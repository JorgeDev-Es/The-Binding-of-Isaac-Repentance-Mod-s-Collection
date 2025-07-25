--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]

local ____modules = {}
local ____moduleCache = {}
local ____originalRequire = require
local function require(file, ...)
    if ____moduleCache[file] then
        return ____moduleCache[file].value
    end
    if ____modules[file] then
        local module = ____modules[file]
        ____moduleCache[file] = { value = (select("#", ...) > 0) and module(...) or module(file) }
        return ____moduleCache[file].value
    else
        if ____originalRequire then
            return ____originalRequire(file)
        else
            error("module '" .. file .. "' not found")
        end
    end
end
____modules = {
["lualib_bundle"] = function(...) 
function __TS__ArrayIsArray(value)
    return type(value) == "table" and (value[1] ~= nil or next(value, nil) == nil)
end

function __TS__ArrayConcat(arr1, ...)
    local args = {...}
    local out = {}
    for ____, val in ipairs(arr1) do
        out[#out + 1] = val
    end
    for ____, arg in ipairs(args) do
        if __TS__ArrayIsArray(arg) then
            local argAsArray = arg
            for ____, val in ipairs(argAsArray) do
                out[#out + 1] = val
            end
        else
            out[#out + 1] = arg
        end
    end
    return out
end

function __TS__ArrayEntries(array)
    local key = 0
    return {
        [Symbol.iterator] = function(self)
            return self
        end,
        next = function(self)
            local result = {done = array[key + 1] == nil, value = {key, array[key + 1]}}
            key = key + 1
            return result
        end
    }
end

function __TS__ArrayEvery(arr, callbackfn)
    do
        local i = 0
        while i < #arr do
            if not callbackfn(_G, arr[i + 1], i, arr) then
                return false
            end
            i = i + 1
        end
    end
    return true
end

function __TS__ArrayFilter(arr, callbackfn)
    local result = {}
    do
        local i = 0
        while i < #arr do
            if callbackfn(_G, arr[i + 1], i, arr) then
                result[#result + 1] = arr[i + 1]
            end
            i = i + 1
        end
    end
    return result
end

function __TS__ArrayForEach(arr, callbackFn)
    do
        local i = 0
        while i < #arr do
            callbackFn(_G, arr[i + 1], i, arr)
            i = i + 1
        end
    end
end

function __TS__ArrayFind(arr, predicate)
    local len = #arr
    local k = 0
    while k < len do
        local elem = arr[k + 1]
        if predicate(_G, elem, k, arr) then
            return elem
        end
        k = k + 1
    end
    return nil
end

function __TS__ArrayFindIndex(arr, callbackFn)
    do
        local i = 0
        local len = #arr
        while i < len do
            if callbackFn(_G, arr[i + 1], i, arr) then
                return i
            end
            i = i + 1
        end
    end
    return -1
end

function __TS__ArrayIncludes(self, searchElement, fromIndex)
    if fromIndex == nil then
        fromIndex = 0
    end
    local len = #self
    local k = fromIndex
    if fromIndex < 0 then
        k = len + fromIndex
    end
    if k < 0 then
        k = 0
    end
    for i = k, len do
        if self[i + 1] == searchElement then
            return true
        end
    end
    return false
end

function __TS__ArrayIndexOf(arr, searchElement, fromIndex)
    local len = #arr
    if len == 0 then
        return -1
    end
    local n = 0
    if fromIndex then
        n = fromIndex
    end
    if n >= len then
        return -1
    end
    local k
    if n >= 0 then
        k = n
    else
        k = len + n
        if k < 0 then
            k = 0
        end
    end
    do
        local i = k
        while i < len do
            if arr[i + 1] == searchElement then
                return i
            end
            i = i + 1
        end
    end
    return -1
end

function __TS__ArrayJoin(self, separator)
    if separator == nil then
        separator = ","
    end
    local result = ""
    for index, value in ipairs(self) do
        if index > 1 then
            result = result .. separator
        end
        result = result .. tostring(value)
    end
    return result
end

function __TS__ArrayMap(arr, callbackfn)
    local newArray = {}
    do
        local i = 0
        while i < #arr do
            newArray[i + 1] = callbackfn(_G, arr[i + 1], i, arr)
            i = i + 1
        end
    end
    return newArray
end

function __TS__ArrayPush(arr, ...)
    local items = {...}
    for ____, item in ipairs(items) do
        arr[#arr + 1] = item
    end
    return #arr
end

function __TS__ArrayReduce(arr, callbackFn, ...)
    local len = #arr
    local k = 0
    local accumulator = nil
    if select("#", ...) ~= 0 then
        accumulator = select(1, ...)
    elseif len > 0 then
        accumulator = arr[1]
        k = 1
    else
        error("Reduce of empty array with no initial value", 0)
    end
    for i = k, len - 1 do
        accumulator = callbackFn(
            _G,
            accumulator,
            arr[i + 1],
            i,
            arr
        )
    end
    return accumulator
end

function __TS__ArrayReduceRight(arr, callbackFn, ...)
    local len = #arr
    local k = len - 1
    local accumulator = nil
    if select("#", ...) ~= 0 then
        accumulator = select(1, ...)
    elseif len > 0 then
        accumulator = arr[k + 1]
        k = k - 1
    else
        error("Reduce of empty array with no initial value", 0)
    end
    for i = k, 0, -1 do
        accumulator = callbackFn(
            _G,
            accumulator,
            arr[i + 1],
            i,
            arr
        )
    end
    return accumulator
end

function __TS__ArrayReverse(arr)
    local i = 0
    local j = #arr - 1
    while i < j do
        local temp = arr[j + 1]
        arr[j + 1] = arr[i + 1]
        arr[i + 1] = temp
        i = i + 1
        j = j - 1
    end
    return arr
end

function __TS__ArrayShift(arr)
    return table.remove(arr, 1)
end

function __TS__ArrayUnshift(arr, ...)
    local items = {...}
    do
        local i = #items - 1
        while i >= 0 do
            table.insert(arr, 1, items[i + 1])
            i = i - 1
        end
    end
    return #arr
end

function __TS__ArraySort(arr, compareFn)
    if compareFn ~= nil then
        table.sort(
            arr,
            function(a, b) return compareFn(_G, a, b) < 0 end
        )
    else
        table.sort(arr)
    end
    return arr
end

function __TS__ArraySlice(list, first, last)
    local len = #list
    local relativeStart = first or 0
    local k
    if relativeStart < 0 then
        k = math.max(len + relativeStart, 0)
    else
        k = math.min(relativeStart, len)
    end
    local relativeEnd = last
    if last == nil then
        relativeEnd = len
    end
    local final
    if relativeEnd < 0 then
        final = math.max(len + relativeEnd, 0)
    else
        final = math.min(relativeEnd, len)
    end
    local out = {}
    local n = 0
    while k < final do
        out[n + 1] = list[k + 1]
        k = k + 1
        n = n + 1
    end
    return out
end

function __TS__ArraySome(arr, callbackfn)
    do
        local i = 0
        while i < #arr do
            if callbackfn(_G, arr[i + 1], i, arr) then
                return true
            end
            i = i + 1
        end
    end
    return false
end

function __TS__ArraySplice(list, ...)
    local len = #list
    local actualArgumentCount = select("#", ...)
    local start = select(1, ...)
    local deleteCount = select(2, ...)
    local actualStart
    if start < 0 then
        actualStart = math.max(len + start, 0)
    else
        actualStart = math.min(start, len)
    end
    local itemCount = math.max(actualArgumentCount - 2, 0)
    local actualDeleteCount
    if actualArgumentCount == 0 then
        actualDeleteCount = 0
    elseif actualArgumentCount == 1 then
        actualDeleteCount = len - actualStart
    else
        actualDeleteCount = math.min(
            math.max(deleteCount or 0, 0),
            len - actualStart
        )
    end
    local out = {}
    do
        local k = 0
        while k < actualDeleteCount do
            local from = actualStart + k
            if list[from + 1] then
                out[k + 1] = list[from + 1]
            end
            k = k + 1
        end
    end
    if itemCount < actualDeleteCount then
        do
            local k = actualStart
            while k < len - actualDeleteCount do
                local from = k + actualDeleteCount
                local to = k + itemCount
                if list[from + 1] then
                    list[to + 1] = list[from + 1]
                else
                    list[to + 1] = nil
                end
                k = k + 1
            end
        end
        do
            local k = len
            while k > len - actualDeleteCount + itemCount do
                list[k] = nil
                k = k - 1
            end
        end
    elseif itemCount > actualDeleteCount then
        do
            local k = len - actualDeleteCount
            while k > actualStart do
                local from = k + actualDeleteCount - 1
                local to = k + itemCount - 1
                if list[from + 1] then
                    list[to + 1] = list[from + 1]
                else
                    list[to + 1] = nil
                end
                k = k - 1
            end
        end
    end
    local j = actualStart
    for i = 3, actualArgumentCount do
        list[j + 1] = select(i, ...)
        j = j + 1
    end
    do
        local k = #list - 1
        while k >= len - actualDeleteCount + itemCount do
            list[k + 1] = nil
            k = k - 1
        end
    end
    return out
end

function __TS__ArrayToObject(array)
    local object = {}
    do
        local i = 0
        while i < #array do
            object[i] = array[i + 1]
            i = i + 1
        end
    end
    return object
end

function __TS__ArrayFlat(array, depth)
    if depth == nil then
        depth = 1
    end
    local result = {}
    for ____, value in ipairs(array) do
        if depth > 0 and __TS__ArrayIsArray(value) then
            result = __TS__ArrayConcat(
                result,
                __TS__ArrayFlat(value, depth - 1)
            )
        else
            result[#result + 1] = value
        end
    end
    return result
end

function __TS__ArrayFlatMap(array, callback)
    local result = {}
    do
        local i = 0
        while i < #array do
            local value = callback(_G, array[i + 1], i, array)
            if type(value) == "table" and __TS__ArrayIsArray(value) then
                result = __TS__ArrayConcat(result, value)
            else
                result[#result + 1] = value
            end
            i = i + 1
        end
    end
    return result
end

function __TS__ArraySetLength(arr, length)
    if length < 0 or length ~= length or length == math.huge or math.floor(length) ~= length then
        error(
            "invalid array length: " .. tostring(length),
            0
        )
    end
    do
        local i = #arr - 1
        while i >= length do
            arr[i + 1] = nil
            i = i - 1
        end
    end
    return length
end

____symbolMetatable = {__tostring = function(self)
    return ("Symbol(" .. (self.description or "")) .. ")"
end}
function __TS__Symbol(description)
    return setmetatable({description = description}, ____symbolMetatable)
end
Symbol = {
    iterator = __TS__Symbol("Symbol.iterator"),
    hasInstance = __TS__Symbol("Symbol.hasInstance"),
    species = __TS__Symbol("Symbol.species"),
    toStringTag = __TS__Symbol("Symbol.toStringTag")
}

function __TS__InstanceOf(obj, classTbl)
    if type(classTbl) ~= "table" then
        error("Right-hand side of 'instanceof' is not an object", 0)
    end
    if classTbl[Symbol.hasInstance] ~= nil then
        return not not classTbl[Symbol.hasInstance](classTbl, obj)
    end
    if type(obj) == "table" then
        local luaClass = obj.constructor
        while luaClass ~= nil do
            if luaClass == classTbl then
                return true
            end
            luaClass = luaClass.____super
        end
    end
    return false
end

function __TS__New(target, ...)
    local instance = setmetatable({}, target.prototype)
    instance:____constructor(...)
    return instance
end

function __TS__Class(self)
    local c = {prototype = {}}
    c.prototype.__index = c.prototype
    c.prototype.constructor = c
    return c
end

__TS__Unpack = table.unpack or unpack

function __TS__FunctionBind(fn, thisArg, ...)
    local boundArgs = {...}
    return function(____, ...)
        local args = {...}
        do
            local i = 0
            while i < #boundArgs do
                table.insert(args, i + 1, boundArgs[i + 1])
                i = i + 1
            end
        end
        return fn(
            thisArg,
            __TS__Unpack(args)
        )
    end
end

__TS__PromiseState = __TS__PromiseState or ({})
__TS__PromiseState.Pending = 0
__TS__PromiseState[__TS__PromiseState.Pending] = "Pending"
__TS__PromiseState.Fulfilled = 1
__TS__PromiseState[__TS__PromiseState.Fulfilled] = "Fulfilled"
__TS__PromiseState.Rejected = 2
__TS__PromiseState[__TS__PromiseState.Rejected] = "Rejected"
function __TS__PromiseDeferred(self)
    local resolve
    local reject
    local promise = __TS__New(
        __TS__Promise,
        function(____, res, rej)
            resolve = res
            reject = rej
        end
    )
    return {promise = promise, resolve = resolve, reject = reject}
end
function __TS__IsPromiseLike(self, thing)
    return __TS__InstanceOf(thing, __TS__Promise)
end
__TS__Promise = __TS__Class()
__TS__Promise.name = "__TS__Promise"
function __TS__Promise.prototype.____constructor(self, executor)
    self.state = __TS__PromiseState.Pending
    self.fulfilledCallbacks = {}
    self.rejectedCallbacks = {}
    self.finallyCallbacks = {}
    do
        local function ____catch(e)
            self:reject(e)
        end
        local ____try, ____hasReturned = pcall(function()
            executor(
                _G,
                __TS__FunctionBind(self.resolve, self),
                __TS__FunctionBind(self.reject, self)
            )
        end)
        if not ____try then
            ____catch(____hasReturned)
        end
    end
end
function __TS__Promise.resolve(data)
    local promise = __TS__New(
        __TS__Promise,
        function()
        end
    )
    promise.state = __TS__PromiseState.Fulfilled
    promise.value = data
    return promise
end
function __TS__Promise.reject(reason)
    local promise = __TS__New(
        __TS__Promise,
        function()
        end
    )
    promise.state = __TS__PromiseState.Rejected
    promise.rejectionReason = reason
    return promise
end
__TS__Promise.prototype["then"] = function(self, onFulfilled, onRejected)
    local ____TS__PromiseDeferred_result_0 = __TS__PromiseDeferred(_G)
    local promise = ____TS__PromiseDeferred_result_0.promise
    local resolve = ____TS__PromiseDeferred_result_0.resolve
    local reject = ____TS__PromiseDeferred_result_0.reject
    local isFulfilled = self.state == __TS__PromiseState.Fulfilled
    local isRejected = self.state == __TS__PromiseState.Rejected
    if onFulfilled then
        local internalCallback = self:createPromiseResolvingCallback(onFulfilled, resolve, reject)
        __TS__ArrayPush(self.fulfilledCallbacks, internalCallback)
        if isFulfilled then
            internalCallback(_G, self.value)
        end
    else
        __TS__ArrayPush(
            self.fulfilledCallbacks,
            function() return resolve(_G, nil) end
        )
    end
    if onRejected then
        local internalCallback = self:createPromiseResolvingCallback(onRejected, resolve, reject)
        __TS__ArrayPush(self.rejectedCallbacks, internalCallback)
        if isRejected then
            internalCallback(_G, self.rejectionReason)
        end
    end
    if isFulfilled then
        resolve(_G, self.value)
    end
    if isRejected then
        reject(_G, self.rejectionReason)
    end
    return promise
end
function __TS__Promise.prototype.catch(self, onRejected)
    return self["then"](self, nil, onRejected)
end
function __TS__Promise.prototype.finally(self, onFinally)
    if onFinally then
        __TS__ArrayPush(self.finallyCallbacks, onFinally)
        if self.state ~= __TS__PromiseState.Pending then
            onFinally(_G)
        end
    end
    return self
end
function __TS__Promise.prototype.resolve(self, data)
    if __TS__InstanceOf(data, __TS__Promise) then
        data["then"](
            data,
            function(____, v) return self:resolve(v) end,
            function(____, err) return self:reject(err) end
        )
        return
    end
    if self.state == __TS__PromiseState.Pending then
        self.state = __TS__PromiseState.Fulfilled
        self.value = data
        for ____, callback in ipairs(self.fulfilledCallbacks) do
            callback(_G, data)
        end
        for ____, callback in ipairs(self.finallyCallbacks) do
            callback(_G)
        end
    end
end
function __TS__Promise.prototype.reject(self, reason)
    if self.state == __TS__PromiseState.Pending then
        self.state = __TS__PromiseState.Rejected
        self.rejectionReason = reason
        for ____, callback in ipairs(self.rejectedCallbacks) do
            callback(_G, reason)
        end
        for ____, callback in ipairs(self.finallyCallbacks) do
            callback(_G)
        end
    end
end
function __TS__Promise.prototype.createPromiseResolvingCallback(self, f, resolve, reject)
    return function(____, value)
        do
            local function ____catch(e)
                reject(_G, e)
            end
            local ____try, ____hasReturned = pcall(function()
                self:handleCallbackData(
                    f(_G, value),
                    resolve,
                    reject
                )
            end)
            if not ____try then
                ____catch(____hasReturned)
            end
        end
    end
end
function __TS__Promise.prototype.handleCallbackData(self, data, resolve, reject)
    if __TS__IsPromiseLike(_G, data) then
        local nextpromise = data
        if nextpromise.state == __TS__PromiseState.Fulfilled then
            resolve(_G, nextpromise.value)
        elseif nextpromise.state == __TS__PromiseState.Rejected then
            reject(_G, nextpromise.rejectionReason)
        else
            data["then"](data, resolve, reject)
        end
    else
        resolve(_G, data)
    end
end

function __TS__AsyncAwaiter(generator)
    return __TS__New(
        __TS__Promise,
        function(____, resolve, reject)
            local adopt, fulfilled, rejected, step, asyncCoroutine
            function adopt(self, value)
                local ____temp_0
                if __TS__InstanceOf(value, __TS__Promise) then
                    ____temp_0 = value
                else
                    ____temp_0 = __TS__Promise.resolve(value)
                end
                return ____temp_0
            end
            function fulfilled(self, value)
                local success, errorOrErrorHandler, resultOrError = coroutine.resume(asyncCoroutine, value)
                if success then
                    step(_G, resultOrError, errorOrErrorHandler)
                else
                    reject(_G, errorOrErrorHandler)
                end
            end
            function rejected(self, handler)
                if handler then
                    return function(____, value)
                        local success, hasReturnedOrError, returnedValue = pcall(handler, value)
                        if success then
                            if hasReturnedOrError then
                                resolve(_G, returnedValue)
                            else
                                step(_G, hasReturnedOrError, handler)
                            end
                        else
                            reject(_G, hasReturnedOrError)
                        end
                    end
                else
                    return function(____, value)
                        reject(_G, value)
                    end
                end
            end
            function step(self, result, errorHandler)
                if coroutine.status(asyncCoroutine) == "dead" then
                    resolve(_G, result)
                else
                    local ____self_1 = adopt(_G, result)
                    ____self_1["then"](
                        ____self_1,
                        fulfilled,
                        rejected(_G, errorHandler)
                    )
                end
            end
            asyncCoroutine = coroutine.create(generator)
            local success, errorOrErrorHandler, resultOrError = coroutine.resume(asyncCoroutine)
            if success then
                step(_G, resultOrError, errorOrErrorHandler)
            else
                reject(_G, errorOrErrorHandler)
            end
        end
    )
end
function __TS__Await(errorHandler, thing)
    return coroutine.yield(errorHandler, thing)
end

function __TS__ClassExtends(target, base)
    target.____super = base
    local staticMetatable = setmetatable({__index = base}, base)
    setmetatable(target, staticMetatable)
    local baseMetatable = getmetatable(base)
    if baseMetatable then
        if type(baseMetatable.__index) == "function" then
            staticMetatable.__index = baseMetatable.__index
        end
        if type(baseMetatable.__newindex) == "function" then
            staticMetatable.__newindex = baseMetatable.__newindex
        end
    end
    setmetatable(target.prototype, base.prototype)
    if type(base.prototype.__index) == "function" then
        target.prototype.__index = base.prototype.__index
    end
    if type(base.prototype.__newindex) == "function" then
        target.prototype.__newindex = base.prototype.__newindex
    end
    if type(base.prototype.__tostring) == "function" then
        target.prototype.__tostring = base.prototype.__tostring
    end
end

function __TS__CloneDescriptor(____bindingPattern0)
    local value
    local writable
    local set
    local get
    local configurable
    local enumerable
    enumerable = ____bindingPattern0.enumerable
    configurable = ____bindingPattern0.configurable
    get = ____bindingPattern0.get
    set = ____bindingPattern0.set
    writable = ____bindingPattern0.writable
    value = ____bindingPattern0.value
    local descriptor = {enumerable = enumerable == true, configurable = configurable == true}
    local hasGetterOrSetter = get ~= nil or set ~= nil
    local hasValueOrWritableAttribute = writable ~= nil or value ~= nil
    if hasGetterOrSetter and hasValueOrWritableAttribute then
        error("Invalid property descriptor. Cannot both specify accessors and a value or writable attribute.", 0)
    end
    if get or set then
        descriptor.get = get
        descriptor.set = set
    else
        descriptor.value = value
        descriptor.writable = writable == true
    end
    return descriptor
end

function __TS__ObjectGetOwnPropertyDescriptor(object, key)
    local metatable = getmetatable(object)
    if not metatable then
        return
    end
    if not rawget(metatable, "_descriptors") then
        return
    end
    return rawget(metatable, "_descriptors")[key]
end

function ____descriptorIndex(self, key)
    local value = rawget(self, key)
    if value ~= nil then
        return value
    end
    local metatable = getmetatable(self)
    while metatable do
        local rawResult = rawget(metatable, key)
        if rawResult ~= nil then
            return rawResult
        end
        local descriptors = rawget(metatable, "_descriptors")
        if descriptors then
            local descriptor = descriptors[key]
            if descriptor then
                if descriptor.get then
                    return descriptor.get(self)
                end
                return descriptor.value
            end
        end
        metatable = getmetatable(metatable)
    end
end
function ____descriptorNewindex(self, key, value)
    local metatable = getmetatable(self)
    while metatable do
        local descriptors = rawget(metatable, "_descriptors")
        if descriptors then
            local descriptor = descriptors[key]
            if descriptor then
                if descriptor.set then
                    descriptor.set(self, value)
                else
                    if descriptor.writable == false then
                        error(
                            ((("Cannot assign to read only property '" .. key) .. "' of object '") .. tostring(self)) .. "'",
                            0
                        )
                    end
                    descriptor.value = value
                end
                return
            end
        end
        metatable = getmetatable(metatable)
    end
    rawset(self, key, value)
end
function __TS__SetDescriptor(target, key, desc, isPrototype)
    if isPrototype == nil then
        isPrototype = false
    end
    local ____isPrototype_0
    if isPrototype then
        ____isPrototype_0 = target
    else
        ____isPrototype_0 = getmetatable(target)
    end
    local metatable = ____isPrototype_0
    if not metatable then
        metatable = {}
        setmetatable(target, metatable)
    end
    local value = rawget(target, key)
    if value ~= nil then
        rawset(target, key, nil)
    end
    if not rawget(metatable, "_descriptors") then
        metatable._descriptors = {}
    end
    local descriptor = __TS__CloneDescriptor(desc)
    metatable._descriptors[key] = descriptor
    metatable.__index = ____descriptorIndex
    metatable.__newindex = ____descriptorNewindex
end

function __TS__ObjectAssign(to, ...)
    local sources = {...}
    if to == nil then
        return to
    end
    for ____, source in ipairs(sources) do
        for key in pairs(source) do
            to[key] = source[key]
        end
    end
    return to
end

function __TS__Decorate(decorators, target, key, desc)
    local result = target
    do
        local i = #decorators
        while i >= 0 do
            local decorator = decorators[i + 1]
            if decorator then
                local oldResult = result
                if key == nil then
                    result = decorator(_G, result)
                elseif desc == true then
                    local value = rawget(target, key)
                    local descriptor = __TS__ObjectGetOwnPropertyDescriptor(target, key) or ({configurable = true, writable = true, value = value})
                    local desc = decorator(_G, target, key, descriptor) or descriptor
                    local isSimpleValue = desc.configurable == true and desc.writable == true and not desc.get and not desc.set
                    if isSimpleValue then
                        rawset(target, key, desc.value)
                    else
                        __TS__SetDescriptor(
                            target,
                            key,
                            __TS__ObjectAssign({}, descriptor, desc)
                        )
                    end
                elseif desc == false then
                    result = decorator(_G, target, key, desc)
                else
                    result = decorator(_G, target, key)
                end
                result = result or oldResult
            end
            i = i - 1
        end
    end
    return result
end

function __TS__DecorateParam(paramIndex, decorator)
    return function(____, target, key) return decorator(_G, target, key, paramIndex) end
end

function __TS__ObjectGetOwnPropertyDescriptors(object)
    local metatable = getmetatable(object)
    if not metatable then
        return {}
    end
    return rawget(metatable, "_descriptors") or ({})
end

function __TS__GetErrorStack(self, constructor)
    local level = 1
    while true do
        local info = debug.getinfo(level, "f")
        level = level + 1
        if not info then
            level = 1
            break
        elseif info.func == constructor then
            break
        end
    end
    return debug.traceback(nil, level)
end
function __TS__WrapErrorToString(self, getDescription)
    return function(self)
        local description = getDescription(self)
        local caller = debug.getinfo(3, "f")
        if _VERSION == "Lua 5.1" or caller and caller.func ~= error then
            return description
        else
            return (tostring(description) .. "\n") .. self.stack
        end
    end
end
function __TS__InitErrorClass(self, Type, name)
    Type.name = name
    return setmetatable(
        Type,
        {__call = function(____, _self, message) return __TS__New(Type, message) end}
    )
end
local ____TS__InitErrorClass_3 = __TS__InitErrorClass
local ____G_2 = _G
____class_0 = __TS__Class()
____class_0.name = ""
function ____class_0.prototype.____constructor(self, message)
    if message == nil then
        message = ""
    end
    self.message = message
    self.name = "Error"
    self.stack = __TS__GetErrorStack(_G, self.constructor.new)
    local metatable = getmetatable(self)
    if not metatable.__errorToStringPatched then
        metatable.__errorToStringPatched = true
        metatable.__tostring = __TS__WrapErrorToString(_G, metatable.__tostring)
    end
end
function ____class_0.prototype.__tostring(self)
    local ____temp_1
    if self.message ~= "" then
        ____temp_1 = (self.name .. ": ") .. self.message
    else
        ____temp_1 = self.name
    end
    return ____temp_1
end
Error = ____TS__InitErrorClass_3(____G_2, ____class_0, "Error")
for ____, errorName in ipairs({
    "RangeError",
    "ReferenceError",
    "SyntaxError",
    "TypeError",
    "URIError"
}) do
    local ____G_7 = _G
    local ____TS__InitErrorClass_6 = __TS__InitErrorClass
    local ____G_5 = _G
    local ____class_4 = __TS__Class()
    ____class_4.name = ____class_4.name
    __TS__ClassExtends(____class_4, Error)
    function ____class_4.prototype.____constructor(self, ...)
        Error.prototype.____constructor(self, ...)
        self.name = errorName
    end
    ____G_7[errorName] = ____TS__InitErrorClass_6(____G_5, ____class_4, errorName)
end

function __TS__Delete(target, key)
    local descriptors = __TS__ObjectGetOwnPropertyDescriptors(target)
    local descriptor = descriptors[key]
    if descriptor then
        if not descriptor.configurable then
            error(
                __TS__New(
                    TypeError,
                    ((("Cannot delete property " .. tostring(key)) .. " of ") .. tostring(target)) .. "."
                ),
                0
            )
        end
        descriptors[key] = nil
        return true
    end
    target[key] = nil
    return true
end

function __TS__StringAccess(self, index)
    if index >= 0 and index < #self then
        return string.sub(self, index + 1, index + 1)
    end
end

function __TS__DelegatedYield(iterable)
    if type(iterable) == "string" then
        for index = 0, #iterable - 1 do
            coroutine.yield(__TS__StringAccess(iterable, index))
        end
    elseif iterable.____coroutine ~= nil then
        local co = iterable.____coroutine
        while true do
            local status, value = coroutine.resume(co)
            if not status then
                error(value, 0)
            end
            if coroutine.status(co) == "dead" then
                return value
            else
                coroutine.yield(value)
            end
        end
    elseif iterable[Symbol.iterator] then
        local iterator = iterable[Symbol.iterator](iterable)
        while true do
            local result = iterator:next()
            if result.done then
                return result.value
            else
                coroutine.yield(result.value)
            end
        end
    else
        for ____, value in ipairs(iterable) do
            coroutine.yield(value)
        end
    end
end

function __TS__GeneratorIterator(self)
    return self
end
function __TS__GeneratorNext(self, ...)
    local co = self.____coroutine
    if coroutine.status(co) == "dead" then
        return {done = true}
    end
    local status, value = coroutine.resume(co, ...)
    if not status then
        error(value, 0)
    end
    return {
        value = value,
        done = coroutine.status(co) == "dead"
    }
end
function __TS__Generator(fn)
    return function(...)
        local args = {...}
        local argsLength = select("#", ...)
        return {
            ____coroutine = coroutine.create(function() return fn((unpack or table.unpack)(args, 1, argsLength)) end),
            [Symbol.iterator] = __TS__GeneratorIterator,
            next = __TS__GeneratorNext
        }
    end
end

function __TS__InstanceOfObject(value)
    local valueType = type(value)
    return valueType == "table" or valueType == "function"
end

function __TS__IteratorGeneratorStep(self)
    local co = self.____coroutine
    local status, value = coroutine.resume(co)
    if not status then
        error(value, 0)
    end
    if coroutine.status(co) == "dead" then
        return
    end
    return true, value
end
function __TS__IteratorIteratorStep(self)
    local result = self:next()
    if result.done then
        return
    end
    return true, result.value
end
function __TS__IteratorStringStep(self, index)
    index = index + 1
    if index > #self then
        return
    end
    return index, string.sub(self, index, index)
end
function __TS__Iterator(iterable)
    if type(iterable) == "string" then
        return __TS__IteratorStringStep, iterable, 0
    elseif iterable.____coroutine ~= nil then
        return __TS__IteratorGeneratorStep, iterable
    elseif iterable[Symbol.iterator] then
        local iterator = iterable[Symbol.iterator](iterable)
        return __TS__IteratorIteratorStep, iterator
    else
        return ipairs(iterable)
    end
end

Map = __TS__Class()
Map.name = "Map"
function Map.prototype.____constructor(self, entries)
    self[Symbol.toStringTag] = "Map"
    self.items = {}
    self.size = 0
    self.nextKey = {}
    self.previousKey = {}
    if entries == nil then
        return
    end
    local iterable = entries
    if iterable[Symbol.iterator] then
        local iterator = iterable[Symbol.iterator](iterable)
        while true do
            local result = iterator:next()
            if result.done then
                break
            end
            local value = result.value
            self:set(value[1], value[2])
        end
    else
        local array = entries
        for ____, kvp in ipairs(array) do
            self:set(kvp[1], kvp[2])
        end
    end
end
function Map.prototype.clear(self)
    self.items = {}
    self.nextKey = {}
    self.previousKey = {}
    self.firstKey = nil
    self.lastKey = nil
    self.size = 0
end
function Map.prototype.delete(self, key)
    local contains = self:has(key)
    if contains then
        self.size = self.size - 1
        local next = self.nextKey[key]
        local previous = self.previousKey[key]
        if next and previous then
            self.nextKey[previous] = next
            self.previousKey[next] = previous
        elseif next then
            self.firstKey = next
            self.previousKey[next] = nil
        elseif previous then
            self.lastKey = previous
            self.nextKey[previous] = nil
        else
            self.firstKey = nil
            self.lastKey = nil
        end
        self.nextKey[key] = nil
        self.previousKey[key] = nil
    end
    self.items[key] = nil
    return contains
end
function Map.prototype.forEach(self, callback)
    for ____, key in __TS__Iterator(self:keys()) do
        callback(_G, self.items[key], key, self)
    end
end
function Map.prototype.get(self, key)
    return self.items[key]
end
function Map.prototype.has(self, key)
    return self.nextKey[key] ~= nil or self.lastKey == key
end
function Map.prototype.set(self, key, value)
    local isNewValue = not self:has(key)
    if isNewValue then
        self.size = self.size + 1
    end
    self.items[key] = value
    if self.firstKey == nil then
        self.firstKey = key
        self.lastKey = key
    elseif isNewValue then
        self.nextKey[self.lastKey] = key
        self.previousKey[key] = self.lastKey
        self.lastKey = key
    end
    return self
end
Map.prototype[Symbol.iterator] = function(self)
    return self:entries()
end
function Map.prototype.entries(self)
    local ____temp_0 = self
    local items = ____temp_0.items
    local nextKey = ____temp_0.nextKey
    local key = self.firstKey
    return {
        [Symbol.iterator] = function(self)
            return self
        end,
        next = function(self)
            local result = {done = not key, value = {key, items[key]}}
            key = nextKey[key]
            return result
        end
    }
end
function Map.prototype.keys(self)
    local nextKey = self.nextKey
    local key = self.firstKey
    return {
        [Symbol.iterator] = function(self)
            return self
        end,
        next = function(self)
            local result = {done = not key, value = key}
            key = nextKey[key]
            return result
        end
    }
end
function Map.prototype.values(self)
    local ____temp_1 = self
    local items = ____temp_1.items
    local nextKey = ____temp_1.nextKey
    local key = self.firstKey
    return {
        [Symbol.iterator] = function(self)
            return self
        end,
        next = function(self)
            local result = {done = not key, value = items[key]}
            key = nextKey[key]
            return result
        end
    }
end
Map[Symbol.species] = Map
Map = Map

__TS__MathAtan2 = math.atan2 or math.atan

function __TS__MathSign(val)
    if val > 0 then
        return 1
    elseif val < 0 then
        return -1
    end
    return 0
end

function __TS__Number(value)
    local valueType = type(value)
    if valueType == "number" then
        return value
    elseif valueType == "string" then
        local numberValue = tonumber(value)
        if numberValue then
            return numberValue
        end
        if value == "Infinity" then
            return math.huge
        end
        if value == "-Infinity" then
            return -math.huge
        end
        local stringWithoutSpaces = string.gsub(value, "%s", "")
        if stringWithoutSpaces == "" then
            return 0
        end
        return 0 / 0
    elseif valueType == "boolean" then
        return value and 1 or 0
    else
        return 0 / 0
    end
end

function __TS__NumberIsFinite(value)
    return type(value) == "number" and value == value and value ~= math.huge and value ~= -math.huge
end

function __TS__NumberIsNaN(value)
    return value ~= value
end

____radixChars = "0123456789abcdefghijklmnopqrstuvwxyz"
function __TS__NumberToString(self, radix)
    if radix == nil or radix == 10 or self == math.huge or self == -math.huge or self ~= self then
        return tostring(self)
    end
    radix = math.floor(radix)
    if radix < 2 or radix > 36 then
        error("toString() radix argument must be between 2 and 36", 0)
    end
    local integer, fraction = math.modf(math.abs(self))
    local result = ""
    if radix == 8 then
        result = string.format("%o", integer)
    elseif radix == 16 then
        result = string.format("%x", integer)
    else
        repeat
            do
                result = __TS__StringAccess(____radixChars, integer % radix) .. result
                integer = math.floor(integer / radix)
            end
        until not (integer ~= 0)
    end
    if fraction ~= 0 then
        result = result .. "."
        local delta = 1e-16
        repeat
            do
                fraction = fraction * radix
                delta = delta * radix
                local digit = math.floor(fraction)
                result = result .. __TS__StringAccess(____radixChars, digit)
                fraction = fraction - digit
            end
        until not (fraction >= delta)
    end
    if self < 0 then
        result = "-" .. result
    end
    return result
end

function __TS__ObjectDefineProperty(target, key, desc)
    local ____temp_0
    if type(key) == "number" then
        ____temp_0 = key + 1
    else
        ____temp_0 = key
    end
    local luaKey = ____temp_0
    local value = rawget(target, luaKey)
    local hasGetterOrSetter = desc.get ~= nil or desc.set ~= nil
    local descriptor
    if hasGetterOrSetter then
        if value ~= nil then
            error(
                "Cannot redefine property: " .. tostring(key),
                0
            )
        end
        descriptor = desc
    else
        local valueExists = value ~= nil
        local ____desc_set_5 = desc.set
        local ____desc_get_6 = desc.get
        local ____temp_1
        if desc.configurable ~= nil then
            ____temp_1 = desc.configurable
        else
            ____temp_1 = valueExists
        end
        local ____temp_2
        if desc.enumerable ~= nil then
            ____temp_2 = desc.enumerable
        else
            ____temp_2 = valueExists
        end
        local ____temp_3
        if desc.writable ~= nil then
            ____temp_3 = desc.writable
        else
            ____temp_3 = valueExists
        end
        local ____temp_4
        if desc.value ~= nil then
            ____temp_4 = desc.value
        else
            ____temp_4 = value
        end
        descriptor = {
            set = ____desc_set_5,
            get = ____desc_get_6,
            configurable = ____temp_1,
            enumerable = ____temp_2,
            writable = ____temp_3,
            value = ____temp_4
        }
    end
    __TS__SetDescriptor(target, luaKey, descriptor)
    return target
end

function __TS__ObjectEntries(obj)
    local result = {}
    for key in pairs(obj) do
        result[#result + 1] = {key, obj[key]}
    end
    return result
end

function __TS__ObjectFromEntries(entries)
    local obj = {}
    local iterable = entries
    if iterable[Symbol.iterator] then
        local iterator = iterable[Symbol.iterator](iterable)
        while true do
            local result = iterator:next()
            if result.done then
                break
            end
            local value = result.value
            obj[value[1]] = value[2]
        end
    else
        for ____, entry in ipairs(entries) do
            obj[entry[1]] = entry[2]
        end
    end
    return obj
end

function __TS__ObjectKeys(obj)
    local result = {}
    for key in pairs(obj) do
        result[#result + 1] = key
    end
    return result
end

function __TS__ObjectRest(target, usedProperties)
    local result = {}
    for property in pairs(target) do
        if not usedProperties[property] then
            result[property] = target[property]
        end
    end
    return result
end

function __TS__ObjectValues(obj)
    local result = {}
    for key in pairs(obj) do
        result[#result + 1] = obj[key]
    end
    return result
end

function __TS__ParseFloat(numberString)
    local infinityMatch = string.match(numberString, "^%s*(-?Infinity)")
    if infinityMatch then
        local ____temp_0
        if __TS__StringAccess(infinityMatch, 0) == "-" then
            ____temp_0 = -math.huge
        else
            ____temp_0 = math.huge
        end
        return ____temp_0
    end
    local number = tonumber(string.match(numberString, "^%s*(-?%d+%.?%d*)"))
    return number or 0 / 0
end

function __TS__StringSubstr(self, from, length)
    if from ~= from then
        from = 0
    end
    if length ~= nil then
        if length ~= length or length <= 0 then
            return ""
        end
        length = length + from
    end
    if from >= 0 then
        from = from + 1
    end
    return string.sub(self, from, length)
end

function __TS__StringSubstring(self, start, ____end)
    if ____end ~= ____end then
        ____end = 0
    end
    if ____end ~= nil and start > ____end then
        start, ____end = ____end, start
    end
    if start >= 0 then
        start = start + 1
    else
        start = 1
    end
    if ____end ~= nil and ____end < 0 then
        ____end = 0
    end
    return string.sub(self, start, ____end)
end

__TS__parseInt_base_pattern = "0123456789aAbBcCdDeEfFgGhHiIjJkKlLmMnNoOpPqQrRsStTvVwWxXyYzZ"
function __TS__ParseInt(numberString, base)
    if base == nil then
        base = 10
        local hexMatch = string.match(numberString, "^%s*-?0[xX]")
        if hexMatch then
            base = 16
            local ____string_match_result__0_0
            if string.match(hexMatch, "-") then
                ____string_match_result__0_0 = "-" .. __TS__StringSubstr(numberString, #hexMatch)
            else
                ____string_match_result__0_0 = __TS__StringSubstr(numberString, #hexMatch)
            end
            numberString = ____string_match_result__0_0
        end
    end
    if base < 2 or base > 36 then
        return 0 / 0
    end
    local ____temp_1
    if base <= 10 then
        ____temp_1 = __TS__StringSubstring(__TS__parseInt_base_pattern, 0, base)
    else
        ____temp_1 = __TS__StringSubstr(__TS__parseInt_base_pattern, 0, 10 + 2 * (base - 10))
    end
    local allowedDigits = ____temp_1
    local pattern = ("^%s*(-?[" .. allowedDigits) .. "]*)"
    local number = tonumber(
        string.match(numberString, pattern),
        base
    )
    if number == nil then
        return 0 / 0
    end
    if number >= 0 then
        return math.floor(number)
    else
        return math.ceil(number)
    end
end

function __TS__PromiseAll(iterable)
    local results = {}
    local toResolve = {}
    local numToResolve = 0
    local i = 0
    for ____, item in __TS__Iterator(iterable) do
        if __TS__InstanceOf(item, __TS__Promise) then
            if item.state == __TS__PromiseState.Fulfilled then
                results[i + 1] = item.value
            elseif item.state == __TS__PromiseState.Rejected then
                return __TS__Promise.reject(item.rejectionReason)
            else
                numToResolve = numToResolve + 1
                toResolve[i] = item
            end
        else
            results[i + 1] = item
        end
        i = i + 1
    end
    if numToResolve == 0 then
        return __TS__Promise.resolve(results)
    end
    return __TS__New(
        __TS__Promise,
        function(____, resolve, reject)
            for index, promise in pairs(toResolve) do
                promise["then"](
                    promise,
                    function(____, data)
                        results[index + 1] = data
                        numToResolve = numToResolve - 1
                        if numToResolve == 0 then
                            resolve(_G, results)
                        end
                    end,
                    function(____, reason)
                        reject(_G, reason)
                    end
                )
            end
        end
    )
end

function __TS__PromiseAllSettled(iterable)
    local results = {}
    local toResolve = {}
    local numToResolve = 0
    local i = 0
    for ____, item in __TS__Iterator(iterable) do
        if __TS__InstanceOf(item, __TS__Promise) then
            if item.state == __TS__PromiseState.Fulfilled then
                results[i + 1] = {status = "fulfilled", value = item.value}
            elseif item.state == __TS__PromiseState.Rejected then
                results[i + 1] = {status = "rejected", reason = item.rejectionReason}
            else
                numToResolve = numToResolve + 1
                toResolve[i] = item
            end
        else
            results[i + 1] = {status = "fulfilled", value = item}
        end
        i = i + 1
    end
    if numToResolve == 0 then
        return __TS__Promise.resolve(results)
    end
    return __TS__New(
        __TS__Promise,
        function(____, resolve)
            for index, promise in pairs(toResolve) do
                promise["then"](
                    promise,
                    function(____, data)
                        results[index + 1] = {status = "fulfilled", value = data}
                        numToResolve = numToResolve - 1
                        if numToResolve == 0 then
                            resolve(_G, results)
                        end
                    end,
                    function(____, reason)
                        results[index + 1] = {status = "rejected", reason = reason}
                        numToResolve = numToResolve - 1
                        if numToResolve == 0 then
                            resolve(_G, results)
                        end
                    end
                )
            end
        end
    )
end

function __TS__PromiseAny(iterable)
    local rejections = {}
    local pending = {}
    for ____, item in __TS__Iterator(iterable) do
        if __TS__InstanceOf(item, __TS__Promise) then
            if item.state == __TS__PromiseState.Fulfilled then
                return __TS__Promise.resolve(item.value)
            elseif item.state == __TS__PromiseState.Rejected then
                __TS__ArrayPush(rejections, item.rejectionReason)
            else
                __TS__ArrayPush(pending, item)
            end
        else
            return __TS__Promise.resolve(item)
        end
    end
    if #pending == 0 then
        return __TS__Promise.reject("No promises to resolve with .any()")
    end
    local numResolved = 0
    return __TS__New(
        __TS__Promise,
        function(____, resolve, reject)
            for ____, promise in ipairs(pending) do
                promise["then"](
                    promise,
                    function(____, data)
                        resolve(_G, data)
                    end,
                    function(____, reason)
                        __TS__ArrayPush(rejections, reason)
                        numResolved = numResolved + 1
                        if numResolved == #pending then
                            reject(_G, {name = "AggregateError", message = "All Promises rejected", errors = rejections})
                        end
                    end
                )
            end
        end
    )
end

function __TS__PromiseRace(iterable)
    local pending = {}
    for ____, item in __TS__Iterator(iterable) do
        if __TS__InstanceOf(item, __TS__Promise) then
            if item.state == __TS__PromiseState.Fulfilled then
                return __TS__Promise.resolve(item.value)
            elseif item.state == __TS__PromiseState.Rejected then
                return __TS__Promise.reject(item.rejectionReason)
            else
                __TS__ArrayPush(pending, item)
            end
        else
            return __TS__Promise.resolve(item)
        end
    end
    return __TS__New(
        __TS__Promise,
        function(____, resolve, reject)
            for ____, promise in ipairs(pending) do
                promise["then"](
                    promise,
                    function(____, value) return resolve(_G, value) end,
                    function(____, reason) return reject(_G, reason) end
                )
            end
        end
    )
end

Set = __TS__Class()
Set.name = "Set"
function Set.prototype.____constructor(self, values)
    self[Symbol.toStringTag] = "Set"
    self.size = 0
    self.nextKey = {}
    self.previousKey = {}
    if values == nil then
        return
    end
    local iterable = values
    if iterable[Symbol.iterator] then
        local iterator = iterable[Symbol.iterator](iterable)
        while true do
            local result = iterator:next()
            if result.done then
                break
            end
            self:add(result.value)
        end
    else
        local array = values
        for ____, value in ipairs(array) do
            self:add(value)
        end
    end
end
function Set.prototype.add(self, value)
    local isNewValue = not self:has(value)
    if isNewValue then
        self.size = self.size + 1
    end
    if self.firstKey == nil then
        self.firstKey = value
        self.lastKey = value
    elseif isNewValue then
        self.nextKey[self.lastKey] = value
        self.previousKey[value] = self.lastKey
        self.lastKey = value
    end
    return self
end
function Set.prototype.clear(self)
    self.nextKey = {}
    self.previousKey = {}
    self.firstKey = nil
    self.lastKey = nil
    self.size = 0
end
function Set.prototype.delete(self, value)
    local contains = self:has(value)
    if contains then
        self.size = self.size - 1
        local next = self.nextKey[value]
        local previous = self.previousKey[value]
        if next and previous then
            self.nextKey[previous] = next
            self.previousKey[next] = previous
        elseif next then
            self.firstKey = next
            self.previousKey[next] = nil
        elseif previous then
            self.lastKey = previous
            self.nextKey[previous] = nil
        else
            self.firstKey = nil
            self.lastKey = nil
        end
        self.nextKey[value] = nil
        self.previousKey[value] = nil
    end
    return contains
end
function Set.prototype.forEach(self, callback)
    for ____, key in __TS__Iterator(self:keys()) do
        callback(_G, key, key, self)
    end
end
function Set.prototype.has(self, value)
    return self.nextKey[value] ~= nil or self.lastKey == value
end
Set.prototype[Symbol.iterator] = function(self)
    return self:values()
end
function Set.prototype.entries(self)
    local nextKey = self.nextKey
    local key = self.firstKey
    return {
        [Symbol.iterator] = function(self)
            return self
        end,
        next = function(self)
            local result = {done = not key, value = {key, key}}
            key = nextKey[key]
            return result
        end
    }
end
function Set.prototype.keys(self)
    local nextKey = self.nextKey
    local key = self.firstKey
    return {
        [Symbol.iterator] = function(self)
            return self
        end,
        next = function(self)
            local result = {done = not key, value = key}
            key = nextKey[key]
            return result
        end
    }
end
function Set.prototype.values(self)
    local nextKey = self.nextKey
    local key = self.firstKey
    return {
        [Symbol.iterator] = function(self)
            return self
        end,
        next = function(self)
            local result = {done = not key, value = key}
            key = nextKey[key]
            return result
        end
    }
end
Set[Symbol.species] = Set
Set = Set

function __TS__SparseArrayNew(...)
    local sparseArray = {...}
    sparseArray.sparseLength = select("#", ...)
    return sparseArray
end

function __TS__SparseArrayPush(sparseArray, ...)
    local args = {...}
    local argsLen = select("#", ...)
    local listLen = sparseArray.sparseLength
    for i = 1, argsLen do
        sparseArray[listLen + i] = args[i]
    end
    sparseArray.sparseLength = listLen + argsLen
end

function __TS__SparseArraySpread(sparseArray)
    local _unpack = unpack or table.unpack
    return _unpack(sparseArray, 1, sparseArray.sparseLength)
end

WeakMap = __TS__Class()
WeakMap.name = "WeakMap"
function WeakMap.prototype.____constructor(self, entries)
    self[Symbol.toStringTag] = "WeakMap"
    self.items = {}
    setmetatable(self.items, {__mode = "k"})
    if entries == nil then
        return
    end
    local iterable = entries
    if iterable[Symbol.iterator] then
        local iterator = iterable[Symbol.iterator](iterable)
        while true do
            local result = iterator:next()
            if result.done then
                break
            end
            local value = result.value
            self.items[value[1]] = value[2]
        end
    else
        for ____, kvp in ipairs(entries) do
            self.items[kvp[1]] = kvp[2]
        end
    end
end
function WeakMap.prototype.delete(self, key)
    local contains = self:has(key)
    self.items[key] = nil
    return contains
end
function WeakMap.prototype.get(self, key)
    return self.items[key]
end
function WeakMap.prototype.has(self, key)
    return self.items[key] ~= nil
end
function WeakMap.prototype.set(self, key, value)
    self.items[key] = value
    return self
end
WeakMap[Symbol.species] = WeakMap
WeakMap = WeakMap

WeakSet = __TS__Class()
WeakSet.name = "WeakSet"
function WeakSet.prototype.____constructor(self, values)
    self[Symbol.toStringTag] = "WeakSet"
    self.items = {}
    setmetatable(self.items, {__mode = "k"})
    if values == nil then
        return
    end
    local iterable = values
    if iterable[Symbol.iterator] then
        local iterator = iterable[Symbol.iterator](iterable)
        while true do
            local result = iterator:next()
            if result.done then
                break
            end
            self.items[result.value] = true
        end
    else
        for ____, value in ipairs(values) do
            self.items[value] = true
        end
    end
end
function WeakSet.prototype.add(self, value)
    self.items[value] = true
    return self
end
function WeakSet.prototype.delete(self, value)
    local contains = self:has(value)
    self.items[value] = nil
    return contains
end
function WeakSet.prototype.has(self, value)
    return self.items[value] == true
end
WeakSet[Symbol.species] = WeakSet
WeakSet = WeakSet

function __TS__SourceMapTraceBack(fileName, sourceMap)
    _G.__TS__sourcemap = _G.__TS__sourcemap or ({})
    _G.__TS__sourcemap[fileName] = sourceMap
    if _G.__TS__originalTraceback == nil then
        _G.__TS__originalTraceback = debug.traceback
        debug.traceback = function(thread, message, level)
            local trace
            if thread == nil and message == nil and level == nil then
                trace = _G.__TS__originalTraceback()
            else
                trace = _G.__TS__originalTraceback(thread, message, level)
            end
            if type(trace) ~= "string" then
                return trace
            end
            local function replacer(____, file, srcFile, line)
                local fileSourceMap = _G.__TS__sourcemap[file]
                if fileSourceMap and fileSourceMap[line] then
                    local data = fileSourceMap[line]
                    if type(data) == "number" then
                        return (srcFile .. ":") .. tostring(data)
                    end
                    return (tostring(data.file) .. ":") .. tostring(data.line)
                end
                return (file .. ":") .. line
            end
            local result = string.gsub(
                trace,
                "(%S+)%.lua:(%d+)",
                function(file, line) return replacer(_G, file .. ".lua", file .. ".ts", line) end
            )
            result = string.gsub(
                result,
                "(%[string \"[^\"]+\"%]):(%d+)",
                function(file, line) return replacer(_G, file, "unknown", line) end
            )
            return result
        end
    end
end

function __TS__Spread(iterable)
    local arr = {}
    if type(iterable) == "string" then
        do
            local i = 0
            while i < #iterable do
                arr[#arr + 1] = __TS__StringAccess(iterable, i)
                i = i + 1
            end
        end
    else
        for ____, item in __TS__Iterator(iterable) do
            arr[#arr + 1] = item
        end
    end
    return __TS__Unpack(arr)
end

function __TS__StringCharAt(self, pos)
    if pos ~= pos then
        pos = 0
    end
    if pos < 0 then
        return ""
    end
    return string.sub(self, pos + 1, pos + 1)
end

function __TS__StringCharCodeAt(self, index)
    if index ~= index then
        index = 0
    end
    if index < 0 then
        return 0 / 0
    end
    return string.byte(self, index + 1) or 0 / 0
end

function __TS__StringConcat(str1, ...)
    local args = {...}
    local out = str1
    for ____, arg in ipairs(args) do
        out = out .. arg
    end
    return out
end

function __TS__StringEndsWith(self, searchString, endPosition)
    if endPosition == nil or endPosition > #self then
        endPosition = #self
    end
    return string.sub(self, endPosition - #searchString + 1, endPosition) == searchString
end

function __TS__StringIncludes(self, searchString, position)
    if not position then
        position = 1
    else
        position = position + 1
    end
    local index = string.find(self, searchString, position, true)
    return index ~= nil
end

function __TS__StringPadEnd(self, maxLength, fillString)
    if fillString == nil then
        fillString = " "
    end
    if maxLength ~= maxLength then
        maxLength = 0
    end
    if maxLength == -math.huge or maxLength == math.huge then
        error("Invalid string length", 0)
    end
    if #self >= maxLength or #fillString == 0 then
        return self
    end
    maxLength = maxLength - #self
    if maxLength > #fillString then
        fillString = fillString .. string.rep(
            fillString,
            math.floor(maxLength / #fillString)
        )
    end
    return self .. string.sub(
        fillString,
        1,
        math.floor(maxLength)
    )
end

function __TS__StringPadStart(self, maxLength, fillString)
    if fillString == nil then
        fillString = " "
    end
    if maxLength ~= maxLength then
        maxLength = 0
    end
    if maxLength == -math.huge or maxLength == math.huge then
        error("Invalid string length", 0)
    end
    if #self >= maxLength or #fillString == 0 then
        return self
    end
    maxLength = maxLength - #self
    if maxLength > #fillString then
        fillString = fillString .. string.rep(
            fillString,
            math.floor(maxLength / #fillString)
        )
    end
    return string.sub(
        fillString,
        1,
        math.floor(maxLength)
    ) .. self
end

function __TS__StringReplace(source, searchValue, replaceValue)
    local startPos, endPos = string.find(source, searchValue, nil, true)
    if not startPos then
        return source
    end
    local sub = string.sub
    local before = sub(source, 1, startPos - 1)
    local ____temp_0
    if type(replaceValue) == "string" then
        ____temp_0 = replaceValue
    else
        ____temp_0 = replaceValue(_G, searchValue, startPos - 1, source)
    end
    local replacement = ____temp_0
    local after = sub(source, endPos + 1)
    return (before .. replacement) .. after
end

function __TS__StringReplaceAll(source, searchValue, replaceValue)
    local replacer
    if type(replaceValue) == "string" then
        replacer = function() return replaceValue end
    else
        replacer = replaceValue
    end
    local parts = {}
    local partsIndex = 1
    local sub = string.sub
    if #searchValue == 0 then
        parts[1] = replacer(_G, "", 0, source)
        partsIndex = 2
        for i = 1, #source do
            parts[partsIndex] = sub(source, i, i)
            parts[partsIndex + 1] = replacer(_G, "", i, source)
            partsIndex = partsIndex + 2
        end
    else
        local find = string.find
        local currentPos = 1
        while true do
            local startPos, endPos = find(source, searchValue, currentPos, true)
            if not startPos then
                break
            end
            parts[partsIndex] = sub(source, currentPos, startPos - 1)
            parts[partsIndex + 1] = replacer(_G, searchValue, startPos - 1, source)
            partsIndex = partsIndex + 2
            currentPos = endPos + 1
        end
        parts[partsIndex] = sub(source, currentPos)
    end
    return table.concat(parts)
end

function __TS__StringSlice(self, start, ____end)
    if start == nil or start ~= start then
        start = 0
    end
    if ____end ~= ____end then
        ____end = 0
    end
    if start >= 0 then
        start = start + 1
    end
    if ____end ~= nil and ____end < 0 then
        ____end = ____end - 1
    end
    return string.sub(self, start, ____end)
end

function __TS__StringSplit(source, separator, limit)
    if limit == nil then
        limit = 4294967295
    end
    if limit == 0 then
        return {}
    end
    local out = {}
    local index = 0
    local count = 0
    if separator == nil or separator == "" then
        while index < #source - 1 and count < limit do
            out[count + 1] = __TS__StringAccess(source, index)
            count = count + 1
            index = index + 1
        end
    else
        local separatorLength = #separator
        local nextIndex = (string.find(source, separator, nil, true) or 0) - 1
        while nextIndex >= 0 and count < limit do
            out[count + 1] = __TS__StringSubstring(source, index, nextIndex)
            count = count + 1
            index = nextIndex + separatorLength
            nextIndex = (string.find(
                source,
                separator,
                math.max(index + 1, 1),
                true
            ) or 0) - 1
        end
    end
    if count < limit then
        out[count + 1] = __TS__StringSubstring(source, index)
    end
    return out
end

function __TS__StringStartsWith(self, searchString, position)
    if position == nil or position < 0 then
        position = 0
    end
    return string.sub(self, position + 1, #searchString + position) == searchString
end

function __TS__StringTrim(self)
    local result = string.gsub(self, "^[%s ﻿]*(.-)[%s ﻿]*$", "%1")
    return result
end

function __TS__StringTrimEnd(self)
    local result = string.gsub(self, "[%s ﻿]*$", "")
    return result
end

function __TS__StringTrimStart(self)
    local result = string.gsub(self, "^[%s ﻿]*", "")
    return result
end

____symbolRegistry = {}
function __TS__SymbolRegistryFor(key)
    if not ____symbolRegistry[key] then
        ____symbolRegistry[key] = __TS__Symbol(key)
    end
    return ____symbolRegistry[key]
end
function __TS__SymbolRegistryKeyFor(sym)
    for key in pairs(____symbolRegistry) do
        if ____symbolRegistry[key] == sym then
            return key
        end
    end
end

function __TS__TypeOf(value)
    local luaType = type(value)
    if luaType == "table" then
        return "object"
    elseif luaType == "nil" then
        return "undefined"
    else
        return luaType
    end
end

 end,
["types"] = function(...) 
--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
return ____exports
 end,
["config"] = function(...) 
--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
____exports.config = {
    enabled = true,
    showAdditionalText = true,
    hideOnCurseOfTheUnknown = false,
    onlyShowNextRespawn = false,
    transparency = 1,
    useAlternateSprites = false,
    spriteScale = 0.5,
    fontScale = 0.5,
    position = Vector(70, 15)
}
return ____exports
 end,
["helpers.general"] = function(...) 
--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
local ____config = require("config")
local config = ____config.config
function ____exports.hasCurseOfTheUnknown(self)
    return Game():GetLevel():GetCurses() == LevelCurse.CURSE_OF_THE_UNKNOWN
end
function ____exports.updateRespawnsForPlayer(self, player, respawnsForRender)
    local data = player:GetData()
    data.DetailedRespawnRespawnInfo = respawnsForRender
end
function ____exports.getRespawnsForPlayer(self, player)
    return player:GetData().DetailedRespawnRespawnInfo
end
function ____exports.shouldRunModStuff(self)
    return config.enabled and not (config.hideOnCurseOfTheUnknown and ____exports.hasCurseOfTheUnknown(nil)) and Game():GetHUD():IsVisible()
end
function ____exports.getCardCountForPlayer(self, player, card)
    local count = 0
    if player:GetCard(0) == card then
        count = count + 1
    end
    if player:GetCard(1) == card then
        count = count + 1
    end
    return count
end
return ____exports
 end,
["VANILLA_RESPAWNS"] = function(...) 
--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
local ____general = require("helpers.general")
local getCardCountForPlayer = ____general.getCardCountForPlayer
____exports.VANILLA_RESPAWNS = {
    {
        name = "Soul Of Lazarus",
        gfx = "gfx/detailedrespawn/Soul Of Lazarus.png",
        positionModifier = Vector(3, 0),
        additionalText = function(____, player) return getCardCountForPlayer(nil, player, Card.CARD_SOUL_LAZARUS) == 2 and "x2" or "" end,
        condition = function(self, player)
            return getCardCountForPlayer(nil, player, Card.CARD_SOUL_LAZARUS) > 0
        end
    },
    {
        name = "1up!",
        itemId = CollectibleType.COLLECTIBLE_1UP,
        positionModifier = Vector(0.5, 0),
        increaseCount = true
    },
    {
        name = "Second Lazarus",
        gfx = Isaac.GetItemConfig():GetCollectible(CollectibleType.COLLECTIBLE_LAZARUS_RAGS).GfxFileName,
        condition = function(self, player)
            return player:GetPlayerType() == PlayerType.PLAYER_LAZARUS
        end,
        hasAltSprite = true,
        increaseCount = true
    },
    {
        name = "Dead Cat",
        itemId = CollectibleType.COLLECTIBLE_DEAD_CAT,
        additionalText = function(____, player) return "x" .. tostring(player:GetData().DetailedRespawnDeadCatCount) end,
        increaseCount = false
    },
    {name = "Inner Child", itemId = CollectibleType.COLLECTIBLE_INNER_CHILD, increaseCount = true},
    {name = "Lazarus' Rags", itemId = CollectibleType.COLLECTIBLE_LAZARUS_RAGS, hasAltSprite = true, increaseCount = true},
    {
        name = "Guppy's Collar",
        itemId = CollectibleType.COLLECTIBLE_GUPPYS_COLLAR,
        additionalText = "50%",
        positionModifier = Vector(1.5, 0),
        increaseCount = true
    },
    {name = "Ankh", itemId = CollectibleType.COLLECTIBLE_ANKH, hasAltSprite = true, increaseCount = true},
    {
        name = "Broken Ankh",
        gfx = Isaac.GetItemConfig():GetTrinket(TrinketType.TRINKET_BROKEN_ANKH).GfxFileName,
        additionalText = "22%",
        positionModifier = Vector(0, 0.5),
        condition = function(self, player)
            return player:HasTrinket(TrinketType.TRINKET_BROKEN_ANKH)
        end
    },
    {
        name = "Judas' Shadow",
        itemId = CollectibleType.COLLECTIBLE_JUDAS_SHADOW,
        positionModifier = Vector(-1, -0.5),
        hasAltSprite = true,
        increaseCount = true
    },
    {
        name = "Missing Poster",
        gfx = Isaac.GetItemConfig():GetTrinket(TrinketType.TRINKET_MISSING_POSTER).GfxFileName,
        positionModifier = Vector(-2, 1),
        condition = function(self, player)
            return player:HasTrinket(TrinketType.TRINKET_MISSING_POSTER, true)
        end,
        hasAltSprite = true
    }
}
return ____exports
 end,
["helpers.normalizeRespawn"] = function(...) 
--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local function generateRenderFunction(self, respawn)
    if respawn.itemId == nil then
        error(("Respawn " .. respawn.name) .. " does not have a condition nor an item id")
    end
    return function(____, player) return player:HasCollectible(respawn.itemId) end
end
local function getAdditionalTextFunction(self, respawn)
    if type(respawn.additionalText) == "string" then
        return function() return respawn.additionalText end
    end
    if type(respawn.additionalText) == "function" then
        return respawn.additionalText
    end
    return function(____, player)
        if respawn.itemId == nil then
            return ""
        end
        local collectibleCount = player:GetCollectibleNum(respawn.itemId)
        return collectibleCount > 1 and "x" .. tostring(collectibleCount) or ""
    end
end
local function getAltIconPath(self, name)
    return ("gfx/detailedrespawn/" .. name) .. ".png"
end
local function getGfx(self, respawn, useAlternateSprite)
    if useAlternateSprite and respawn.hasAltSprite then
        return getAltIconPath(nil, respawn.name)
    end
    if respawn.gfx ~= nil then
        return respawn.gfx
    end
    if respawn.itemId == nil then
        error(("Error in respawn " .. respawn.name) .. " - no gfx provided and no itemid to infer gfx from")
    end
    return Isaac.GetItemConfig():GetCollectible(respawn.itemId).GfxFileName
end
local function getIncreaseCountFunction(self, respawn)
    if not respawn.increaseCount then
        return function() return 0 end
    end
    if respawn.itemId ~= nil then
        return function(____, player) return player:GetCollectibleNum(respawn.itemId) end
    end
    return function() return 1 end
end
function ____exports.normalizeRespawn(self, respawn, config)
    local gfx = getGfx(nil, respawn, config.useAlternateSprites)
    local sprite = Sprite()
    sprite:Load("gfx/005.100_collectible.anm2", false)
    sprite:Play("ShopIdle", true)
    sprite.Scale = sprite.Scale * config.spriteScale
    sprite.Color = Color(
        1,
        1,
        1,
        config.transparency,
        0,
        0,
        0
    )
    sprite:ReplaceSpritesheet(1, gfx)
    sprite:LoadGraphics()
    sprite:Update()
    local font = Font()
    font:Load("font/terminus.fnt")
    local normalizedRespawn = {
        name = respawn.name,
        gfx = gfx,
        sprite = sprite,
        font = font,
        increaseCount = getIncreaseCountFunction(nil, respawn),
        additionalText = getAdditionalTextFunction(nil, respawn),
        positionModifier = respawn.positionModifier ~= nil and respawn.positionModifier or Vector(0, 0),
        shouldRender = respawn.condition ~= nil and respawn.condition or generateRenderFunction(nil, respawn)
    }
    return normalizedRespawn
end
function ____exports.NormalizeRespawns(self, respawns, config)
    return __TS__ArrayMap(
        respawns,
        function(____, respawn) return ____exports.normalizeRespawn(nil, respawn, config) end
    )
end
return ____exports
 end,
["data.normalizedIRespawns"] = function(...) 
--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
local ____config = require("config")
local config = ____config.config
local ____normalizeRespawn = require("helpers.normalizeRespawn")
local NormalizeRespawns = ____normalizeRespawn.NormalizeRespawns
local ____VANILLA_RESPAWNS = require("VANILLA_RESPAWNS")
local VANILLA_RESPAWNS = ____VANILLA_RESPAWNS.VANILLA_RESPAWNS
local normalizedRespawns = NormalizeRespawns(nil, VANILLA_RESPAWNS, config)
function ____exports.setNormalizedRespawns(self, data)
    normalizedRespawns = data
end
function ____exports.getNormalizedRespawns(self)
    return normalizedRespawns
end
function ____exports.refreshNormalizedRespawns(self)
    normalizedRespawns = NormalizeRespawns(nil, VANILLA_RESPAWNS, config)
end
return ____exports
 end,
["callbacks.onPEffectUpdate"] = function(...) 
--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____config = require("config")
local config = ____config.config
local ____normalizedIRespawns = require("data.normalizedIRespawns")
local getNormalizedRespawns = ____normalizedIRespawns.getNormalizedRespawns
local ____general = require("helpers.general")
local shouldRunModStuff = ____general.shouldRunModStuff
local updateRespawnsForPlayer = ____general.updateRespawnsForPlayer
local function filterRespawnsForPlayer(self, player)
    local respawnsForRender = {}
    for ____, respawn in ipairs(getNormalizedRespawns(nil)) do
        if respawn:shouldRender(player) then
            __TS__ArrayPush(respawnsForRender, respawn)
            if config.onlyShowNextRespawn then
                break
            end
        end
    end
    return respawnsForRender
end
function ____exports.onPEffectUpdate(self, player)
    if not shouldRunModStuff(nil) then
        return
    end
    local fliteredRespawns = filterRespawnsForPlayer(nil, player)
    updateRespawnsForPlayer(nil, player, fliteredRespawns)
    local data = player:GetData()
    local countWithoutDeadCat = __TS__ArrayReduce(
        fliteredRespawns,
        function(____, prev, respawn) return prev + respawn:increaseCount(player) end,
        0
    )
    data.DetailedRespawnDeadCatCount = player:GetExtraLives() - countWithoutDeadCat
end
return ____exports
 end,
["helpers.rendering"] = function(...) 
--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
local ____general = require("helpers.general")
local hasCurseOfTheUnknown = ____general.hasCurseOfTheUnknown
local function getTotalHeartsDisplayed(self, player)
    return player:GetEffectiveMaxHearts() + player:GetSoulHearts() + player:GetBrokenHearts() * 2
end
local function getDisplayedHeartsColumns(self, player)
    local totalHearts = getTotalHeartsDisplayed(nil, player)
    return totalHearts > 12 and 6 or math.floor(totalHearts / 2 + 0.5)
end
function ____exports.calculateHeartsUiOffset(self, player)
    if hasCurseOfTheUnknown(nil) then
        return Vector(0, 0)
    end
    local totalHeartColumns = getDisplayedHeartsColumns(nil, player)
    local heartCountModifier = Vector(12 * (totalHeartColumns - 1), 0)
    local respawnCountText = "x" .. tostring(player:GetExtraLives())
    if player:HasCollectible(CollectibleType.COLLECTIBLE_GUPPYS_COLLAR) then
        respawnCountText = respawnCountText .. "?"
    end
    local respawnCountTextModifier = player:GetExtraLives() ~= 0 and Vector(#respawnCountText * 5, 0) or Vector(0, 0)
    local holyMantleModifier = totalHeartColumns < 6 and player:GetEffects():HasCollectibleEffect(CollectibleType.COLLECTIBLE_HOLY_MANTLE) and Vector(12, 0) or Vector(0, 0)
    return heartCountModifier + respawnCountTextModifier + holyMantleModifier
end
function ____exports.hudOffset(self)
    local notches = math.floor(Options.HUDOffset * 10)
    local xoffset = notches * 2
    local oneovereight = 1 / 8
    local yoffset = oneovereight * (10 * notches + (-1) ^ notches + 7)
    return Vector(xoffset, yoffset)
end
return ____exports
 end,
["callbacks.onRender"] = function(...) 
--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____config = require("config")
local config = ____config.config
local ____general = require("helpers.general")
local getRespawnsForPlayer = ____general.getRespawnsForPlayer
local shouldRunModStuff = ____general.shouldRunModStuff
local ____rendering = require("helpers.rendering")
local calculateHeartsUiOffset = ____rendering.calculateHeartsUiOffset
local hudOffset = ____rendering.hudOffset
function ____exports.onRender(self)
    if not shouldRunModStuff(nil) then
        return
    end
    local player = Isaac.GetPlayer(0)
    local position = config.position + calculateHeartsUiOffset(nil, player) + hudOffset(nil)
    __TS__ArrayForEach(
        getRespawnsForPlayer(nil, player),
        function(____, ____bindingPattern0)
            local positionModifier
            local additionalText
            local font
            local sprite
            sprite = ____bindingPattern0.sprite
            font = ____bindingPattern0.font
            additionalText = ____bindingPattern0.additionalText
            positionModifier = ____bindingPattern0.positionModifier
            local text = additionalText(nil, player)
            sprite.Scale = Vector(config.spriteScale, config.spriteScale)
            sprite.Color = Color(
                1,
                1,
                1,
                config.transparency,
                0,
                0,
                0
            )
            sprite:Render(
                position + positionModifier,
                Vector(0, 0),
                Vector(0, 0)
            )
            if config.showAdditionalText and text ~= "" then
                local stringWidth = font:GetStringWidth(text) * config.fontScale
                font:DrawStringScaled(
                    text,
                    position.X - stringWidth / 2 + positionModifier.X,
                    position.Y,
                    config.fontScale,
                    config.fontScale,
                    KColor(1, 1, 1, config.transparency),
                    0,
                    false
                )
            end
            position = position + Vector(32 * config.spriteScale, 0)
        end
    )
end
return ____exports
 end,
["helpers.moddedRespawns"] = function(...) 
--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
local ____normalizedIRespawns = require("data.normalizedIRespawns")
local getNormalizedRespawns = ____normalizedIRespawns.getNormalizedRespawns
local refreshNormalizedRespawns = ____normalizedIRespawns.refreshNormalizedRespawns
local ____VANILLA_RESPAWNS = require("VANILLA_RESPAWNS")
local VANILLA_RESPAWNS = ____VANILLA_RESPAWNS.VANILLA_RESPAWNS
____exports.RespawnPosition = {
    First = 0,
    Last = -1,
    After = function(self, after)
        local normalizedRespawns = getNormalizedRespawns(nil)
        do
            local i = 0
            while i < #normalizedRespawns do
                local respawn = normalizedRespawns[i + 1]
                if respawn.name == after then
                    return i + 1
                end
                i = i + 1
            end
        end
        error(("Error while creating modded respawn - A respawn with the name " .. after) .. " does not exists")
    end
}
function ____exports.AddCustomRespawn(self, respawn, position)
    if position == -1 then
        table.insert(VANILLA_RESPAWNS, respawn)
    else
        table.insert(VANILLA_RESPAWNS, position + 1, respawn)
    end
    refreshNormalizedRespawns(nil)
end
return ____exports
 end,
["modConfigMenu"] = function(...) 
--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____config = require("config")
local config = ____config.config
local ____normalizedIRespawns = require("data.normalizedIRespawns")
local refreshNormalizedRespawns = ____normalizedIRespawns.refreshNormalizedRespawns
if ModConfigMenu ~= nil then
    local TRANSPARENCY_LEVELS = {
        0.25,
        0.3,
        0.4,
        0.5,
        0.6,
        0.75,
        0.8,
        0.9,
        1
    }
    ModConfigMenu.RemoveCategory("Detailed Respawn")
    ModConfigMenu.AddSetting(
        "Detailed Respawn",
        "General",
        {
            Type = 4,
            CurrentSetting = function()
                return config.enabled
            end,
            Display = function()
                local onOff = "Disabled"
                if config.enabled then
                    onOff = "Enabled"
                end
                return "The mod is currently: " .. onOff
            end,
            OnChange = function(IsOn)
                config.enabled = IsOn
            end,
            Info = {"Disable to hide the respawn information"}
        }
    )
    ModConfigMenu.AddSetting(
        "Detailed Respawn",
        "General",
        {
            Type = 4,
            CurrentSetting = function()
                return config.showAdditionalText
            end,
            Display = function()
                local onOff = "Disabled"
                if config.showAdditionalText then
                    onOff = "Enabled"
                end
                return "Show additional text: " .. onOff
            end,
            OnChange = function(IsOn)
                config.showAdditionalText = IsOn
            end,
            Info = {"Disable to hide additional text", "Additional text can be: \"50%\" for Guppy's collar", "And the number of nine lives left"}
        }
    )
    ModConfigMenu.AddSetting(
        "Detailed Respawn",
        "General",
        {
            Type = 4,
            CurrentSetting = function()
                return config.onlyShowNextRespawn
            end,
            Display = function()
                local onOff = "Disabled"
                if config.onlyShowNextRespawn then
                    onOff = "Enabled"
                end
                return "Only show next respawn: " .. onOff
            end,
            OnChange = function(IsOn)
                config.onlyShowNextRespawn = IsOn
            end,
            Info = {"Only show the next respawn", "That is going to activate.", "Instead of all respawns"}
        }
    )
    ModConfigMenu.AddSetting(
        "Detailed Respawn",
        "General",
        {
            Type = 4,
            CurrentSetting = function()
                return config.hideOnCurseOfTheUnknown
            end,
            Display = function()
                local onOff = "Disabled"
                if config.hideOnCurseOfTheUnknown then
                    onOff = "Enabled"
                end
                return "Hide on Curse Of The Unknown: " .. onOff
            end,
            OnChange = function(IsOn)
                config.hideOnCurseOfTheUnknown = IsOn
            end,
            Info = {"Hide respawn info on curse of the unknown."}
        }
    )
    ModConfigMenu.AddSetting(
        "Detailed Respawn",
        "Style",
        {
            Type = 5,
            CurrentSetting = function()
                return __TS__ArrayIndexOf(TRANSPARENCY_LEVELS, config.transparency)
            end,
            Minimum = 0,
            Maximum = #TRANSPARENCY_LEVELS - 1,
            Display = function()
                return "Transparency: " .. tostring(config.transparency)
            end,
            OnChange = function(num)
                config.transparency = TRANSPARENCY_LEVELS[num + 1]
            end,
            Info = {"Transparency of the hud", "1 is maximum (completly visible)"}
        }
    )
    local sizes = {
        0.25,
        0.3,
        0.4,
        0.5,
        0.6,
        0.75,
        0.8,
        0.9,
        1
    }
    ModConfigMenu.AddText("Detailed Respawn", "Style", "For sizes,")
    ModConfigMenu.AddText("Detailed Respawn", "Style", "anything other than 0.5 looks weird.")
    ModConfigMenu.AddText("Detailed Respawn", "Style", "But you do you :D")
    ModConfigMenu.AddSetting(
        "Detailed Respawn",
        "Style",
        {
            Type = 5,
            CurrentSetting = function()
                return __TS__ArrayIndexOf(sizes, config.spriteScale)
            end,
            Minimum = 0,
            Maximum = #sizes - 1,
            Display = function()
                return "Icons size: " .. tostring(config.spriteScale)
            end,
            OnChange = function(num)
                config.spriteScale = sizes[num + 1]
            end,
            Info = {"Size of the respawn icons", "I recommend 0.5"}
        }
    )
    ModConfigMenu.AddSetting(
        "Detailed Respawn",
        "Style",
        {
            Type = 5,
            CurrentSetting = function()
                return __TS__ArrayIndexOf(sizes, config.fontScale)
            end,
            Minimum = 0,
            Maximum = #sizes - 1,
            Display = function()
                return "Text size: " .. tostring(config.fontScale)
            end,
            OnChange = function(num)
                config.fontScale = sizes[num + 1]
            end,
            Info = {"Size of the additional text", "I recommend 0.5"}
        }
    )
    ModConfigMenu.AddSetting(
        "Detailed Respawn",
        "Style",
        {
            Type = 4,
            CurrentSetting = function()
                return config.useAlternateSprites
            end,
            Display = function()
                local onOff = "Disabled"
                if config.useAlternateSprites then
                    onOff = "Enabled"
                end
                return "Use alternate sprites: " .. onOff
            end,
            OnChange = function(IsOn)
                config.useAlternateSprites = IsOn
                refreshNormalizedRespawns(nil)
            end,
            Info = {"Use the character icons", "Instead of the item icons", "eg: Dark Judas for Judas' Shadow"}
        }
    )
end
return ____exports
 end,
["main"] = function(...) 
--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
local json = require("json")
local ____onPEffectUpdate = require("callbacks.onPEffectUpdate")
local onPEffectUpdate = ____onPEffectUpdate.onPEffectUpdate
local ____onRender = require("callbacks.onRender")
local onRender = ____onRender.onRender
local ____config = require("config")
local config = ____config.config
local ____normalizedIRespawns = require("data.normalizedIRespawns")
local refreshNormalizedRespawns = ____normalizedIRespawns.refreshNormalizedRespawns
local ____moddedRespawns = require("helpers.moddedRespawns")
local AddCustomRespawn = ____moddedRespawns.AddCustomRespawn
local RespawnPosition = ____moddedRespawns.RespawnPosition
require("modConfigMenu")
function ____exports.main(self)
    local mod = RegisterMod("DetailedRespawn", 1)
    local function onGameStart(self)
        if mod:HasData() then
            local loadedFromSave = json.decode(Isaac.LoadModData(mod))
            for k, v in pairs(loadedFromSave) do
                config[k] = v
            end
            refreshNormalizedRespawns(nil)
        end
    end
    local function onGameExit(self)
        mod:SaveData(json.encode(config))
    end
    mod:AddCallback(ModCallbacks.MC_POST_PEFFECT_UPDATE, onPEffectUpdate)
    mod:AddCallback(ModCallbacks.MC_POST_RENDER, onRender)
    mod:AddCallback(ModCallbacks.MC_POST_GAME_STARTED, onGameStart)
    mod:AddCallback(ModCallbacks.MC_PRE_GAME_EXIT, onGameExit)
    Isaac.DebugString("detailed respawn initialized.")
end
DetailedRespawnGlobalAPI = {AddCustomRespawn = AddCustomRespawn, RespawnPosition = RespawnPosition}
return ____exports
 end,
["bundleEntry"] = function(...) 
--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
local ____main = require("main")
local main = ____main.main
main(nil)
return ____exports
 end,
}
return require("bundleEntry", ...)
