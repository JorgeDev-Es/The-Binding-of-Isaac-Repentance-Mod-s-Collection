function TSIL.SaveManager.GetPersistentPlayerVariable(mod, variableName, player)
	local persistentData = TSIL.__VERSION_PERSISTENT_DATA.PersistentData
    local persistentPlayerData = TSIL.__VERSION_PERSISTENT_DATA.PersistentPlayerData

	local modPersistentData = persistentData[mod.Name]
    local modPersistentPlayerData = persistentPlayerData[mod.Name]

	if modPersistentData == nil or modPersistentPlayerData == nil then
		return
	end

	local modVariables = modPersistentData.variables

	local foundVariable = modVariables[variableName]
    local playerVariableData = modPersistentPlayerData[variableName]

	if foundVariable == nil or playerVariableData == nil then
		return
	end

	local perPlayerData = foundVariable.value
    local playerIndex = TSIL.Players.GetPlayerIndex(player, playerVariableData.differentiateSoulAndForgotten)

    local value = perPlayerData[playerIndex]

    if value == nil then
        value = TSIL.Utils.DeepCopy.DeepCopy(playerVariableData.default, TSIL.Enums.SerializationType.NONE)
        perPlayerData[playerIndex] = value
    end

    return value
end