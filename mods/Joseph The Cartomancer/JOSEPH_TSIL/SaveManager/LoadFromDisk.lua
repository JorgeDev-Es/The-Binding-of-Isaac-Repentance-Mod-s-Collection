local DEFAULT_MOD_DATA = "{}"

local function GetDeserializedValue(value)
    if TSIL.Serialize.IsSerializedIsaacAPIClass(value) then
        local deserializedObject = TSIL.Serialize.DeserializeIsaacAPIClass(value)
        return deserializedObject
    end

    if type(value) == "table" then
        if TSIL.Serialize.IsSerializedTableWithNumberKeys(value) then
            local deserializedTable = TSIL.Serialize.DeserializeTableWithNumberKeys(value)

            local copiedTable = {}

            for key, valueInTable in pairs(deserializedTable) do
                copiedTable[key] = GetDeserializedValue(valueInTable)
            end

            return copiedTable
        end

        local copiedTable = {}

        for key, valueInTable in pairs(value) do
            copiedTable[key] = GetDeserializedValue(valueInTable)
        end

        return copiedTable
    end

    return value
end

local function mergeSaveData(oldSaveData, newSaveData)
    TSIL.Utils.Tables.IterateTableInOrder(newSaveData, function (variableName, persistentVariable)
        local oldPersistentVariable = oldSaveData[variableName]

        if oldPersistentVariable then
            oldPersistentVariable.value = GetDeserializedValue(persistentVariable.value)
        else
            oldSaveData[variableName] = {
                value = GetDeserializedValue(persistentVariable.value),
                default = GetDeserializedValue(persistentVariable.default),
                ignoreGlowingHourglass = persistentVariable.ignoreGlowingHourglass,
                persistenceMode = persistentVariable.persistenceMode
            }
        end
    end)
end


local function readSaveDatFile(mod)
    local ok, jsonStringOrErrMsg = pcall(function()
        return mod:LoadData()
    end)

    if not ok then
        print([[Failed to read from the "save#.dat" file: ]] .. jsonStringOrErrMsg)
        return DEFAULT_MOD_DATA
    end

    if jsonStringOrErrMsg == nil then
        return DEFAULT_MOD_DATA
    end

    local jsonStringTrimmed = string.gsub(jsonStringOrErrMsg, " ", "")

    if jsonStringOrErrMsg == "" then
        return DEFAULT_MOD_DATA
    end

    return jsonStringTrimmed
end

function TSIL.SaveManager.LoadFromDisk()
    local PersistentData = TSIL.__VERSION_PERSISTENT_DATA.PersistentData

    local hasLoadedLibraryData = false

    TSIL.Utils.Tables.IterateTableInOrder(PersistentData, function (modName, modPersistentData)
        if modName == "TSIL_MOD" then
            return
        end

        local modToLoad = modPersistentData.mod

        local overrideLibraryData = TSIL.__TriggerCustomCallback(
            TSIL.Enums.CustomCallback.PRE_SAVE_MANAGER_LOAD_FROM_DISK,
            modToLoad
        )

        if overrideLibraryData then
            if not hasLoadedLibraryData then
                hasLoadedLibraryData = true

                local libraryPersistentData = PersistentData["TSIL_MOD"]

                if libraryPersistentData then
                    local newDeserializedLibrarySaveData = TSIL.Utils.DeepCopy.DeepCopy(
                        overrideLibraryData,
                        TSIL.Enums.SerializationType.DESERIALIZE
                    )

                    mergeSaveData(
                        libraryPersistentData.variables,
                        newDeserializedLibrarySaveData
                    )
                end
            end

            return
        end

        if not modToLoad:HasData() then return end

        local jsonString = readSaveDatFile(modToLoad)
        local newSaveData = TSIL.JSON.Decode(jsonString)

        if not newSaveData.TSIL_DATA or not newSaveData.MOD_DATA then
            return
        end

        if not hasLoadedLibraryData then
            hasLoadedLibraryData = true

            local libraryPersistentData = PersistentData["TSIL_MOD"]
            if libraryPersistentData then
                local newDeserializedLibrarySaveData = TSIL.Utils.DeepCopy.DeepCopy(
                    newSaveData.TSIL_DATA,
                    TSIL.Enums.SerializationType.DESERIALIZE
                )

                mergeSaveData(
                    libraryPersistentData.variables,
                    newDeserializedLibrarySaveData
                )
            end
        end

        local newDeserializedSaveData = TSIL.Utils.DeepCopy.DeepCopy(
            newSaveData.MOD_DATA,
            TSIL.Enums.SerializationType.DESERIALIZE
        )

        mergeSaveData(
            modPersistentData.variables,
            newDeserializedSaveData
        )
    end)

    if not hasLoadedLibraryData then
        local overrideLibraryData = TSIL.__TriggerCustomCallback(
            TSIL.Enums.CustomCallback.PRE_SAVE_MANAGER_LOAD_FROM_DISK,
            nil
        )

        if overrideLibraryData then
            local libraryPersistentData = PersistentData["TSIL_MOD"]

            if libraryPersistentData then
                local newDeserializedLibrarySaveData = TSIL.Utils.DeepCopy.DeepCopy(
                    overrideLibraryData,
                    TSIL.Enums.SerializationType.DESERIALIZE
                )

                mergeSaveData(
                    libraryPersistentData.variables,
                    newDeserializedLibrarySaveData
                )
            end
        else
            if not TSIL.__MOD:HasData() then return end

            local jsonString = readSaveDatFile(TSIL.__MOD)
            local newSaveData = TSIL.JSON.Decode(jsonString)

            if not newSaveData.TSIL_DATA then return end

            local libraryPersistentData = PersistentData["TSIL_MOD"]
            if libraryPersistentData then
                local newDeserializedLibrarySaveData = TSIL.Utils.DeepCopy.DeepCopy(
                    newSaveData.TSIL_DATA,
                    TSIL.Enums.SerializationType.DESERIALIZE
                )

                mergeSaveData(
                    libraryPersistentData.variables,
                    newDeserializedLibrarySaveData
                )
            end
        end
    end
end