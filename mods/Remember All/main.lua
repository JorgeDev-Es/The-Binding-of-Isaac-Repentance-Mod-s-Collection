--[[

This Isaac mod was created with the IsaacScript tool.

The Lua code in this file is not actually the source code for the program. Rather, it was
automatically generated from higher-level TypeScript code, and might be hard to read. If you want to
understand how the code in this mod works, you should read the actual TypeScript source code
directly instead of trying to read this file. Usually, the link to the source code can be found in
the mod's description on the Steam Workshop. If not, you can ask the mod author directly if the
source code is publicly available.

IsaacScript provides a lot of advantages over using raw Lua. For more information about the tool,
see the official website: https://isaacscript.github.io/

--]]

---@diagnostic disable: assign-type-mismatch
---@diagnostic disable: deprecated
---@diagnostic disable: lowercase-global
---@diagnostic disable: need-check-nil
---@diagnostic disable: redefined-local
---@diagnostic disable: redundant-parameter
---@diagnostic disable: unused-function
---@diagnostic disable: unused-local
---@diagnostic disable: unused-vararg


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
local function __TS__ArrayIsArray(value)
    return type(value) == "table" and (value[1] ~= nil or next(value) == nil)
end

local function __TS__ArrayConcat(self, ...)
    local items = {...}
    local result = {}
    local len = 0
    for i = 1, #self do
        len = len + 1
        result[len] = self[i]
    end
    for i = 1, #items do
        local item = items[i]
        if __TS__ArrayIsArray(item) then
            for j = 1, #item do
                len = len + 1
                result[len] = item[j]
            end
        else
            len = len + 1
            result[len] = item
        end
    end
    return result
end

local __TS__Symbol, Symbol
do
    local symbolMetatable = {__tostring = function(self)
        return ("Symbol(" .. (self.description or "")) .. ")"
    end}
    function __TS__Symbol(description)
        return setmetatable({description = description}, symbolMetatable)
    end
    Symbol = {
        iterator = __TS__Symbol("Symbol.iterator"),
        hasInstance = __TS__Symbol("Symbol.hasInstance"),
        species = __TS__Symbol("Symbol.species"),
        toStringTag = __TS__Symbol("Symbol.toStringTag")
    }
end

local function __TS__ArrayEntries(array)
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

local function __TS__ArrayEvery(self, callbackfn, thisArg)
    for i = 1, #self do
        if not callbackfn(thisArg, self[i], i - 1, self) then
            return false
        end
    end
    return true
end

local function __TS__ArrayFilter(self, callbackfn, thisArg)
    local result = {}
    local len = 0
    for i = 1, #self do
        if callbackfn(thisArg, self[i], i - 1, self) then
            len = len + 1
            result[len] = self[i]
        end
    end
    return result
end

local function __TS__ArrayForEach(self, callbackFn, thisArg)
    for i = 1, #self do
        callbackFn(thisArg, self[i], i - 1, self)
    end
end

local function __TS__ArrayFind(self, predicate, thisArg)
    for i = 1, #self do
        local elem = self[i]
        if predicate(thisArg, elem, i - 1, self) then
            return elem
        end
    end
    return nil
end

local function __TS__ArrayFindIndex(self, callbackFn, thisArg)
    for i = 1, #self do
        if callbackFn(thisArg, self[i], i - 1, self) then
            return i - 1
        end
    end
    return -1
end

local __TS__Iterator
do
    local function iteratorGeneratorStep(self)
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
    local function iteratorIteratorStep(self)
        local result = self:next()
        if result.done then
            return
        end
        return true, result.value
    end
    local function iteratorStringStep(self, index)
        index = index + 1
        if index > #self then
            return
        end
        return index, string.sub(self, index, index)
    end
    function __TS__Iterator(iterable)
        if type(iterable) == "string" then
            return iteratorStringStep, iterable, 0
        elseif iterable.____coroutine ~= nil then
            return iteratorGeneratorStep, iterable
        elseif iterable[Symbol.iterator] then
            local iterator = iterable[Symbol.iterator](iterable)
            return iteratorIteratorStep, iterator
        else
            return ipairs(iterable)
        end
    end
end

local __TS__ArrayFrom
do
    local function arrayLikeStep(self, index)
        index = index + 1
        if index > self.length then
            return
        end
        return index, self[index]
    end
    local function arrayLikeIterator(arr)
        if type(arr.length) == "number" then
            return arrayLikeStep, arr, 0
        end
        return __TS__Iterator(arr)
    end
    function __TS__ArrayFrom(arrayLike, mapFn, thisArg)
        local result = {}
        if mapFn == nil then
            for ____, v in arrayLikeIterator(arrayLike) do
                result[#result + 1] = v
            end
        else
            for i, v in arrayLikeIterator(arrayLike) do
                result[#result + 1] = mapFn(thisArg, v, i - 1)
            end
        end
        return result
    end
end

local function __TS__ArrayIncludes(self, searchElement, fromIndex)
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
    for i = k + 1, len do
        if self[i] == searchElement then
            return true
        end
    end
    return false
end

local function __TS__ArrayIndexOf(self, searchElement, fromIndex)
    if fromIndex == nil then
        fromIndex = 0
    end
    local len = #self
    if len == 0 then
        return -1
    end
    if fromIndex >= len then
        return -1
    end
    if fromIndex < 0 then
        fromIndex = len + fromIndex
        if fromIndex < 0 then
            fromIndex = 0
        end
    end
    for i = fromIndex + 1, len do
        if self[i] == searchElement then
            return i - 1
        end
    end
    return -1
end

local function __TS__ArrayJoin(self, separator)
    if separator == nil then
        separator = ","
    end
    local parts = {}
    for i = 1, #self do
        parts[i] = tostring(self[i])
    end
    return table.concat(parts, separator)
end

local function __TS__ArrayMap(self, callbackfn, thisArg)
    local result = {}
    for i = 1, #self do
        result[i] = callbackfn(thisArg, self[i], i - 1, self)
    end
    return result
end

local function __TS__ArrayPush(self, ...)
    local items = {...}
    local len = #self
    for i = 1, #items do
        len = len + 1
        self[len] = items[i]
    end
    return len
end

local function __TS__ArrayPushArray(self, items)
    local len = #self
    for i = 1, #items do
        len = len + 1
        self[len] = items[i]
    end
    return len
end

local function __TS__CountVarargs(...)
    return select("#", ...)
end

local function __TS__ArrayReduce(self, callbackFn, ...)
    local len = #self
    local k = 0
    local accumulator = nil
    if __TS__CountVarargs(...) ~= 0 then
        accumulator = ...
    elseif len > 0 then
        accumulator = self[1]
        k = 1
    else
        error("Reduce of empty array with no initial value", 0)
    end
    for i = k + 1, len do
        accumulator = callbackFn(
            nil,
            accumulator,
            self[i],
            i - 1,
            self
        )
    end
    return accumulator
end

local function __TS__ArrayReduceRight(self, callbackFn, ...)
    local len = #self
    local k = len - 1
    local accumulator = nil
    if __TS__CountVarargs(...) ~= 0 then
        accumulator = ...
    elseif len > 0 then
        accumulator = self[k + 1]
        k = k - 1
    else
        error("Reduce of empty array with no initial value", 0)
    end
    for i = k + 1, 1, -1 do
        accumulator = callbackFn(
            nil,
            accumulator,
            self[i],
            i - 1,
            self
        )
    end
    return accumulator
end

local function __TS__ArrayReverse(self)
    local i = 1
    local j = #self
    while i < j do
        local temp = self[j]
        self[j] = self[i]
        self[i] = temp
        i = i + 1
        j = j - 1
    end
    return self
end

local function __TS__ArrayUnshift(self, ...)
    local items = {...}
    local numItemsToInsert = #items
    if numItemsToInsert == 0 then
        return #self
    end
    for i = #self, 1, -1 do
        self[i + numItemsToInsert] = self[i]
    end
    for i = 1, numItemsToInsert do
        self[i] = items[i]
    end
    return #self
end

local function __TS__ArraySort(self, compareFn)
    if compareFn ~= nil then
        table.sort(
            self,
            function(a, b) return compareFn(nil, a, b) < 0 end
        )
    else
        table.sort(self)
    end
    return self
end

local function __TS__ArraySlice(self, first, last)
    local len = #self
    local ____first_0 = first
    if ____first_0 == nil then
        ____first_0 = 0
    end
    first = ____first_0
    if first < 0 then
        first = len + first
        if first < 0 then
            first = 0
        end
    else
        if first > len then
            first = len
        end
    end
    local ____last_1 = last
    if ____last_1 == nil then
        ____last_1 = len
    end
    last = ____last_1
    if last < 0 then
        last = len + last
        if last < 0 then
            last = 0
        end
    else
        if last > len then
            last = len
        end
    end
    local out = {}
    first = first + 1
    last = last + 1
    local n = 1
    while first < last do
        out[n] = self[first]
        first = first + 1
        n = n + 1
    end
    return out
end

local function __TS__ArraySome(self, callbackfn, thisArg)
    for i = 1, #self do
        if callbackfn(thisArg, self[i], i - 1, self) then
            return true
        end
    end
    return false
end

local function __TS__ArraySplice(self, ...)
    local args = {...}
    local len = #self
    local actualArgumentCount = __TS__CountVarargs(...)
    local start = args[1]
    local deleteCount = args[2]
    if start < 0 then
        start = len + start
        if start < 0 then
            start = 0
        end
    elseif start > len then
        start = len
    end
    local itemCount = actualArgumentCount - 2
    if itemCount < 0 then
        itemCount = 0
    end
    local actualDeleteCount
    if actualArgumentCount == 0 then
        actualDeleteCount = 0
    elseif actualArgumentCount == 1 then
        actualDeleteCount = len - start
    else
        local ____deleteCount_0 = deleteCount
        if ____deleteCount_0 == nil then
            ____deleteCount_0 = 0
        end
        actualDeleteCount = ____deleteCount_0
        if actualDeleteCount < 0 then
            actualDeleteCount = 0
        end
        if actualDeleteCount > len - start then
            actualDeleteCount = len - start
        end
    end
    local out = {}
    for k = 1, actualDeleteCount do
        local from = start + k
        if self[from] ~= nil then
            out[k] = self[from]
        end
    end
    if itemCount < actualDeleteCount then
        for k = start + 1, len - actualDeleteCount do
            local from = k + actualDeleteCount
            local to = k + itemCount
            if self[from] then
                self[to] = self[from]
            else
                self[to] = nil
            end
        end
        for k = len - actualDeleteCount + itemCount + 1, len do
            self[k] = nil
        end
    elseif itemCount > actualDeleteCount then
        for k = len - actualDeleteCount, start + 1, -1 do
            local from = k + actualDeleteCount
            local to = k + itemCount
            if self[from] then
                self[to] = self[from]
            else
                self[to] = nil
            end
        end
    end
    local j = start + 1
    for i = 3, actualArgumentCount do
        self[j] = args[i]
        j = j + 1
    end
    for k = #self, len - actualDeleteCount + itemCount + 1, -1 do
        self[k] = nil
    end
    return out
end

local function __TS__ArrayToObject(self)
    local object = {}
    for i = 1, #self do
        object[i - 1] = self[i]
    end
    return object
end

local function __TS__ArrayFlat(self, depth)
    if depth == nil then
        depth = 1
    end
    local result = {}
    local len = 0
    for i = 1, #self do
        local value = self[i]
        if depth > 0 and __TS__ArrayIsArray(value) then
            local toAdd
            if depth == 1 then
                toAdd = value
            else
                toAdd = __TS__ArrayFlat(value, depth - 1)
            end
            for j = 1, #toAdd do
                local val = toAdd[j]
                len = len + 1
                result[len] = val
            end
        else
            len = len + 1
            result[len] = value
        end
    end
    return result
end

local function __TS__ArrayFlatMap(self, callback, thisArg)
    local result = {}
    local len = 0
    for i = 1, #self do
        local value = callback(thisArg, self[i], i - 1, self)
        if __TS__ArrayIsArray(value) then
            for j = 1, #value do
                len = len + 1
                result[len] = value[j]
            end
        else
            len = len + 1
            result[len] = value
        end
    end
    return result
end

local function __TS__ArraySetLength(self, length)
    if length < 0 or length ~= length or length == math.huge or math.floor(length) ~= length then
        error(
            "invalid array length: " .. tostring(length),
            0
        )
    end
    for i = length + 1, #self do
        self[i] = nil
    end
    return length
end

local function __TS__InstanceOf(obj, classTbl)
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

local function __TS__New(target, ...)
    local instance = setmetatable({}, target.prototype)
    instance:____constructor(...)
    return instance
end

local function __TS__Class(self)
    local c = {prototype = {}}
    c.prototype.__index = c.prototype
    c.prototype.constructor = c
    return c
end

local __TS__Unpack = table.unpack or unpack

local function __TS__FunctionBind(fn, ...)
    local boundArgs = {...}
    return function(____, ...)
        local args = {...}
        __TS__ArrayUnshift(
            args,
            __TS__Unpack(boundArgs)
        )
        return fn(__TS__Unpack(args))
    end
end

local __TS__Promise
do
    local function promiseDeferred(self)
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
    local function isPromiseLike(self, thing)
        return __TS__InstanceOf(thing, __TS__Promise)
    end
    __TS__Promise = __TS__Class()
    __TS__Promise.name = "__TS__Promise"
    function __TS__Promise.prototype.____constructor(self, executor)
        self.state = 0
        self.fulfilledCallbacks = {}
        self.rejectedCallbacks = {}
        self.finallyCallbacks = {}
        do
            local function ____catch(e)
                self:reject(e)
            end
            local ____try, ____hasReturned = pcall(function()
                executor(
                    nil,
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
        promise.state = 1
        promise.value = data
        return promise
    end
    function __TS__Promise.reject(reason)
        local promise = __TS__New(
            __TS__Promise,
            function()
            end
        )
        promise.state = 2
        promise.rejectionReason = reason
        return promise
    end
    __TS__Promise.prototype["then"] = function(self, onFulfilled, onRejected)
        local ____promiseDeferred_result_0 = promiseDeferred(nil)
        local promise = ____promiseDeferred_result_0.promise
        local resolve = ____promiseDeferred_result_0.resolve
        local reject = ____promiseDeferred_result_0.reject
        local isFulfilled = self.state == 1
        local isRejected = self.state == 2
        if onFulfilled then
            local internalCallback = self:createPromiseResolvingCallback(onFulfilled, resolve, reject)
            local ____self_fulfilledCallbacks_1 = self.fulfilledCallbacks
            ____self_fulfilledCallbacks_1[#____self_fulfilledCallbacks_1 + 1] = internalCallback
            if isFulfilled then
                internalCallback(nil, self.value)
            end
        else
            local ____self_fulfilledCallbacks_2 = self.fulfilledCallbacks
            ____self_fulfilledCallbacks_2[#____self_fulfilledCallbacks_2 + 1] = function(____, v) return resolve(nil, v) end
        end
        if onRejected then
            local internalCallback = self:createPromiseResolvingCallback(onRejected, resolve, reject)
            local ____self_rejectedCallbacks_3 = self.rejectedCallbacks
            ____self_rejectedCallbacks_3[#____self_rejectedCallbacks_3 + 1] = internalCallback
            if isRejected then
                internalCallback(nil, self.rejectionReason)
            end
        else
            local ____self_rejectedCallbacks_4 = self.rejectedCallbacks
            ____self_rejectedCallbacks_4[#____self_rejectedCallbacks_4 + 1] = function(____, err) return reject(nil, err) end
        end
        if isFulfilled then
            resolve(nil, self.value)
        end
        if isRejected then
            reject(nil, self.rejectionReason)
        end
        return promise
    end
    function __TS__Promise.prototype.catch(self, onRejected)
        return self["then"](self, nil, onRejected)
    end
    function __TS__Promise.prototype.finally(self, onFinally)
        if onFinally then
            local ____self_finallyCallbacks_5 = self.finallyCallbacks
            ____self_finallyCallbacks_5[#____self_finallyCallbacks_5 + 1] = onFinally
            if self.state ~= 0 then
                onFinally(nil)
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
        if self.state == 0 then
            self.state = 1
            self.value = data
            for ____, callback in ipairs(self.fulfilledCallbacks) do
                callback(nil, data)
            end
            for ____, callback in ipairs(self.finallyCallbacks) do
                callback(nil)
            end
        end
    end
    function __TS__Promise.prototype.reject(self, reason)
        if self.state == 0 then
            self.state = 2
            self.rejectionReason = reason
            for ____, callback in ipairs(self.rejectedCallbacks) do
                callback(nil, reason)
            end
            for ____, callback in ipairs(self.finallyCallbacks) do
                callback(nil)
            end
        end
    end
    function __TS__Promise.prototype.createPromiseResolvingCallback(self, f, resolve, reject)
        return function(____, value)
            do
                local function ____catch(e)
                    reject(nil, e)
                end
                local ____try, ____hasReturned = pcall(function()
                    self:handleCallbackData(
                        f(nil, value),
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
        if isPromiseLike(nil, data) then
            local nextpromise = data
            if nextpromise.state == 1 then
                resolve(nil, nextpromise.value)
            elseif nextpromise.state == 2 then
                reject(nil, nextpromise.rejectionReason)
            else
                data["then"](data, resolve, reject)
            end
        else
            resolve(nil, data)
        end
    end
end

local function __TS__AsyncAwaiter(generator)
    return __TS__New(
        __TS__Promise,
        function(____, resolve, reject)
            local adopt, fulfilled, step, resolved, asyncCoroutine
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
                local success, resultOrError = coroutine.resume(asyncCoroutine, value)
                if success then
                    step(nil, resultOrError)
                else
                    reject(nil, resultOrError)
                end
            end
            function step(self, result)
                if resolved then
                    return
                end
                if coroutine.status(asyncCoroutine) == "dead" then
                    resolve(nil, result)
                else
                    local ____self_1 = adopt(nil, result)
                    ____self_1["then"](____self_1, fulfilled, reject)
                end
            end
            resolved = false
            asyncCoroutine = coroutine.create(generator)
            local success, resultOrError = coroutine.resume(
                asyncCoroutine,
                function(____, v)
                    resolved = true
                    local ____self_2 = adopt(nil, v)
                    ____self_2["then"](____self_2, resolve, reject)
                end
            )
            if success then
                step(nil, resultOrError)
            else
                reject(nil, resultOrError)
            end
        end
    )
end
local function __TS__Await(thing)
    return coroutine.yield(thing)
end

local function __TS__ClassExtends(target, base)
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

local function __TS__CloneDescriptor(____bindingPattern0)
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

local function __TS__ObjectAssign(target, ...)
    local sources = {...}
    for i = 1, #sources do
        local source = sources[i]
        for key in pairs(source) do
            target[key] = source[key]
        end
    end
    return target
end

local function __TS__ObjectGetOwnPropertyDescriptor(object, key)
    local metatable = getmetatable(object)
    if not metatable then
        return
    end
    if not rawget(metatable, "_descriptors") then
        return
    end
    return rawget(metatable, "_descriptors")[key]
end

local __TS__SetDescriptor
do
    local function descriptorIndex(self, key)
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
    local function descriptorNewIndex(self, key, value)
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
        metatable._descriptors[key] = __TS__CloneDescriptor(desc)
        metatable.__index = descriptorIndex
        metatable.__newindex = descriptorNewIndex
    end
end

local function __TS__Decorate(decorators, target, key, desc)
    local result = target
    do
        local i = #decorators
        while i >= 0 do
            local decorator = decorators[i + 1]
            if decorator then
                local oldResult = result
                if key == nil then
                    result = decorator(nil, result)
                elseif desc == true then
                    local value = rawget(target, key)
                    local descriptor = __TS__ObjectGetOwnPropertyDescriptor(target, key) or ({configurable = true, writable = true, value = value})
                    local desc = decorator(nil, target, key, descriptor) or descriptor
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
                    result = decorator(nil, target, key, desc)
                else
                    result = decorator(nil, target, key)
                end
                result = result or oldResult
            end
            i = i - 1
        end
    end
    return result
end

local function __TS__DecorateParam(paramIndex, decorator)
    return function(____, target, key) return decorator(nil, target, key, paramIndex) end
end

local function __TS__StringIncludes(self, searchString, position)
    if not position then
        position = 1
    else
        position = position + 1
    end
    local index = string.find(self, searchString, position, true)
    return index ~= nil
end

local Error, RangeError, ReferenceError, SyntaxError, TypeError, URIError
do
    local function getErrorStack(self, constructor)
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
        if __TS__StringIncludes(_VERSION, "Lua 5.0") then
            return debug.traceback(("[Level " .. tostring(level)) .. "]")
        else
            return debug.traceback(nil, level)
        end
    end
    local function wrapErrorToString(self, getDescription)
        return function(self)
            local description = getDescription(self)
            local caller = debug.getinfo(3, "f")
            local isClassicLua = __TS__StringIncludes(_VERSION, "Lua 5.0") or _VERSION == "Lua 5.1"
            if isClassicLua or caller and caller.func ~= error then
                return description
            else
                return (tostring(description) .. "\n") .. self.stack
            end
        end
    end
    local function initErrorClass(self, Type, name)
        Type.name = name
        return setmetatable(
            Type,
            {__call = function(____, _self, message) return __TS__New(Type, message) end}
        )
    end
    local ____initErrorClass_2 = initErrorClass
    local ____class_0 = __TS__Class()
    ____class_0.name = ""
    function ____class_0.prototype.____constructor(self, message)
        if message == nil then
            message = ""
        end
        self.message = message
        self.name = "Error"
        self.stack = getErrorStack(nil, self.constructor.new)
        local metatable = getmetatable(self)
        if not metatable.__errorToStringPatched then
            metatable.__errorToStringPatched = true
            metatable.__tostring = wrapErrorToString(nil, metatable.__tostring)
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
    Error = ____initErrorClass_2(nil, ____class_0, "Error")
    local function createErrorClass(self, name)
        local ____initErrorClass_4 = initErrorClass
        local ____class_3 = __TS__Class()
        ____class_3.name = ____class_3.name
        __TS__ClassExtends(____class_3, Error)
        function ____class_3.prototype.____constructor(self, ...)
            ____class_3.____super.prototype.____constructor(self, ...)
            self.name = name
        end
        return ____initErrorClass_4(nil, ____class_3, name)
    end
    RangeError = createErrorClass(nil, "RangeError")
    ReferenceError = createErrorClass(nil, "ReferenceError")
    SyntaxError = createErrorClass(nil, "SyntaxError")
    TypeError = createErrorClass(nil, "TypeError")
    URIError = createErrorClass(nil, "URIError")
end

local function __TS__ObjectGetOwnPropertyDescriptors(object)
    local metatable = getmetatable(object)
    if not metatable then
        return {}
    end
    return rawget(metatable, "_descriptors") or ({})
end

local function __TS__Delete(target, key)
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

local function __TS__StringAccess(self, index)
    if index >= 0 and index < #self then
        return string.sub(self, index + 1, index + 1)
    end
end

local function __TS__DelegatedYield(iterable)
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

local __TS__Generator
do
    local function generatorIterator(self)
        return self
    end
    local function generatorNext(self, ...)
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
            local argsLength = __TS__CountVarargs(...)
            return {
                ____coroutine = coroutine.create(function() return fn(__TS__Unpack(args, 1, argsLength)) end),
                [Symbol.iterator] = generatorIterator,
                next = generatorNext
            }
        end
    end
end

local function __TS__InstanceOfObject(value)
    local valueType = type(value)
    return valueType == "table" or valueType == "function"
end

local function __TS__LuaIteratorSpread(self, state, firstKey)
    local results = {}
    local key, value = self(state, firstKey)
    while key do
        results[#results + 1] = {key, value}
        key, value = self(state, key)
    end
    return __TS__Unpack(results)
end

local Map
do
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
            callback(nil, self.items[key], key, self)
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
        local items = self.items
        local nextKey = self.nextKey
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
        local items = self.items
        local nextKey = self.nextKey
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
end

local __TS__Match = string.match

local __TS__MathAtan2 = math.atan2 or math.atan

local __TS__MathModf = math.modf

local function __TS__MathSign(val)
    if val > 0 then
        return 1
    elseif val < 0 then
        return -1
    end
    return 0
end

local function __TS__Modulo50(a, b)
    return a - math.floor(a / b) * b
end

local function __TS__Number(value)
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

local function __TS__NumberIsFinite(value)
    return type(value) == "number" and value == value and value ~= math.huge and value ~= -math.huge
end

local function __TS__NumberIsNaN(value)
    return value ~= value
end

local __TS__NumberToString
do
    local radixChars = "0123456789abcdefghijklmnopqrstuvwxyz"
    function __TS__NumberToString(self, radix)
        if radix == nil or radix == 10 or self == math.huge or self == -math.huge or self ~= self then
            return tostring(self)
        end
        radix = math.floor(radix)
        if radix < 2 or radix > 36 then
            error("toString() radix argument must be between 2 and 36", 0)
        end
        local integer, fraction = __TS__MathModf(math.abs(self))
        local result = ""
        if radix == 8 then
            result = string.format("%o", integer)
        elseif radix == 16 then
            result = string.format("%x", integer)
        else
            repeat
                do
                    result = __TS__StringAccess(radixChars, integer % radix) .. result
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
                    result = result .. __TS__StringAccess(radixChars, digit)
                    fraction = fraction - digit
                end
            until not (fraction >= delta)
        end
        if self < 0 then
            result = "-" .. result
        end
        return result
    end
end

local function __TS__ObjectDefineProperty(target, key, desc)
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

local function __TS__ObjectEntries(obj)
    local result = {}
    local len = 0
    for key in pairs(obj) do
        len = len + 1
        result[len] = {key, obj[key]}
    end
    return result
end

local function __TS__ObjectFromEntries(entries)
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

local function __TS__ObjectKeys(obj)
    local result = {}
    local len = 0
    for key in pairs(obj) do
        len = len + 1
        result[len] = key
    end
    return result
end

local function __TS__ObjectRest(target, usedProperties)
    local result = {}
    for property in pairs(target) do
        if not usedProperties[property] then
            result[property] = target[property]
        end
    end
    return result
end

local function __TS__ObjectValues(obj)
    local result = {}
    local len = 0
    for key in pairs(obj) do
        len = len + 1
        result[len] = obj[key]
    end
    return result
end

local function __TS__ParseFloat(numberString)
    local infinityMatch = __TS__Match(numberString, "^%s*(-?Infinity)")
    if infinityMatch then
        local ____temp_0
        if __TS__StringAccess(infinityMatch, 0) == "-" then
            ____temp_0 = -math.huge
        else
            ____temp_0 = math.huge
        end
        return ____temp_0
    end
    local number = tonumber(__TS__Match(numberString, "^%s*(-?%d+%.?%d*)"))
    local ____number_1 = number
    if ____number_1 == nil then
        ____number_1 = 0 / 0
    end
    return ____number_1
end

local function __TS__StringSubstring(self, start, ____end)
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

local __TS__ParseInt
do
    local parseIntBasePattern = "0123456789aAbBcCdDeEfFgGhHiIjJkKlLmMnNoOpPqQrRsStTvVwWxXyYzZ"
    function __TS__ParseInt(numberString, base)
        if base == nil then
            base = 10
            local hexMatch = __TS__Match(numberString, "^%s*-?0[xX]")
            if hexMatch then
                base = 16
                local ____TS__Match_result__0_0
                if __TS__Match(hexMatch, "-") then
                    ____TS__Match_result__0_0 = "-" .. __TS__StringSubstring(numberString, #hexMatch)
                else
                    ____TS__Match_result__0_0 = __TS__StringSubstring(numberString, #hexMatch)
                end
                numberString = ____TS__Match_result__0_0
            end
        end
        if base < 2 or base > 36 then
            return 0 / 0
        end
        local ____temp_1
        if base <= 10 then
            ____temp_1 = __TS__StringSubstring(parseIntBasePattern, 0, base)
        else
            ____temp_1 = __TS__StringSubstring(parseIntBasePattern, 0, 10 + 2 * (base - 10))
        end
        local allowedDigits = ____temp_1
        local pattern = ("^%s*(-?[" .. allowedDigits) .. "]*)"
        local number = tonumber(
            __TS__Match(numberString, pattern),
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
end

local function __TS__PromiseAll(iterable)
    local results = {}
    local toResolve = {}
    local numToResolve = 0
    local i = 0
    for ____, item in __TS__Iterator(iterable) do
        if __TS__InstanceOf(item, __TS__Promise) then
            if item.state == 1 then
                results[i + 1] = item.value
            elseif item.state == 2 then
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
                            resolve(nil, results)
                        end
                    end,
                    function(____, reason)
                        reject(nil, reason)
                    end
                )
            end
        end
    )
end

local function __TS__PromiseAllSettled(iterable)
    local results = {}
    local toResolve = {}
    local numToResolve = 0
    local i = 0
    for ____, item in __TS__Iterator(iterable) do
        if __TS__InstanceOf(item, __TS__Promise) then
            if item.state == 1 then
                results[i + 1] = {status = "fulfilled", value = item.value}
            elseif item.state == 2 then
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
                            resolve(nil, results)
                        end
                    end,
                    function(____, reason)
                        results[index + 1] = {status = "rejected", reason = reason}
                        numToResolve = numToResolve - 1
                        if numToResolve == 0 then
                            resolve(nil, results)
                        end
                    end
                )
            end
        end
    )
end

local function __TS__PromiseAny(iterable)
    local rejections = {}
    local pending = {}
    for ____, item in __TS__Iterator(iterable) do
        if __TS__InstanceOf(item, __TS__Promise) then
            if item.state == 1 then
                return __TS__Promise.resolve(item.value)
            elseif item.state == 2 then
                rejections[#rejections + 1] = item.rejectionReason
            else
                pending[#pending + 1] = item
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
                        resolve(nil, data)
                    end,
                    function(____, reason)
                        rejections[#rejections + 1] = reason
                        numResolved = numResolved + 1
                        if numResolved == #pending then
                            reject(nil, {name = "AggregateError", message = "All Promises rejected", errors = rejections})
                        end
                    end
                )
            end
        end
    )
end

local function __TS__PromiseRace(iterable)
    local pending = {}
    for ____, item in __TS__Iterator(iterable) do
        if __TS__InstanceOf(item, __TS__Promise) then
            if item.state == 1 then
                return __TS__Promise.resolve(item.value)
            elseif item.state == 2 then
                return __TS__Promise.reject(item.rejectionReason)
            else
                pending[#pending + 1] = item
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
                    function(____, value) return resolve(nil, value) end,
                    function(____, reason) return reject(nil, reason) end
                )
            end
        end
    )
end

local Set
do
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
            callback(nil, key, key, self)
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
end

local function __TS__SparseArrayNew(...)
    local sparseArray = {...}
    sparseArray.sparseLength = __TS__CountVarargs(...)
    return sparseArray
end

local function __TS__SparseArrayPush(sparseArray, ...)
    local args = {...}
    local argsLen = __TS__CountVarargs(...)
    local listLen = sparseArray.sparseLength
    for i = 1, argsLen do
        sparseArray[listLen + i] = args[i]
    end
    sparseArray.sparseLength = listLen + argsLen
end

local function __TS__SparseArraySpread(sparseArray)
    local ____unpack_0 = unpack
    if ____unpack_0 == nil then
        ____unpack_0 = table.unpack
    end
    local _unpack = ____unpack_0
    return _unpack(sparseArray, 1, sparseArray.sparseLength)
end

local WeakMap
do
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
end

local WeakSet
do
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
end

local function __TS__SourceMapTraceBack(fileName, sourceMap)
    _G.__TS__sourcemap = _G.__TS__sourcemap or ({})
    _G.__TS__sourcemap[fileName] = sourceMap
    if _G.__TS__originalTraceback == nil then
        local originalTraceback = debug.traceback
        _G.__TS__originalTraceback = originalTraceback
        debug.traceback = function(thread, message, level)
            local trace
            if thread == nil and message == nil and level == nil then
                trace = originalTraceback()
            elseif __TS__StringIncludes(_VERSION, "Lua 5.0") then
                trace = originalTraceback((("[Level " .. tostring(level)) .. "] ") .. message)
            else
                trace = originalTraceback(thread, message, level)
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
                function(file, line) return replacer(nil, file .. ".lua", file .. ".ts", line) end
            )
            local function stringReplacer(____, file, line)
                local fileSourceMap = _G.__TS__sourcemap[file]
                if fileSourceMap and fileSourceMap[line] then
                    local chunkName = __TS__Match(file, "%[string \"([^\"]+)\"%]")
                    local sourceName = string.gsub(chunkName, ".lua$", ".ts")
                    local data = fileSourceMap[line]
                    if type(data) == "number" then
                        return (sourceName .. ":") .. tostring(data)
                    end
                    return (tostring(data.file) .. ":") .. tostring(data.line)
                end
                return (file .. ":") .. line
            end
            result = string.gsub(
                result,
                "(%[string \"[^\"]+\"%]):(%d+)",
                function(file, line) return stringReplacer(nil, file, line) end
            )
            return result
        end
    end
end

local function __TS__Spread(iterable)
    local arr = {}
    if type(iterable) == "string" then
        for i = 0, #iterable - 1 do
            arr[i + 1] = __TS__StringAccess(iterable, i)
        end
    else
        local len = 0
        for ____, item in __TS__Iterator(iterable) do
            len = len + 1
            arr[len] = item
        end
    end
    return __TS__Unpack(arr)
end

local function __TS__StringCharAt(self, pos)
    if pos ~= pos then
        pos = 0
    end
    if pos < 0 then
        return ""
    end
    return string.sub(self, pos + 1, pos + 1)
end

local function __TS__StringCharCodeAt(self, index)
    if index ~= index then
        index = 0
    end
    if index < 0 then
        return 0 / 0
    end
    local ____string_byte_result_0 = string.byte(self, index + 1)
    if ____string_byte_result_0 == nil then
        ____string_byte_result_0 = 0 / 0
    end
    return ____string_byte_result_0
end

local function __TS__StringEndsWith(self, searchString, endPosition)
    if endPosition == nil or endPosition > #self then
        endPosition = #self
    end
    return string.sub(self, endPosition - #searchString + 1, endPosition) == searchString
end

local function __TS__StringPadEnd(self, maxLength, fillString)
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

local function __TS__StringPadStart(self, maxLength, fillString)
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

local __TS__StringReplace
do
    local sub = string.sub
    function __TS__StringReplace(source, searchValue, replaceValue)
        local startPos, endPos = string.find(source, searchValue, nil, true)
        if not startPos then
            return source
        end
        local before = sub(source, 1, startPos - 1)
        local ____temp_0
        if type(replaceValue) == "string" then
            ____temp_0 = replaceValue
        else
            ____temp_0 = replaceValue(nil, searchValue, startPos - 1, source)
        end
        local replacement = ____temp_0
        local after = sub(source, endPos + 1)
        return (before .. replacement) .. after
    end
end

local __TS__StringSplit
do
    local sub = string.sub
    local find = string.find
    function __TS__StringSplit(source, separator, limit)
        if limit == nil then
            limit = 4294967295
        end
        if limit == 0 then
            return {}
        end
        local result = {}
        local resultIndex = 1
        if separator == nil or separator == "" then
            for i = 1, #source do
                result[resultIndex] = sub(source, i, i)
                resultIndex = resultIndex + 1
            end
        else
            local currentPos = 1
            while resultIndex <= limit do
                local startPos, endPos = find(source, separator, currentPos, true)
                if not startPos then
                    break
                end
                result[resultIndex] = sub(source, currentPos, startPos - 1)
                resultIndex = resultIndex + 1
                currentPos = endPos + 1
            end
            if resultIndex <= limit then
                result[resultIndex] = sub(source, currentPos)
            end
        end
        return result
    end
end

local __TS__StringReplaceAll
do
    local sub = string.sub
    local find = string.find
    function __TS__StringReplaceAll(source, searchValue, replaceValue)
        if type(replaceValue) == "string" then
            local concat = table.concat(
                __TS__StringSplit(source, searchValue),
                replaceValue
            )
            if #searchValue == 0 then
                return (replaceValue .. concat) .. replaceValue
            end
            return concat
        end
        local parts = {}
        local partsIndex = 1
        if #searchValue == 0 then
            parts[1] = replaceValue(nil, "", 0, source)
            partsIndex = 2
            for i = 1, #source do
                parts[partsIndex] = sub(source, i, i)
                parts[partsIndex + 1] = replaceValue(nil, "", i, source)
                partsIndex = partsIndex + 2
            end
        else
            local currentPos = 1
            while true do
                local startPos, endPos = find(source, searchValue, currentPos, true)
                if not startPos then
                    break
                end
                parts[partsIndex] = sub(source, currentPos, startPos - 1)
                parts[partsIndex + 1] = replaceValue(nil, searchValue, startPos - 1, source)
                partsIndex = partsIndex + 2
                currentPos = endPos + 1
            end
            parts[partsIndex] = sub(source, currentPos)
        end
        return table.concat(parts)
    end
end

local function __TS__StringSlice(self, start, ____end)
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

local function __TS__StringStartsWith(self, searchString, position)
    if position == nil or position < 0 then
        position = 0
    end
    return string.sub(self, position + 1, #searchString + position) == searchString
end

local function __TS__StringSubstr(self, from, length)
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

local function __TS__StringTrim(self)
    local result = string.gsub(self, "^[%s ﻿]*(.-)[%s ﻿]*$", "%1")
    return result
end

local function __TS__StringTrimEnd(self)
    local result = string.gsub(self, "[%s ﻿]*$", "")
    return result
end

local function __TS__StringTrimStart(self)
    local result = string.gsub(self, "^[%s ﻿]*", "")
    return result
end

local __TS__SymbolRegistryFor, __TS__SymbolRegistryKeyFor
do
    local symbolRegistry = {}
    function __TS__SymbolRegistryFor(key)
        if not symbolRegistry[key] then
            symbolRegistry[key] = __TS__Symbol(key)
        end
        return symbolRegistry[key]
    end
    function __TS__SymbolRegistryKeyFor(sym)
        for key in pairs(symbolRegistry) do
            if symbolRegistry[key] == sym then
                return key
            end
        end
    end
end

local function __TS__TypeOf(value)
    local luaType = type(value)
    if luaType == "table" then
        return "object"
    elseif luaType == "nil" then
        return "undefined"
    else
        return luaType
    end
end

return {
  __TS__ArrayConcat = __TS__ArrayConcat,
  __TS__ArrayEntries = __TS__ArrayEntries,
  __TS__ArrayEvery = __TS__ArrayEvery,
  __TS__ArrayFilter = __TS__ArrayFilter,
  __TS__ArrayForEach = __TS__ArrayForEach,
  __TS__ArrayFind = __TS__ArrayFind,
  __TS__ArrayFindIndex = __TS__ArrayFindIndex,
  __TS__ArrayFrom = __TS__ArrayFrom,
  __TS__ArrayIncludes = __TS__ArrayIncludes,
  __TS__ArrayIndexOf = __TS__ArrayIndexOf,
  __TS__ArrayIsArray = __TS__ArrayIsArray,
  __TS__ArrayJoin = __TS__ArrayJoin,
  __TS__ArrayMap = __TS__ArrayMap,
  __TS__ArrayPush = __TS__ArrayPush,
  __TS__ArrayPushArray = __TS__ArrayPushArray,
  __TS__ArrayReduce = __TS__ArrayReduce,
  __TS__ArrayReduceRight = __TS__ArrayReduceRight,
  __TS__ArrayReverse = __TS__ArrayReverse,
  __TS__ArrayUnshift = __TS__ArrayUnshift,
  __TS__ArraySort = __TS__ArraySort,
  __TS__ArraySlice = __TS__ArraySlice,
  __TS__ArraySome = __TS__ArraySome,
  __TS__ArraySplice = __TS__ArraySplice,
  __TS__ArrayToObject = __TS__ArrayToObject,
  __TS__ArrayFlat = __TS__ArrayFlat,
  __TS__ArrayFlatMap = __TS__ArrayFlatMap,
  __TS__ArraySetLength = __TS__ArraySetLength,
  __TS__AsyncAwaiter = __TS__AsyncAwaiter,
  __TS__Await = __TS__Await,
  __TS__Class = __TS__Class,
  __TS__ClassExtends = __TS__ClassExtends,
  __TS__CloneDescriptor = __TS__CloneDescriptor,
  __TS__CountVarargs = __TS__CountVarargs,
  __TS__Decorate = __TS__Decorate,
  __TS__DecorateParam = __TS__DecorateParam,
  __TS__Delete = __TS__Delete,
  __TS__DelegatedYield = __TS__DelegatedYield,
  Error = Error,
  RangeError = RangeError,
  ReferenceError = ReferenceError,
  SyntaxError = SyntaxError,
  TypeError = TypeError,
  URIError = URIError,
  __TS__FunctionBind = __TS__FunctionBind,
  __TS__Generator = __TS__Generator,
  __TS__InstanceOf = __TS__InstanceOf,
  __TS__InstanceOfObject = __TS__InstanceOfObject,
  __TS__Iterator = __TS__Iterator,
  __TS__LuaIteratorSpread = __TS__LuaIteratorSpread,
  Map = Map,
  __TS__Match = __TS__Match,
  __TS__MathAtan2 = __TS__MathAtan2,
  __TS__MathModf = __TS__MathModf,
  __TS__MathSign = __TS__MathSign,
  __TS__Modulo50 = __TS__Modulo50,
  __TS__New = __TS__New,
  __TS__Number = __TS__Number,
  __TS__NumberIsFinite = __TS__NumberIsFinite,
  __TS__NumberIsNaN = __TS__NumberIsNaN,
  __TS__NumberToString = __TS__NumberToString,
  __TS__ObjectAssign = __TS__ObjectAssign,
  __TS__ObjectDefineProperty = __TS__ObjectDefineProperty,
  __TS__ObjectEntries = __TS__ObjectEntries,
  __TS__ObjectFromEntries = __TS__ObjectFromEntries,
  __TS__ObjectGetOwnPropertyDescriptor = __TS__ObjectGetOwnPropertyDescriptor,
  __TS__ObjectGetOwnPropertyDescriptors = __TS__ObjectGetOwnPropertyDescriptors,
  __TS__ObjectKeys = __TS__ObjectKeys,
  __TS__ObjectRest = __TS__ObjectRest,
  __TS__ObjectValues = __TS__ObjectValues,
  __TS__ParseFloat = __TS__ParseFloat,
  __TS__ParseInt = __TS__ParseInt,
  __TS__Promise = __TS__Promise,
  __TS__PromiseAll = __TS__PromiseAll,
  __TS__PromiseAllSettled = __TS__PromiseAllSettled,
  __TS__PromiseAny = __TS__PromiseAny,
  __TS__PromiseRace = __TS__PromiseRace,
  Set = Set,
  __TS__SetDescriptor = __TS__SetDescriptor,
  __TS__SparseArrayNew = __TS__SparseArrayNew,
  __TS__SparseArrayPush = __TS__SparseArrayPush,
  __TS__SparseArraySpread = __TS__SparseArraySpread,
  WeakMap = WeakMap,
  WeakSet = WeakSet,
  __TS__SourceMapTraceBack = __TS__SourceMapTraceBack,
  __TS__Spread = __TS__Spread,
  __TS__StringAccess = __TS__StringAccess,
  __TS__StringCharAt = __TS__StringCharAt,
  __TS__StringCharCodeAt = __TS__StringCharCodeAt,
  __TS__StringEndsWith = __TS__StringEndsWith,
  __TS__StringIncludes = __TS__StringIncludes,
  __TS__StringPadEnd = __TS__StringPadEnd,
  __TS__StringPadStart = __TS__StringPadStart,
  __TS__StringReplace = __TS__StringReplace,
  __TS__StringReplaceAll = __TS__StringReplaceAll,
  __TS__StringSlice = __TS__StringSlice,
  __TS__StringSplit = __TS__StringSplit,
  __TS__StringStartsWith = __TS__StringStartsWith,
  __TS__StringSubstr = __TS__StringSubstr,
  __TS__StringSubstring = __TS__StringSubstring,
  __TS__StringTrim = __TS__StringTrim,
  __TS__StringTrimEnd = __TS__StringTrimEnd,
  __TS__StringTrimStart = __TS__StringTrimStart,
  __TS__Symbol = __TS__Symbol,
  Symbol = Symbol,
  __TS__SymbolRegistryFor = __TS__SymbolRegistryFor,
  __TS__SymbolRegistryKeyFor = __TS__SymbolRegistryKeyFor,
  __TS__TypeOf = __TS__TypeOf,
  __TS__Unpack = __TS__Unpack
}
 end,
["Script.AnimElseIf"] = function(...) 
local ____exports = {}
function ____exports.SetAnimName(self, Type, Variant, Subtype, config)
    if Type == 2 then
        if config.Shop == false then
            return 0
        end
        return "IconShop"
    elseif Type == 4 then
        if config.Treasure == false then
            return 0
        end
        return "IconTreasureRoom"
    elseif Type == 6 then
        if config.Mini == false then
            return 0
        end
        return "IconMiniboss"
    elseif Type == 7 then
        if config.Secret == false then
            return 0
        end
        return "IconSecretRoom"
    elseif Type == 8 then
        if config.SuperSecret == false then
            return 0
        end
        return "IconSuperSecretRoom"
    elseif Type == 9 then
        if config.Arcade == false then
            return 0
        end
        return "IconArcade"
    elseif Type == 10 then
        if config.Curse == false then
            return 0
        end
        return "IconCurseRoom"
    elseif Type == 11 then
        if config.Ambush == false then
            return 0
        end
        if Subtype == 1 then
            return "IconBossAmbushRoom"
        end
        return "IconAmbushRoom"
    elseif Type == 12 then
        if config.Library == false then
            return 0
        end
        return "IconLibrary"
    elseif Type == 13 then
        if config.Sacrifice == false then
            return 0
        else
            return "IconSacrificeRoom"
        end
    elseif Type == 14 then
        return "IconDevilRoom"
    elseif Type == 15 then
        return "IconAngelRoom"
    elseif Type == 16 then
        return "IconLadder"
    elseif Type == 18 then
        if config.Isaac == false then
            return 0
        end
        return "IconIsaacsRoom"
    elseif Type == 19 then
        if config.Barren == false then
            return 0
        end
        return "IconBarrenRoom"
    elseif Type == 20 then
        if config.Chest == false then
            return 0
        end
        return "IconChestRoom"
    end
    if TaintedTreasure ~= nil then
        if Type == 21 and (Variant >= 12000 and Variant <= 12050) then
            if config.Tainted == false then
                return 0
            end
            return "Tainted"
        end
    end
    if HeavensCall ~= nil then
        if Type == 21 and (Variant >= 8500 and Variant <= 8508) then
            if config.Heaven == false then
                return 0
            end
            return "Astral"
        end
    end
    if Type == 21 then
        if config.Dice == false then
            return 0
        end
        return "IconDiceRoom"
    elseif Type == 24 then
        if config.Planetarium == false then
            return 0
        end
        return "IconPlanetarium"
    elseif Type == 29 then
        if config.Ultra == false then
            return 0
        end
        return "IconUltraSecretRoom"
    elseif Type == 1 and Subtype == 34 then
        if config.Knife == false then
            return 0
        end
        return "IconMirrorRoom"
    elseif Type == 1 and Subtype == 10 then
        if config.Knife == false then
            return 0
        end
        return "IconMinecartRoom"
    else
        return 0
    end
end
return ____exports
 end,
["Script.Config"] = function(...) 
local ____exports = {}
____exports.configRA = {
    spoil = 0,
    Disable = false,
    HideVisited = false,
    Fortune = true,
    Old = false,
    Knife = true,
    Shop = true,
    Treasure = true,
    Mini = true,
    Secret = true,
    SuperSecret = true,
    Arcade = true,
    Curse = true,
    Ambush = true,
    Library = true,
    Chests = true,
    Isaac = true,
    Barren = true,
    Dice = true,
    Planetarium = true,
    Tainted = true,
    Heaven = true,
    Ultra = false,
    Sacrifice = true,
    Position = 50,
    PositionTop = false
}
return ____exports
 end,
["Script.MCM"] = function(...) 
local ____exports = {}
function ____exports.ModConfig(self, configRA)
    if ModConfigMenu ~= nil then
        ModConfigMenu.RemoveCategory("RemembrAll!")
        ModConfigMenu.AddSpace("RemembrAll!", "About")
        ModConfigMenu.AddText(
            "RemembrAll!",
            "About",
            function() return "RemembrAll!" end
        )
        ModConfigMenu.AddSpace("RemembrAll!", "About")
        ModConfigMenu.AddText(
            "RemembrAll!",
            "About",
            function() return "Version 0.10" end
        )
        ModConfigMenu.AddSpace("RemembrAll!", "About")
        ModConfigMenu.AddText(
            "RemembrAll!",
            "About",
            function() return "Mod made by Tidloas with love" end
        )
        ModConfigMenu.AddSpace("RemembrAll!", "About")
        ModConfigMenu.AddSetting(
            "RemembrAll!",
            "Mains",
            {
                CurrentSetting = function() return configRA.spoil end,
                Maximum = 2,
                Minimum = 0,
                Display = function()
                    local onOff = "Spoil"
                    if configRA.spoil == 1 then
                        onOff = "No spoil"
                    end
                    if configRA.spoil == 2 then
                        onOff = "Real no spoil"
                    end
                    return "Mode: " .. onOff
                end,
                Info = {"spoil: all icons are displayed, NoSpoil: all icons but \"hidden\", RealNoSpoil: Hidden until discovered"},
                OnChange = function(currentValue)
                    configRA.spoil = currentValue
                end,
                Type = 5
            }
        )
        ModConfigMenu.AddSetting(
            "RemembrAll!",
            "Mains",
            {
                CurrentSetting = function() return configRA.Position end,
                Maximum = 512,
                Minimum = 0,
                Display = function()
                    local onOff = configRA.Position
                    return "Position-X: " .. tostring(onOff)
                end,
                Info = {""},
                OnChange = function(currentValue)
                    configRA.Position = currentValue
                end,
                Type = 5
            }
        )
        local function addItem(self, entity, ____type, name, desc)
            ModConfigMenu.AddSetting(
                "RemembrAll!",
                tostring(____type),
                {
                    Type = 4,
                    CurrentSetting = function()
                        return configRA[entity]
                    end,
                    Display = function()
                        local onOff = "Disabled"
                        if configRA[entity] == true then
                            onOff = "Enabled"
                        end
                        return (tostring(name) .. ": ") .. onOff
                    end,
                    OnChange = function(IsOn)
                        configRA[entity] = IsOn
                    end,
                    Info = {tostring(desc)}
                }
            )
        end
        addItem(
            nil,
            "PositionTop",
            "Mains",
            "Position Top",
            "Place the icons at the top of the screen"
        )
        addItem(
            nil,
            "Old",
            "Mains",
            "Original layout",
            "Changes the layout of the icons vertically, as originally"
        )
        addItem(
            nil,
            "HideVisited",
            "Mains",
            "Hide Visited",
            "Hides the icons of the visited rooms, instead of changing the opacity"
        )
        addItem(
            nil,
            "Disable",
            "Mains",
            "Disable icons",
            "Hide icons"
        )
        addItem(
            nil,
            "Fortune",
            "Mains",
            "Fortune",
            "Displays a fortune with the objectives/rooms missed"
        )
        addItem(
            nil,
            "Knife",
            "Rooms",
            "Knife",
            "Enable Knife Room detection"
        )
        addItem(
            nil,
            "Shop",
            "Rooms",
            "Shop",
            "Enable Shop Room detection"
        )
        addItem(
            nil,
            "Treasure",
            "Rooms",
            "Treasure",
            "Enable Treasure Room detection"
        )
        addItem(
            nil,
            "Mini",
            "Rooms",
            "MiniBoss",
            "Enable MiniBoss Room detection"
        )
        addItem(
            nil,
            "Secret",
            "Rooms",
            "Secret",
            "Enable Secret Room detection"
        )
        addItem(
            nil,
            "SuperSecret",
            "Rooms",
            "SuperSecret",
            "Enable SuperSecret Room detection"
        )
        addItem(
            nil,
            "Arcade",
            "Rooms",
            "Arcade",
            "Enable Arcade Room detection"
        )
        addItem(
            nil,
            "Curse",
            "Rooms",
            "Curse",
            "Enable Curse Room detection"
        )
        addItem(
            nil,
            "Ambush",
            "Rooms",
            "Ambush",
            "Enable Ambush Room detection"
        )
        addItem(
            nil,
            "Library",
            "Rooms",
            "Library",
            "Enable Library Room detection"
        )
        addItem(
            nil,
            "Isaac",
            "Rooms",
            "Isaac",
            "Enable Isaac Room detection"
        )
        addItem(
            nil,
            "Barren",
            "Rooms",
            "Barren",
            "Enable Barren Room detection"
        )
        addItem(
            nil,
            "Chests",
            "Rooms",
            "Chests",
            "Enable Chests Room detection"
        )
        addItem(
            nil,
            "Dice",
            "Rooms",
            "Dice",
            "Enable Dice Room detection"
        )
        addItem(
            nil,
            "Planetarium",
            "Rooms",
            "Planetarium",
            "Enable Planetarium Room detection"
        )
        addItem(
            nil,
            "Sacrifice",
            "Rooms",
            "Sacrifice",
            "Enable Sacrifice Room detection"
        )
        addItem(
            nil,
            "Ultra",
            "Rooms",
            "UltraSecret",
            "Enable UltraSecret Room detection"
        )
        addItem(
            nil,
            "Tainted",
            "Rooms",
            "Tainted",
            "Enable Tainted Room detection"
        )
        addItem(
            nil,
            "Heaven",
            "Rooms",
            "Heaven",
            "Enable Heaven's call Room detection"
        )
        ModConfigMenu.AddSpace("RemembrAll!", "ChangeLog")
        ModConfigMenu.AddText(
            "RemembrAll!",
            "ChangeLog",
            function() return "+ Fixed tainted treasure mod compatibility" end
        )
        ModConfigMenu.AddText(
            "RemembrAll!",
            "ChangeLog",
            function() return "+ Added Isaac + Barren Room" end
        )
        ModConfigMenu.AddText(
            "RemembrAll!",
            "ChangeLog",
            function() return "+ Fixed XL stage for knife part" end
        )
        ModConfigMenu.AddText(
            "RemembrAll!",
            "ChangeLog",
            function() return "+ Heaven call compatibility (v1)" end
        )
    end
end
return ____exports
 end,
["main"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__ArraySplice = ____lualib.__TS__ArraySplice
local __TS__ArrayForEach = ____lualib.__TS__ArrayForEach
local __TS__ArraySort = ____lualib.__TS__ArraySort
local ____exports = {}
local DisplayIcon, CheckRoom, CheckTrapdoor, GetAllRooms, CheckSafeIndex, main, RoomArray, fortuneSpawned, Icon, ArrayCheck
local ____isaac_2Dtypescript_2Ddefinitions = require("lua_modules.isaac-typescript-definitions.dist.src.index")
local ModCallback = ____isaac_2Dtypescript_2Ddefinitions.ModCallback
local json = require("json")
local ____AnimElseIf = require("Script.AnimElseIf")
local SetAnimName = ____AnimElseIf.SetAnimName
local ____Config = require("Script.Config")
local configRA = ____Config.configRA
local ____MCM = require("Script.MCM")
local ModConfig = ____MCM.ModConfig
function DisplayIcon(self)
    local posX = configRA.Position
    local posY = 200
    local Rooms = {}
    local Hud = Options.HUDOffset
    if configRA.Disable == true then
        return
    end
    if posX < 50 and Isaac.GetPlayer():HasTrinket(0) == false then
        posX = 50
    end
    if configRA.spoil == 2 then
        do
            local index = 0
            while index < #RoomArray do
                local ThisRoom = RoomArray[index + 1]
                if ThisRoom.Room.DisplayFlags == 5 or ThisRoom.Room.DisplayFlags == 3 or ThisRoom.Room.Type == 1 then
                    Rooms[#Rooms + 1] = ThisRoom
                end
                index = index + 1
            end
        end
    else
        Rooms = RoomArray
    end
    if #Rooms > 0 then
        do
            local index = 0
            while index < #Rooms do
                local ThisRoom = Rooms[index + 1]
                if ThisRoom.Type ~= 1 or ThisRoom.Type == 1 and (ThisRoom.Room.Data.Subtype == 34 or ThisRoom.Room.Data.Subtype == 10) then
                    if ThisRoom.Room.DisplayFlags ~= 5 and ThisRoom.Room.DisplayFlags ~= 7 and ThisRoom.Room.DisplayFlags ~= 3 and configRA.spoil == 1 and ThisRoom.Type ~= 1 then
                        Icon:SetFrame("CurseI", 1)
                    else
                        Icon:SetFrame(ThisRoom.Animation, 1)
                    end
                    Icon.Color = Color(1, 1, 1, ThisRoom.Opacity)
                    if configRA.Old == false then
                        if configRA.PositionTop == false then
                            Icon:Render(
                                Vector(
                                    posX,
                                    Isaac.GetScreenHeight() - 20
                                ),
                                Vector(0, 0),
                                Vector(0, 0)
                            )
                        else
                            Icon:Render(
                                Vector(posX, 0),
                                Vector(0, 0),
                                Vector(0, 0)
                            )
                        end
                        posX = posX + 15
                    else
                        if index % 2 == 1 then
                            Icon:Render(
                                Vector(Hud * 20 + 15, posY + Hud * 12),
                                Vector(0, 0),
                                Vector(0, 0)
                            )
                            posY = posY + 15
                        else
                            Icon:Render(
                                Vector(Hud * 20, posY + Hud * 12),
                                Vector(0, 0),
                                Vector(0, 0)
                            )
                        end
                    end
                end
                index = index + 1
            end
        end
    end
end
function CheckRoom(self)
    CheckTrapdoor(nil)
    if #RoomArray > 0 then
        do
            local index = 0
            while index < #RoomArray do
                local e = RoomArray[index + 1]
                if e.Room.VisitedCount > 0 and e.Type ~= 1 then
                    if configRA.HideVisited == false then
                        e.Opacity = 0.25
                    else
                        __TS__ArraySplice(RoomArray, index, 1)
                    end
                else
                    if Isaac.GetPlayer():HasCollectible(626) == true and e.Room.Data.Subtype == 34 then
                        if configRA.HideVisited == false then
                            e.Opacity = 0.25
                        else
                            __TS__ArraySplice(RoomArray, index, 1)
                        end
                    end
                    if Isaac.GetPlayer():HasCollectible(627) == true and e.Room.Data.Subtype == 10 then
                        if configRA.HideVisited == false then
                            e.Opacity = 0.25
                        else
                            __TS__ArraySplice(RoomArray, index, 1)
                        end
                    end
                end
                index = index + 1
            end
        end
    end
end
function CheckTrapdoor(self)
    if configRA.Fortune == true then
        local room = Game():GetRoom()
        local num = room:GetGridSize()
        if num > 0 then
            do
                local index = 0
                while index < num do
                    if room:GetGridEntity(index) ~= nil then
                        local element = room:GetGridEntity(index)
                        if element:GetSaveState().Type == 17 and fortuneSpawned == 0 then
                            local knife = 0
                            if Game():GetLevel():GetStage() == 2 and Game():GetLevel():GetStageType() == 4 or Game():GetLevel():GetStageType() == 5 or (Game():GetLevel():GetStage() == 1 and Game():GetLevel():GetCurses() == 2 and Game():GetLevel():GetStageType() == 4 or Game():GetLevel():GetStageType() == 5) then
                                if Isaac.GetPlayer():HasCollectible(626) == false then
                                    knife = 1
                                end
                            end
                            if Game():GetLevel():GetStage() == 4 and Game():GetLevel():GetStageType() == 4 or Game():GetLevel():GetStageType() == 5 or (Game():GetLevel():GetStage() == 3 and Game():GetLevel():GetCurses() == 2 and Game():GetLevel():GetStageType() == 4 or Game():GetLevel():GetStageType() == 5) then
                                if Isaac.GetPlayer():HasCollectible(627) == false then
                                    knife = 1
                                end
                            end
                            if configRA.spoil == 2 then
                                local count = 0
                                __TS__ArrayForEach(
                                    RoomArray,
                                    function(____, element)
                                        if (element.Room.DisplayFlags == 5 or element.Room.DisplayFlags == 3) and element.Room.VisitedCount == 0 then
                                            count = count + 1
                                        end
                                    end
                                )
                                if count > 0 then
                                    if knife == 1 and configRA.Knife == true then
                                        Game():GetHUD():ShowFortuneText(
                                            "RemembrAll",
                                            tostring(count) .. " rooms not visited,",
                                            "A piece of knife was left behind"
                                        )
                                    else
                                        Game():GetHUD():ShowFortuneText(
                                            "RemembrAll",
                                            tostring(count) .. " rooms not visited"
                                        )
                                    end
                                else
                                    if knife == 1 and configRA.Knife == true then
                                        Game():GetHUD():ShowFortuneText("RemembrAll", "Unknown", "A piece of knife was left behind")
                                    else
                                        Game():GetHUD():ShowFortuneText("RemembrAll", "Unknown")
                                    end
                                end
                            else
                                local count = 0
                                __TS__ArrayForEach(
                                    RoomArray,
                                    function(____, element)
                                        if element.Room.VisitedCount == 0 then
                                            count = count + 1
                                        end
                                    end
                                )
                                if count ~= 0 then
                                    if knife == 1 and configRA.Knife == true then
                                        Game():GetHUD():ShowFortuneText(
                                            "RemembrAll",
                                            tostring(count) .. " rooms not visited",
                                            "A piece of knife was left behind"
                                        )
                                    else
                                        Game():GetHUD():ShowFortuneText(
                                            "RemembrAll",
                                            tostring(count) .. " rooms not visited"
                                        )
                                    end
                                else
                                    if knife == 1 and configRA.Knife == true then
                                        Game():GetHUD():ShowFortuneText("RemembrAll", "All special rooms have been visited", "A piece of knife was left behind")
                                    else
                                        Game():GetHUD():ShowFortuneText("RemembrAll", "All rooms have been visited")
                                    end
                                end
                            end
                            fortuneSpawned = 1
                        end
                    end
                    index = index + 1
                end
            end
        end
    end
end
function GetAllRooms(self)
    local GetRooms = Game():GetLevel():GetRooms()
    local SpecialRooms = {}
    do
        local index = 0
        while index < GetRooms.Size do
            do
                local Room = GetRooms:Get(index)
                if Room.Data.Type ~= 1 or Room.Data.Type == 1 and (Room.Data.Subtype == 34 or Room.Data.Subtype == 10) then
                    ArrayCheck = SpecialRooms
                    if #SpecialRooms > 0 and CheckSafeIndex(nil, Room, SpecialRooms) == true then
                        goto __continue62
                    end
                    local RoomObj = {
                        Room = Room,
                        Visited = false,
                        Spawned = false,
                        Animation = nil,
                        Type = Room.Data.Type,
                        Opacity = 0.75
                    }
                    RoomObj.Animation = SetAnimName(
                        nil,
                        Room.Data.Type,
                        Room.Data.Variant,
                        Room.Data.Subtype,
                        configRA
                    )
                    if RoomObj.Animation == 0 then
                        goto __continue62
                    end
                    SpecialRooms[#SpecialRooms + 1] = RoomObj
                end
            end
            ::__continue62::
            index = index + 1
        end
    end
    RoomArray = __TS__ArraySort(
        SpecialRooms,
        function(____, a, b) return a.Room.Data.Type < b.Room.Data.Type and -1 or 1 end
    )
end
function CheckSafeIndex(self, room, test)
    do
        local index = 0
        while index < #ArrayCheck do
            local element = ArrayCheck[index + 1]
            if room.SafeGridIndex == element.Room.SafeGridIndex then
                return true
            end
            index = index + 1
        end
    end
    return false
end
function main(self)
    local mod = RegisterMod("remembrall", 1)
    local function postGameStarted(self)
        if mod:HasData() then
            local loadedFromSave = json.decode(Isaac.LoadModData(mod))
            for k, v in pairs(loadedFromSave) do
                configRA[k] = v
            end
        end
    end
    local function preGameExit(self)
        mod:SaveData(json.encode(configRA))
    end
    mod:AddCallback(ModCallback.PRE_GAME_EXIT, preGameExit)
    mod:AddCallback(ModCallback.POST_GAME_STARTED, postGameStarted)
    if ModConfigMenu ~= nil then
        ModConfig(nil, configRA)
    end
    mod:AddCallback(ModCallback.POST_NEW_LEVEL, GetAllRooms)
    mod:AddCallback(ModCallback.POST_RENDER, DisplayIcon)
    mod:AddCallback(ModCallback.POST_UPDATE, CheckRoom)
    mod:AddCallback(
        ModCallback.POST_NEW_ROOM,
        function()
            fortuneSpawned = 0
        end
    )
end
RoomArray = {}
fortuneSpawned = 0
Icon = Sprite()
ArrayCheck = {}
Icon:Load("gfx/ui/RA_icons.anm2", true)
Icon.Scale = Vector(1.5, 1.5)
main(nil)
return ____exports
 end,
["lua_modules.isaac-typescript-definitions.dist.src.index"] = function(...) 
local ____exports = {}
do
    local ____export = require("lua_modules.isaac-typescript-definitions.dist.src.enums.ActiveSlot")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lua_modules.isaac-typescript-definitions.dist.src.enums.BackdropType")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lua_modules.isaac-typescript-definitions.dist.src.enums.BrokenWatchState")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lua_modules.isaac-typescript-definitions.dist.src.enums.ButtonAction")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lua_modules.isaac-typescript-definitions.dist.src.enums.Challenge")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lua_modules.isaac-typescript-definitions.dist.src.enums.ChampionColor")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lua_modules.isaac-typescript-definitions.dist.src.enums.CollectibleAnimation")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lua_modules.isaac-typescript-definitions.dist.src.enums.CollectiblePedestalType")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lua_modules.isaac-typescript-definitions.dist.src.enums.CollectibleSpriteLayer")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lua_modules.isaac-typescript-definitions.dist.src.enums.collections.entityState")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lua_modules.isaac-typescript-definitions.dist.src.enums.collections.gridEntityState")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lua_modules.isaac-typescript-definitions.dist.src.enums.collections.gridEntityVariants")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lua_modules.isaac-typescript-definitions.dist.src.enums.collections.roomSubTypes")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lua_modules.isaac-typescript-definitions.dist.src.enums.collections.subTypes")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lua_modules.isaac-typescript-definitions.dist.src.enums.collections.variants")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lua_modules.isaac-typescript-definitions.dist.src.enums.Controller")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lua_modules.isaac-typescript-definitions.dist.src.enums.ControllerIndex")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lua_modules.isaac-typescript-definitions.dist.src.enums.CopyableIsaacAPIClassType")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lua_modules.isaac-typescript-definitions.dist.src.enums.CurseID")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lua_modules.isaac-typescript-definitions.dist.src.enums.Difficulty")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lua_modules.isaac-typescript-definitions.dist.src.enums.Dimension")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lua_modules.isaac-typescript-definitions.dist.src.enums.Direction")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lua_modules.isaac-typescript-definitions.dist.src.enums.DoorSlot")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lua_modules.isaac-typescript-definitions.dist.src.enums.Ending")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lua_modules.isaac-typescript-definitions.dist.src.enums.EntityCollisionClass")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lua_modules.isaac-typescript-definitions.dist.src.enums.EntityGridCollisionClass")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lua_modules.isaac-typescript-definitions.dist.src.enums.EntityType")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lua_modules.isaac-typescript-definitions.dist.src.enums.FadeoutTarget")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lua_modules.isaac-typescript-definitions.dist.src.enums.flags.ActionTrigger")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lua_modules.isaac-typescript-definitions.dist.src.enums.flags.CacheFlag")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lua_modules.isaac-typescript-definitions.dist.src.enums.flags.DamageFlag")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lua_modules.isaac-typescript-definitions.dist.src.enums.flags.DisplayFlag")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lua_modules.isaac-typescript-definitions.dist.src.enums.flags.DoorSlotFlag")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lua_modules.isaac-typescript-definitions.dist.src.enums.flags.EntityFlag")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lua_modules.isaac-typescript-definitions.dist.src.enums.flags.EntityPartition")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lua_modules.isaac-typescript-definitions.dist.src.enums.flags.ItemConfigTag")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lua_modules.isaac-typescript-definitions.dist.src.enums.flags.LevelCurse")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lua_modules.isaac-typescript-definitions.dist.src.enums.flags.ProjectileFlag")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lua_modules.isaac-typescript-definitions.dist.src.enums.flags.RoomDescriptorFlag")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lua_modules.isaac-typescript-definitions.dist.src.enums.flags.TargetFlag")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lua_modules.isaac-typescript-definitions.dist.src.enums.flags.TearFlag")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lua_modules.isaac-typescript-definitions.dist.src.enums.flags.UseFlag")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lua_modules.isaac-typescript-definitions.dist.src.enums.GameStateFlag")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lua_modules.isaac-typescript-definitions.dist.src.enums.GridCollisionClass")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lua_modules.isaac-typescript-definitions.dist.src.enums.GridEntityType")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lua_modules.isaac-typescript-definitions.dist.src.enums.GridEntityXMLType")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lua_modules.isaac-typescript-definitions.dist.src.enums.GridPath")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lua_modules.isaac-typescript-definitions.dist.src.enums.GridRoom")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lua_modules.isaac-typescript-definitions.dist.src.enums.InputHook")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lua_modules.isaac-typescript-definitions.dist.src.enums.ItemConfigCardType")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lua_modules.isaac-typescript-definitions.dist.src.enums.ItemConfigChargeType")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lua_modules.isaac-typescript-definitions.dist.src.enums.ItemConfigPillEffectClass")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lua_modules.isaac-typescript-definitions.dist.src.enums.ItemConfigPillEffectType")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lua_modules.isaac-typescript-definitions.dist.src.enums.ItemPoolType")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lua_modules.isaac-typescript-definitions.dist.src.enums.ItemType")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lua_modules.isaac-typescript-definitions.dist.src.enums.Keyboard")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lua_modules.isaac-typescript-definitions.dist.src.enums.LanguageAbbreviation")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lua_modules.isaac-typescript-definitions.dist.src.enums.LaserOffset")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lua_modules.isaac-typescript-definitions.dist.src.enums.LevelStage")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lua_modules.isaac-typescript-definitions.dist.src.enums.LevelStateFlag")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lua_modules.isaac-typescript-definitions.dist.src.enums.LineCheckMode")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lua_modules.isaac-typescript-definitions.dist.src.enums.ModCallback")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lua_modules.isaac-typescript-definitions.dist.src.enums.Mouse")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lua_modules.isaac-typescript-definitions.dist.src.enums.Music")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lua_modules.isaac-typescript-definitions.dist.src.enums.NpcState")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lua_modules.isaac-typescript-definitions.dist.src.enums.NullItemID")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lua_modules.isaac-typescript-definitions.dist.src.enums.PickupPrice")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lua_modules.isaac-typescript-definitions.dist.src.enums.PillEffect")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lua_modules.isaac-typescript-definitions.dist.src.enums.PlayerForm")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lua_modules.isaac-typescript-definitions.dist.src.enums.PlayerItemAnimation")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lua_modules.isaac-typescript-definitions.dist.src.enums.PlayerSpriteLayer")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lua_modules.isaac-typescript-definitions.dist.src.enums.PocketItemSlot")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lua_modules.isaac-typescript-definitions.dist.src.enums.PoopSpellType")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lua_modules.isaac-typescript-definitions.dist.src.enums.ProjectilesMode")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lua_modules.isaac-typescript-definitions.dist.src.enums.RenderMode")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lua_modules.isaac-typescript-definitions.dist.src.enums.RoomDescriptorDisplayType")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lua_modules.isaac-typescript-definitions.dist.src.enums.RoomDifficulty")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lua_modules.isaac-typescript-definitions.dist.src.enums.RoomShape")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lua_modules.isaac-typescript-definitions.dist.src.enums.RoomTransitionAnim")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lua_modules.isaac-typescript-definitions.dist.src.enums.RoomType")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lua_modules.isaac-typescript-definitions.dist.src.enums.SeedEffect")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lua_modules.isaac-typescript-definitions.dist.src.enums.SkinColor")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lua_modules.isaac-typescript-definitions.dist.src.enums.SortingLayer")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lua_modules.isaac-typescript-definitions.dist.src.enums.SoundEffect")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lua_modules.isaac-typescript-definitions.dist.src.enums.StageID")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lua_modules.isaac-typescript-definitions.dist.src.enums.StageTransition")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lua_modules.isaac-typescript-definitions.dist.src.enums.StageType")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lua_modules.isaac-typescript-definitions.dist.src.enums.TrinketSlot")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("lua_modules.isaac-typescript-definitions.dist.src.enums.WeaponType")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
return ____exports
 end,
["lua_modules.isaac-typescript-definitions.dist.src.enums.ActiveSlot"] = function(...) 
local ____exports = {}
____exports.ActiveSlot = {}
____exports.ActiveSlot.PRIMARY = 0
____exports.ActiveSlot[____exports.ActiveSlot.PRIMARY] = "PRIMARY"
____exports.ActiveSlot.SECONDARY = 1
____exports.ActiveSlot[____exports.ActiveSlot.SECONDARY] = "SECONDARY"
____exports.ActiveSlot.POCKET = 2
____exports.ActiveSlot[____exports.ActiveSlot.POCKET] = "POCKET"
____exports.ActiveSlot.POCKET_SINGLE_USE = 3
____exports.ActiveSlot[____exports.ActiveSlot.POCKET_SINGLE_USE] = "POCKET_SINGLE_USE"
return ____exports
 end,
["lua_modules.isaac-typescript-definitions.dist.src.enums.BackdropType"] = function(...) 
local ____exports = {}
____exports.BackdropType = {}
____exports.BackdropType.BASEMENT = 1
____exports.BackdropType[____exports.BackdropType.BASEMENT] = "BASEMENT"
____exports.BackdropType.CELLAR = 2
____exports.BackdropType[____exports.BackdropType.CELLAR] = "CELLAR"
____exports.BackdropType.BURNT_BASEMENT = 3
____exports.BackdropType[____exports.BackdropType.BURNT_BASEMENT] = "BURNT_BASEMENT"
____exports.BackdropType.CAVES = 4
____exports.BackdropType[____exports.BackdropType.CAVES] = "CAVES"
____exports.BackdropType.CATACOMBS = 5
____exports.BackdropType[____exports.BackdropType.CATACOMBS] = "CATACOMBS"
____exports.BackdropType.FLOODED_CAVES = 6
____exports.BackdropType[____exports.BackdropType.FLOODED_CAVES] = "FLOODED_CAVES"
____exports.BackdropType.DEPTHS = 7
____exports.BackdropType[____exports.BackdropType.DEPTHS] = "DEPTHS"
____exports.BackdropType.NECROPOLIS = 8
____exports.BackdropType[____exports.BackdropType.NECROPOLIS] = "NECROPOLIS"
____exports.BackdropType.DANK_DEPTHS = 9
____exports.BackdropType[____exports.BackdropType.DANK_DEPTHS] = "DANK_DEPTHS"
____exports.BackdropType.WOMB = 10
____exports.BackdropType[____exports.BackdropType.WOMB] = "WOMB"
____exports.BackdropType.UTERO = 11
____exports.BackdropType[____exports.BackdropType.UTERO] = "UTERO"
____exports.BackdropType.SCARRED_WOMB = 12
____exports.BackdropType[____exports.BackdropType.SCARRED_WOMB] = "SCARRED_WOMB"
____exports.BackdropType.BLUE_WOMB = 13
____exports.BackdropType[____exports.BackdropType.BLUE_WOMB] = "BLUE_WOMB"
____exports.BackdropType.SHEOL = 14
____exports.BackdropType[____exports.BackdropType.SHEOL] = "SHEOL"
____exports.BackdropType.CATHEDRAL = 15
____exports.BackdropType[____exports.BackdropType.CATHEDRAL] = "CATHEDRAL"
____exports.BackdropType.DARK_ROOM = 16
____exports.BackdropType[____exports.BackdropType.DARK_ROOM] = "DARK_ROOM"
____exports.BackdropType.CHEST = 17
____exports.BackdropType[____exports.BackdropType.CHEST] = "CHEST"
____exports.BackdropType.MEGA_SATAN = 18
____exports.BackdropType[____exports.BackdropType.MEGA_SATAN] = "MEGA_SATAN"
____exports.BackdropType.LIBRARY = 19
____exports.BackdropType[____exports.BackdropType.LIBRARY] = "LIBRARY"
____exports.BackdropType.SHOP = 20
____exports.BackdropType[____exports.BackdropType.SHOP] = "SHOP"
____exports.BackdropType.CLEAN_BEDROOM = 21
____exports.BackdropType[____exports.BackdropType.CLEAN_BEDROOM] = "CLEAN_BEDROOM"
____exports.BackdropType.DIRTY_BEDROOM = 22
____exports.BackdropType[____exports.BackdropType.DIRTY_BEDROOM] = "DIRTY_BEDROOM"
____exports.BackdropType.SECRET = 23
____exports.BackdropType[____exports.BackdropType.SECRET] = "SECRET"
____exports.BackdropType.DICE = 24
____exports.BackdropType[____exports.BackdropType.DICE] = "DICE"
____exports.BackdropType.ARCADE = 25
____exports.BackdropType[____exports.BackdropType.ARCADE] = "ARCADE"
____exports.BackdropType.ERROR_ROOM = 26
____exports.BackdropType[____exports.BackdropType.ERROR_ROOM] = "ERROR_ROOM"
____exports.BackdropType.BLUE_WOMB_PASS = 27
____exports.BackdropType[____exports.BackdropType.BLUE_WOMB_PASS] = "BLUE_WOMB_PASS"
____exports.BackdropType.GREED_SHOP = 28
____exports.BackdropType[____exports.BackdropType.GREED_SHOP] = "GREED_SHOP"
____exports.BackdropType.DUNGEON = 29
____exports.BackdropType[____exports.BackdropType.DUNGEON] = "DUNGEON"
____exports.BackdropType.SACRIFICE = 30
____exports.BackdropType[____exports.BackdropType.SACRIFICE] = "SACRIFICE"
____exports.BackdropType.DOWNPOUR = 31
____exports.BackdropType[____exports.BackdropType.DOWNPOUR] = "DOWNPOUR"
____exports.BackdropType.MINES = 32
____exports.BackdropType[____exports.BackdropType.MINES] = "MINES"
____exports.BackdropType.MAUSOLEUM = 33
____exports.BackdropType[____exports.BackdropType.MAUSOLEUM] = "MAUSOLEUM"
____exports.BackdropType.CORPSE = 34
____exports.BackdropType[____exports.BackdropType.CORPSE] = "CORPSE"
____exports.BackdropType.PLANETARIUM = 35
____exports.BackdropType[____exports.BackdropType.PLANETARIUM] = "PLANETARIUM"
____exports.BackdropType.DOWNPOUR_ENTRANCE = 36
____exports.BackdropType[____exports.BackdropType.DOWNPOUR_ENTRANCE] = "DOWNPOUR_ENTRANCE"
____exports.BackdropType.MINES_ENTRANCE = 37
____exports.BackdropType[____exports.BackdropType.MINES_ENTRANCE] = "MINES_ENTRANCE"
____exports.BackdropType.MAUSOLEUM_ENTRANCE = 38
____exports.BackdropType[____exports.BackdropType.MAUSOLEUM_ENTRANCE] = "MAUSOLEUM_ENTRANCE"
____exports.BackdropType.CORPSE_ENTRANCE = 39
____exports.BackdropType[____exports.BackdropType.CORPSE_ENTRANCE] = "CORPSE_ENTRANCE"
____exports.BackdropType.MAUSOLEUM_2 = 40
____exports.BackdropType[____exports.BackdropType.MAUSOLEUM_2] = "MAUSOLEUM_2"
____exports.BackdropType.MAUSOLEUM_3 = 41
____exports.BackdropType[____exports.BackdropType.MAUSOLEUM_3] = "MAUSOLEUM_3"
____exports.BackdropType.MAUSOLEUM_4 = 42
____exports.BackdropType[____exports.BackdropType.MAUSOLEUM_4] = "MAUSOLEUM_4"
____exports.BackdropType.CORPSE_2 = 43
____exports.BackdropType[____exports.BackdropType.CORPSE_2] = "CORPSE_2"
____exports.BackdropType.CORPSE_3 = 44
____exports.BackdropType[____exports.BackdropType.CORPSE_3] = "CORPSE_3"
____exports.BackdropType.DROSS = 45
____exports.BackdropType[____exports.BackdropType.DROSS] = "DROSS"
____exports.BackdropType.ASHPIT = 46
____exports.BackdropType[____exports.BackdropType.ASHPIT] = "ASHPIT"
____exports.BackdropType.GEHENNA = 47
____exports.BackdropType[____exports.BackdropType.GEHENNA] = "GEHENNA"
____exports.BackdropType.MORTIS = 48
____exports.BackdropType[____exports.BackdropType.MORTIS] = "MORTIS"
____exports.BackdropType.ISAACS_BEDROOM = 49
____exports.BackdropType[____exports.BackdropType.ISAACS_BEDROOM] = "ISAACS_BEDROOM"
____exports.BackdropType.HALLWAY = 50
____exports.BackdropType[____exports.BackdropType.HALLWAY] = "HALLWAY"
____exports.BackdropType.MOMS_BEDROOM = 51
____exports.BackdropType[____exports.BackdropType.MOMS_BEDROOM] = "MOMS_BEDROOM"
____exports.BackdropType.CLOSET = 52
____exports.BackdropType[____exports.BackdropType.CLOSET] = "CLOSET"
____exports.BackdropType.CLOSET_B = 53
____exports.BackdropType[____exports.BackdropType.CLOSET_B] = "CLOSET_B"
____exports.BackdropType.DOGMA = 54
____exports.BackdropType[____exports.BackdropType.DOGMA] = "DOGMA"
____exports.BackdropType.DUNGEON_GIDEON = 55
____exports.BackdropType[____exports.BackdropType.DUNGEON_GIDEON] = "DUNGEON_GIDEON"
____exports.BackdropType.DUNGEON_ROTGUT = 56
____exports.BackdropType[____exports.BackdropType.DUNGEON_ROTGUT] = "DUNGEON_ROTGUT"
____exports.BackdropType.DUNGEON_BEAST = 57
____exports.BackdropType[____exports.BackdropType.DUNGEON_BEAST] = "DUNGEON_BEAST"
____exports.BackdropType.MINES_SHAFT = 58
____exports.BackdropType[____exports.BackdropType.MINES_SHAFT] = "MINES_SHAFT"
____exports.BackdropType.ASHPIT_SHAFT = 59
____exports.BackdropType[____exports.BackdropType.ASHPIT_SHAFT] = "ASHPIT_SHAFT"
____exports.BackdropType.DARK_CLOSET = 60
____exports.BackdropType[____exports.BackdropType.DARK_CLOSET] = "DARK_CLOSET"
return ____exports
 end,
["lua_modules.isaac-typescript-definitions.dist.src.enums.BrokenWatchState"] = function(...) 
local ____exports = {}
--- Used by the `Room.SetBrokenWatchState` method.
____exports.BrokenWatchState = {}
____exports.BrokenWatchState.NONE = 0
____exports.BrokenWatchState[____exports.BrokenWatchState.NONE] = "NONE"
____exports.BrokenWatchState.SLOW = 1
____exports.BrokenWatchState[____exports.BrokenWatchState.SLOW] = "SLOW"
____exports.BrokenWatchState.FAST = 2
____exports.BrokenWatchState[____exports.BrokenWatchState.FAST] = "FAST"
return ____exports
 end,
["lua_modules.isaac-typescript-definitions.dist.src.enums.ButtonAction"] = function(...) 
local ____exports = {}
____exports.ButtonAction = {}
____exports.ButtonAction.LEFT = 0
____exports.ButtonAction[____exports.ButtonAction.LEFT] = "LEFT"
____exports.ButtonAction.RIGHT = 1
____exports.ButtonAction[____exports.ButtonAction.RIGHT] = "RIGHT"
____exports.ButtonAction.UP = 2
____exports.ButtonAction[____exports.ButtonAction.UP] = "UP"
____exports.ButtonAction.DOWN = 3
____exports.ButtonAction[____exports.ButtonAction.DOWN] = "DOWN"
____exports.ButtonAction.SHOOT_LEFT = 4
____exports.ButtonAction[____exports.ButtonAction.SHOOT_LEFT] = "SHOOT_LEFT"
____exports.ButtonAction.SHOOT_RIGHT = 5
____exports.ButtonAction[____exports.ButtonAction.SHOOT_RIGHT] = "SHOOT_RIGHT"
____exports.ButtonAction.SHOOT_UP = 6
____exports.ButtonAction[____exports.ButtonAction.SHOOT_UP] = "SHOOT_UP"
____exports.ButtonAction.SHOOT_DOWN = 7
____exports.ButtonAction[____exports.ButtonAction.SHOOT_DOWN] = "SHOOT_DOWN"
____exports.ButtonAction.BOMB = 8
____exports.ButtonAction[____exports.ButtonAction.BOMB] = "BOMB"
____exports.ButtonAction.ITEM = 9
____exports.ButtonAction[____exports.ButtonAction.ITEM] = "ITEM"
____exports.ButtonAction.PILL_CARD = 10
____exports.ButtonAction[____exports.ButtonAction.PILL_CARD] = "PILL_CARD"
____exports.ButtonAction.DROP = 11
____exports.ButtonAction[____exports.ButtonAction.DROP] = "DROP"
____exports.ButtonAction.PAUSE = 12
____exports.ButtonAction[____exports.ButtonAction.PAUSE] = "PAUSE"
____exports.ButtonAction.MAP = 13
____exports.ButtonAction[____exports.ButtonAction.MAP] = "MAP"
____exports.ButtonAction.MENU_CONFIRM = 14
____exports.ButtonAction[____exports.ButtonAction.MENU_CONFIRM] = "MENU_CONFIRM"
____exports.ButtonAction.MENU_BACK = 15
____exports.ButtonAction[____exports.ButtonAction.MENU_BACK] = "MENU_BACK"
____exports.ButtonAction.RESTART = 16
____exports.ButtonAction[____exports.ButtonAction.RESTART] = "RESTART"
____exports.ButtonAction.FULLSCREEN = 17
____exports.ButtonAction[____exports.ButtonAction.FULLSCREEN] = "FULLSCREEN"
____exports.ButtonAction.MUTE = 18
____exports.ButtonAction[____exports.ButtonAction.MUTE] = "MUTE"
____exports.ButtonAction.JOIN_MULTIPLAYER = 19
____exports.ButtonAction[____exports.ButtonAction.JOIN_MULTIPLAYER] = "JOIN_MULTIPLAYER"
____exports.ButtonAction.MENU_LEFT = 20
____exports.ButtonAction[____exports.ButtonAction.MENU_LEFT] = "MENU_LEFT"
____exports.ButtonAction.MENU_RIGHT = 21
____exports.ButtonAction[____exports.ButtonAction.MENU_RIGHT] = "MENU_RIGHT"
____exports.ButtonAction.MENU_UP = 22
____exports.ButtonAction[____exports.ButtonAction.MENU_UP] = "MENU_UP"
____exports.ButtonAction.MENU_DOWN = 23
____exports.ButtonAction[____exports.ButtonAction.MENU_DOWN] = "MENU_DOWN"
____exports.ButtonAction.MENU_LT = 24
____exports.ButtonAction[____exports.ButtonAction.MENU_LT] = "MENU_LT"
____exports.ButtonAction.MENU_RT = 25
____exports.ButtonAction[____exports.ButtonAction.MENU_RT] = "MENU_RT"
____exports.ButtonAction.MENU_TAB = 26
____exports.ButtonAction[____exports.ButtonAction.MENU_TAB] = "MENU_TAB"
____exports.ButtonAction.CONSOLE = 28
____exports.ButtonAction[____exports.ButtonAction.CONSOLE] = "CONSOLE"
return ____exports
 end,
["lua_modules.isaac-typescript-definitions.dist.src.enums.Challenge"] = function(...) 
local ____exports = {}
____exports.Challenge = {}
____exports.Challenge.NULL = 0
____exports.Challenge[____exports.Challenge.NULL] = "NULL"
____exports.Challenge.PITCH_BLACK = 1
____exports.Challenge[____exports.Challenge.PITCH_BLACK] = "PITCH_BLACK"
____exports.Challenge.HIGH_BROW = 2
____exports.Challenge[____exports.Challenge.HIGH_BROW] = "HIGH_BROW"
____exports.Challenge.HEAD_TRAUMA = 3
____exports.Challenge[____exports.Challenge.HEAD_TRAUMA] = "HEAD_TRAUMA"
____exports.Challenge.DARKNESS_FALLS = 4
____exports.Challenge[____exports.Challenge.DARKNESS_FALLS] = "DARKNESS_FALLS"
____exports.Challenge.THE_TANK = 5
____exports.Challenge[____exports.Challenge.THE_TANK] = "THE_TANK"
____exports.Challenge.SOLAR_SYSTEM = 6
____exports.Challenge[____exports.Challenge.SOLAR_SYSTEM] = "SOLAR_SYSTEM"
____exports.Challenge.SUICIDE_KING = 7
____exports.Challenge[____exports.Challenge.SUICIDE_KING] = "SUICIDE_KING"
____exports.Challenge.CAT_GOT_YOUR_TONGUE = 8
____exports.Challenge[____exports.Challenge.CAT_GOT_YOUR_TONGUE] = "CAT_GOT_YOUR_TONGUE"
____exports.Challenge.DEMO_MAN = 9
____exports.Challenge[____exports.Challenge.DEMO_MAN] = "DEMO_MAN"
____exports.Challenge.CURSED = 10
____exports.Challenge[____exports.Challenge.CURSED] = "CURSED"
____exports.Challenge.GLASS_CANNON = 11
____exports.Challenge[____exports.Challenge.GLASS_CANNON] = "GLASS_CANNON"
____exports.Challenge.WHEN_LIFE_GIVES_LEMONS = 12
____exports.Challenge[____exports.Challenge.WHEN_LIFE_GIVES_LEMONS] = "WHEN_LIFE_GIVES_LEMONS"
____exports.Challenge.BEANS = 13
____exports.Challenge[____exports.Challenge.BEANS] = "BEANS"
____exports.Challenge.ITS_IN_THE_CARDS = 14
____exports.Challenge[____exports.Challenge.ITS_IN_THE_CARDS] = "ITS_IN_THE_CARDS"
____exports.Challenge.SLOW_ROLL = 15
____exports.Challenge[____exports.Challenge.SLOW_ROLL] = "SLOW_ROLL"
____exports.Challenge.COMPUTER_SAVY = 16
____exports.Challenge[____exports.Challenge.COMPUTER_SAVY] = "COMPUTER_SAVY"
____exports.Challenge.WAKA_WAKA = 17
____exports.Challenge[____exports.Challenge.WAKA_WAKA] = "WAKA_WAKA"
____exports.Challenge.THE_HOST = 18
____exports.Challenge[____exports.Challenge.THE_HOST] = "THE_HOST"
____exports.Challenge.THE_FAMILY_MAN = 19
____exports.Challenge[____exports.Challenge.THE_FAMILY_MAN] = "THE_FAMILY_MAN"
____exports.Challenge.PURIST = 20
____exports.Challenge[____exports.Challenge.PURIST] = "PURIST"
____exports.Challenge.XXXXXXXXL = 21
____exports.Challenge[____exports.Challenge.XXXXXXXXL] = "XXXXXXXXL"
____exports.Challenge.SPEED = 22
____exports.Challenge[____exports.Challenge.SPEED] = "SPEED"
____exports.Challenge.BLUE_BOMBER = 23
____exports.Challenge[____exports.Challenge.BLUE_BOMBER] = "BLUE_BOMBER"
____exports.Challenge.PAY_TO_PLAY = 24
____exports.Challenge[____exports.Challenge.PAY_TO_PLAY] = "PAY_TO_PLAY"
____exports.Challenge.HAVE_A_HEART = 25
____exports.Challenge[____exports.Challenge.HAVE_A_HEART] = "HAVE_A_HEART"
____exports.Challenge.I_RULE = 26
____exports.Challenge[____exports.Challenge.I_RULE] = "I_RULE"
____exports.Challenge.BRAINS = 27
____exports.Challenge[____exports.Challenge.BRAINS] = "BRAINS"
____exports.Challenge.PRIDE_DAY = 28
____exports.Challenge[____exports.Challenge.PRIDE_DAY] = "PRIDE_DAY"
____exports.Challenge.ONANS_STREAK = 29
____exports.Challenge[____exports.Challenge.ONANS_STREAK] = "ONANS_STREAK"
____exports.Challenge.GUARDIAN = 30
____exports.Challenge[____exports.Challenge.GUARDIAN] = "GUARDIAN"
____exports.Challenge.BACKASSWARDS = 31
____exports.Challenge[____exports.Challenge.BACKASSWARDS] = "BACKASSWARDS"
____exports.Challenge.APRILS_FOOL = 32
____exports.Challenge[____exports.Challenge.APRILS_FOOL] = "APRILS_FOOL"
____exports.Challenge.POKEY_MANS = 33
____exports.Challenge[____exports.Challenge.POKEY_MANS] = "POKEY_MANS"
____exports.Challenge.ULTRA_HARD = 34
____exports.Challenge[____exports.Challenge.ULTRA_HARD] = "ULTRA_HARD"
____exports.Challenge.PONG = 35
____exports.Challenge[____exports.Challenge.PONG] = "PONG"
____exports.Challenge.SCAT_MAN = 36
____exports.Challenge[____exports.Challenge.SCAT_MAN] = "SCAT_MAN"
____exports.Challenge.BLOODY_MARY = 37
____exports.Challenge[____exports.Challenge.BLOODY_MARY] = "BLOODY_MARY"
____exports.Challenge.BAPTISM_BY_FIRE = 38
____exports.Challenge[____exports.Challenge.BAPTISM_BY_FIRE] = "BAPTISM_BY_FIRE"
____exports.Challenge.ISAACS_AWAKENING = 39
____exports.Challenge[____exports.Challenge.ISAACS_AWAKENING] = "ISAACS_AWAKENING"
____exports.Challenge.SEEING_DOUBLE = 40
____exports.Challenge[____exports.Challenge.SEEING_DOUBLE] = "SEEING_DOUBLE"
____exports.Challenge.PICA_RUN = 41
____exports.Challenge[____exports.Challenge.PICA_RUN] = "PICA_RUN"
____exports.Challenge.HOT_POTATO = 42
____exports.Challenge[____exports.Challenge.HOT_POTATO] = "HOT_POTATO"
____exports.Challenge.CANTRIPPED = 43
____exports.Challenge[____exports.Challenge.CANTRIPPED] = "CANTRIPPED"
____exports.Challenge.RED_REDEMPTION = 44
____exports.Challenge[____exports.Challenge.RED_REDEMPTION] = "RED_REDEMPTION"
____exports.Challenge.DELETE_THIS = 45
____exports.Challenge[____exports.Challenge.DELETE_THIS] = "DELETE_THIS"
return ____exports
 end,
["lua_modules.isaac-typescript-definitions.dist.src.enums.ChampionColor"] = function(...) 
local ____exports = {}
____exports.ChampionColor = {}
____exports.ChampionColor.RED = 0
____exports.ChampionColor[____exports.ChampionColor.RED] = "RED"
____exports.ChampionColor.YELLOW = 1
____exports.ChampionColor[____exports.ChampionColor.YELLOW] = "YELLOW"
____exports.ChampionColor.GREEN = 2
____exports.ChampionColor[____exports.ChampionColor.GREEN] = "GREEN"
____exports.ChampionColor.ORANGE = 3
____exports.ChampionColor[____exports.ChampionColor.ORANGE] = "ORANGE"
____exports.ChampionColor.BLUE = 4
____exports.ChampionColor[____exports.ChampionColor.BLUE] = "BLUE"
____exports.ChampionColor.BLACK = 5
____exports.ChampionColor[____exports.ChampionColor.BLACK] = "BLACK"
____exports.ChampionColor.WHITE = 6
____exports.ChampionColor[____exports.ChampionColor.WHITE] = "WHITE"
____exports.ChampionColor.GREY = 7
____exports.ChampionColor[____exports.ChampionColor.GREY] = "GREY"
____exports.ChampionColor.TRANSPARENT = 8
____exports.ChampionColor[____exports.ChampionColor.TRANSPARENT] = "TRANSPARENT"
____exports.ChampionColor.FLICKER = 9
____exports.ChampionColor[____exports.ChampionColor.FLICKER] = "FLICKER"
____exports.ChampionColor.PINK = 10
____exports.ChampionColor[____exports.ChampionColor.PINK] = "PINK"
____exports.ChampionColor.PURPLE = 11
____exports.ChampionColor[____exports.ChampionColor.PURPLE] = "PURPLE"
____exports.ChampionColor.DARK_RED = 12
____exports.ChampionColor[____exports.ChampionColor.DARK_RED] = "DARK_RED"
____exports.ChampionColor.LIGHT_BLUE = 13
____exports.ChampionColor[____exports.ChampionColor.LIGHT_BLUE] = "LIGHT_BLUE"
____exports.ChampionColor.CAMO = 14
____exports.ChampionColor[____exports.ChampionColor.CAMO] = "CAMO"
____exports.ChampionColor.PULSE_GREEN = 15
____exports.ChampionColor[____exports.ChampionColor.PULSE_GREEN] = "PULSE_GREEN"
____exports.ChampionColor.PULSE_GREY = 16
____exports.ChampionColor[____exports.ChampionColor.PULSE_GREY] = "PULSE_GREY"
____exports.ChampionColor.FLY_PROTECTED = 17
____exports.ChampionColor[____exports.ChampionColor.FLY_PROTECTED] = "FLY_PROTECTED"
____exports.ChampionColor.TINY = 18
____exports.ChampionColor[____exports.ChampionColor.TINY] = "TINY"
____exports.ChampionColor.GIANT = 19
____exports.ChampionColor[____exports.ChampionColor.GIANT] = "GIANT"
____exports.ChampionColor.PULSE_RED = 20
____exports.ChampionColor[____exports.ChampionColor.PULSE_RED] = "PULSE_RED"
____exports.ChampionColor.SIZE_PULSE = 21
____exports.ChampionColor[____exports.ChampionColor.SIZE_PULSE] = "SIZE_PULSE"
____exports.ChampionColor.KING = 22
____exports.ChampionColor[____exports.ChampionColor.KING] = "KING"
____exports.ChampionColor.DEATH = 23
____exports.ChampionColor[____exports.ChampionColor.DEATH] = "DEATH"
____exports.ChampionColor.BROWN = 24
____exports.ChampionColor[____exports.ChampionColor.BROWN] = "BROWN"
____exports.ChampionColor.RAINBOW = 25
____exports.ChampionColor[____exports.ChampionColor.RAINBOW] = "RAINBOW"
return ____exports
 end,
["lua_modules.isaac-typescript-definitions.dist.src.enums.CollectibleAnimation"] = function(...) 
local ____exports = {}
____exports.CollectibleAnimation = {}
____exports.CollectibleAnimation.IDLE = "Idle"
____exports.CollectibleAnimation.EMPTY = "Empty"
____exports.CollectibleAnimation.SHOP_IDLE = "ShopIdle"
____exports.CollectibleAnimation.PLAYER_PICKUP = "PlayerPickup"
____exports.CollectibleAnimation.PLAYER_PICKUP_SPARKLE = "PlayerPickupSparkle"
return ____exports
 end,
["lua_modules.isaac-typescript-definitions.dist.src.enums.CollectiblePedestalType"] = function(...) 
local ____exports = {}
--- Corresponds to the overlay frame number in "005.100_collectible.anm2".
____exports.CollectiblePedestalType = {}
____exports.CollectiblePedestalType.NONE = -1
____exports.CollectiblePedestalType[____exports.CollectiblePedestalType.NONE] = "NONE"
____exports.CollectiblePedestalType.NORMAL = 0
____exports.CollectiblePedestalType[____exports.CollectiblePedestalType.NORMAL] = "NORMAL"
____exports.CollectiblePedestalType.FORTUNE_TELLING_MACHINE = 1
____exports.CollectiblePedestalType[____exports.CollectiblePedestalType.FORTUNE_TELLING_MACHINE] = "FORTUNE_TELLING_MACHINE"
____exports.CollectiblePedestalType.BLOOD_DONATION_MACHINE = 2
____exports.CollectiblePedestalType[____exports.CollectiblePedestalType.BLOOD_DONATION_MACHINE] = "BLOOD_DONATION_MACHINE"
____exports.CollectiblePedestalType.SLOT_MACHINE = 3
____exports.CollectiblePedestalType[____exports.CollectiblePedestalType.SLOT_MACHINE] = "SLOT_MACHINE"
____exports.CollectiblePedestalType.LOCKED_CHEST = 4
____exports.CollectiblePedestalType[____exports.CollectiblePedestalType.LOCKED_CHEST] = "LOCKED_CHEST"
____exports.CollectiblePedestalType.RED_CHEST = 5
____exports.CollectiblePedestalType[____exports.CollectiblePedestalType.RED_CHEST] = "RED_CHEST"
____exports.CollectiblePedestalType.BOMB_CHEST = 6
____exports.CollectiblePedestalType[____exports.CollectiblePedestalType.BOMB_CHEST] = "BOMB_CHEST"
____exports.CollectiblePedestalType.SPIKED_CHEST = 7
____exports.CollectiblePedestalType[____exports.CollectiblePedestalType.SPIKED_CHEST] = "SPIKED_CHEST"
____exports.CollectiblePedestalType.ETERNAL_CHEST = 8
____exports.CollectiblePedestalType[____exports.CollectiblePedestalType.ETERNAL_CHEST] = "ETERNAL_CHEST"
____exports.CollectiblePedestalType.MOMS_DRESSING_TABLE = 9
____exports.CollectiblePedestalType[____exports.CollectiblePedestalType.MOMS_DRESSING_TABLE] = "MOMS_DRESSING_TABLE"
____exports.CollectiblePedestalType.CHEST = 10
____exports.CollectiblePedestalType[____exports.CollectiblePedestalType.CHEST] = "CHEST"
____exports.CollectiblePedestalType.MOMS_CHEST = 11
____exports.CollectiblePedestalType[____exports.CollectiblePedestalType.MOMS_CHEST] = "MOMS_CHEST"
____exports.CollectiblePedestalType.OLD_CHEST = 12
____exports.CollectiblePedestalType[____exports.CollectiblePedestalType.OLD_CHEST] = "OLD_CHEST"
____exports.CollectiblePedestalType.WOODEN_CHEST = 13
____exports.CollectiblePedestalType[____exports.CollectiblePedestalType.WOODEN_CHEST] = "WOODEN_CHEST"
____exports.CollectiblePedestalType.MEGA_CHEST = 14
____exports.CollectiblePedestalType[____exports.CollectiblePedestalType.MEGA_CHEST] = "MEGA_CHEST"
return ____exports
 end,
["lua_modules.isaac-typescript-definitions.dist.src.enums.CollectibleSpriteLayer"] = function(...) 
local ____exports = {}
--- Corresponds to "resources/gfx/005.100_collectible.anm2".
____exports.CollectibleSpriteLayer = {}
____exports.CollectibleSpriteLayer.BODY = 0
____exports.CollectibleSpriteLayer[____exports.CollectibleSpriteLayer.BODY] = "BODY"
____exports.CollectibleSpriteLayer.HEAD = 1
____exports.CollectibleSpriteLayer[____exports.CollectibleSpriteLayer.HEAD] = "HEAD"
____exports.CollectibleSpriteLayer.SPARKLE = 2
____exports.CollectibleSpriteLayer[____exports.CollectibleSpriteLayer.SPARKLE] = "SPARKLE"
____exports.CollectibleSpriteLayer.SHADOW = 3
____exports.CollectibleSpriteLayer[____exports.CollectibleSpriteLayer.SHADOW] = "SHADOW"
____exports.CollectibleSpriteLayer.ITEM_SHADOW = 4
____exports.CollectibleSpriteLayer[____exports.CollectibleSpriteLayer.ITEM_SHADOW] = "ITEM_SHADOW"
____exports.CollectibleSpriteLayer.ALTAR = 5
____exports.CollectibleSpriteLayer[____exports.CollectibleSpriteLayer.ALTAR] = "ALTAR"
return ____exports
 end,
["lua_modules.isaac-typescript-definitions.dist.src.enums.collections.entityState"] = function(...) 
local ____exports = {}
--- EntityType.FAMILIAR (3), FamiliarVariant.LOST_SOUL (211).
____exports.LostSoulState = {}
____exports.LostSoulState.ALIVE = 1
____exports.LostSoulState[____exports.LostSoulState.ALIVE] = "ALIVE"
____exports.LostSoulState.DEAD = 4
____exports.LostSoulState[____exports.LostSoulState.DEAD] = "DEAD"
--- For `EntityType.DEATH` (66).
____exports.DeathState = {}
____exports.DeathState.APPEAR = 1
____exports.DeathState[____exports.DeathState.APPEAR] = "APPEAR"
____exports.DeathState.SCYTHE_APPEAR = 3
____exports.DeathState[____exports.DeathState.SCYTHE_APPEAR] = "SCYTHE_APPEAR"
____exports.DeathState.MAIN_IDLE = 4
____exports.DeathState[____exports.DeathState.MAIN_IDLE] = "MAIN_IDLE"
____exports.DeathState.JUMP_OFF_HORSE = 7
____exports.DeathState[____exports.DeathState.JUMP_OFF_HORSE] = "JUMP_OFF_HORSE"
____exports.DeathState.SLOW_ATTACK = 8
____exports.DeathState[____exports.DeathState.SLOW_ATTACK] = "SLOW_ATTACK"
____exports.DeathState.SUMMON_KNIGHTS = 13
____exports.DeathState[____exports.DeathState.SUMMON_KNIGHTS] = "SUMMON_KNIGHTS"
____exports.DeathState.SUMMON_SCYTHES = 14
____exports.DeathState[____exports.DeathState.SUMMON_SCYTHES] = "SUMMON_SCYTHES"
--- For `EntityType.DADDY_LONG_LEGS` (101).
____exports.DaddyLongLegsState = {}
____exports.DaddyLongLegsState.SLAM_WITH_PROJECTILE_BURST = 4
____exports.DaddyLongLegsState[____exports.DaddyLongLegsState.SLAM_WITH_PROJECTILE_BURST] = "SLAM_WITH_PROJECTILE_BURST"
____exports.DaddyLongLegsState.STOMP_ATTACK_LEG = 7
____exports.DaddyLongLegsState[____exports.DaddyLongLegsState.STOMP_ATTACK_LEG] = "STOMP_ATTACK_LEG"
____exports.DaddyLongLegsState.SPITTING_SPIDERS_ATTACK = 8
____exports.DaddyLongLegsState[____exports.DaddyLongLegsState.SPITTING_SPIDERS_ATTACK] = "SPITTING_SPIDERS_ATTACK"
____exports.DaddyLongLegsState.MULTI_STOMP_ATTACK_MAIN = 9
____exports.DaddyLongLegsState[____exports.DaddyLongLegsState.MULTI_STOMP_ATTACK_MAIN] = "MULTI_STOMP_ATTACK_MAIN"
--- For `EntityType.BIG_HORN` (411).
____exports.BigHornState = {}
____exports.BigHornState.IDLE = 3
____exports.BigHornState[____exports.BigHornState.IDLE] = "IDLE"
____exports.BigHornState.HEAD_GOING_UP_OR_GOING_DOWN_INTO_HOLE = 4
____exports.BigHornState[____exports.BigHornState.HEAD_GOING_UP_OR_GOING_DOWN_INTO_HOLE] = "HEAD_GOING_UP_OR_GOING_DOWN_INTO_HOLE"
____exports.BigHornState.HAND_GOING_DOWN_INTO_HOLE = 5
____exports.BigHornState[____exports.BigHornState.HAND_GOING_DOWN_INTO_HOLE] = "HAND_GOING_DOWN_INTO_HOLE"
____exports.BigHornState.HAND_SLAM_ATTACK = 8
____exports.BigHornState[____exports.BigHornState.HAND_SLAM_ATTACK] = "HAND_SLAM_ATTACK"
____exports.BigHornState.HAND_THROW_TROLL_BOMB_ATTACK = 9
____exports.BigHornState[____exports.BigHornState.HAND_THROW_TROLL_BOMB_ATTACK] = "HAND_THROW_TROLL_BOMB_ATTACK"
____exports.BigHornState.HAND_THROW_TRIPLE_TROLL_BOMB_ATTACK = 10
____exports.BigHornState[____exports.BigHornState.HAND_THROW_TRIPLE_TROLL_BOMB_ATTACK] = "HAND_THROW_TRIPLE_TROLL_BOMB_ATTACK"
____exports.BigHornState.HEAD_BALL_ATTACK = 13
____exports.BigHornState[____exports.BigHornState.HEAD_BALL_ATTACK] = "HEAD_BALL_ATTACK"
--- For `EntityType.REAP_CREEP` (900).
____exports.ReapCreepState = {}
____exports.ReapCreepState.CRAWLING_FROM_SIDE_TO_SIDE = 3
____exports.ReapCreepState[____exports.ReapCreepState.CRAWLING_FROM_SIDE_TO_SIDE] = "CRAWLING_FROM_SIDE_TO_SIDE"
____exports.ReapCreepState.JUMPING_TO_TOP_WALL = 6
____exports.ReapCreepState[____exports.ReapCreepState.JUMPING_TO_TOP_WALL] = "JUMPING_TO_TOP_WALL"
____exports.ReapCreepState.WALL_SLAM_ATTACK = 7
____exports.ReapCreepState[____exports.ReapCreepState.WALL_SLAM_ATTACK] = "WALL_SLAM_ATTACK"
____exports.ReapCreepState.PROJECTILE_SPIT_LINE_ATTACK = 8
____exports.ReapCreepState[____exports.ReapCreepState.PROJECTILE_SPIT_LINE_ATTACK] = "PROJECTILE_SPIT_LINE_ATTACK"
____exports.ReapCreepState.PROJECTILE_SPIT_BURST_ATTACK = 9
____exports.ReapCreepState[____exports.ReapCreepState.PROJECTILE_SPIT_BURST_ATTACK] = "PROJECTILE_SPIT_BURST_ATTACK"
____exports.ReapCreepState.BRIMSTONE_ATTACK = 10
____exports.ReapCreepState[____exports.ReapCreepState.BRIMSTONE_ATTACK] = "BRIMSTONE_ATTACK"
____exports.ReapCreepState.SPAWNING_WALL_SPIDERS = 13
____exports.ReapCreepState[____exports.ReapCreepState.SPAWNING_WALL_SPIDERS] = "SPAWNING_WALL_SPIDERS"
____exports.ReapCreepState.SPAWNING_SPIDERS = 14
____exports.ReapCreepState[____exports.ReapCreepState.SPAWNING_SPIDERS] = "SPAWNING_SPIDERS"
____exports.ReapCreepState.TRANSFORMING_TO_NEXT_PHASE = 16
____exports.ReapCreepState[____exports.ReapCreepState.TRANSFORMING_TO_NEXT_PHASE] = "TRANSFORMING_TO_NEXT_PHASE"
--- For `EntityType.COLOSTOMIA` (917).
____exports.ColostomiaState = {}
____exports.ColostomiaState.IDLE_PHASE_1 = 3
____exports.ColostomiaState[____exports.ColostomiaState.IDLE_PHASE_1] = "IDLE_PHASE_1"
____exports.ColostomiaState.IDLE_PHASE_2 = 4
____exports.ColostomiaState[____exports.ColostomiaState.IDLE_PHASE_2] = "IDLE_PHASE_2"
____exports.ColostomiaState.JUMP_ATTACK_WITH_PROJECTILE_SPLASH = 6
____exports.ColostomiaState[____exports.ColostomiaState.JUMP_ATTACK_WITH_PROJECTILE_SPLASH] = "JUMP_ATTACK_WITH_PROJECTILE_SPLASH"
____exports.ColostomiaState.CHARGE_SLIDE = 8
____exports.ColostomiaState[____exports.ColostomiaState.CHARGE_SLIDE] = "CHARGE_SLIDE"
____exports.ColostomiaState.SPIT_POOP_BOMB = 9
____exports.ColostomiaState[____exports.ColostomiaState.SPIT_POOP_BOMB] = "SPIT_POOP_BOMB"
____exports.ColostomiaState.SPIT_TWO_POOP_BOMBS = 10
____exports.ColostomiaState[____exports.ColostomiaState.SPIT_TWO_POOP_BOMBS] = "SPIT_TWO_POOP_BOMBS"
____exports.ColostomiaState.FART_ATTACK = 11
____exports.ColostomiaState[____exports.ColostomiaState.FART_ATTACK] = "FART_ATTACK"
____exports.ColostomiaState.TRANSITION_TO_PHASE_2 = 16
____exports.ColostomiaState[____exports.ColostomiaState.TRANSITION_TO_PHASE_2] = "TRANSITION_TO_PHASE_2"
return ____exports
 end,
["lua_modules.isaac-typescript-definitions.dist.src.enums.collections.gridEntityState"] = function(...) 
local ____exports = {}
--- Used by the following grid entity types:
-- - GridEntityType.ROCK (2)
-- - GridEntityType.ROCK_TINTED (4)
-- - GridEntityType.ROCK_BOMB (5)
-- - GridEntityType.ROCK_ALT (6)
-- - GridEntityType.STATUE (21) (only for Angel Statues)
-- - GridEntityType.ROCK_SS (22)
-- - GridEntityType.ROCK_SPIKED (25)
-- - GridEntityType.ROCK_ALT2 (26)
-- - GridEntityType.ROCK_GOLD (27)
____exports.RockState = {}
____exports.RockState.UNBROKEN = 1
____exports.RockState[____exports.RockState.UNBROKEN] = "UNBROKEN"
____exports.RockState.BROKEN = 2
____exports.RockState[____exports.RockState.BROKEN] = "BROKEN"
____exports.RockState.EXPLODING = 3
____exports.RockState[____exports.RockState.EXPLODING] = "EXPLODING"
____exports.RockState.HALF_BROKEN = 4
____exports.RockState[____exports.RockState.HALF_BROKEN] = "HALF_BROKEN"
--- For `GridEntityType.PIT` (7).
____exports.PitState = {}
____exports.PitState.NORMAL = 0
____exports.PitState[____exports.PitState.NORMAL] = "NORMAL"
____exports.PitState.FILLED = 1
____exports.PitState[____exports.PitState.FILLED] = "FILLED"
--- For `GridEntityType.SPIKES_ON_OFF` (9).
____exports.SpikesOnOffState = {}
____exports.SpikesOnOffState.ON = 0
____exports.SpikesOnOffState[____exports.SpikesOnOffState.ON] = "ON"
____exports.SpikesOnOffState.OFF = 1
____exports.SpikesOnOffState[____exports.SpikesOnOffState.OFF] = "OFF"
--- For `GridEntityType.SPIDERWEB` (10).
____exports.SpiderWebState = {}
____exports.SpiderWebState.UNBROKEN = 0
____exports.SpiderWebState[____exports.SpiderWebState.UNBROKEN] = "UNBROKEN"
____exports.SpiderWebState.BROKEN = 1
____exports.SpiderWebState[____exports.SpiderWebState.BROKEN] = "BROKEN"
--- For `GridEntityType.LOCK` (11).
____exports.LockState = {}
____exports.LockState.LOCKED = 0
____exports.LockState[____exports.LockState.LOCKED] = "LOCKED"
____exports.LockState.UNLOCKED = 1
____exports.LockState[____exports.LockState.UNLOCKED] = "UNLOCKED"
--- For `GridEntityType.TNT` (12).
-- 
-- The health of a TNT barrel is represented by its state. It starts at 0 and climbs upwards in
-- increments of 1. Once the state reaches 4, the barrel explodes, and remains at state 4.
-- 
-- Breaking a TNT barrel usually takes 4 tears. However, it is possible to take less than that if
-- the players damage is high enough. (High damage causes the tear to do two or more increments at
-- once.)
____exports.TNTState = {}
____exports.TNTState.UNDAMAGED = 0
____exports.TNTState[____exports.TNTState.UNDAMAGED] = "UNDAMAGED"
____exports.TNTState.ONE_QUARTER_DAMAGED = 1
____exports.TNTState[____exports.TNTState.ONE_QUARTER_DAMAGED] = "ONE_QUARTER_DAMAGED"
____exports.TNTState.TWO_QUARTERS_DAMAGED = 2
____exports.TNTState[____exports.TNTState.TWO_QUARTERS_DAMAGED] = "TWO_QUARTERS_DAMAGED"
____exports.TNTState.THREE_QUARTERS_DAMAGED = 3
____exports.TNTState[____exports.TNTState.THREE_QUARTERS_DAMAGED] = "THREE_QUARTERS_DAMAGED"
____exports.TNTState.EXPLODED = 4
____exports.TNTState[____exports.TNTState.EXPLODED] = "EXPLODED"
--- For `GridEntityType.POOP` (14).
-- 
-- The health of a poop is represented by its state. It starts at 0 and climbs upwards in increments
-- of 250. Once the state reaches 1000, the poop is completely broken.
-- 
-- Breaking a poop usually takes 4 tears. However, it is possible to take less than that if the
-- players damage is high enough. (High damage causes the tear to do two or more increments at
-- once.)
-- 
-- Giga Poops increment by 20 instead of 250. Thus, they take around 50 tears to destroy.
____exports.PoopState = {}
____exports.PoopState.UNDAMAGED = 0
____exports.PoopState[____exports.PoopState.UNDAMAGED] = "UNDAMAGED"
____exports.PoopState.ONE_QUARTER_DAMAGED = 250
____exports.PoopState[____exports.PoopState.ONE_QUARTER_DAMAGED] = "ONE_QUARTER_DAMAGED"
____exports.PoopState.TWO_QUARTERS_DAMAGED = 500
____exports.PoopState[____exports.PoopState.TWO_QUARTERS_DAMAGED] = "TWO_QUARTERS_DAMAGED"
____exports.PoopState.THREE_QUARTERS_DAMAGED = 750
____exports.PoopState[____exports.PoopState.THREE_QUARTERS_DAMAGED] = "THREE_QUARTERS_DAMAGED"
____exports.PoopState.COMPLETELY_DESTROYED = 1000
____exports.PoopState[____exports.PoopState.COMPLETELY_DESTROYED] = "COMPLETELY_DESTROYED"
--- For `GridEntityType.DOOR` (16).
____exports.DoorState = {}
____exports.DoorState.INIT = 0
____exports.DoorState[____exports.DoorState.INIT] = "INIT"
____exports.DoorState.CLOSED = 1
____exports.DoorState[____exports.DoorState.CLOSED] = "CLOSED"
____exports.DoorState.OPEN = 2
____exports.DoorState[____exports.DoorState.OPEN] = "OPEN"
____exports.DoorState.ONE_CHAIN = 3
____exports.DoorState[____exports.DoorState.ONE_CHAIN] = "ONE_CHAIN"
____exports.DoorState.HALF_CRACKED = 4
____exports.DoorState[____exports.DoorState.HALF_CRACKED] = "HALF_CRACKED"
--- For `GridEntityType.TRAPDOOR` (17).
____exports.TrapdoorState = {}
____exports.TrapdoorState.CLOSED = 0
____exports.TrapdoorState[____exports.TrapdoorState.CLOSED] = "CLOSED"
____exports.TrapdoorState.OPEN = 1
____exports.TrapdoorState[____exports.TrapdoorState.OPEN] = "OPEN"
--- For `GridEntityType.CRAWL_SPACE` (18).
____exports.CrawlSpaceState = {}
____exports.CrawlSpaceState.CLOSED = 0
____exports.CrawlSpaceState[____exports.CrawlSpaceState.CLOSED] = "CLOSED"
____exports.CrawlSpaceState.OPEN = 1
____exports.CrawlSpaceState[____exports.CrawlSpaceState.OPEN] = "OPEN"
--- For `GridEntityType.PRESSURE_PLATE` (20).
____exports.PressurePlateState = {}
____exports.PressurePlateState.UNPRESSED = 0
____exports.PressurePlateState[____exports.PressurePlateState.UNPRESSED] = "UNPRESSED"
____exports.PressurePlateState.STATE_1_UNKNOWN = 1
____exports.PressurePlateState[____exports.PressurePlateState.STATE_1_UNKNOWN] = "STATE_1_UNKNOWN"
____exports.PressurePlateState.STATE_2_UNKNOWN = 2
____exports.PressurePlateState[____exports.PressurePlateState.STATE_2_UNKNOWN] = "STATE_2_UNKNOWN"
____exports.PressurePlateState.PRESSURE_PLATE_PRESSED = 3
____exports.PressurePlateState[____exports.PressurePlateState.PRESSURE_PLATE_PRESSED] = "PRESSURE_PLATE_PRESSED"
____exports.PressurePlateState.REWARD_PLATE_PRESSED = 4
____exports.PressurePlateState[____exports.PressurePlateState.REWARD_PLATE_PRESSED] = "REWARD_PLATE_PRESSED"
--- For `GridEntityType.TELEPORTER` (23).
____exports.TeleporterState = {}
____exports.TeleporterState.NORMAL = 0
____exports.TeleporterState[____exports.TeleporterState.NORMAL] = "NORMAL"
____exports.TeleporterState.ACTIVATED = 1
____exports.TeleporterState[____exports.TeleporterState.ACTIVATED] = "ACTIVATED"
____exports.TeleporterState.DISABLED = 2
____exports.TeleporterState[____exports.TeleporterState.DISABLED] = "DISABLED"
return ____exports
 end,
["lua_modules.isaac-typescript-definitions.dist.src.enums.collections.gridEntityVariants"] = function(...) 
local ____exports = {}
--- For `GridEntityType.ROCK` (2).
-- 
-- Note that this does not always apply to `GridEntityRock`, since that class can be equal to other
-- grid entity types.
____exports.RockVariant = {}
____exports.RockVariant.NORMAL = 0
____exports.RockVariant[____exports.RockVariant.NORMAL] = "NORMAL"
____exports.RockVariant.EVENT = 1
____exports.RockVariant[____exports.RockVariant.EVENT] = "EVENT"
--- For GridEntityType.ROCK_ALT (6), RockAltType.URN
-- 
-- Note that you are unable to spawn specific urn variants. The game will pick a random variant
-- regardless of which one you select.
____exports.UrnVariant = {}
____exports.UrnVariant.NORMAL = 0
____exports.UrnVariant[____exports.UrnVariant.NORMAL] = "NORMAL"
____exports.UrnVariant.CHIPPED_TOP_LEFT = 1
____exports.UrnVariant[____exports.UrnVariant.CHIPPED_TOP_LEFT] = "CHIPPED_TOP_LEFT"
____exports.UrnVariant.NARROW = 2
____exports.UrnVariant[____exports.UrnVariant.NARROW] = "NARROW"
--- For GridEntityType.ROCK_ALT (6), RockAltType.MUSHROOM
-- 
-- Note that you are unable to spawn specific mushroom variants. The game will pick a random variant
-- regardless of which one you select.
____exports.MushroomVariant = {}
____exports.MushroomVariant.NORMAL = 0
____exports.MushroomVariant[____exports.MushroomVariant.NORMAL] = "NORMAL"
____exports.MushroomVariant.CHIPPED_TOP_RIGHT = 1
____exports.MushroomVariant[____exports.MushroomVariant.CHIPPED_TOP_RIGHT] = "CHIPPED_TOP_RIGHT"
____exports.MushroomVariant.NARROW = 2
____exports.MushroomVariant[____exports.MushroomVariant.NARROW] = "NARROW"
--- For GridEntityType.ROCK_ALT (6), RockAltType.SKULL
-- 
-- Note that you are unable to spawn specific skull variants. The game will pick a random variant
-- regardless of which one you select.
____exports.SkullVariant = {}
____exports.SkullVariant.NORMAL = 0
____exports.SkullVariant[____exports.SkullVariant.NORMAL] = "NORMAL"
____exports.SkullVariant.FACING_RIGHT = 1
____exports.SkullVariant[____exports.SkullVariant.FACING_RIGHT] = "FACING_RIGHT"
____exports.SkullVariant.FACING_LEFT = 2
____exports.SkullVariant[____exports.SkullVariant.FACING_LEFT] = "FACING_LEFT"
--- For GridEntityType.ROCK_ALT (6), RockAltType.POLYP
-- 
-- Note that you are unable to spawn specific polyp variants. The game will pick a random variant
-- regardless of which one you select.
____exports.PolypVariant = {}
____exports.PolypVariant.NORMAL = 0
____exports.PolypVariant[____exports.PolypVariant.NORMAL] = "NORMAL"
____exports.PolypVariant.MANY_FINGERS = 1
____exports.PolypVariant[____exports.PolypVariant.MANY_FINGERS] = "MANY_FINGERS"
____exports.PolypVariant.FLIPPED_AND_SHIFTED_UPWARDS = 2
____exports.PolypVariant[____exports.PolypVariant.FLIPPED_AND_SHIFTED_UPWARDS] = "FLIPPED_AND_SHIFTED_UPWARDS"
--- For GridEntityType.ROCK_ALT (6), RockAltType.BUCKET
-- 
-- Note that you are unable to spawn specific bucket variants. The game will pick a random variant
-- regardless of which one you select.
____exports.BucketVariant = {}
____exports.BucketVariant.EMPTY = 0
____exports.BucketVariant[____exports.BucketVariant.EMPTY] = "EMPTY"
____exports.BucketVariant.FULL = 1
____exports.BucketVariant[____exports.BucketVariant.FULL] = "FULL"
____exports.BucketVariant.EMPTY_AND_SHIFTED_UPWARDS = 2
____exports.BucketVariant[____exports.BucketVariant.EMPTY_AND_SHIFTED_UPWARDS] = "EMPTY_AND_SHIFTED_UPWARDS"
--- For `GridEntityType.PIT` (7).
____exports.PitVariant = {}
____exports.PitVariant.NORMAL = 0
____exports.PitVariant[____exports.PitVariant.NORMAL] = "NORMAL"
____exports.PitVariant.FISSURE_SPAWNER = 16
____exports.PitVariant[____exports.PitVariant.FISSURE_SPAWNER] = "FISSURE_SPAWNER"
--- For `GridEntityType.FIREPLACE`. (13).
-- 
-- This only partially corresponds to the `FireplaceVariant` for non-grid entities. (Spawning a grid
-- entity fireplace with a variant higher than 1 will result in a normal fireplace.)
____exports.FireplaceGridEntityVariant = {}
____exports.FireplaceGridEntityVariant.NORMAL = 0
____exports.FireplaceGridEntityVariant[____exports.FireplaceGridEntityVariant.NORMAL] = "NORMAL"
____exports.FireplaceGridEntityVariant.RED = 1
____exports.FireplaceGridEntityVariant[____exports.FireplaceGridEntityVariant.RED] = "RED"
--- For `GridEntityType.POOP`. (14).
____exports.PoopGridEntityVariant = {}
____exports.PoopGridEntityVariant.NORMAL = 0
____exports.PoopGridEntityVariant[____exports.PoopGridEntityVariant.NORMAL] = "NORMAL"
____exports.PoopGridEntityVariant.RED = 1
____exports.PoopGridEntityVariant[____exports.PoopGridEntityVariant.RED] = "RED"
____exports.PoopGridEntityVariant.CORN = 2
____exports.PoopGridEntityVariant[____exports.PoopGridEntityVariant.CORN] = "CORN"
____exports.PoopGridEntityVariant.GOLDEN = 3
____exports.PoopGridEntityVariant[____exports.PoopGridEntityVariant.GOLDEN] = "GOLDEN"
____exports.PoopGridEntityVariant.RAINBOW = 4
____exports.PoopGridEntityVariant[____exports.PoopGridEntityVariant.RAINBOW] = "RAINBOW"
____exports.PoopGridEntityVariant.BLACK = 5
____exports.PoopGridEntityVariant[____exports.PoopGridEntityVariant.BLACK] = "BLACK"
____exports.PoopGridEntityVariant.WHITE = 6
____exports.PoopGridEntityVariant[____exports.PoopGridEntityVariant.WHITE] = "WHITE"
____exports.PoopGridEntityVariant.GIGA_TOP_LEFT = 7
____exports.PoopGridEntityVariant[____exports.PoopGridEntityVariant.GIGA_TOP_LEFT] = "GIGA_TOP_LEFT"
____exports.PoopGridEntityVariant.GIGA_TOP_RIGHT = 8
____exports.PoopGridEntityVariant[____exports.PoopGridEntityVariant.GIGA_TOP_RIGHT] = "GIGA_TOP_RIGHT"
____exports.PoopGridEntityVariant.GIGA_BOTTOM_LEFT = 9
____exports.PoopGridEntityVariant[____exports.PoopGridEntityVariant.GIGA_BOTTOM_LEFT] = "GIGA_BOTTOM_LEFT"
____exports.PoopGridEntityVariant.GIGA_BOTTOM_RIGHT = 10
____exports.PoopGridEntityVariant[____exports.PoopGridEntityVariant.GIGA_BOTTOM_RIGHT] = "GIGA_BOTTOM_RIGHT"
____exports.PoopGridEntityVariant.CHARMING = 11
____exports.PoopGridEntityVariant[____exports.PoopGridEntityVariant.CHARMING] = "CHARMING"
--- For `GridEntityType.DOOR`. (16).
____exports.DoorVariant = {}
____exports.DoorVariant.UNSPECIFIED = 0
____exports.DoorVariant[____exports.DoorVariant.UNSPECIFIED] = "UNSPECIFIED"
____exports.DoorVariant.LOCKED = 1
____exports.DoorVariant[____exports.DoorVariant.LOCKED] = "LOCKED"
____exports.DoorVariant.LOCKED_DOUBLE = 2
____exports.DoorVariant[____exports.DoorVariant.LOCKED_DOUBLE] = "LOCKED_DOUBLE"
____exports.DoorVariant.LOCKED_CRACKED = 3
____exports.DoorVariant[____exports.DoorVariant.LOCKED_CRACKED] = "LOCKED_CRACKED"
____exports.DoorVariant.LOCKED_BARRED = 4
____exports.DoorVariant[____exports.DoorVariant.LOCKED_BARRED] = "LOCKED_BARRED"
____exports.DoorVariant.LOCKED_KEY_FAMILIAR = 5
____exports.DoorVariant[____exports.DoorVariant.LOCKED_KEY_FAMILIAR] = "LOCKED_KEY_FAMILIAR"
____exports.DoorVariant.LOCKED_GREED = 6
____exports.DoorVariant[____exports.DoorVariant.LOCKED_GREED] = "LOCKED_GREED"
____exports.DoorVariant.HIDDEN = 7
____exports.DoorVariant[____exports.DoorVariant.HIDDEN] = "HIDDEN"
____exports.DoorVariant.UNLOCKED = 8
____exports.DoorVariant[____exports.DoorVariant.UNLOCKED] = "UNLOCKED"
--- For `GridEntityType.TRAPDOOR` (17).
____exports.TrapdoorVariant = {}
____exports.TrapdoorVariant.NORMAL = 0
____exports.TrapdoorVariant[____exports.TrapdoorVariant.NORMAL] = "NORMAL"
____exports.TrapdoorVariant.VOID_PORTAL = 1
____exports.TrapdoorVariant[____exports.TrapdoorVariant.VOID_PORTAL] = "VOID_PORTAL"
--- For `GridEntityType.CRAWL_SPACE`. (18).
____exports.CrawlSpaceVariant = {}
____exports.CrawlSpaceVariant.NORMAL = 0
____exports.CrawlSpaceVariant[____exports.CrawlSpaceVariant.NORMAL] = "NORMAL"
____exports.CrawlSpaceVariant.GREAT_GIDEON = 1
____exports.CrawlSpaceVariant[____exports.CrawlSpaceVariant.GREAT_GIDEON] = "GREAT_GIDEON"
____exports.CrawlSpaceVariant.SECRET_SHOP = 2
____exports.CrawlSpaceVariant[____exports.CrawlSpaceVariant.SECRET_SHOP] = "SECRET_SHOP"
____exports.CrawlSpaceVariant.PASSAGE_TO_BEGINNING_OF_FLOOR = 3
____exports.CrawlSpaceVariant[____exports.CrawlSpaceVariant.PASSAGE_TO_BEGINNING_OF_FLOOR] = "PASSAGE_TO_BEGINNING_OF_FLOOR"
____exports.CrawlSpaceVariant.NULL = 4
____exports.CrawlSpaceVariant[____exports.CrawlSpaceVariant.NULL] = "NULL"
--- For `GridEntityType.PRESSURE_PLATE` (20).
____exports.PressurePlateVariant = {}
____exports.PressurePlateVariant.PRESSURE_PLATE = 0
____exports.PressurePlateVariant[____exports.PressurePlateVariant.PRESSURE_PLATE] = "PRESSURE_PLATE"
____exports.PressurePlateVariant.REWARD_PLATE = 1
____exports.PressurePlateVariant[____exports.PressurePlateVariant.REWARD_PLATE] = "REWARD_PLATE"
____exports.PressurePlateVariant.GREED_PLATE = 2
____exports.PressurePlateVariant[____exports.PressurePlateVariant.GREED_PLATE] = "GREED_PLATE"
____exports.PressurePlateVariant.RAIL_PLATE = 3
____exports.PressurePlateVariant[____exports.PressurePlateVariant.RAIL_PLATE] = "RAIL_PLATE"
____exports.PressurePlateVariant.KILL_ALL_ENEMIES_PLATE = 9
____exports.PressurePlateVariant[____exports.PressurePlateVariant.KILL_ALL_ENEMIES_PLATE] = "KILL_ALL_ENEMIES_PLATE"
____exports.PressurePlateVariant.SPAWN_ROCKS_PLATE = 10
____exports.PressurePlateVariant[____exports.PressurePlateVariant.SPAWN_ROCKS_PLATE] = "SPAWN_ROCKS_PLATE"
--- For `GridEntityType.STATUE` (21).
____exports.StatueVariant = {}
____exports.StatueVariant.DEVIL = 0
____exports.StatueVariant[____exports.StatueVariant.DEVIL] = "DEVIL"
____exports.StatueVariant.ANGEL = 1
____exports.StatueVariant[____exports.StatueVariant.ANGEL] = "ANGEL"
return ____exports
 end,
["lua_modules.isaac-typescript-definitions.dist.src.enums.collections.roomSubTypes"] = function(...) 
local ____exports = {}
--- For `StageID.SPECIAL_ROOMS` (0), `RoomType.SHOP` (2).
-- 
-- This matches the sub-type in the "00.special rooms.stb" file.
____exports.ShopSubType = {}
____exports.ShopSubType.LEVEL_1 = 0
____exports.ShopSubType[____exports.ShopSubType.LEVEL_1] = "LEVEL_1"
____exports.ShopSubType.LEVEL_2 = 1
____exports.ShopSubType[____exports.ShopSubType.LEVEL_2] = "LEVEL_2"
____exports.ShopSubType.LEVEL_3 = 2
____exports.ShopSubType[____exports.ShopSubType.LEVEL_3] = "LEVEL_3"
____exports.ShopSubType.LEVEL_4 = 3
____exports.ShopSubType[____exports.ShopSubType.LEVEL_4] = "LEVEL_4"
____exports.ShopSubType.LEVEL_5 = 4
____exports.ShopSubType[____exports.ShopSubType.LEVEL_5] = "LEVEL_5"
____exports.ShopSubType.RARE_GOOD = 10
____exports.ShopSubType[____exports.ShopSubType.RARE_GOOD] = "RARE_GOOD"
____exports.ShopSubType.RARE_BAD = 11
____exports.ShopSubType[____exports.ShopSubType.RARE_BAD] = "RARE_BAD"
____exports.ShopSubType.TAINTED_KEEPER_LEVEL_1 = 100
____exports.ShopSubType[____exports.ShopSubType.TAINTED_KEEPER_LEVEL_1] = "TAINTED_KEEPER_LEVEL_1"
____exports.ShopSubType.TAINTED_KEEPER_LEVEL_2 = 101
____exports.ShopSubType[____exports.ShopSubType.TAINTED_KEEPER_LEVEL_2] = "TAINTED_KEEPER_LEVEL_2"
____exports.ShopSubType.TAINTED_KEEPER_LEVEL_3 = 102
____exports.ShopSubType[____exports.ShopSubType.TAINTED_KEEPER_LEVEL_3] = "TAINTED_KEEPER_LEVEL_3"
____exports.ShopSubType.TAINTED_KEEPER_LEVEL_4 = 103
____exports.ShopSubType[____exports.ShopSubType.TAINTED_KEEPER_LEVEL_4] = "TAINTED_KEEPER_LEVEL_4"
____exports.ShopSubType.TAINTED_KEEPER_LEVEL_5 = 104
____exports.ShopSubType[____exports.ShopSubType.TAINTED_KEEPER_LEVEL_5] = "TAINTED_KEEPER_LEVEL_5"
____exports.ShopSubType.TAINTED_KEEPER_RARE_GOOD = 110
____exports.ShopSubType[____exports.ShopSubType.TAINTED_KEEPER_RARE_GOOD] = "TAINTED_KEEPER_RARE_GOOD"
____exports.ShopSubType.TAINTED_KEEPER_RARE_BAD = 111
____exports.ShopSubType[____exports.ShopSubType.TAINTED_KEEPER_RARE_BAD] = "TAINTED_KEEPER_RARE_BAD"
--- For `StageID.SPECIAL_ROOMS` (0), `RoomType.TREASURE` (4).
-- 
-- This matches the sub-type in the "00.special rooms.stb" file and elsewhere.
____exports.TreasureRoomSubType = {}
____exports.TreasureRoomSubType.NORMAL = 0
____exports.TreasureRoomSubType[____exports.TreasureRoomSubType.NORMAL] = "NORMAL"
____exports.TreasureRoomSubType.MORE_OPTIONS = 1
____exports.TreasureRoomSubType[____exports.TreasureRoomSubType.MORE_OPTIONS] = "MORE_OPTIONS"
____exports.TreasureRoomSubType.PAY_TO_WIN = 2
____exports.TreasureRoomSubType[____exports.TreasureRoomSubType.PAY_TO_WIN] = "PAY_TO_WIN"
____exports.TreasureRoomSubType.MORE_OPTIONS_AND_PAY_TO_WIN = 3
____exports.TreasureRoomSubType[____exports.TreasureRoomSubType.MORE_OPTIONS_AND_PAY_TO_WIN] = "MORE_OPTIONS_AND_PAY_TO_WIN"
____exports.TreasureRoomSubType.KNIFE_PIECE = 34
____exports.TreasureRoomSubType[____exports.TreasureRoomSubType.KNIFE_PIECE] = "KNIFE_PIECE"
--- For `StageID.SPECIAL_ROOMS` (0), `RoomType.BOSS` (5).
-- 
-- This matches the "bossID" attribute in the "entities2.xml" file. It also matches the sub-type in
-- the "00.special rooms.stb" file.
-- 
-- The enum is named `BossID` instead of `BossRoomSubType` in order to match the `Entity.GetBossID`,
-- `Room.GetBossID` and `Room.GetSecondBossID` methods.
____exports.BossID = {}
____exports.BossID.MONSTRO = 1
____exports.BossID[____exports.BossID.MONSTRO] = "MONSTRO"
____exports.BossID.LARRY_JR = 2
____exports.BossID[____exports.BossID.LARRY_JR] = "LARRY_JR"
____exports.BossID.CHUB = 3
____exports.BossID[____exports.BossID.CHUB] = "CHUB"
____exports.BossID.GURDY = 4
____exports.BossID[____exports.BossID.GURDY] = "GURDY"
____exports.BossID.MONSTRO_II = 5
____exports.BossID[____exports.BossID.MONSTRO_II] = "MONSTRO_II"
____exports.BossID.MOM = 6
____exports.BossID[____exports.BossID.MOM] = "MOM"
____exports.BossID.SCOLEX = 7
____exports.BossID[____exports.BossID.SCOLEX] = "SCOLEX"
____exports.BossID.MOMS_HEART = 8
____exports.BossID[____exports.BossID.MOMS_HEART] = "MOMS_HEART"
____exports.BossID.FAMINE = 9
____exports.BossID[____exports.BossID.FAMINE] = "FAMINE"
____exports.BossID.PESTILENCE = 10
____exports.BossID[____exports.BossID.PESTILENCE] = "PESTILENCE"
____exports.BossID.WAR = 11
____exports.BossID[____exports.BossID.WAR] = "WAR"
____exports.BossID.DEATH = 12
____exports.BossID[____exports.BossID.DEATH] = "DEATH"
____exports.BossID.DUKE_OF_FLIES = 13
____exports.BossID[____exports.BossID.DUKE_OF_FLIES] = "DUKE_OF_FLIES"
____exports.BossID.PEEP = 14
____exports.BossID[____exports.BossID.PEEP] = "PEEP"
____exports.BossID.LOKI = 15
____exports.BossID[____exports.BossID.LOKI] = "LOKI"
____exports.BossID.BLASTOCYST = 16
____exports.BossID[____exports.BossID.BLASTOCYST] = "BLASTOCYST"
____exports.BossID.GEMINI = 17
____exports.BossID[____exports.BossID.GEMINI] = "GEMINI"
____exports.BossID.FISTULA = 18
____exports.BossID[____exports.BossID.FISTULA] = "FISTULA"
____exports.BossID.GISH = 19
____exports.BossID[____exports.BossID.GISH] = "GISH"
____exports.BossID.STEVEN = 20
____exports.BossID[____exports.BossID.STEVEN] = "STEVEN"
____exports.BossID.CHAD = 21
____exports.BossID[____exports.BossID.CHAD] = "CHAD"
____exports.BossID.HEADLESS_HORSEMAN = 22
____exports.BossID[____exports.BossID.HEADLESS_HORSEMAN] = "HEADLESS_HORSEMAN"
____exports.BossID.THE_FALLEN = 23
____exports.BossID[____exports.BossID.THE_FALLEN] = "THE_FALLEN"
____exports.BossID.SATAN = 24
____exports.BossID[____exports.BossID.SATAN] = "SATAN"
____exports.BossID.IT_LIVES = 25
____exports.BossID[____exports.BossID.IT_LIVES] = "IT_LIVES"
____exports.BossID.THE_HOLLOW = 26
____exports.BossID[____exports.BossID.THE_HOLLOW] = "THE_HOLLOW"
____exports.BossID.THE_CARRION_QUEEN = 27
____exports.BossID[____exports.BossID.THE_CARRION_QUEEN] = "THE_CARRION_QUEEN"
____exports.BossID.GURDY_JR = 28
____exports.BossID[____exports.BossID.GURDY_JR] = "GURDY_JR"
____exports.BossID.THE_HUSK = 29
____exports.BossID[____exports.BossID.THE_HUSK] = "THE_HUSK"
____exports.BossID.THE_BLOAT = 30
____exports.BossID[____exports.BossID.THE_BLOAT] = "THE_BLOAT"
____exports.BossID.LOKII = 31
____exports.BossID[____exports.BossID.LOKII] = "LOKII"
____exports.BossID.THE_BLIGHTED_OVUM = 32
____exports.BossID[____exports.BossID.THE_BLIGHTED_OVUM] = "THE_BLIGHTED_OVUM"
____exports.BossID.TERATOMA = 33
____exports.BossID[____exports.BossID.TERATOMA] = "TERATOMA"
____exports.BossID.THE_WIDOW = 34
____exports.BossID[____exports.BossID.THE_WIDOW] = "THE_WIDOW"
____exports.BossID.MASK_OF_INFAMY = 35
____exports.BossID[____exports.BossID.MASK_OF_INFAMY] = "MASK_OF_INFAMY"
____exports.BossID.THE_WRETCHED = 36
____exports.BossID[____exports.BossID.THE_WRETCHED] = "THE_WRETCHED"
____exports.BossID.PIN = 37
____exports.BossID[____exports.BossID.PIN] = "PIN"
____exports.BossID.CONQUEST = 38
____exports.BossID[____exports.BossID.CONQUEST] = "CONQUEST"
____exports.BossID.ISAAC = 39
____exports.BossID[____exports.BossID.ISAAC] = "ISAAC"
____exports.BossID.BLUE_BABY = 40
____exports.BossID[____exports.BossID.BLUE_BABY] = "BLUE_BABY"
____exports.BossID.DADDY_LONG_LEGS = 41
____exports.BossID[____exports.BossID.DADDY_LONG_LEGS] = "DADDY_LONG_LEGS"
____exports.BossID.TRIACHNID = 42
____exports.BossID[____exports.BossID.TRIACHNID] = "TRIACHNID"
____exports.BossID.THE_HAUNT = 43
____exports.BossID[____exports.BossID.THE_HAUNT] = "THE_HAUNT"
____exports.BossID.DINGLE = 44
____exports.BossID[____exports.BossID.DINGLE] = "DINGLE"
____exports.BossID.MEGA_MAW = 45
____exports.BossID[____exports.BossID.MEGA_MAW] = "MEGA_MAW"
____exports.BossID.THE_GATE = 46
____exports.BossID[____exports.BossID.THE_GATE] = "THE_GATE"
____exports.BossID.MEGA_FATTY = 47
____exports.BossID[____exports.BossID.MEGA_FATTY] = "MEGA_FATTY"
____exports.BossID.THE_CAGE = 48
____exports.BossID[____exports.BossID.THE_CAGE] = "THE_CAGE"
____exports.BossID.MAMA_GURDY = 49
____exports.BossID[____exports.BossID.MAMA_GURDY] = "MAMA_GURDY"
____exports.BossID.DARK_ONE = 50
____exports.BossID[____exports.BossID.DARK_ONE] = "DARK_ONE"
____exports.BossID.THE_ADVERSARY = 51
____exports.BossID[____exports.BossID.THE_ADVERSARY] = "THE_ADVERSARY"
____exports.BossID.POLYCEPHALUS = 52
____exports.BossID[____exports.BossID.POLYCEPHALUS] = "POLYCEPHALUS"
____exports.BossID.MR_FRED = 53
____exports.BossID[____exports.BossID.MR_FRED] = "MR_FRED"
____exports.BossID.THE_LAMB = 54
____exports.BossID[____exports.BossID.THE_LAMB] = "THE_LAMB"
____exports.BossID.MEGA_SATAN = 55
____exports.BossID[____exports.BossID.MEGA_SATAN] = "MEGA_SATAN"
____exports.BossID.GURGLINGS = 56
____exports.BossID[____exports.BossID.GURGLINGS] = "GURGLINGS"
____exports.BossID.THE_STAIN = 57
____exports.BossID[____exports.BossID.THE_STAIN] = "THE_STAIN"
____exports.BossID.BROWNIE = 58
____exports.BossID[____exports.BossID.BROWNIE] = "BROWNIE"
____exports.BossID.THE_FORSAKEN = 59
____exports.BossID[____exports.BossID.THE_FORSAKEN] = "THE_FORSAKEN"
____exports.BossID.LITTLE_HORN = 60
____exports.BossID[____exports.BossID.LITTLE_HORN] = "LITTLE_HORN"
____exports.BossID.RAG_MAN = 61
____exports.BossID[____exports.BossID.RAG_MAN] = "RAG_MAN"
____exports.BossID.ULTRA_GREED = 62
____exports.BossID[____exports.BossID.ULTRA_GREED] = "ULTRA_GREED"
____exports.BossID.HUSH = 63
____exports.BossID[____exports.BossID.HUSH] = "HUSH"
____exports.BossID.DANGLE = 64
____exports.BossID[____exports.BossID.DANGLE] = "DANGLE"
____exports.BossID.TURDLING = 65
____exports.BossID[____exports.BossID.TURDLING] = "TURDLING"
____exports.BossID.THE_FRAIL = 66
____exports.BossID[____exports.BossID.THE_FRAIL] = "THE_FRAIL"
____exports.BossID.RAG_MEGA = 67
____exports.BossID[____exports.BossID.RAG_MEGA] = "RAG_MEGA"
____exports.BossID.SISTERS_VIS = 68
____exports.BossID[____exports.BossID.SISTERS_VIS] = "SISTERS_VIS"
____exports.BossID.BIG_HORN = 69
____exports.BossID[____exports.BossID.BIG_HORN] = "BIG_HORN"
____exports.BossID.DELIRIUM = 70
____exports.BossID[____exports.BossID.DELIRIUM] = "DELIRIUM"
____exports.BossID.THE_MATRIARCH = 72
____exports.BossID[____exports.BossID.THE_MATRIARCH] = "THE_MATRIARCH"
____exports.BossID.THE_PILE = 73
____exports.BossID[____exports.BossID.THE_PILE] = "THE_PILE"
____exports.BossID.REAP_CREEP = 74
____exports.BossID[____exports.BossID.REAP_CREEP] = "REAP_CREEP"
____exports.BossID.LIL_BLUB = 75
____exports.BossID[____exports.BossID.LIL_BLUB] = "LIL_BLUB"
____exports.BossID.WORMWOOD = 76
____exports.BossID[____exports.BossID.WORMWOOD] = "WORMWOOD"
____exports.BossID.RAINMAKER = 77
____exports.BossID[____exports.BossID.RAINMAKER] = "RAINMAKER"
____exports.BossID.THE_VISAGE = 78
____exports.BossID[____exports.BossID.THE_VISAGE] = "THE_VISAGE"
____exports.BossID.THE_SIREN = 79
____exports.BossID[____exports.BossID.THE_SIREN] = "THE_SIREN"
____exports.BossID.TUFF_TWINS = 80
____exports.BossID[____exports.BossID.TUFF_TWINS] = "TUFF_TWINS"
____exports.BossID.THE_HERETIC = 81
____exports.BossID[____exports.BossID.THE_HERETIC] = "THE_HERETIC"
____exports.BossID.HORNFEL = 82
____exports.BossID[____exports.BossID.HORNFEL] = "HORNFEL"
____exports.BossID.GREAT_GIDEON = 83
____exports.BossID[____exports.BossID.GREAT_GIDEON] = "GREAT_GIDEON"
____exports.BossID.BABY_PLUM = 84
____exports.BossID[____exports.BossID.BABY_PLUM] = "BABY_PLUM"
____exports.BossID.THE_SCOURGE = 85
____exports.BossID[____exports.BossID.THE_SCOURGE] = "THE_SCOURGE"
____exports.BossID.CHIMERA = 86
____exports.BossID[____exports.BossID.CHIMERA] = "CHIMERA"
____exports.BossID.ROTGUT = 87
____exports.BossID[____exports.BossID.ROTGUT] = "ROTGUT"
____exports.BossID.MOTHER = 88
____exports.BossID[____exports.BossID.MOTHER] = "MOTHER"
____exports.BossID.MAUSOLEUM_MOM = 89
____exports.BossID[____exports.BossID.MAUSOLEUM_MOM] = "MAUSOLEUM_MOM"
____exports.BossID.MAUSOLEUM_MOMS_HEART = 90
____exports.BossID[____exports.BossID.MAUSOLEUM_MOMS_HEART] = "MAUSOLEUM_MOMS_HEART"
____exports.BossID.MIN_MIN = 91
____exports.BossID[____exports.BossID.MIN_MIN] = "MIN_MIN"
____exports.BossID.CLOG = 92
____exports.BossID[____exports.BossID.CLOG] = "CLOG"
____exports.BossID.SINGE = 93
____exports.BossID[____exports.BossID.SINGE] = "SINGE"
____exports.BossID.BUMBINO = 94
____exports.BossID[____exports.BossID.BUMBINO] = "BUMBINO"
____exports.BossID.COLOSTOMIA = 95
____exports.BossID[____exports.BossID.COLOSTOMIA] = "COLOSTOMIA"
____exports.BossID.THE_SHELL = 96
____exports.BossID[____exports.BossID.THE_SHELL] = "THE_SHELL"
____exports.BossID.TURDLET = 97
____exports.BossID[____exports.BossID.TURDLET] = "TURDLET"
____exports.BossID.RAGLICH = 98
____exports.BossID[____exports.BossID.RAGLICH] = "RAGLICH"
____exports.BossID.DOGMA = 99
____exports.BossID[____exports.BossID.DOGMA] = "DOGMA"
____exports.BossID.BEAST = 100
____exports.BossID[____exports.BossID.BEAST] = "BEAST"
____exports.BossID.HORNY_BOYS = 101
____exports.BossID[____exports.BossID.HORNY_BOYS] = "HORNY_BOYS"
____exports.BossID.CLUTCH = 102
____exports.BossID[____exports.BossID.CLUTCH] = "CLUTCH"
--- For `StageID.SPECIAL_ROOMS` (0), `RoomType.MINI_BOSS` (6).
-- 
-- This matches the sub-type in the "00.special rooms.stb" file.
-- 
-- The enum is named `MinibossID` instead of` MinibossRoomSubType` in order to match the `BossID`
-- enum.
____exports.MinibossID = {}
____exports.MinibossID.SLOTH = 0
____exports.MinibossID[____exports.MinibossID.SLOTH] = "SLOTH"
____exports.MinibossID.LUST = 1
____exports.MinibossID[____exports.MinibossID.LUST] = "LUST"
____exports.MinibossID.WRATH = 2
____exports.MinibossID[____exports.MinibossID.WRATH] = "WRATH"
____exports.MinibossID.GLUTTONY = 3
____exports.MinibossID[____exports.MinibossID.GLUTTONY] = "GLUTTONY"
____exports.MinibossID.GREED = 4
____exports.MinibossID[____exports.MinibossID.GREED] = "GREED"
____exports.MinibossID.ENVY = 5
____exports.MinibossID[____exports.MinibossID.ENVY] = "ENVY"
____exports.MinibossID.PRIDE = 6
____exports.MinibossID[____exports.MinibossID.PRIDE] = "PRIDE"
____exports.MinibossID.SUPER_SLOTH = 7
____exports.MinibossID[____exports.MinibossID.SUPER_SLOTH] = "SUPER_SLOTH"
____exports.MinibossID.SUPER_LUST = 8
____exports.MinibossID[____exports.MinibossID.SUPER_LUST] = "SUPER_LUST"
____exports.MinibossID.SUPER_WRATH = 9
____exports.MinibossID[____exports.MinibossID.SUPER_WRATH] = "SUPER_WRATH"
____exports.MinibossID.SUPER_GLUTTONY = 10
____exports.MinibossID[____exports.MinibossID.SUPER_GLUTTONY] = "SUPER_GLUTTONY"
____exports.MinibossID.SUPER_GREED = 11
____exports.MinibossID[____exports.MinibossID.SUPER_GREED] = "SUPER_GREED"
____exports.MinibossID.SUPER_ENVY = 12
____exports.MinibossID[____exports.MinibossID.SUPER_ENVY] = "SUPER_ENVY"
____exports.MinibossID.SUPER_PRIDE = 13
____exports.MinibossID[____exports.MinibossID.SUPER_PRIDE] = "SUPER_PRIDE"
____exports.MinibossID.ULTRA_PRIDE = 14
____exports.MinibossID[____exports.MinibossID.ULTRA_PRIDE] = "ULTRA_PRIDE"
____exports.MinibossID.KRAMPUS = 15
____exports.MinibossID[____exports.MinibossID.KRAMPUS] = "KRAMPUS"
--- For `StageID.SPECIAL_ROOMS` (0), `RoomType.CURSE` (10).
-- 
-- This matches the sub-type in the "00.special rooms.stb" file.
____exports.CurseRoomSubType = {}
____exports.CurseRoomSubType.NORMAL = 0
____exports.CurseRoomSubType[____exports.CurseRoomSubType.NORMAL] = "NORMAL"
____exports.CurseRoomSubType.VOODOO_HEAD = 1
____exports.CurseRoomSubType[____exports.CurseRoomSubType.VOODOO_HEAD] = "VOODOO_HEAD"
--- For `StageID.SPECIAL_ROOMS` (0), `RoomType.CHALLENGE` (11).
-- 
-- This matches the sub-type in the "00.special rooms.stb" file and elsewhere.
____exports.ChallengeRoomSubType = {}
____exports.ChallengeRoomSubType.NORMAL = 0
____exports.ChallengeRoomSubType[____exports.ChallengeRoomSubType.NORMAL] = "NORMAL"
____exports.ChallengeRoomSubType.BOSS = 1
____exports.ChallengeRoomSubType[____exports.ChallengeRoomSubType.BOSS] = "BOSS"
____exports.ChallengeRoomSubType.NORMAL_WAVE = 10
____exports.ChallengeRoomSubType[____exports.ChallengeRoomSubType.NORMAL_WAVE] = "NORMAL_WAVE"
____exports.ChallengeRoomSubType.BOSS_WAVE = 11
____exports.ChallengeRoomSubType[____exports.ChallengeRoomSubType.BOSS_WAVE] = "BOSS_WAVE"
____exports.ChallengeRoomSubType.GREAT_GIDEON_WAVE = 12
____exports.ChallengeRoomSubType[____exports.ChallengeRoomSubType.GREAT_GIDEON_WAVE] = "GREAT_GIDEON_WAVE"
--- For `StageID.SPECIAL_ROOMS` (0), `RoomType.LIBRARY` (12).
-- 
-- This matches the sub-type in the "00.special rooms.stb" file.
____exports.LibrarySubType = {}
____exports.LibrarySubType.LEVEL_1 = 0
____exports.LibrarySubType[____exports.LibrarySubType.LEVEL_1] = "LEVEL_1"
____exports.LibrarySubType.LEVEL_2 = 1
____exports.LibrarySubType[____exports.LibrarySubType.LEVEL_2] = "LEVEL_2"
____exports.LibrarySubType.LEVEL_3 = 2
____exports.LibrarySubType[____exports.LibrarySubType.LEVEL_3] = "LEVEL_3"
____exports.LibrarySubType.LEVEL_4 = 3
____exports.LibrarySubType[____exports.LibrarySubType.LEVEL_4] = "LEVEL_4"
____exports.LibrarySubType.LEVEL_5 = 4
____exports.LibrarySubType[____exports.LibrarySubType.LEVEL_5] = "LEVEL_5"
____exports.LibrarySubType.EXTRA_GOOD = 10
____exports.LibrarySubType[____exports.LibrarySubType.EXTRA_GOOD] = "EXTRA_GOOD"
____exports.LibrarySubType.EXTRA_BAD = 11
____exports.LibrarySubType[____exports.LibrarySubType.EXTRA_BAD] = "EXTRA_BAD"
____exports.LibrarySubType.TAINTED_KEEPER_LEVEL_1 = 100
____exports.LibrarySubType[____exports.LibrarySubType.TAINTED_KEEPER_LEVEL_1] = "TAINTED_KEEPER_LEVEL_1"
____exports.LibrarySubType.TAINTED_KEEPER_LEVEL_2 = 101
____exports.LibrarySubType[____exports.LibrarySubType.TAINTED_KEEPER_LEVEL_2] = "TAINTED_KEEPER_LEVEL_2"
____exports.LibrarySubType.TAINTED_KEEPER_LEVEL_3 = 102
____exports.LibrarySubType[____exports.LibrarySubType.TAINTED_KEEPER_LEVEL_3] = "TAINTED_KEEPER_LEVEL_3"
____exports.LibrarySubType.TAINTED_KEEPER_LEVEL_4 = 103
____exports.LibrarySubType[____exports.LibrarySubType.TAINTED_KEEPER_LEVEL_4] = "TAINTED_KEEPER_LEVEL_4"
____exports.LibrarySubType.TAINTED_KEEPER_LEVEL_5 = 104
____exports.LibrarySubType[____exports.LibrarySubType.TAINTED_KEEPER_LEVEL_5] = "TAINTED_KEEPER_LEVEL_5"
____exports.LibrarySubType.TAINTED_KEEPER_EXTRA_GOOD = 110
____exports.LibrarySubType[____exports.LibrarySubType.TAINTED_KEEPER_EXTRA_GOOD] = "TAINTED_KEEPER_EXTRA_GOOD"
____exports.LibrarySubType.TAINTED_KEEPER_EXTRA_BAD = 111
____exports.LibrarySubType[____exports.LibrarySubType.TAINTED_KEEPER_EXTRA_BAD] = "TAINTED_KEEPER_EXTRA_BAD"
--- For `StageID.SPECIAL_ROOMS` (0), `RoomType.DEVIL` (14).
-- 
-- This matches the sub-type in the "00.special rooms.stb" file.
____exports.DevilRoomSubType = {}
____exports.DevilRoomSubType.NORMAL = 0
____exports.DevilRoomSubType[____exports.DevilRoomSubType.NORMAL] = "NORMAL"
____exports.DevilRoomSubType.NUMBER_SIX_TRINKET = 1
____exports.DevilRoomSubType[____exports.DevilRoomSubType.NUMBER_SIX_TRINKET] = "NUMBER_SIX_TRINKET"
--- For `StageID.SPECIAL_ROOMS` (0), `RoomType.ANGEL` (15).
-- 
-- This matches the sub-type in the "00.special rooms.stb" file.
____exports.AngelRoomSubType = {}
____exports.AngelRoomSubType.NORMAL = 0
____exports.AngelRoomSubType[____exports.AngelRoomSubType.NORMAL] = "NORMAL"
____exports.AngelRoomSubType.SHOP = 1
____exports.AngelRoomSubType[____exports.AngelRoomSubType.SHOP] = "SHOP"
--- For `StageID.SPECIAL_ROOMS` (0), `RoomType.DUNGEON` (16).
-- 
-- This matches the sub-type in the "00.special rooms.stb" file and elsewhere.
____exports.DungeonSubType = {}
____exports.DungeonSubType.NORMAL = 0
____exports.DungeonSubType[____exports.DungeonSubType.NORMAL] = "NORMAL"
____exports.DungeonSubType.GIDEONS_GRAVE = 1
____exports.DungeonSubType[____exports.DungeonSubType.GIDEONS_GRAVE] = "GIDEONS_GRAVE"
____exports.DungeonSubType.ROTGUT_MAGGOT = 2
____exports.DungeonSubType[____exports.DungeonSubType.ROTGUT_MAGGOT] = "ROTGUT_MAGGOT"
____exports.DungeonSubType.ROTGUT_HEART = 3
____exports.DungeonSubType[____exports.DungeonSubType.ROTGUT_HEART] = "ROTGUT_HEART"
____exports.DungeonSubType.BEAST_ROOM = 4
____exports.DungeonSubType[____exports.DungeonSubType.BEAST_ROOM] = "BEAST_ROOM"
--- For `StageID.SPECIAL_ROOMS` (0), `RoomType.CLEAN_BEDROOM` (18).
-- 
-- This matches the sub-type in the "00.special rooms.stb" file.
____exports.IsaacsRoomSubType = {}
____exports.IsaacsRoomSubType.NORMAL = 0
____exports.IsaacsRoomSubType[____exports.IsaacsRoomSubType.NORMAL] = "NORMAL"
____exports.IsaacsRoomSubType.GENESIS = 99
____exports.IsaacsRoomSubType[____exports.IsaacsRoomSubType.GENESIS] = "GENESIS"
--- For `StageID.SPECIAL_ROOMS` (0), `RoomType.SECRET_EXIT` (27).
-- 
-- This matches the sub-type in the "00.special rooms.stb" file.
____exports.SecretExitSubType = {}
____exports.SecretExitSubType.DOWNPOUR = 1
____exports.SecretExitSubType[____exports.SecretExitSubType.DOWNPOUR] = "DOWNPOUR"
____exports.SecretExitSubType.MINES = 2
____exports.SecretExitSubType[____exports.SecretExitSubType.MINES] = "MINES"
____exports.SecretExitSubType.MAUSOLEUM = 3
____exports.SecretExitSubType[____exports.SecretExitSubType.MAUSOLEUM] = "MAUSOLEUM"
--- For `StageID.DOWNPOUR` (27) and `StageID.DROSS` (28), `RoomType.DEFAULT` (1).
-- 
-- This matches the sub-type in the "27.downpour.stb" and "28.dross.stb" files.
____exports.DownpourRoomSubType = {}
____exports.DownpourRoomSubType.NORMAL = 0
____exports.DownpourRoomSubType[____exports.DownpourRoomSubType.NORMAL] = "NORMAL"
____exports.DownpourRoomSubType.WHITE_FIRE = 1
____exports.DownpourRoomSubType[____exports.DownpourRoomSubType.WHITE_FIRE] = "WHITE_FIRE"
____exports.DownpourRoomSubType.MIRROR = 34
____exports.DownpourRoomSubType[____exports.DownpourRoomSubType.MIRROR] = "MIRROR"
--- For `StageID.MINES` (29) and `StageID.ASHPIT` (30), `RoomType.DEFAULT` (1).
-- 
-- This matches the sub-type in the "29.mines.stb" and "30.ashpit.stb" files.
____exports.MinesRoomSubType = {}
____exports.MinesRoomSubType.NORMAL = 0
____exports.MinesRoomSubType[____exports.MinesRoomSubType.NORMAL] = "NORMAL"
____exports.MinesRoomSubType.BUTTON_ROOM = 1
____exports.MinesRoomSubType[____exports.MinesRoomSubType.BUTTON_ROOM] = "BUTTON_ROOM"
____exports.MinesRoomSubType.MINESHAFT_ENTRANCE = 10
____exports.MinesRoomSubType[____exports.MinesRoomSubType.MINESHAFT_ENTRANCE] = "MINESHAFT_ENTRANCE"
____exports.MinesRoomSubType.MINESHAFT_LOBBY = 11
____exports.MinesRoomSubType[____exports.MinesRoomSubType.MINESHAFT_LOBBY] = "MINESHAFT_LOBBY"
____exports.MinesRoomSubType.MINESHAFT_KNIFE_PIECE = 20
____exports.MinesRoomSubType[____exports.MinesRoomSubType.MINESHAFT_KNIFE_PIECE] = "MINESHAFT_KNIFE_PIECE"
____exports.MinesRoomSubType.MINESHAFT_ROOM_PRE_CHASE = 30
____exports.MinesRoomSubType[____exports.MinesRoomSubType.MINESHAFT_ROOM_PRE_CHASE] = "MINESHAFT_ROOM_PRE_CHASE"
____exports.MinesRoomSubType.MINESHAFT_ROOM_POST_CHASE = 31
____exports.MinesRoomSubType[____exports.MinesRoomSubType.MINESHAFT_ROOM_POST_CHASE] = "MINESHAFT_ROOM_POST_CHASE"
--- For `StageID.HOME` (35), `RoomType.DEFAULT` (1).
-- 
-- This matches the sub-type in the "35.home.stb" file.
____exports.HomeRoomSubType = {}
____exports.HomeRoomSubType.ISAACS_BEDROOM = 0
____exports.HomeRoomSubType[____exports.HomeRoomSubType.ISAACS_BEDROOM] = "ISAACS_BEDROOM"
____exports.HomeRoomSubType.HALLWAY = 1
____exports.HomeRoomSubType[____exports.HomeRoomSubType.HALLWAY] = "HALLWAY"
____exports.HomeRoomSubType.MOMS_BEDROOM = 2
____exports.HomeRoomSubType[____exports.HomeRoomSubType.MOMS_BEDROOM] = "MOMS_BEDROOM"
____exports.HomeRoomSubType.LIVING_ROOM = 3
____exports.HomeRoomSubType[____exports.HomeRoomSubType.LIVING_ROOM] = "LIVING_ROOM"
____exports.HomeRoomSubType.CLOSET_RIGHT = 10
____exports.HomeRoomSubType[____exports.HomeRoomSubType.CLOSET_RIGHT] = "CLOSET_RIGHT"
____exports.HomeRoomSubType.CLOSET_LEFT = 11
____exports.HomeRoomSubType[____exports.HomeRoomSubType.CLOSET_LEFT] = "CLOSET_LEFT"
____exports.HomeRoomSubType.DEATH_CERTIFICATE_ENTRANCE = 33
____exports.HomeRoomSubType[____exports.HomeRoomSubType.DEATH_CERTIFICATE_ENTRANCE] = "DEATH_CERTIFICATE_ENTRANCE"
____exports.HomeRoomSubType.DEATH_CERTIFICATE_ITEMS = 34
____exports.HomeRoomSubType[____exports.HomeRoomSubType.DEATH_CERTIFICATE_ITEMS] = "DEATH_CERTIFICATE_ITEMS"
--- For `StageID.BACKWARDS` (36), `RoomType.DEFAULT` (1).
-- 
-- This matches the sub-type in the "36.backwards.stb" file.
____exports.BackwardsRoomSubType = {}
____exports.BackwardsRoomSubType.EXIT = 0
____exports.BackwardsRoomSubType[____exports.BackwardsRoomSubType.EXIT] = "EXIT"
____exports.BackwardsRoomSubType.BASEMENT = 1
____exports.BackwardsRoomSubType[____exports.BackwardsRoomSubType.BASEMENT] = "BASEMENT"
____exports.BackwardsRoomSubType.CAVES = 4
____exports.BackwardsRoomSubType[____exports.BackwardsRoomSubType.CAVES] = "CAVES"
____exports.BackwardsRoomSubType.DEPTHS = 7
____exports.BackwardsRoomSubType[____exports.BackwardsRoomSubType.DEPTHS] = "DEPTHS"
____exports.BackwardsRoomSubType.DOWNPOUR = 27
____exports.BackwardsRoomSubType[____exports.BackwardsRoomSubType.DOWNPOUR] = "DOWNPOUR"
____exports.BackwardsRoomSubType.MINES = 29
____exports.BackwardsRoomSubType[____exports.BackwardsRoomSubType.MINES] = "MINES"
____exports.BackwardsRoomSubType.MAUSOLEUM = 31
____exports.BackwardsRoomSubType[____exports.BackwardsRoomSubType.MAUSOLEUM] = "MAUSOLEUM"
return ____exports
 end,
["lua_modules.isaac-typescript-definitions.dist.src.enums.collections.subTypes"] = function(...) 
local ____exports = {}
--- For `EntityType.PLAYER` (1), `PlayerVariant.PLAYER` (0).
-- 
-- This is the sub-type of a player.
-- 
-- Conventionally, variables that have this type are represented as "character" instead of
-- "playerType", since the former is more descriptive of what this value actually represents.
____exports.PlayerType = {}
____exports.PlayerType.POSSESSOR = -1
____exports.PlayerType[____exports.PlayerType.POSSESSOR] = "POSSESSOR"
____exports.PlayerType.ISAAC = 0
____exports.PlayerType[____exports.PlayerType.ISAAC] = "ISAAC"
____exports.PlayerType.MAGDALENE = 1
____exports.PlayerType[____exports.PlayerType.MAGDALENE] = "MAGDALENE"
____exports.PlayerType.CAIN = 2
____exports.PlayerType[____exports.PlayerType.CAIN] = "CAIN"
____exports.PlayerType.JUDAS = 3
____exports.PlayerType[____exports.PlayerType.JUDAS] = "JUDAS"
____exports.PlayerType.BLUE_BABY = 4
____exports.PlayerType[____exports.PlayerType.BLUE_BABY] = "BLUE_BABY"
____exports.PlayerType.EVE = 5
____exports.PlayerType[____exports.PlayerType.EVE] = "EVE"
____exports.PlayerType.SAMSON = 6
____exports.PlayerType[____exports.PlayerType.SAMSON] = "SAMSON"
____exports.PlayerType.AZAZEL = 7
____exports.PlayerType[____exports.PlayerType.AZAZEL] = "AZAZEL"
____exports.PlayerType.LAZARUS = 8
____exports.PlayerType[____exports.PlayerType.LAZARUS] = "LAZARUS"
____exports.PlayerType.EDEN = 9
____exports.PlayerType[____exports.PlayerType.EDEN] = "EDEN"
____exports.PlayerType.LOST = 10
____exports.PlayerType[____exports.PlayerType.LOST] = "LOST"
____exports.PlayerType.LAZARUS_2 = 11
____exports.PlayerType[____exports.PlayerType.LAZARUS_2] = "LAZARUS_2"
____exports.PlayerType.DARK_JUDAS = 12
____exports.PlayerType[____exports.PlayerType.DARK_JUDAS] = "DARK_JUDAS"
____exports.PlayerType.LILITH = 13
____exports.PlayerType[____exports.PlayerType.LILITH] = "LILITH"
____exports.PlayerType.KEEPER = 14
____exports.PlayerType[____exports.PlayerType.KEEPER] = "KEEPER"
____exports.PlayerType.APOLLYON = 15
____exports.PlayerType[____exports.PlayerType.APOLLYON] = "APOLLYON"
____exports.PlayerType.FORGOTTEN = 16
____exports.PlayerType[____exports.PlayerType.FORGOTTEN] = "FORGOTTEN"
____exports.PlayerType.SOUL = 17
____exports.PlayerType[____exports.PlayerType.SOUL] = "SOUL"
____exports.PlayerType.BETHANY = 18
____exports.PlayerType[____exports.PlayerType.BETHANY] = "BETHANY"
____exports.PlayerType.JACOB = 19
____exports.PlayerType[____exports.PlayerType.JACOB] = "JACOB"
____exports.PlayerType.ESAU = 20
____exports.PlayerType[____exports.PlayerType.ESAU] = "ESAU"
____exports.PlayerType.ISAAC_B = 21
____exports.PlayerType[____exports.PlayerType.ISAAC_B] = "ISAAC_B"
____exports.PlayerType.MAGDALENE_B = 22
____exports.PlayerType[____exports.PlayerType.MAGDALENE_B] = "MAGDALENE_B"
____exports.PlayerType.CAIN_B = 23
____exports.PlayerType[____exports.PlayerType.CAIN_B] = "CAIN_B"
____exports.PlayerType.JUDAS_B = 24
____exports.PlayerType[____exports.PlayerType.JUDAS_B] = "JUDAS_B"
____exports.PlayerType.BLUE_BABY_B = 25
____exports.PlayerType[____exports.PlayerType.BLUE_BABY_B] = "BLUE_BABY_B"
____exports.PlayerType.EVE_B = 26
____exports.PlayerType[____exports.PlayerType.EVE_B] = "EVE_B"
____exports.PlayerType.SAMSON_B = 27
____exports.PlayerType[____exports.PlayerType.SAMSON_B] = "SAMSON_B"
____exports.PlayerType.AZAZEL_B = 28
____exports.PlayerType[____exports.PlayerType.AZAZEL_B] = "AZAZEL_B"
____exports.PlayerType.LAZARUS_B = 29
____exports.PlayerType[____exports.PlayerType.LAZARUS_B] = "LAZARUS_B"
____exports.PlayerType.EDEN_B = 30
____exports.PlayerType[____exports.PlayerType.EDEN_B] = "EDEN_B"
____exports.PlayerType.LOST_B = 31
____exports.PlayerType[____exports.PlayerType.LOST_B] = "LOST_B"
____exports.PlayerType.LILITH_B = 32
____exports.PlayerType[____exports.PlayerType.LILITH_B] = "LILITH_B"
____exports.PlayerType.KEEPER_B = 33
____exports.PlayerType[____exports.PlayerType.KEEPER_B] = "KEEPER_B"
____exports.PlayerType.APOLLYON_B = 34
____exports.PlayerType[____exports.PlayerType.APOLLYON_B] = "APOLLYON_B"
____exports.PlayerType.FORGOTTEN_B = 35
____exports.PlayerType[____exports.PlayerType.FORGOTTEN_B] = "FORGOTTEN_B"
____exports.PlayerType.BETHANY_B = 36
____exports.PlayerType[____exports.PlayerType.BETHANY_B] = "BETHANY_B"
____exports.PlayerType.JACOB_B = 37
____exports.PlayerType[____exports.PlayerType.JACOB_B] = "JACOB_B"
____exports.PlayerType.LAZARUS_2_B = 38
____exports.PlayerType[____exports.PlayerType.LAZARUS_2_B] = "LAZARUS_2_B"
____exports.PlayerType.JACOB_2_B = 39
____exports.PlayerType[____exports.PlayerType.JACOB_2_B] = "JACOB_2_B"
____exports.PlayerType.SOUL_B = 40
____exports.PlayerType[____exports.PlayerType.SOUL_B] = "SOUL_B"
--- For `EntityType.PLAYER` (1), `PlayerVariant.COOP_BABY` (1).
____exports.BabySubType = {}
____exports.BabySubType.UNASSIGNED = -1
____exports.BabySubType[____exports.BabySubType.UNASSIGNED] = "UNASSIGNED"
____exports.BabySubType.SPIDER = 0
____exports.BabySubType[____exports.BabySubType.SPIDER] = "SPIDER"
____exports.BabySubType.LOVE = 1
____exports.BabySubType[____exports.BabySubType.LOVE] = "LOVE"
____exports.BabySubType.BLOAT = 2
____exports.BabySubType[____exports.BabySubType.BLOAT] = "BLOAT"
____exports.BabySubType.WATER = 3
____exports.BabySubType[____exports.BabySubType.WATER] = "WATER"
____exports.BabySubType.PSY = 4
____exports.BabySubType[____exports.BabySubType.PSY] = "PSY"
____exports.BabySubType.CURSED = 5
____exports.BabySubType[____exports.BabySubType.CURSED] = "CURSED"
____exports.BabySubType.TROLL = 6
____exports.BabySubType[____exports.BabySubType.TROLL] = "TROLL"
____exports.BabySubType.YBAB = 7
____exports.BabySubType[____exports.BabySubType.YBAB] = "YBAB"
____exports.BabySubType.COCKEYED = 8
____exports.BabySubType[____exports.BabySubType.COCKEYED] = "COCKEYED"
____exports.BabySubType.HOST = 9
____exports.BabySubType[____exports.BabySubType.HOST] = "HOST"
____exports.BabySubType.LOST = 10
____exports.BabySubType[____exports.BabySubType.LOST] = "LOST"
____exports.BabySubType.CUTE = 11
____exports.BabySubType[____exports.BabySubType.CUTE] = "CUTE"
____exports.BabySubType.CROW = 12
____exports.BabySubType[____exports.BabySubType.CROW] = "CROW"
____exports.BabySubType.SHADOW = 13
____exports.BabySubType[____exports.BabySubType.SHADOW] = "SHADOW"
____exports.BabySubType.GLASS = 14
____exports.BabySubType[____exports.BabySubType.GLASS] = "GLASS"
____exports.BabySubType.GOLD = 15
____exports.BabySubType[____exports.BabySubType.GOLD] = "GOLD"
____exports.BabySubType.CY = 16
____exports.BabySubType[____exports.BabySubType.CY] = "CY"
____exports.BabySubType.BEAN = 17
____exports.BabySubType[____exports.BabySubType.BEAN] = "BEAN"
____exports.BabySubType.MAG = 18
____exports.BabySubType[____exports.BabySubType.MAG] = "MAG"
____exports.BabySubType.WRATH = 19
____exports.BabySubType[____exports.BabySubType.WRATH] = "WRATH"
____exports.BabySubType.WRAPPED = 20
____exports.BabySubType[____exports.BabySubType.WRAPPED] = "WRAPPED"
____exports.BabySubType.BEGOTTEN = 21
____exports.BabySubType[____exports.BabySubType.BEGOTTEN] = "BEGOTTEN"
____exports.BabySubType.DEAD = 22
____exports.BabySubType[____exports.BabySubType.DEAD] = "DEAD"
____exports.BabySubType.FIGHTING = 23
____exports.BabySubType[____exports.BabySubType.FIGHTING] = "FIGHTING"
____exports.BabySubType.ZERO = 24
____exports.BabySubType[____exports.BabySubType.ZERO] = "ZERO"
____exports.BabySubType.GLITCH = 25
____exports.BabySubType[____exports.BabySubType.GLITCH] = "GLITCH"
____exports.BabySubType.MAGNET = 26
____exports.BabySubType[____exports.BabySubType.MAGNET] = "MAGNET"
____exports.BabySubType.BLACK = 27
____exports.BabySubType[____exports.BabySubType.BLACK] = "BLACK"
____exports.BabySubType.RED = 28
____exports.BabySubType[____exports.BabySubType.RED] = "RED"
____exports.BabySubType.WHITE = 29
____exports.BabySubType[____exports.BabySubType.WHITE] = "WHITE"
____exports.BabySubType.BLUE = 30
____exports.BabySubType[____exports.BabySubType.BLUE] = "BLUE"
____exports.BabySubType.RAGE = 31
____exports.BabySubType[____exports.BabySubType.RAGE] = "RAGE"
____exports.BabySubType.CRY = 32
____exports.BabySubType[____exports.BabySubType.CRY] = "CRY"
____exports.BabySubType.YELLOW = 33
____exports.BabySubType[____exports.BabySubType.YELLOW] = "YELLOW"
____exports.BabySubType.LONG = 34
____exports.BabySubType[____exports.BabySubType.LONG] = "LONG"
____exports.BabySubType.GREEN = 35
____exports.BabySubType[____exports.BabySubType.GREEN] = "GREEN"
____exports.BabySubType.LIL = 36
____exports.BabySubType[____exports.BabySubType.LIL] = "LIL"
____exports.BabySubType.BIG = 37
____exports.BabySubType[____exports.BabySubType.BIG] = "BIG"
____exports.BabySubType.BROWN = 38
____exports.BabySubType[____exports.BabySubType.BROWN] = "BROWN"
____exports.BabySubType.NOOSE = 39
____exports.BabySubType[____exports.BabySubType.NOOSE] = "NOOSE"
____exports.BabySubType.HIVE = 40
____exports.BabySubType[____exports.BabySubType.HIVE] = "HIVE"
____exports.BabySubType.BUDDY = 41
____exports.BabySubType[____exports.BabySubType.BUDDY] = "BUDDY"
____exports.BabySubType.COLORFUL = 42
____exports.BabySubType[____exports.BabySubType.COLORFUL] = "COLORFUL"
____exports.BabySubType.WHORE = 43
____exports.BabySubType[____exports.BabySubType.WHORE] = "WHORE"
____exports.BabySubType.CRACKED = 44
____exports.BabySubType[____exports.BabySubType.CRACKED] = "CRACKED"
____exports.BabySubType.DRIPPING = 45
____exports.BabySubType[____exports.BabySubType.DRIPPING] = "DRIPPING"
____exports.BabySubType.BLINDING = 46
____exports.BabySubType[____exports.BabySubType.BLINDING] = "BLINDING"
____exports.BabySubType.SUCKY = 47
____exports.BabySubType[____exports.BabySubType.SUCKY] = "SUCKY"
____exports.BabySubType.DARK = 48
____exports.BabySubType[____exports.BabySubType.DARK] = "DARK"
____exports.BabySubType.PICKY = 49
____exports.BabySubType[____exports.BabySubType.PICKY] = "PICKY"
____exports.BabySubType.REVENGE = 50
____exports.BabySubType[____exports.BabySubType.REVENGE] = "REVENGE"
____exports.BabySubType.BELIAL = 51
____exports.BabySubType[____exports.BabySubType.BELIAL] = "BELIAL"
____exports.BabySubType.SALE = 52
____exports.BabySubType[____exports.BabySubType.SALE] = "SALE"
____exports.BabySubType.GOAT = 53
____exports.BabySubType[____exports.BabySubType.GOAT] = "GOAT"
____exports.BabySubType.SUPER_GREED = 54
____exports.BabySubType[____exports.BabySubType.SUPER_GREED] = "SUPER_GREED"
____exports.BabySubType.MORT = 55
____exports.BabySubType[____exports.BabySubType.MORT] = "MORT"
____exports.BabySubType.APOLLYON = 56
____exports.BabySubType[____exports.BabySubType.APOLLYON] = "APOLLYON"
____exports.BabySubType.BONE = 57
____exports.BabySubType[____exports.BabySubType.BONE] = "BONE"
____exports.BabySubType.BOUND = 58
____exports.BabySubType[____exports.BabySubType.BOUND] = "BOUND"
____exports.BabySubType.FOUND_SOUL = 59
____exports.BabySubType[____exports.BabySubType.FOUND_SOUL] = "FOUND_SOUL"
____exports.BabySubType.LOST_WHITE = 60
____exports.BabySubType[____exports.BabySubType.LOST_WHITE] = "LOST_WHITE"
____exports.BabySubType.LOST_BLACK = 61
____exports.BabySubType[____exports.BabySubType.LOST_BLACK] = "LOST_BLACK"
____exports.BabySubType.LOST_BLUE = 62
____exports.BabySubType[____exports.BabySubType.LOST_BLUE] = "LOST_BLUE"
____exports.BabySubType.LOST_GREY = 63
____exports.BabySubType[____exports.BabySubType.LOST_GREY] = "LOST_GREY"
____exports.BabySubType.WISP = 64
____exports.BabySubType[____exports.BabySubType.WISP] = "WISP"
____exports.BabySubType.DOUBLE = 65
____exports.BabySubType[____exports.BabySubType.DOUBLE] = "DOUBLE"
____exports.BabySubType.GLOWING = 66
____exports.BabySubType[____exports.BabySubType.GLOWING] = "GLOWING"
____exports.BabySubType.ILLUSION = 67
____exports.BabySubType[____exports.BabySubType.ILLUSION] = "ILLUSION"
____exports.BabySubType.HOPE = 68
____exports.BabySubType[____exports.BabySubType.HOPE] = "HOPE"
____exports.BabySubType.SOLOMON_A = 69
____exports.BabySubType[____exports.BabySubType.SOLOMON_A] = "SOLOMON_A"
____exports.BabySubType.SOLOMON_B = 70
____exports.BabySubType[____exports.BabySubType.SOLOMON_B] = "SOLOMON_B"
____exports.BabySubType.BASIC = 71
____exports.BabySubType[____exports.BabySubType.BASIC] = "BASIC"
--- For `EntityType.FAMILIAR` (3), `FamiliarVariant.BLUE_FLY` (43).
____exports.BlueFlySubType = {}
____exports.BlueFlySubType.BLUE_FLY = 0
____exports.BlueFlySubType[____exports.BlueFlySubType.BLUE_FLY] = "BLUE_FLY"
____exports.BlueFlySubType.WRATH = 1
____exports.BlueFlySubType[____exports.BlueFlySubType.WRATH] = "WRATH"
____exports.BlueFlySubType.PESTILENCE = 2
____exports.BlueFlySubType[____exports.BlueFlySubType.PESTILENCE] = "PESTILENCE"
____exports.BlueFlySubType.FAMINE = 3
____exports.BlueFlySubType[____exports.BlueFlySubType.FAMINE] = "FAMINE"
____exports.BlueFlySubType.DEATH = 4
____exports.BlueFlySubType[____exports.BlueFlySubType.DEATH] = "DEATH"
____exports.BlueFlySubType.CONQUEST = 5
____exports.BlueFlySubType[____exports.BlueFlySubType.CONQUEST] = "CONQUEST"
--- For `EntityType.FAMILIAR` (3), `FamiliarVariant.DIP` (201).
____exports.DipFamiliarSubType = {}
____exports.DipFamiliarSubType.NORMAL = 0
____exports.DipFamiliarSubType[____exports.DipFamiliarSubType.NORMAL] = "NORMAL"
____exports.DipFamiliarSubType.RED = 1
____exports.DipFamiliarSubType[____exports.DipFamiliarSubType.RED] = "RED"
____exports.DipFamiliarSubType.CORNY = 2
____exports.DipFamiliarSubType[____exports.DipFamiliarSubType.CORNY] = "CORNY"
____exports.DipFamiliarSubType.GOLD = 3
____exports.DipFamiliarSubType[____exports.DipFamiliarSubType.GOLD] = "GOLD"
____exports.DipFamiliarSubType.RAINBOW = 4
____exports.DipFamiliarSubType[____exports.DipFamiliarSubType.RAINBOW] = "RAINBOW"
____exports.DipFamiliarSubType.BLACK = 5
____exports.DipFamiliarSubType[____exports.DipFamiliarSubType.BLACK] = "BLACK"
____exports.DipFamiliarSubType.WHITE = 6
____exports.DipFamiliarSubType[____exports.DipFamiliarSubType.WHITE] = "WHITE"
____exports.DipFamiliarSubType.STONE = 12
____exports.DipFamiliarSubType[____exports.DipFamiliarSubType.STONE] = "STONE"
____exports.DipFamiliarSubType.FLAMING = 13
____exports.DipFamiliarSubType[____exports.DipFamiliarSubType.FLAMING] = "FLAMING"
____exports.DipFamiliarSubType.STINKY = 14
____exports.DipFamiliarSubType[____exports.DipFamiliarSubType.STINKY] = "STINKY"
____exports.DipFamiliarSubType.BROWNIE = 20
____exports.DipFamiliarSubType[____exports.DipFamiliarSubType.BROWNIE] = "BROWNIE"
--- For `EntityType.FAMILIAR` (3), `FamiliarVariant.BLOOD_BABY` (238).
____exports.BloodClotSubType = {}
____exports.BloodClotSubType.RED = 0
____exports.BloodClotSubType[____exports.BloodClotSubType.RED] = "RED"
____exports.BloodClotSubType.SOUL = 1
____exports.BloodClotSubType[____exports.BloodClotSubType.SOUL] = "SOUL"
____exports.BloodClotSubType.BLACK = 2
____exports.BloodClotSubType[____exports.BloodClotSubType.BLACK] = "BLACK"
____exports.BloodClotSubType.ETERNAL = 3
____exports.BloodClotSubType[____exports.BloodClotSubType.ETERNAL] = "ETERNAL"
____exports.BloodClotSubType.GOLD = 4
____exports.BloodClotSubType[____exports.BloodClotSubType.GOLD] = "GOLD"
____exports.BloodClotSubType.BONE = 5
____exports.BloodClotSubType[____exports.BloodClotSubType.BONE] = "BONE"
____exports.BloodClotSubType.ROTTEN = 6
____exports.BloodClotSubType[____exports.BloodClotSubType.ROTTEN] = "ROTTEN"
____exports.BloodClotSubType.RED_NO_SUMPTORIUM = 7
____exports.BloodClotSubType[____exports.BloodClotSubType.RED_NO_SUMPTORIUM] = "RED_NO_SUMPTORIUM"
--- For `EntityType.PICKUP` (5), `PickupVariant.NULL` (0).
____exports.PickupNullSubType = {}
____exports.PickupNullSubType.ALL = 0
____exports.PickupNullSubType[____exports.PickupNullSubType.ALL] = "ALL"
____exports.PickupNullSubType.EXCLUDE_COLLECTIBLES_CHESTS = 1
____exports.PickupNullSubType[____exports.PickupNullSubType.EXCLUDE_COLLECTIBLES_CHESTS] = "EXCLUDE_COLLECTIBLES_CHESTS"
____exports.PickupNullSubType.EXCLUDE_COLLECTIBLES = 2
____exports.PickupNullSubType[____exports.PickupNullSubType.EXCLUDE_COLLECTIBLES] = "EXCLUDE_COLLECTIBLES"
____exports.PickupNullSubType.EXCLUDE_COLLECTIBLES_CHESTS_COINS = 3
____exports.PickupNullSubType[____exports.PickupNullSubType.EXCLUDE_COLLECTIBLES_CHESTS_COINS] = "EXCLUDE_COLLECTIBLES_CHESTS_COINS"
____exports.PickupNullSubType.EXCLUDE_COLLECTIBLES_TRINKETS_CHESTS = 4
____exports.PickupNullSubType[____exports.PickupNullSubType.EXCLUDE_COLLECTIBLES_TRINKETS_CHESTS] = "EXCLUDE_COLLECTIBLES_TRINKETS_CHESTS"
--- For `EntityType.PICKUP` (5), `PickupVariant.HEART` (10).
____exports.HeartSubType = {}
____exports.HeartSubType.NULL = 0
____exports.HeartSubType[____exports.HeartSubType.NULL] = "NULL"
____exports.HeartSubType.FULL = 1
____exports.HeartSubType[____exports.HeartSubType.FULL] = "FULL"
____exports.HeartSubType.HALF = 2
____exports.HeartSubType[____exports.HeartSubType.HALF] = "HALF"
____exports.HeartSubType.SOUL = 3
____exports.HeartSubType[____exports.HeartSubType.SOUL] = "SOUL"
____exports.HeartSubType.ETERNAL = 4
____exports.HeartSubType[____exports.HeartSubType.ETERNAL] = "ETERNAL"
____exports.HeartSubType.DOUBLE_PACK = 5
____exports.HeartSubType[____exports.HeartSubType.DOUBLE_PACK] = "DOUBLE_PACK"
____exports.HeartSubType.BLACK = 6
____exports.HeartSubType[____exports.HeartSubType.BLACK] = "BLACK"
____exports.HeartSubType.GOLDEN = 7
____exports.HeartSubType[____exports.HeartSubType.GOLDEN] = "GOLDEN"
____exports.HeartSubType.HALF_SOUL = 8
____exports.HeartSubType[____exports.HeartSubType.HALF_SOUL] = "HALF_SOUL"
____exports.HeartSubType.SCARED = 9
____exports.HeartSubType[____exports.HeartSubType.SCARED] = "SCARED"
____exports.HeartSubType.BLENDED = 10
____exports.HeartSubType[____exports.HeartSubType.BLENDED] = "BLENDED"
____exports.HeartSubType.BONE = 11
____exports.HeartSubType[____exports.HeartSubType.BONE] = "BONE"
____exports.HeartSubType.ROTTEN = 12
____exports.HeartSubType[____exports.HeartSubType.ROTTEN] = "ROTTEN"
--- For `EntityType.PICKUP` (5), `PickupVariant.COIN` (20).
____exports.CoinSubType = {}
____exports.CoinSubType.NULL = 0
____exports.CoinSubType[____exports.CoinSubType.NULL] = "NULL"
____exports.CoinSubType.PENNY = 1
____exports.CoinSubType[____exports.CoinSubType.PENNY] = "PENNY"
____exports.CoinSubType.NICKEL = 2
____exports.CoinSubType[____exports.CoinSubType.NICKEL] = "NICKEL"
____exports.CoinSubType.DIME = 3
____exports.CoinSubType[____exports.CoinSubType.DIME] = "DIME"
____exports.CoinSubType.DOUBLE_PACK = 4
____exports.CoinSubType[____exports.CoinSubType.DOUBLE_PACK] = "DOUBLE_PACK"
____exports.CoinSubType.LUCKY_PENNY = 5
____exports.CoinSubType[____exports.CoinSubType.LUCKY_PENNY] = "LUCKY_PENNY"
____exports.CoinSubType.STICKY_NICKEL = 6
____exports.CoinSubType[____exports.CoinSubType.STICKY_NICKEL] = "STICKY_NICKEL"
____exports.CoinSubType.GOLDEN = 7
____exports.CoinSubType[____exports.CoinSubType.GOLDEN] = "GOLDEN"
--- For `EntityType.PICKUP` (5), `PickupVariant.KEY` (30).
____exports.KeySubType = {}
____exports.KeySubType.NULL = 0
____exports.KeySubType[____exports.KeySubType.NULL] = "NULL"
____exports.KeySubType.NORMAL = 1
____exports.KeySubType[____exports.KeySubType.NORMAL] = "NORMAL"
____exports.KeySubType.GOLDEN = 2
____exports.KeySubType[____exports.KeySubType.GOLDEN] = "GOLDEN"
____exports.KeySubType.DOUBLE_PACK = 3
____exports.KeySubType[____exports.KeySubType.DOUBLE_PACK] = "DOUBLE_PACK"
____exports.KeySubType.CHARGED = 4
____exports.KeySubType[____exports.KeySubType.CHARGED] = "CHARGED"
--- For `EntityType.PICKUP` (5), `PickupVariant.BOMB` (40).
____exports.BombSubType = {}
____exports.BombSubType.NULL = 0
____exports.BombSubType[____exports.BombSubType.NULL] = "NULL"
____exports.BombSubType.NORMAL = 1
____exports.BombSubType[____exports.BombSubType.NORMAL] = "NORMAL"
____exports.BombSubType.DOUBLE_PACK = 2
____exports.BombSubType[____exports.BombSubType.DOUBLE_PACK] = "DOUBLE_PACK"
____exports.BombSubType.TROLL = 3
____exports.BombSubType[____exports.BombSubType.TROLL] = "TROLL"
____exports.BombSubType.GOLDEN = 4
____exports.BombSubType[____exports.BombSubType.GOLDEN] = "GOLDEN"
____exports.BombSubType.MEGA_TROLL = 5
____exports.BombSubType[____exports.BombSubType.MEGA_TROLL] = "MEGA_TROLL"
____exports.BombSubType.GOLDEN_TROLL = 6
____exports.BombSubType[____exports.BombSubType.GOLDEN_TROLL] = "GOLDEN_TROLL"
____exports.BombSubType.GIGA = 7
____exports.BombSubType[____exports.BombSubType.GIGA] = "GIGA"
--- For `EntityType.PICKUP` (5), `PickupVariant.POOP` (42).
____exports.PoopPickupSubType = {}
____exports.PoopPickupSubType.SMALL = 0
____exports.PoopPickupSubType[____exports.PoopPickupSubType.SMALL] = "SMALL"
____exports.PoopPickupSubType.BIG = 1
____exports.PoopPickupSubType[____exports.PoopPickupSubType.BIG] = "BIG"
--- For `EntityType.PICKUP` (5), `PickupVariant.CHEST` (50).
____exports.ChestSubType = {}
____exports.ChestSubType.OPENED = 0
____exports.ChestSubType[____exports.ChestSubType.OPENED] = "OPENED"
____exports.ChestSubType.CLOSED = 1
____exports.ChestSubType[____exports.ChestSubType.CLOSED] = "CLOSED"
--- For `EntityType.PICKUP` (5), `PickupVariant.SACK` (69).
____exports.SackSubType = {}
____exports.SackSubType.NULL = 0
____exports.SackSubType[____exports.SackSubType.NULL] = "NULL"
____exports.SackSubType.NORMAL = 1
____exports.SackSubType[____exports.SackSubType.NORMAL] = "NORMAL"
____exports.SackSubType.BLACK = 2
____exports.SackSubType[____exports.SackSubType.BLACK] = "BLACK"
--- For `EntityType.PICKUP` (5), `PickupVariant.PILL` (70).
-- 
-- This is the sub-type of a pill.
____exports.PillColor = {}
____exports.PillColor.NULL = 0
____exports.PillColor[____exports.PillColor.NULL] = "NULL"
____exports.PillColor.BLUE_BLUE = 1
____exports.PillColor[____exports.PillColor.BLUE_BLUE] = "BLUE_BLUE"
____exports.PillColor.WHITE_BLUE = 2
____exports.PillColor[____exports.PillColor.WHITE_BLUE] = "WHITE_BLUE"
____exports.PillColor.ORANGE_ORANGE = 3
____exports.PillColor[____exports.PillColor.ORANGE_ORANGE] = "ORANGE_ORANGE"
____exports.PillColor.WHITE_WHITE = 4
____exports.PillColor[____exports.PillColor.WHITE_WHITE] = "WHITE_WHITE"
____exports.PillColor.RED_DOTS_RED = 5
____exports.PillColor[____exports.PillColor.RED_DOTS_RED] = "RED_DOTS_RED"
____exports.PillColor.PINK_RED = 6
____exports.PillColor[____exports.PillColor.PINK_RED] = "PINK_RED"
____exports.PillColor.BLUE_CADET_BLUE = 7
____exports.PillColor[____exports.PillColor.BLUE_CADET_BLUE] = "BLUE_CADET_BLUE"
____exports.PillColor.YELLOW_ORANGE = 8
____exports.PillColor[____exports.PillColor.YELLOW_ORANGE] = "YELLOW_ORANGE"
____exports.PillColor.ORANGE_DOTS_WHITE = 9
____exports.PillColor[____exports.PillColor.ORANGE_DOTS_WHITE] = "ORANGE_DOTS_WHITE"
____exports.PillColor.WHITE_AZURE = 10
____exports.PillColor[____exports.PillColor.WHITE_AZURE] = "WHITE_AZURE"
____exports.PillColor.BLACK_YELLOW = 11
____exports.PillColor[____exports.PillColor.BLACK_YELLOW] = "BLACK_YELLOW"
____exports.PillColor.WHITE_BLACK = 12
____exports.PillColor[____exports.PillColor.WHITE_BLACK] = "WHITE_BLACK"
____exports.PillColor.WHITE_YELLOW = 13
____exports.PillColor[____exports.PillColor.WHITE_YELLOW] = "WHITE_YELLOW"
____exports.PillColor.GOLD = 14
____exports.PillColor[____exports.PillColor.GOLD] = "GOLD"
____exports.PillColor.HORSE_BLUE_BLUE = 2049
____exports.PillColor[____exports.PillColor.HORSE_BLUE_BLUE] = "HORSE_BLUE_BLUE"
____exports.PillColor.HORSE_WHITE_BLUE = 2050
____exports.PillColor[____exports.PillColor.HORSE_WHITE_BLUE] = "HORSE_WHITE_BLUE"
____exports.PillColor.HORSE_ORANGE_ORANGE = 2051
____exports.PillColor[____exports.PillColor.HORSE_ORANGE_ORANGE] = "HORSE_ORANGE_ORANGE"
____exports.PillColor.HORSE_WHITE_WHITE = 2052
____exports.PillColor[____exports.PillColor.HORSE_WHITE_WHITE] = "HORSE_WHITE_WHITE"
____exports.PillColor.HORSE_RED_DOTS_RED = 2053
____exports.PillColor[____exports.PillColor.HORSE_RED_DOTS_RED] = "HORSE_RED_DOTS_RED"
____exports.PillColor.HORSE_PINK_RED = 2054
____exports.PillColor[____exports.PillColor.HORSE_PINK_RED] = "HORSE_PINK_RED"
____exports.PillColor.HORSE_BLUE_CADET_BLUE = 2055
____exports.PillColor[____exports.PillColor.HORSE_BLUE_CADET_BLUE] = "HORSE_BLUE_CADET_BLUE"
____exports.PillColor.HORSE_YELLOW_ORANGE = 2056
____exports.PillColor[____exports.PillColor.HORSE_YELLOW_ORANGE] = "HORSE_YELLOW_ORANGE"
____exports.PillColor.HORSE_ORANGE_DOTS_WHITE = 2057
____exports.PillColor[____exports.PillColor.HORSE_ORANGE_DOTS_WHITE] = "HORSE_ORANGE_DOTS_WHITE"
____exports.PillColor.HORSE_WHITE_AZURE = 2058
____exports.PillColor[____exports.PillColor.HORSE_WHITE_AZURE] = "HORSE_WHITE_AZURE"
____exports.PillColor.HORSE_BLACK_YELLOW = 2059
____exports.PillColor[____exports.PillColor.HORSE_BLACK_YELLOW] = "HORSE_BLACK_YELLOW"
____exports.PillColor.HORSE_WHITE_BLACK = 2060
____exports.PillColor[____exports.PillColor.HORSE_WHITE_BLACK] = "HORSE_WHITE_BLACK"
____exports.PillColor.HORSE_WHITE_YELLOW = 2061
____exports.PillColor[____exports.PillColor.HORSE_WHITE_YELLOW] = "HORSE_WHITE_YELLOW"
____exports.PillColor.HORSE_GOLD = 2062
____exports.PillColor[____exports.PillColor.HORSE_GOLD] = "HORSE_GOLD"
--- For `EntityType.PICKUP` (5), `PickupVariant.LIL_BATTERY` (90).
____exports.BatterySubType = {}
____exports.BatterySubType.NULL = 0
____exports.BatterySubType[____exports.BatterySubType.NULL] = "NULL"
____exports.BatterySubType.NORMAL = 1
____exports.BatterySubType[____exports.BatterySubType.NORMAL] = "NORMAL"
____exports.BatterySubType.MICRO = 2
____exports.BatterySubType[____exports.BatterySubType.MICRO] = "MICRO"
____exports.BatterySubType.MEGA = 3
____exports.BatterySubType[____exports.BatterySubType.MEGA] = "MEGA"
____exports.BatterySubType.GOLDEN = 4
____exports.BatterySubType[____exports.BatterySubType.GOLDEN] = "GOLDEN"
--- For `EntityType.PICKUP` (5), `PickupVariant.COLLECTIBLE` (100).
-- 
-- This is the sub-type of a collectible.
____exports.CollectibleType = {}
____exports.CollectibleType.NULL = 0
____exports.CollectibleType[____exports.CollectibleType.NULL] = "NULL"
____exports.CollectibleType.SAD_ONION = 1
____exports.CollectibleType[____exports.CollectibleType.SAD_ONION] = "SAD_ONION"
____exports.CollectibleType.INNER_EYE = 2
____exports.CollectibleType[____exports.CollectibleType.INNER_EYE] = "INNER_EYE"
____exports.CollectibleType.SPOON_BENDER = 3
____exports.CollectibleType[____exports.CollectibleType.SPOON_BENDER] = "SPOON_BENDER"
____exports.CollectibleType.CRICKETS_HEAD = 4
____exports.CollectibleType[____exports.CollectibleType.CRICKETS_HEAD] = "CRICKETS_HEAD"
____exports.CollectibleType.MY_REFLECTION = 5
____exports.CollectibleType[____exports.CollectibleType.MY_REFLECTION] = "MY_REFLECTION"
____exports.CollectibleType.NUMBER_ONE = 6
____exports.CollectibleType[____exports.CollectibleType.NUMBER_ONE] = "NUMBER_ONE"
____exports.CollectibleType.BLOOD_OF_THE_MARTYR = 7
____exports.CollectibleType[____exports.CollectibleType.BLOOD_OF_THE_MARTYR] = "BLOOD_OF_THE_MARTYR"
____exports.CollectibleType.BROTHER_BOBBY = 8
____exports.CollectibleType[____exports.CollectibleType.BROTHER_BOBBY] = "BROTHER_BOBBY"
____exports.CollectibleType.SKATOLE = 9
____exports.CollectibleType[____exports.CollectibleType.SKATOLE] = "SKATOLE"
____exports.CollectibleType.HALO_OF_FLIES = 10
____exports.CollectibleType[____exports.CollectibleType.HALO_OF_FLIES] = "HALO_OF_FLIES"
____exports.CollectibleType.ONE_UP = 11
____exports.CollectibleType[____exports.CollectibleType.ONE_UP] = "ONE_UP"
____exports.CollectibleType.MAGIC_MUSHROOM = 12
____exports.CollectibleType[____exports.CollectibleType.MAGIC_MUSHROOM] = "MAGIC_MUSHROOM"
____exports.CollectibleType.VIRUS = 13
____exports.CollectibleType[____exports.CollectibleType.VIRUS] = "VIRUS"
____exports.CollectibleType.ROID_RAGE = 14
____exports.CollectibleType[____exports.CollectibleType.ROID_RAGE] = "ROID_RAGE"
____exports.CollectibleType.HEART = 15
____exports.CollectibleType[____exports.CollectibleType.HEART] = "HEART"
____exports.CollectibleType.RAW_LIVER = 16
____exports.CollectibleType[____exports.CollectibleType.RAW_LIVER] = "RAW_LIVER"
____exports.CollectibleType.SKELETON_KEY = 17
____exports.CollectibleType[____exports.CollectibleType.SKELETON_KEY] = "SKELETON_KEY"
____exports.CollectibleType.DOLLAR = 18
____exports.CollectibleType[____exports.CollectibleType.DOLLAR] = "DOLLAR"
____exports.CollectibleType.BOOM = 19
____exports.CollectibleType[____exports.CollectibleType.BOOM] = "BOOM"
____exports.CollectibleType.TRANSCENDENCE = 20
____exports.CollectibleType[____exports.CollectibleType.TRANSCENDENCE] = "TRANSCENDENCE"
____exports.CollectibleType.COMPASS = 21
____exports.CollectibleType[____exports.CollectibleType.COMPASS] = "COMPASS"
____exports.CollectibleType.LUNCH = 22
____exports.CollectibleType[____exports.CollectibleType.LUNCH] = "LUNCH"
____exports.CollectibleType.DINNER = 23
____exports.CollectibleType[____exports.CollectibleType.DINNER] = "DINNER"
____exports.CollectibleType.DESSERT = 24
____exports.CollectibleType[____exports.CollectibleType.DESSERT] = "DESSERT"
____exports.CollectibleType.BREAKFAST = 25
____exports.CollectibleType[____exports.CollectibleType.BREAKFAST] = "BREAKFAST"
____exports.CollectibleType.ROTTEN_MEAT = 26
____exports.CollectibleType[____exports.CollectibleType.ROTTEN_MEAT] = "ROTTEN_MEAT"
____exports.CollectibleType.WOODEN_SPOON = 27
____exports.CollectibleType[____exports.CollectibleType.WOODEN_SPOON] = "WOODEN_SPOON"
____exports.CollectibleType.BELT = 28
____exports.CollectibleType[____exports.CollectibleType.BELT] = "BELT"
____exports.CollectibleType.MOMS_UNDERWEAR = 29
____exports.CollectibleType[____exports.CollectibleType.MOMS_UNDERWEAR] = "MOMS_UNDERWEAR"
____exports.CollectibleType.MOMS_HEELS = 30
____exports.CollectibleType[____exports.CollectibleType.MOMS_HEELS] = "MOMS_HEELS"
____exports.CollectibleType.MOMS_LIPSTICK = 31
____exports.CollectibleType[____exports.CollectibleType.MOMS_LIPSTICK] = "MOMS_LIPSTICK"
____exports.CollectibleType.WIRE_COAT_HANGER = 32
____exports.CollectibleType[____exports.CollectibleType.WIRE_COAT_HANGER] = "WIRE_COAT_HANGER"
____exports.CollectibleType.BIBLE = 33
____exports.CollectibleType[____exports.CollectibleType.BIBLE] = "BIBLE"
____exports.CollectibleType.BOOK_OF_BELIAL = 34
____exports.CollectibleType[____exports.CollectibleType.BOOK_OF_BELIAL] = "BOOK_OF_BELIAL"
____exports.CollectibleType.NECRONOMICON = 35
____exports.CollectibleType[____exports.CollectibleType.NECRONOMICON] = "NECRONOMICON"
____exports.CollectibleType.POOP = 36
____exports.CollectibleType[____exports.CollectibleType.POOP] = "POOP"
____exports.CollectibleType.MR_BOOM = 37
____exports.CollectibleType[____exports.CollectibleType.MR_BOOM] = "MR_BOOM"
____exports.CollectibleType.TAMMYS_HEAD = 38
____exports.CollectibleType[____exports.CollectibleType.TAMMYS_HEAD] = "TAMMYS_HEAD"
____exports.CollectibleType.MOMS_BRA = 39
____exports.CollectibleType[____exports.CollectibleType.MOMS_BRA] = "MOMS_BRA"
____exports.CollectibleType.KAMIKAZE = 40
____exports.CollectibleType[____exports.CollectibleType.KAMIKAZE] = "KAMIKAZE"
____exports.CollectibleType.MOMS_PAD = 41
____exports.CollectibleType[____exports.CollectibleType.MOMS_PAD] = "MOMS_PAD"
____exports.CollectibleType.BOBS_ROTTEN_HEAD = 42
____exports.CollectibleType[____exports.CollectibleType.BOBS_ROTTEN_HEAD] = "BOBS_ROTTEN_HEAD"
____exports.CollectibleType.TELEPORT = 44
____exports.CollectibleType[____exports.CollectibleType.TELEPORT] = "TELEPORT"
____exports.CollectibleType.YUM_HEART = 45
____exports.CollectibleType[____exports.CollectibleType.YUM_HEART] = "YUM_HEART"
____exports.CollectibleType.LUCKY_FOOT = 46
____exports.CollectibleType[____exports.CollectibleType.LUCKY_FOOT] = "LUCKY_FOOT"
____exports.CollectibleType.DOCTORS_REMOTE = 47
____exports.CollectibleType[____exports.CollectibleType.DOCTORS_REMOTE] = "DOCTORS_REMOTE"
____exports.CollectibleType.CUPIDS_ARROW = 48
____exports.CollectibleType[____exports.CollectibleType.CUPIDS_ARROW] = "CUPIDS_ARROW"
____exports.CollectibleType.SHOOP_DA_WHOOP = 49
____exports.CollectibleType[____exports.CollectibleType.SHOOP_DA_WHOOP] = "SHOOP_DA_WHOOP"
____exports.CollectibleType.STEVEN = 50
____exports.CollectibleType[____exports.CollectibleType.STEVEN] = "STEVEN"
____exports.CollectibleType.PENTAGRAM = 51
____exports.CollectibleType[____exports.CollectibleType.PENTAGRAM] = "PENTAGRAM"
____exports.CollectibleType.DR_FETUS = 52
____exports.CollectibleType[____exports.CollectibleType.DR_FETUS] = "DR_FETUS"
____exports.CollectibleType.MAGNETO = 53
____exports.CollectibleType[____exports.CollectibleType.MAGNETO] = "MAGNETO"
____exports.CollectibleType.TREASURE_MAP = 54
____exports.CollectibleType[____exports.CollectibleType.TREASURE_MAP] = "TREASURE_MAP"
____exports.CollectibleType.MOMS_EYE = 55
____exports.CollectibleType[____exports.CollectibleType.MOMS_EYE] = "MOMS_EYE"
____exports.CollectibleType.LEMON_MISHAP = 56
____exports.CollectibleType[____exports.CollectibleType.LEMON_MISHAP] = "LEMON_MISHAP"
____exports.CollectibleType.DISTANT_ADMIRATION = 57
____exports.CollectibleType[____exports.CollectibleType.DISTANT_ADMIRATION] = "DISTANT_ADMIRATION"
____exports.CollectibleType.BOOK_OF_SHADOWS = 58
____exports.CollectibleType[____exports.CollectibleType.BOOK_OF_SHADOWS] = "BOOK_OF_SHADOWS"
____exports.CollectibleType.BOOK_OF_BELIAL_BIRTHRIGHT = 59
____exports.CollectibleType[____exports.CollectibleType.BOOK_OF_BELIAL_BIRTHRIGHT] = "BOOK_OF_BELIAL_BIRTHRIGHT"
____exports.CollectibleType.LADDER = 60
____exports.CollectibleType[____exports.CollectibleType.LADDER] = "LADDER"
____exports.CollectibleType.CHARM_VAMPIRE = 62
____exports.CollectibleType[____exports.CollectibleType.CHARM_VAMPIRE] = "CHARM_VAMPIRE"
____exports.CollectibleType.BATTERY = 63
____exports.CollectibleType[____exports.CollectibleType.BATTERY] = "BATTERY"
____exports.CollectibleType.STEAM_SALE = 64
____exports.CollectibleType[____exports.CollectibleType.STEAM_SALE] = "STEAM_SALE"
____exports.CollectibleType.ANARCHIST_COOKBOOK = 65
____exports.CollectibleType[____exports.CollectibleType.ANARCHIST_COOKBOOK] = "ANARCHIST_COOKBOOK"
____exports.CollectibleType.HOURGLASS = 66
____exports.CollectibleType[____exports.CollectibleType.HOURGLASS] = "HOURGLASS"
____exports.CollectibleType.SISTER_MAGGY = 67
____exports.CollectibleType[____exports.CollectibleType.SISTER_MAGGY] = "SISTER_MAGGY"
____exports.CollectibleType.TECHNOLOGY = 68
____exports.CollectibleType[____exports.CollectibleType.TECHNOLOGY] = "TECHNOLOGY"
____exports.CollectibleType.CHOCOLATE_MILK = 69
____exports.CollectibleType[____exports.CollectibleType.CHOCOLATE_MILK] = "CHOCOLATE_MILK"
____exports.CollectibleType.GROWTH_HORMONES = 70
____exports.CollectibleType[____exports.CollectibleType.GROWTH_HORMONES] = "GROWTH_HORMONES"
____exports.CollectibleType.MINI_MUSH = 71
____exports.CollectibleType[____exports.CollectibleType.MINI_MUSH] = "MINI_MUSH"
____exports.CollectibleType.ROSARY = 72
____exports.CollectibleType[____exports.CollectibleType.ROSARY] = "ROSARY"
____exports.CollectibleType.CUBE_OF_MEAT = 73
____exports.CollectibleType[____exports.CollectibleType.CUBE_OF_MEAT] = "CUBE_OF_MEAT"
____exports.CollectibleType.QUARTER = 74
____exports.CollectibleType[____exports.CollectibleType.QUARTER] = "QUARTER"
____exports.CollectibleType.PHD = 75
____exports.CollectibleType[____exports.CollectibleType.PHD] = "PHD"
____exports.CollectibleType.XRAY_VISION = 76
____exports.CollectibleType[____exports.CollectibleType.XRAY_VISION] = "XRAY_VISION"
____exports.CollectibleType.MY_LITTLE_UNICORN = 77
____exports.CollectibleType[____exports.CollectibleType.MY_LITTLE_UNICORN] = "MY_LITTLE_UNICORN"
____exports.CollectibleType.BOOK_OF_REVELATIONS = 78
____exports.CollectibleType[____exports.CollectibleType.BOOK_OF_REVELATIONS] = "BOOK_OF_REVELATIONS"
____exports.CollectibleType.MARK = 79
____exports.CollectibleType[____exports.CollectibleType.MARK] = "MARK"
____exports.CollectibleType.PACT = 80
____exports.CollectibleType[____exports.CollectibleType.PACT] = "PACT"
____exports.CollectibleType.DEAD_CAT = 81
____exports.CollectibleType[____exports.CollectibleType.DEAD_CAT] = "DEAD_CAT"
____exports.CollectibleType.LORD_OF_THE_PIT = 82
____exports.CollectibleType[____exports.CollectibleType.LORD_OF_THE_PIT] = "LORD_OF_THE_PIT"
____exports.CollectibleType.NAIL = 83
____exports.CollectibleType[____exports.CollectibleType.NAIL] = "NAIL"
____exports.CollectibleType.WE_NEED_TO_GO_DEEPER = 84
____exports.CollectibleType[____exports.CollectibleType.WE_NEED_TO_GO_DEEPER] = "WE_NEED_TO_GO_DEEPER"
____exports.CollectibleType.DECK_OF_CARDS = 85
____exports.CollectibleType[____exports.CollectibleType.DECK_OF_CARDS] = "DECK_OF_CARDS"
____exports.CollectibleType.MONSTROS_TOOTH = 86
____exports.CollectibleType[____exports.CollectibleType.MONSTROS_TOOTH] = "MONSTROS_TOOTH"
____exports.CollectibleType.LOKIS_HORNS = 87
____exports.CollectibleType[____exports.CollectibleType.LOKIS_HORNS] = "LOKIS_HORNS"
____exports.CollectibleType.LITTLE_CHUBBY = 88
____exports.CollectibleType[____exports.CollectibleType.LITTLE_CHUBBY] = "LITTLE_CHUBBY"
____exports.CollectibleType.SPIDER_BITE = 89
____exports.CollectibleType[____exports.CollectibleType.SPIDER_BITE] = "SPIDER_BITE"
____exports.CollectibleType.SMALL_ROCK = 90
____exports.CollectibleType[____exports.CollectibleType.SMALL_ROCK] = "SMALL_ROCK"
____exports.CollectibleType.SPELUNKER_HAT = 91
____exports.CollectibleType[____exports.CollectibleType.SPELUNKER_HAT] = "SPELUNKER_HAT"
____exports.CollectibleType.SUPER_BANDAGE = 92
____exports.CollectibleType[____exports.CollectibleType.SUPER_BANDAGE] = "SUPER_BANDAGE"
____exports.CollectibleType.GAMEKID = 93
____exports.CollectibleType[____exports.CollectibleType.GAMEKID] = "GAMEKID"
____exports.CollectibleType.SACK_OF_PENNIES = 94
____exports.CollectibleType[____exports.CollectibleType.SACK_OF_PENNIES] = "SACK_OF_PENNIES"
____exports.CollectibleType.ROBO_BABY = 95
____exports.CollectibleType[____exports.CollectibleType.ROBO_BABY] = "ROBO_BABY"
____exports.CollectibleType.LITTLE_CHAD = 96
____exports.CollectibleType[____exports.CollectibleType.LITTLE_CHAD] = "LITTLE_CHAD"
____exports.CollectibleType.BOOK_OF_SIN = 97
____exports.CollectibleType[____exports.CollectibleType.BOOK_OF_SIN] = "BOOK_OF_SIN"
____exports.CollectibleType.RELIC = 98
____exports.CollectibleType[____exports.CollectibleType.RELIC] = "RELIC"
____exports.CollectibleType.LITTLE_GISH = 99
____exports.CollectibleType[____exports.CollectibleType.LITTLE_GISH] = "LITTLE_GISH"
____exports.CollectibleType.LITTLE_STEVEN = 100
____exports.CollectibleType[____exports.CollectibleType.LITTLE_STEVEN] = "LITTLE_STEVEN"
____exports.CollectibleType.HALO = 101
____exports.CollectibleType[____exports.CollectibleType.HALO] = "HALO"
____exports.CollectibleType.MOMS_BOTTLE_OF_PILLS = 102
____exports.CollectibleType[____exports.CollectibleType.MOMS_BOTTLE_OF_PILLS] = "MOMS_BOTTLE_OF_PILLS"
____exports.CollectibleType.COMMON_COLD = 103
____exports.CollectibleType[____exports.CollectibleType.COMMON_COLD] = "COMMON_COLD"
____exports.CollectibleType.PARASITE = 104
____exports.CollectibleType[____exports.CollectibleType.PARASITE] = "PARASITE"
____exports.CollectibleType.D6 = 105
____exports.CollectibleType[____exports.CollectibleType.D6] = "D6"
____exports.CollectibleType.MR_MEGA = 106
____exports.CollectibleType[____exports.CollectibleType.MR_MEGA] = "MR_MEGA"
____exports.CollectibleType.PINKING_SHEARS = 107
____exports.CollectibleType[____exports.CollectibleType.PINKING_SHEARS] = "PINKING_SHEARS"
____exports.CollectibleType.WAFER = 108
____exports.CollectibleType[____exports.CollectibleType.WAFER] = "WAFER"
____exports.CollectibleType.MONEY_EQUALS_POWER = 109
____exports.CollectibleType[____exports.CollectibleType.MONEY_EQUALS_POWER] = "MONEY_EQUALS_POWER"
____exports.CollectibleType.MOMS_CONTACTS = 110
____exports.CollectibleType[____exports.CollectibleType.MOMS_CONTACTS] = "MOMS_CONTACTS"
____exports.CollectibleType.BEAN = 111
____exports.CollectibleType[____exports.CollectibleType.BEAN] = "BEAN"
____exports.CollectibleType.GUARDIAN_ANGEL = 112
____exports.CollectibleType[____exports.CollectibleType.GUARDIAN_ANGEL] = "GUARDIAN_ANGEL"
____exports.CollectibleType.DEMON_BABY = 113
____exports.CollectibleType[____exports.CollectibleType.DEMON_BABY] = "DEMON_BABY"
____exports.CollectibleType.MOMS_KNIFE = 114
____exports.CollectibleType[____exports.CollectibleType.MOMS_KNIFE] = "MOMS_KNIFE"
____exports.CollectibleType.OUIJA_BOARD = 115
____exports.CollectibleType[____exports.CollectibleType.OUIJA_BOARD] = "OUIJA_BOARD"
____exports.CollectibleType.NINE_VOLT = 116
____exports.CollectibleType[____exports.CollectibleType.NINE_VOLT] = "NINE_VOLT"
____exports.CollectibleType.DEAD_BIRD = 117
____exports.CollectibleType[____exports.CollectibleType.DEAD_BIRD] = "DEAD_BIRD"
____exports.CollectibleType.BRIMSTONE = 118
____exports.CollectibleType[____exports.CollectibleType.BRIMSTONE] = "BRIMSTONE"
____exports.CollectibleType.BLOOD_BAG = 119
____exports.CollectibleType[____exports.CollectibleType.BLOOD_BAG] = "BLOOD_BAG"
____exports.CollectibleType.ODD_MUSHROOM_THIN = 120
____exports.CollectibleType[____exports.CollectibleType.ODD_MUSHROOM_THIN] = "ODD_MUSHROOM_THIN"
____exports.CollectibleType.ODD_MUSHROOM_LARGE = 121
____exports.CollectibleType[____exports.CollectibleType.ODD_MUSHROOM_LARGE] = "ODD_MUSHROOM_LARGE"
____exports.CollectibleType.WHORE_OF_BABYLON = 122
____exports.CollectibleType[____exports.CollectibleType.WHORE_OF_BABYLON] = "WHORE_OF_BABYLON"
____exports.CollectibleType.MONSTER_MANUAL = 123
____exports.CollectibleType[____exports.CollectibleType.MONSTER_MANUAL] = "MONSTER_MANUAL"
____exports.CollectibleType.DEAD_SEA_SCROLLS = 124
____exports.CollectibleType[____exports.CollectibleType.DEAD_SEA_SCROLLS] = "DEAD_SEA_SCROLLS"
____exports.CollectibleType.BOBBY_BOMB = 125
____exports.CollectibleType[____exports.CollectibleType.BOBBY_BOMB] = "BOBBY_BOMB"
____exports.CollectibleType.RAZOR_BLADE = 126
____exports.CollectibleType[____exports.CollectibleType.RAZOR_BLADE] = "RAZOR_BLADE"
____exports.CollectibleType.FORGET_ME_NOW = 127
____exports.CollectibleType[____exports.CollectibleType.FORGET_ME_NOW] = "FORGET_ME_NOW"
____exports.CollectibleType.FOREVER_ALONE = 128
____exports.CollectibleType[____exports.CollectibleType.FOREVER_ALONE] = "FOREVER_ALONE"
____exports.CollectibleType.BUCKET_OF_LARD = 129
____exports.CollectibleType[____exports.CollectibleType.BUCKET_OF_LARD] = "BUCKET_OF_LARD"
____exports.CollectibleType.PONY = 130
____exports.CollectibleType[____exports.CollectibleType.PONY] = "PONY"
____exports.CollectibleType.BOMB_BAG = 131
____exports.CollectibleType[____exports.CollectibleType.BOMB_BAG] = "BOMB_BAG"
____exports.CollectibleType.LUMP_OF_COAL = 132
____exports.CollectibleType[____exports.CollectibleType.LUMP_OF_COAL] = "LUMP_OF_COAL"
____exports.CollectibleType.GUPPYS_PAW = 133
____exports.CollectibleType[____exports.CollectibleType.GUPPYS_PAW] = "GUPPYS_PAW"
____exports.CollectibleType.GUPPYS_TAIL = 134
____exports.CollectibleType[____exports.CollectibleType.GUPPYS_TAIL] = "GUPPYS_TAIL"
____exports.CollectibleType.IV_BAG = 135
____exports.CollectibleType[____exports.CollectibleType.IV_BAG] = "IV_BAG"
____exports.CollectibleType.BEST_FRIEND = 136
____exports.CollectibleType[____exports.CollectibleType.BEST_FRIEND] = "BEST_FRIEND"
____exports.CollectibleType.REMOTE_DETONATOR = 137
____exports.CollectibleType[____exports.CollectibleType.REMOTE_DETONATOR] = "REMOTE_DETONATOR"
____exports.CollectibleType.STIGMATA = 138
____exports.CollectibleType[____exports.CollectibleType.STIGMATA] = "STIGMATA"
____exports.CollectibleType.MOMS_PURSE = 139
____exports.CollectibleType[____exports.CollectibleType.MOMS_PURSE] = "MOMS_PURSE"
____exports.CollectibleType.BOBS_CURSE = 140
____exports.CollectibleType[____exports.CollectibleType.BOBS_CURSE] = "BOBS_CURSE"
____exports.CollectibleType.PAGEANT_BOY = 141
____exports.CollectibleType[____exports.CollectibleType.PAGEANT_BOY] = "PAGEANT_BOY"
____exports.CollectibleType.SCAPULAR = 142
____exports.CollectibleType[____exports.CollectibleType.SCAPULAR] = "SCAPULAR"
____exports.CollectibleType.SPEED_BALL = 143
____exports.CollectibleType[____exports.CollectibleType.SPEED_BALL] = "SPEED_BALL"
____exports.CollectibleType.BUM_FRIEND = 144
____exports.CollectibleType[____exports.CollectibleType.BUM_FRIEND] = "BUM_FRIEND"
____exports.CollectibleType.GUPPYS_HEAD = 145
____exports.CollectibleType[____exports.CollectibleType.GUPPYS_HEAD] = "GUPPYS_HEAD"
____exports.CollectibleType.PRAYER_CARD = 146
____exports.CollectibleType[____exports.CollectibleType.PRAYER_CARD] = "PRAYER_CARD"
____exports.CollectibleType.NOTCHED_AXE = 147
____exports.CollectibleType[____exports.CollectibleType.NOTCHED_AXE] = "NOTCHED_AXE"
____exports.CollectibleType.INFESTATION = 148
____exports.CollectibleType[____exports.CollectibleType.INFESTATION] = "INFESTATION"
____exports.CollectibleType.IPECAC = 149
____exports.CollectibleType[____exports.CollectibleType.IPECAC] = "IPECAC"
____exports.CollectibleType.TOUGH_LOVE = 150
____exports.CollectibleType[____exports.CollectibleType.TOUGH_LOVE] = "TOUGH_LOVE"
____exports.CollectibleType.MULLIGAN = 151
____exports.CollectibleType[____exports.CollectibleType.MULLIGAN] = "MULLIGAN"
____exports.CollectibleType.TECHNOLOGY_2 = 152
____exports.CollectibleType[____exports.CollectibleType.TECHNOLOGY_2] = "TECHNOLOGY_2"
____exports.CollectibleType.MUTANT_SPIDER = 153
____exports.CollectibleType[____exports.CollectibleType.MUTANT_SPIDER] = "MUTANT_SPIDER"
____exports.CollectibleType.CHEMICAL_PEEL = 154
____exports.CollectibleType[____exports.CollectibleType.CHEMICAL_PEEL] = "CHEMICAL_PEEL"
____exports.CollectibleType.PEEPER = 155
____exports.CollectibleType[____exports.CollectibleType.PEEPER] = "PEEPER"
____exports.CollectibleType.HABIT = 156
____exports.CollectibleType[____exports.CollectibleType.HABIT] = "HABIT"
____exports.CollectibleType.BLOODY_LUST = 157
____exports.CollectibleType[____exports.CollectibleType.BLOODY_LUST] = "BLOODY_LUST"
____exports.CollectibleType.CRYSTAL_BALL = 158
____exports.CollectibleType[____exports.CollectibleType.CRYSTAL_BALL] = "CRYSTAL_BALL"
____exports.CollectibleType.SPIRIT_OF_THE_NIGHT = 159
____exports.CollectibleType[____exports.CollectibleType.SPIRIT_OF_THE_NIGHT] = "SPIRIT_OF_THE_NIGHT"
____exports.CollectibleType.CRACK_THE_SKY = 160
____exports.CollectibleType[____exports.CollectibleType.CRACK_THE_SKY] = "CRACK_THE_SKY"
____exports.CollectibleType.ANKH = 161
____exports.CollectibleType[____exports.CollectibleType.ANKH] = "ANKH"
____exports.CollectibleType.CELTIC_CROSS = 162
____exports.CollectibleType[____exports.CollectibleType.CELTIC_CROSS] = "CELTIC_CROSS"
____exports.CollectibleType.GHOST_BABY = 163
____exports.CollectibleType[____exports.CollectibleType.GHOST_BABY] = "GHOST_BABY"
____exports.CollectibleType.CANDLE = 164
____exports.CollectibleType[____exports.CollectibleType.CANDLE] = "CANDLE"
____exports.CollectibleType.CAT_O_NINE_TAILS = 165
____exports.CollectibleType[____exports.CollectibleType.CAT_O_NINE_TAILS] = "CAT_O_NINE_TAILS"
____exports.CollectibleType.D20 = 166
____exports.CollectibleType[____exports.CollectibleType.D20] = "D20"
____exports.CollectibleType.HARLEQUIN_BABY = 167
____exports.CollectibleType[____exports.CollectibleType.HARLEQUIN_BABY] = "HARLEQUIN_BABY"
____exports.CollectibleType.EPIC_FETUS = 168
____exports.CollectibleType[____exports.CollectibleType.EPIC_FETUS] = "EPIC_FETUS"
____exports.CollectibleType.POLYPHEMUS = 169
____exports.CollectibleType[____exports.CollectibleType.POLYPHEMUS] = "POLYPHEMUS"
____exports.CollectibleType.DADDY_LONGLEGS = 170
____exports.CollectibleType[____exports.CollectibleType.DADDY_LONGLEGS] = "DADDY_LONGLEGS"
____exports.CollectibleType.SPIDER_BUTT = 171
____exports.CollectibleType[____exports.CollectibleType.SPIDER_BUTT] = "SPIDER_BUTT"
____exports.CollectibleType.SACRIFICIAL_DAGGER = 172
____exports.CollectibleType[____exports.CollectibleType.SACRIFICIAL_DAGGER] = "SACRIFICIAL_DAGGER"
____exports.CollectibleType.MITRE = 173
____exports.CollectibleType[____exports.CollectibleType.MITRE] = "MITRE"
____exports.CollectibleType.RAINBOW_BABY = 174
____exports.CollectibleType[____exports.CollectibleType.RAINBOW_BABY] = "RAINBOW_BABY"
____exports.CollectibleType.DADS_KEY = 175
____exports.CollectibleType[____exports.CollectibleType.DADS_KEY] = "DADS_KEY"
____exports.CollectibleType.STEM_CELLS = 176
____exports.CollectibleType[____exports.CollectibleType.STEM_CELLS] = "STEM_CELLS"
____exports.CollectibleType.PORTABLE_SLOT = 177
____exports.CollectibleType[____exports.CollectibleType.PORTABLE_SLOT] = "PORTABLE_SLOT"
____exports.CollectibleType.HOLY_WATER = 178
____exports.CollectibleType[____exports.CollectibleType.HOLY_WATER] = "HOLY_WATER"
____exports.CollectibleType.FATE = 179
____exports.CollectibleType[____exports.CollectibleType.FATE] = "FATE"
____exports.CollectibleType.BLACK_BEAN = 180
____exports.CollectibleType[____exports.CollectibleType.BLACK_BEAN] = "BLACK_BEAN"
____exports.CollectibleType.WHITE_PONY = 181
____exports.CollectibleType[____exports.CollectibleType.WHITE_PONY] = "WHITE_PONY"
____exports.CollectibleType.SACRED_HEART = 182
____exports.CollectibleType[____exports.CollectibleType.SACRED_HEART] = "SACRED_HEART"
____exports.CollectibleType.TOOTH_PICKS = 183
____exports.CollectibleType[____exports.CollectibleType.TOOTH_PICKS] = "TOOTH_PICKS"
____exports.CollectibleType.HOLY_GRAIL = 184
____exports.CollectibleType[____exports.CollectibleType.HOLY_GRAIL] = "HOLY_GRAIL"
____exports.CollectibleType.DEAD_DOVE = 185
____exports.CollectibleType[____exports.CollectibleType.DEAD_DOVE] = "DEAD_DOVE"
____exports.CollectibleType.BLOOD_RIGHTS = 186
____exports.CollectibleType[____exports.CollectibleType.BLOOD_RIGHTS] = "BLOOD_RIGHTS"
____exports.CollectibleType.GUPPYS_HAIRBALL = 187
____exports.CollectibleType[____exports.CollectibleType.GUPPYS_HAIRBALL] = "GUPPYS_HAIRBALL"
____exports.CollectibleType.ABEL = 188
____exports.CollectibleType[____exports.CollectibleType.ABEL] = "ABEL"
____exports.CollectibleType.SMB_SUPER_FAN = 189
____exports.CollectibleType[____exports.CollectibleType.SMB_SUPER_FAN] = "SMB_SUPER_FAN"
____exports.CollectibleType.PYRO = 190
____exports.CollectibleType[____exports.CollectibleType.PYRO] = "PYRO"
____exports.CollectibleType.THREE_DOLLAR_BILL = 191
____exports.CollectibleType[____exports.CollectibleType.THREE_DOLLAR_BILL] = "THREE_DOLLAR_BILL"
____exports.CollectibleType.TELEPATHY_BOOK = 192
____exports.CollectibleType[____exports.CollectibleType.TELEPATHY_BOOK] = "TELEPATHY_BOOK"
____exports.CollectibleType.MEAT = 193
____exports.CollectibleType[____exports.CollectibleType.MEAT] = "MEAT"
____exports.CollectibleType.MAGIC_8_BALL = 194
____exports.CollectibleType[____exports.CollectibleType.MAGIC_8_BALL] = "MAGIC_8_BALL"
____exports.CollectibleType.MOMS_COIN_PURSE = 195
____exports.CollectibleType[____exports.CollectibleType.MOMS_COIN_PURSE] = "MOMS_COIN_PURSE"
____exports.CollectibleType.SQUEEZY = 196
____exports.CollectibleType[____exports.CollectibleType.SQUEEZY] = "SQUEEZY"
____exports.CollectibleType.JESUS_JUICE = 197
____exports.CollectibleType[____exports.CollectibleType.JESUS_JUICE] = "JESUS_JUICE"
____exports.CollectibleType.BOX = 198
____exports.CollectibleType[____exports.CollectibleType.BOX] = "BOX"
____exports.CollectibleType.MOMS_KEY = 199
____exports.CollectibleType[____exports.CollectibleType.MOMS_KEY] = "MOMS_KEY"
____exports.CollectibleType.MOMS_EYESHADOW = 200
____exports.CollectibleType[____exports.CollectibleType.MOMS_EYESHADOW] = "MOMS_EYESHADOW"
____exports.CollectibleType.IRON_BAR = 201
____exports.CollectibleType[____exports.CollectibleType.IRON_BAR] = "IRON_BAR"
____exports.CollectibleType.MIDAS_TOUCH = 202
____exports.CollectibleType[____exports.CollectibleType.MIDAS_TOUCH] = "MIDAS_TOUCH"
____exports.CollectibleType.HUMBLING_BUNDLE = 203
____exports.CollectibleType[____exports.CollectibleType.HUMBLING_BUNDLE] = "HUMBLING_BUNDLE"
____exports.CollectibleType.FANNY_PACK = 204
____exports.CollectibleType[____exports.CollectibleType.FANNY_PACK] = "FANNY_PACK"
____exports.CollectibleType.SHARP_PLUG = 205
____exports.CollectibleType[____exports.CollectibleType.SHARP_PLUG] = "SHARP_PLUG"
____exports.CollectibleType.GUILLOTINE = 206
____exports.CollectibleType[____exports.CollectibleType.GUILLOTINE] = "GUILLOTINE"
____exports.CollectibleType.BALL_OF_BANDAGES = 207
____exports.CollectibleType[____exports.CollectibleType.BALL_OF_BANDAGES] = "BALL_OF_BANDAGES"
____exports.CollectibleType.CHAMPION_BELT = 208
____exports.CollectibleType[____exports.CollectibleType.CHAMPION_BELT] = "CHAMPION_BELT"
____exports.CollectibleType.BUTT_BOMBS = 209
____exports.CollectibleType[____exports.CollectibleType.BUTT_BOMBS] = "BUTT_BOMBS"
____exports.CollectibleType.GNAWED_LEAF = 210
____exports.CollectibleType[____exports.CollectibleType.GNAWED_LEAF] = "GNAWED_LEAF"
____exports.CollectibleType.SPIDERBABY = 211
____exports.CollectibleType[____exports.CollectibleType.SPIDERBABY] = "SPIDERBABY"
____exports.CollectibleType.GUPPYS_COLLAR = 212
____exports.CollectibleType[____exports.CollectibleType.GUPPYS_COLLAR] = "GUPPYS_COLLAR"
____exports.CollectibleType.LOST_CONTACT = 213
____exports.CollectibleType[____exports.CollectibleType.LOST_CONTACT] = "LOST_CONTACT"
____exports.CollectibleType.ANEMIC = 214
____exports.CollectibleType[____exports.CollectibleType.ANEMIC] = "ANEMIC"
____exports.CollectibleType.GOAT_HEAD = 215
____exports.CollectibleType[____exports.CollectibleType.GOAT_HEAD] = "GOAT_HEAD"
____exports.CollectibleType.CEREMONIAL_ROBES = 216
____exports.CollectibleType[____exports.CollectibleType.CEREMONIAL_ROBES] = "CEREMONIAL_ROBES"
____exports.CollectibleType.MOMS_WIG = 217
____exports.CollectibleType[____exports.CollectibleType.MOMS_WIG] = "MOMS_WIG"
____exports.CollectibleType.PLACENTA = 218
____exports.CollectibleType[____exports.CollectibleType.PLACENTA] = "PLACENTA"
____exports.CollectibleType.OLD_BANDAGE = 219
____exports.CollectibleType[____exports.CollectibleType.OLD_BANDAGE] = "OLD_BANDAGE"
____exports.CollectibleType.SAD_BOMBS = 220
____exports.CollectibleType[____exports.CollectibleType.SAD_BOMBS] = "SAD_BOMBS"
____exports.CollectibleType.RUBBER_CEMENT = 221
____exports.CollectibleType[____exports.CollectibleType.RUBBER_CEMENT] = "RUBBER_CEMENT"
____exports.CollectibleType.ANTI_GRAVITY = 222
____exports.CollectibleType[____exports.CollectibleType.ANTI_GRAVITY] = "ANTI_GRAVITY"
____exports.CollectibleType.PYROMANIAC = 223
____exports.CollectibleType[____exports.CollectibleType.PYROMANIAC] = "PYROMANIAC"
____exports.CollectibleType.CRICKETS_BODY = 224
____exports.CollectibleType[____exports.CollectibleType.CRICKETS_BODY] = "CRICKETS_BODY"
____exports.CollectibleType.GIMPY = 225
____exports.CollectibleType[____exports.CollectibleType.GIMPY] = "GIMPY"
____exports.CollectibleType.BLACK_LOTUS = 226
____exports.CollectibleType[____exports.CollectibleType.BLACK_LOTUS] = "BLACK_LOTUS"
____exports.CollectibleType.PIGGY_BANK = 227
____exports.CollectibleType[____exports.CollectibleType.PIGGY_BANK] = "PIGGY_BANK"
____exports.CollectibleType.MOMS_PERFUME = 228
____exports.CollectibleType[____exports.CollectibleType.MOMS_PERFUME] = "MOMS_PERFUME"
____exports.CollectibleType.MONSTROS_LUNG = 229
____exports.CollectibleType[____exports.CollectibleType.MONSTROS_LUNG] = "MONSTROS_LUNG"
____exports.CollectibleType.ABADDON = 230
____exports.CollectibleType[____exports.CollectibleType.ABADDON] = "ABADDON"
____exports.CollectibleType.BALL_OF_TAR = 231
____exports.CollectibleType[____exports.CollectibleType.BALL_OF_TAR] = "BALL_OF_TAR"
____exports.CollectibleType.STOP_WATCH = 232
____exports.CollectibleType[____exports.CollectibleType.STOP_WATCH] = "STOP_WATCH"
____exports.CollectibleType.TINY_PLANET = 233
____exports.CollectibleType[____exports.CollectibleType.TINY_PLANET] = "TINY_PLANET"
____exports.CollectibleType.INFESTATION_2 = 234
____exports.CollectibleType[____exports.CollectibleType.INFESTATION_2] = "INFESTATION_2"
____exports.CollectibleType.E_COLI = 236
____exports.CollectibleType[____exports.CollectibleType.E_COLI] = "E_COLI"
____exports.CollectibleType.DEATHS_TOUCH = 237
____exports.CollectibleType[____exports.CollectibleType.DEATHS_TOUCH] = "DEATHS_TOUCH"
____exports.CollectibleType.KEY_PIECE_1 = 238
____exports.CollectibleType[____exports.CollectibleType.KEY_PIECE_1] = "KEY_PIECE_1"
____exports.CollectibleType.KEY_PIECE_2 = 239
____exports.CollectibleType[____exports.CollectibleType.KEY_PIECE_2] = "KEY_PIECE_2"
____exports.CollectibleType.EXPERIMENTAL_TREATMENT = 240
____exports.CollectibleType[____exports.CollectibleType.EXPERIMENTAL_TREATMENT] = "EXPERIMENTAL_TREATMENT"
____exports.CollectibleType.CONTRACT_FROM_BELOW = 241
____exports.CollectibleType[____exports.CollectibleType.CONTRACT_FROM_BELOW] = "CONTRACT_FROM_BELOW"
____exports.CollectibleType.INFAMY = 242
____exports.CollectibleType[____exports.CollectibleType.INFAMY] = "INFAMY"
____exports.CollectibleType.TRINITY_SHIELD = 243
____exports.CollectibleType[____exports.CollectibleType.TRINITY_SHIELD] = "TRINITY_SHIELD"
____exports.CollectibleType.TECH_5 = 244
____exports.CollectibleType[____exports.CollectibleType.TECH_5] = "TECH_5"
____exports.CollectibleType.TWENTY_TWENTY = 245
____exports.CollectibleType[____exports.CollectibleType.TWENTY_TWENTY] = "TWENTY_TWENTY"
____exports.CollectibleType.BLUE_MAP = 246
____exports.CollectibleType[____exports.CollectibleType.BLUE_MAP] = "BLUE_MAP"
____exports.CollectibleType.BFFS = 247
____exports.CollectibleType[____exports.CollectibleType.BFFS] = "BFFS"
____exports.CollectibleType.HIVE_MIND = 248
____exports.CollectibleType[____exports.CollectibleType.HIVE_MIND] = "HIVE_MIND"
____exports.CollectibleType.THERES_OPTIONS = 249
____exports.CollectibleType[____exports.CollectibleType.THERES_OPTIONS] = "THERES_OPTIONS"
____exports.CollectibleType.BOGO_BOMBS = 250
____exports.CollectibleType[____exports.CollectibleType.BOGO_BOMBS] = "BOGO_BOMBS"
____exports.CollectibleType.STARTER_DECK = 251
____exports.CollectibleType[____exports.CollectibleType.STARTER_DECK] = "STARTER_DECK"
____exports.CollectibleType.LITTLE_BAGGY = 252
____exports.CollectibleType[____exports.CollectibleType.LITTLE_BAGGY] = "LITTLE_BAGGY"
____exports.CollectibleType.MAGIC_SCAB = 253
____exports.CollectibleType[____exports.CollectibleType.MAGIC_SCAB] = "MAGIC_SCAB"
____exports.CollectibleType.BLOOD_CLOT = 254
____exports.CollectibleType[____exports.CollectibleType.BLOOD_CLOT] = "BLOOD_CLOT"
____exports.CollectibleType.SCREW = 255
____exports.CollectibleType[____exports.CollectibleType.SCREW] = "SCREW"
____exports.CollectibleType.HOT_BOMBS = 256
____exports.CollectibleType[____exports.CollectibleType.HOT_BOMBS] = "HOT_BOMBS"
____exports.CollectibleType.FIRE_MIND = 257
____exports.CollectibleType[____exports.CollectibleType.FIRE_MIND] = "FIRE_MIND"
____exports.CollectibleType.MISSING_NO = 258
____exports.CollectibleType[____exports.CollectibleType.MISSING_NO] = "MISSING_NO"
____exports.CollectibleType.DARK_MATTER = 259
____exports.CollectibleType[____exports.CollectibleType.DARK_MATTER] = "DARK_MATTER"
____exports.CollectibleType.BLACK_CANDLE = 260
____exports.CollectibleType[____exports.CollectibleType.BLACK_CANDLE] = "BLACK_CANDLE"
____exports.CollectibleType.PROPTOSIS = 261
____exports.CollectibleType[____exports.CollectibleType.PROPTOSIS] = "PROPTOSIS"
____exports.CollectibleType.MISSING_PAGE_2 = 262
____exports.CollectibleType[____exports.CollectibleType.MISSING_PAGE_2] = "MISSING_PAGE_2"
____exports.CollectibleType.CLEAR_RUNE = 263
____exports.CollectibleType[____exports.CollectibleType.CLEAR_RUNE] = "CLEAR_RUNE"
____exports.CollectibleType.SMART_FLY = 264
____exports.CollectibleType[____exports.CollectibleType.SMART_FLY] = "SMART_FLY"
____exports.CollectibleType.DRY_BABY = 265
____exports.CollectibleType[____exports.CollectibleType.DRY_BABY] = "DRY_BABY"
____exports.CollectibleType.JUICY_SACK = 266
____exports.CollectibleType[____exports.CollectibleType.JUICY_SACK] = "JUICY_SACK"
____exports.CollectibleType.ROBO_BABY_2 = 267
____exports.CollectibleType[____exports.CollectibleType.ROBO_BABY_2] = "ROBO_BABY_2"
____exports.CollectibleType.ROTTEN_BABY = 268
____exports.CollectibleType[____exports.CollectibleType.ROTTEN_BABY] = "ROTTEN_BABY"
____exports.CollectibleType.HEADLESS_BABY = 269
____exports.CollectibleType[____exports.CollectibleType.HEADLESS_BABY] = "HEADLESS_BABY"
____exports.CollectibleType.LEECH = 270
____exports.CollectibleType[____exports.CollectibleType.LEECH] = "LEECH"
____exports.CollectibleType.MYSTERY_SACK = 271
____exports.CollectibleType[____exports.CollectibleType.MYSTERY_SACK] = "MYSTERY_SACK"
____exports.CollectibleType.BBF = 272
____exports.CollectibleType[____exports.CollectibleType.BBF] = "BBF"
____exports.CollectibleType.BOBS_BRAIN = 273
____exports.CollectibleType[____exports.CollectibleType.BOBS_BRAIN] = "BOBS_BRAIN"
____exports.CollectibleType.BEST_BUD = 274
____exports.CollectibleType[____exports.CollectibleType.BEST_BUD] = "BEST_BUD"
____exports.CollectibleType.LIL_BRIMSTONE = 275
____exports.CollectibleType[____exports.CollectibleType.LIL_BRIMSTONE] = "LIL_BRIMSTONE"
____exports.CollectibleType.ISAACS_HEART = 276
____exports.CollectibleType[____exports.CollectibleType.ISAACS_HEART] = "ISAACS_HEART"
____exports.CollectibleType.LIL_HAUNT = 277
____exports.CollectibleType[____exports.CollectibleType.LIL_HAUNT] = "LIL_HAUNT"
____exports.CollectibleType.DARK_BUM = 278
____exports.CollectibleType[____exports.CollectibleType.DARK_BUM] = "DARK_BUM"
____exports.CollectibleType.BIG_FAN = 279
____exports.CollectibleType[____exports.CollectibleType.BIG_FAN] = "BIG_FAN"
____exports.CollectibleType.SISSY_LONGLEGS = 280
____exports.CollectibleType[____exports.CollectibleType.SISSY_LONGLEGS] = "SISSY_LONGLEGS"
____exports.CollectibleType.PUNCHING_BAG = 281
____exports.CollectibleType[____exports.CollectibleType.PUNCHING_BAG] = "PUNCHING_BAG"
____exports.CollectibleType.HOW_TO_JUMP = 282
____exports.CollectibleType[____exports.CollectibleType.HOW_TO_JUMP] = "HOW_TO_JUMP"
____exports.CollectibleType.D100 = 283
____exports.CollectibleType[____exports.CollectibleType.D100] = "D100"
____exports.CollectibleType.D4 = 284
____exports.CollectibleType[____exports.CollectibleType.D4] = "D4"
____exports.CollectibleType.D10 = 285
____exports.CollectibleType[____exports.CollectibleType.D10] = "D10"
____exports.CollectibleType.BLANK_CARD = 286
____exports.CollectibleType[____exports.CollectibleType.BLANK_CARD] = "BLANK_CARD"
____exports.CollectibleType.BOOK_OF_SECRETS = 287
____exports.CollectibleType[____exports.CollectibleType.BOOK_OF_SECRETS] = "BOOK_OF_SECRETS"
____exports.CollectibleType.BOX_OF_SPIDERS = 288
____exports.CollectibleType[____exports.CollectibleType.BOX_OF_SPIDERS] = "BOX_OF_SPIDERS"
____exports.CollectibleType.RED_CANDLE = 289
____exports.CollectibleType[____exports.CollectibleType.RED_CANDLE] = "RED_CANDLE"
____exports.CollectibleType.JAR = 290
____exports.CollectibleType[____exports.CollectibleType.JAR] = "JAR"
____exports.CollectibleType.FLUSH = 291
____exports.CollectibleType[____exports.CollectibleType.FLUSH] = "FLUSH"
____exports.CollectibleType.SATANIC_BIBLE = 292
____exports.CollectibleType[____exports.CollectibleType.SATANIC_BIBLE] = "SATANIC_BIBLE"
____exports.CollectibleType.HEAD_OF_KRAMPUS = 293
____exports.CollectibleType[____exports.CollectibleType.HEAD_OF_KRAMPUS] = "HEAD_OF_KRAMPUS"
____exports.CollectibleType.BUTTER_BEAN = 294
____exports.CollectibleType[____exports.CollectibleType.BUTTER_BEAN] = "BUTTER_BEAN"
____exports.CollectibleType.MAGIC_FINGERS = 295
____exports.CollectibleType[____exports.CollectibleType.MAGIC_FINGERS] = "MAGIC_FINGERS"
____exports.CollectibleType.CONVERTER = 296
____exports.CollectibleType[____exports.CollectibleType.CONVERTER] = "CONVERTER"
____exports.CollectibleType.BLUE_BOX = 297
____exports.CollectibleType[____exports.CollectibleType.BLUE_BOX] = "BLUE_BOX"
____exports.CollectibleType.UNICORN_STUMP = 298
____exports.CollectibleType[____exports.CollectibleType.UNICORN_STUMP] = "UNICORN_STUMP"
____exports.CollectibleType.TAURUS = 299
____exports.CollectibleType[____exports.CollectibleType.TAURUS] = "TAURUS"
____exports.CollectibleType.ARIES = 300
____exports.CollectibleType[____exports.CollectibleType.ARIES] = "ARIES"
____exports.CollectibleType.CANCER = 301
____exports.CollectibleType[____exports.CollectibleType.CANCER] = "CANCER"
____exports.CollectibleType.LEO = 302
____exports.CollectibleType[____exports.CollectibleType.LEO] = "LEO"
____exports.CollectibleType.VIRGO = 303
____exports.CollectibleType[____exports.CollectibleType.VIRGO] = "VIRGO"
____exports.CollectibleType.LIBRA = 304
____exports.CollectibleType[____exports.CollectibleType.LIBRA] = "LIBRA"
____exports.CollectibleType.SCORPIO = 305
____exports.CollectibleType[____exports.CollectibleType.SCORPIO] = "SCORPIO"
____exports.CollectibleType.SAGITTARIUS = 306
____exports.CollectibleType[____exports.CollectibleType.SAGITTARIUS] = "SAGITTARIUS"
____exports.CollectibleType.CAPRICORN = 307
____exports.CollectibleType[____exports.CollectibleType.CAPRICORN] = "CAPRICORN"
____exports.CollectibleType.AQUARIUS = 308
____exports.CollectibleType[____exports.CollectibleType.AQUARIUS] = "AQUARIUS"
____exports.CollectibleType.PISCES = 309
____exports.CollectibleType[____exports.CollectibleType.PISCES] = "PISCES"
____exports.CollectibleType.EVES_MASCARA = 310
____exports.CollectibleType[____exports.CollectibleType.EVES_MASCARA] = "EVES_MASCARA"
____exports.CollectibleType.JUDAS_SHADOW = 311
____exports.CollectibleType[____exports.CollectibleType.JUDAS_SHADOW] = "JUDAS_SHADOW"
____exports.CollectibleType.MAGGYS_BOW = 312
____exports.CollectibleType[____exports.CollectibleType.MAGGYS_BOW] = "MAGGYS_BOW"
____exports.CollectibleType.HOLY_MANTLE = 313
____exports.CollectibleType[____exports.CollectibleType.HOLY_MANTLE] = "HOLY_MANTLE"
____exports.CollectibleType.THUNDER_THIGHS = 314
____exports.CollectibleType[____exports.CollectibleType.THUNDER_THIGHS] = "THUNDER_THIGHS"
____exports.CollectibleType.STRANGE_ATTRACTOR = 315
____exports.CollectibleType[____exports.CollectibleType.STRANGE_ATTRACTOR] = "STRANGE_ATTRACTOR"
____exports.CollectibleType.CURSED_EYE = 316
____exports.CollectibleType[____exports.CollectibleType.CURSED_EYE] = "CURSED_EYE"
____exports.CollectibleType.MYSTERIOUS_LIQUID = 317
____exports.CollectibleType[____exports.CollectibleType.MYSTERIOUS_LIQUID] = "MYSTERIOUS_LIQUID"
____exports.CollectibleType.GEMINI = 318
____exports.CollectibleType[____exports.CollectibleType.GEMINI] = "GEMINI"
____exports.CollectibleType.CAINS_OTHER_EYE = 319
____exports.CollectibleType[____exports.CollectibleType.CAINS_OTHER_EYE] = "CAINS_OTHER_EYE"
____exports.CollectibleType.BLUE_BABYS_ONLY_FRIEND = 320
____exports.CollectibleType[____exports.CollectibleType.BLUE_BABYS_ONLY_FRIEND] = "BLUE_BABYS_ONLY_FRIEND"
____exports.CollectibleType.SAMSONS_CHAINS = 321
____exports.CollectibleType[____exports.CollectibleType.SAMSONS_CHAINS] = "SAMSONS_CHAINS"
____exports.CollectibleType.MONGO_BABY = 322
____exports.CollectibleType[____exports.CollectibleType.MONGO_BABY] = "MONGO_BABY"
____exports.CollectibleType.ISAACS_TEARS = 323
____exports.CollectibleType[____exports.CollectibleType.ISAACS_TEARS] = "ISAACS_TEARS"
____exports.CollectibleType.UNDEFINED = 324
____exports.CollectibleType[____exports.CollectibleType.UNDEFINED] = "UNDEFINED"
____exports.CollectibleType.SCISSORS = 325
____exports.CollectibleType[____exports.CollectibleType.SCISSORS] = "SCISSORS"
____exports.CollectibleType.BREATH_OF_LIFE = 326
____exports.CollectibleType[____exports.CollectibleType.BREATH_OF_LIFE] = "BREATH_OF_LIFE"
____exports.CollectibleType.POLAROID = 327
____exports.CollectibleType[____exports.CollectibleType.POLAROID] = "POLAROID"
____exports.CollectibleType.NEGATIVE = 328
____exports.CollectibleType[____exports.CollectibleType.NEGATIVE] = "NEGATIVE"
____exports.CollectibleType.LUDOVICO_TECHNIQUE = 329
____exports.CollectibleType[____exports.CollectibleType.LUDOVICO_TECHNIQUE] = "LUDOVICO_TECHNIQUE"
____exports.CollectibleType.SOY_MILK = 330
____exports.CollectibleType[____exports.CollectibleType.SOY_MILK] = "SOY_MILK"
____exports.CollectibleType.GODHEAD = 331
____exports.CollectibleType[____exports.CollectibleType.GODHEAD] = "GODHEAD"
____exports.CollectibleType.LAZARUS_RAGS = 332
____exports.CollectibleType[____exports.CollectibleType.LAZARUS_RAGS] = "LAZARUS_RAGS"
____exports.CollectibleType.MIND = 333
____exports.CollectibleType[____exports.CollectibleType.MIND] = "MIND"
____exports.CollectibleType.BODY = 334
____exports.CollectibleType[____exports.CollectibleType.BODY] = "BODY"
____exports.CollectibleType.SOUL = 335
____exports.CollectibleType[____exports.CollectibleType.SOUL] = "SOUL"
____exports.CollectibleType.DEAD_ONION = 336
____exports.CollectibleType[____exports.CollectibleType.DEAD_ONION] = "DEAD_ONION"
____exports.CollectibleType.BROKEN_WATCH = 337
____exports.CollectibleType[____exports.CollectibleType.BROKEN_WATCH] = "BROKEN_WATCH"
____exports.CollectibleType.BOOMERANG = 338
____exports.CollectibleType[____exports.CollectibleType.BOOMERANG] = "BOOMERANG"
____exports.CollectibleType.SAFETY_PIN = 339
____exports.CollectibleType[____exports.CollectibleType.SAFETY_PIN] = "SAFETY_PIN"
____exports.CollectibleType.CAFFEINE_PILL = 340
____exports.CollectibleType[____exports.CollectibleType.CAFFEINE_PILL] = "CAFFEINE_PILL"
____exports.CollectibleType.TORN_PHOTO = 341
____exports.CollectibleType[____exports.CollectibleType.TORN_PHOTO] = "TORN_PHOTO"
____exports.CollectibleType.BLUE_CAP = 342
____exports.CollectibleType[____exports.CollectibleType.BLUE_CAP] = "BLUE_CAP"
____exports.CollectibleType.LATCH_KEY = 343
____exports.CollectibleType[____exports.CollectibleType.LATCH_KEY] = "LATCH_KEY"
____exports.CollectibleType.MATCH_BOOK = 344
____exports.CollectibleType[____exports.CollectibleType.MATCH_BOOK] = "MATCH_BOOK"
____exports.CollectibleType.SYNTHOIL = 345
____exports.CollectibleType[____exports.CollectibleType.SYNTHOIL] = "SYNTHOIL"
____exports.CollectibleType.SNACK = 346
____exports.CollectibleType[____exports.CollectibleType.SNACK] = "SNACK"
____exports.CollectibleType.DIPLOPIA = 347
____exports.CollectibleType[____exports.CollectibleType.DIPLOPIA] = "DIPLOPIA"
____exports.CollectibleType.PLACEBO = 348
____exports.CollectibleType[____exports.CollectibleType.PLACEBO] = "PLACEBO"
____exports.CollectibleType.WOODEN_NICKEL = 349
____exports.CollectibleType[____exports.CollectibleType.WOODEN_NICKEL] = "WOODEN_NICKEL"
____exports.CollectibleType.TOXIC_SHOCK = 350
____exports.CollectibleType[____exports.CollectibleType.TOXIC_SHOCK] = "TOXIC_SHOCK"
____exports.CollectibleType.MEGA_BEAN = 351
____exports.CollectibleType[____exports.CollectibleType.MEGA_BEAN] = "MEGA_BEAN"
____exports.CollectibleType.GLASS_CANNON = 352
____exports.CollectibleType[____exports.CollectibleType.GLASS_CANNON] = "GLASS_CANNON"
____exports.CollectibleType.BOMBER_BOY = 353
____exports.CollectibleType[____exports.CollectibleType.BOMBER_BOY] = "BOMBER_BOY"
____exports.CollectibleType.CRACK_JACKS = 354
____exports.CollectibleType[____exports.CollectibleType.CRACK_JACKS] = "CRACK_JACKS"
____exports.CollectibleType.MOMS_PEARLS = 355
____exports.CollectibleType[____exports.CollectibleType.MOMS_PEARLS] = "MOMS_PEARLS"
____exports.CollectibleType.CAR_BATTERY = 356
____exports.CollectibleType[____exports.CollectibleType.CAR_BATTERY] = "CAR_BATTERY"
____exports.CollectibleType.BOX_OF_FRIENDS = 357
____exports.CollectibleType[____exports.CollectibleType.BOX_OF_FRIENDS] = "BOX_OF_FRIENDS"
____exports.CollectibleType.WIZ = 358
____exports.CollectibleType[____exports.CollectibleType.WIZ] = "WIZ"
____exports.CollectibleType.EIGHT_INCH_NAILS = 359
____exports.CollectibleType[____exports.CollectibleType.EIGHT_INCH_NAILS] = "EIGHT_INCH_NAILS"
____exports.CollectibleType.INCUBUS = 360
____exports.CollectibleType[____exports.CollectibleType.INCUBUS] = "INCUBUS"
____exports.CollectibleType.FATES_REWARD = 361
____exports.CollectibleType[____exports.CollectibleType.FATES_REWARD] = "FATES_REWARD"
____exports.CollectibleType.LIL_CHEST = 362
____exports.CollectibleType[____exports.CollectibleType.LIL_CHEST] = "LIL_CHEST"
____exports.CollectibleType.SWORN_PROTECTOR = 363
____exports.CollectibleType[____exports.CollectibleType.SWORN_PROTECTOR] = "SWORN_PROTECTOR"
____exports.CollectibleType.FRIEND_ZONE = 364
____exports.CollectibleType[____exports.CollectibleType.FRIEND_ZONE] = "FRIEND_ZONE"
____exports.CollectibleType.LOST_FLY = 365
____exports.CollectibleType[____exports.CollectibleType.LOST_FLY] = "LOST_FLY"
____exports.CollectibleType.SCATTER_BOMBS = 366
____exports.CollectibleType[____exports.CollectibleType.SCATTER_BOMBS] = "SCATTER_BOMBS"
____exports.CollectibleType.STICKY_BOMBS = 367
____exports.CollectibleType[____exports.CollectibleType.STICKY_BOMBS] = "STICKY_BOMBS"
____exports.CollectibleType.EPIPHORA = 368
____exports.CollectibleType[____exports.CollectibleType.EPIPHORA] = "EPIPHORA"
____exports.CollectibleType.CONTINUUM = 369
____exports.CollectibleType[____exports.CollectibleType.CONTINUUM] = "CONTINUUM"
____exports.CollectibleType.MR_DOLLY = 370
____exports.CollectibleType[____exports.CollectibleType.MR_DOLLY] = "MR_DOLLY"
____exports.CollectibleType.CURSE_OF_THE_TOWER = 371
____exports.CollectibleType[____exports.CollectibleType.CURSE_OF_THE_TOWER] = "CURSE_OF_THE_TOWER"
____exports.CollectibleType.CHARGED_BABY = 372
____exports.CollectibleType[____exports.CollectibleType.CHARGED_BABY] = "CHARGED_BABY"
____exports.CollectibleType.DEAD_EYE = 373
____exports.CollectibleType[____exports.CollectibleType.DEAD_EYE] = "DEAD_EYE"
____exports.CollectibleType.HOLY_LIGHT = 374
____exports.CollectibleType[____exports.CollectibleType.HOLY_LIGHT] = "HOLY_LIGHT"
____exports.CollectibleType.HOST_HAT = 375
____exports.CollectibleType[____exports.CollectibleType.HOST_HAT] = "HOST_HAT"
____exports.CollectibleType.RESTOCK = 376
____exports.CollectibleType[____exports.CollectibleType.RESTOCK] = "RESTOCK"
____exports.CollectibleType.BURSTING_SACK = 377
____exports.CollectibleType[____exports.CollectibleType.BURSTING_SACK] = "BURSTING_SACK"
____exports.CollectibleType.NUMBER_TWO = 378
____exports.CollectibleType[____exports.CollectibleType.NUMBER_TWO] = "NUMBER_TWO"
____exports.CollectibleType.PUPULA_DUPLEX = 379
____exports.CollectibleType[____exports.CollectibleType.PUPULA_DUPLEX] = "PUPULA_DUPLEX"
____exports.CollectibleType.PAY_TO_PLAY = 380
____exports.CollectibleType[____exports.CollectibleType.PAY_TO_PLAY] = "PAY_TO_PLAY"
____exports.CollectibleType.EDENS_BLESSING = 381
____exports.CollectibleType[____exports.CollectibleType.EDENS_BLESSING] = "EDENS_BLESSING"
____exports.CollectibleType.FRIEND_BALL = 382
____exports.CollectibleType[____exports.CollectibleType.FRIEND_BALL] = "FRIEND_BALL"
____exports.CollectibleType.TEAR_DETONATOR = 383
____exports.CollectibleType[____exports.CollectibleType.TEAR_DETONATOR] = "TEAR_DETONATOR"
____exports.CollectibleType.LIL_GURDY = 384
____exports.CollectibleType[____exports.CollectibleType.LIL_GURDY] = "LIL_GURDY"
____exports.CollectibleType.BUMBO = 385
____exports.CollectibleType[____exports.CollectibleType.BUMBO] = "BUMBO"
____exports.CollectibleType.D12 = 386
____exports.CollectibleType[____exports.CollectibleType.D12] = "D12"
____exports.CollectibleType.CENSER = 387
____exports.CollectibleType[____exports.CollectibleType.CENSER] = "CENSER"
____exports.CollectibleType.KEY_BUM = 388
____exports.CollectibleType[____exports.CollectibleType.KEY_BUM] = "KEY_BUM"
____exports.CollectibleType.RUNE_BAG = 389
____exports.CollectibleType[____exports.CollectibleType.RUNE_BAG] = "RUNE_BAG"
____exports.CollectibleType.SERAPHIM = 390
____exports.CollectibleType[____exports.CollectibleType.SERAPHIM] = "SERAPHIM"
____exports.CollectibleType.BETRAYAL = 391
____exports.CollectibleType[____exports.CollectibleType.BETRAYAL] = "BETRAYAL"
____exports.CollectibleType.ZODIAC = 392
____exports.CollectibleType[____exports.CollectibleType.ZODIAC] = "ZODIAC"
____exports.CollectibleType.SERPENTS_KISS = 393
____exports.CollectibleType[____exports.CollectibleType.SERPENTS_KISS] = "SERPENTS_KISS"
____exports.CollectibleType.MARKED = 394
____exports.CollectibleType[____exports.CollectibleType.MARKED] = "MARKED"
____exports.CollectibleType.TECH_X = 395
____exports.CollectibleType[____exports.CollectibleType.TECH_X] = "TECH_X"
____exports.CollectibleType.VENTRICLE_RAZOR = 396
____exports.CollectibleType[____exports.CollectibleType.VENTRICLE_RAZOR] = "VENTRICLE_RAZOR"
____exports.CollectibleType.TRACTOR_BEAM = 397
____exports.CollectibleType[____exports.CollectibleType.TRACTOR_BEAM] = "TRACTOR_BEAM"
____exports.CollectibleType.GODS_FLESH = 398
____exports.CollectibleType[____exports.CollectibleType.GODS_FLESH] = "GODS_FLESH"
____exports.CollectibleType.MAW_OF_THE_VOID = 399
____exports.CollectibleType[____exports.CollectibleType.MAW_OF_THE_VOID] = "MAW_OF_THE_VOID"
____exports.CollectibleType.SPEAR_OF_DESTINY = 400
____exports.CollectibleType[____exports.CollectibleType.SPEAR_OF_DESTINY] = "SPEAR_OF_DESTINY"
____exports.CollectibleType.EXPLOSIVO = 401
____exports.CollectibleType[____exports.CollectibleType.EXPLOSIVO] = "EXPLOSIVO"
____exports.CollectibleType.CHAOS = 402
____exports.CollectibleType[____exports.CollectibleType.CHAOS] = "CHAOS"
____exports.CollectibleType.SPIDER_MOD = 403
____exports.CollectibleType[____exports.CollectibleType.SPIDER_MOD] = "SPIDER_MOD"
____exports.CollectibleType.FARTING_BABY = 404
____exports.CollectibleType[____exports.CollectibleType.FARTING_BABY] = "FARTING_BABY"
____exports.CollectibleType.GB_BUG = 405
____exports.CollectibleType[____exports.CollectibleType.GB_BUG] = "GB_BUG"
____exports.CollectibleType.D8 = 406
____exports.CollectibleType[____exports.CollectibleType.D8] = "D8"
____exports.CollectibleType.PURITY = 407
____exports.CollectibleType[____exports.CollectibleType.PURITY] = "PURITY"
____exports.CollectibleType.ATHAME = 408
____exports.CollectibleType[____exports.CollectibleType.ATHAME] = "ATHAME"
____exports.CollectibleType.EMPTY_VESSEL = 409
____exports.CollectibleType[____exports.CollectibleType.EMPTY_VESSEL] = "EMPTY_VESSEL"
____exports.CollectibleType.EVIL_EYE = 410
____exports.CollectibleType[____exports.CollectibleType.EVIL_EYE] = "EVIL_EYE"
____exports.CollectibleType.LUSTY_BLOOD = 411
____exports.CollectibleType[____exports.CollectibleType.LUSTY_BLOOD] = "LUSTY_BLOOD"
____exports.CollectibleType.CAMBION_CONCEPTION = 412
____exports.CollectibleType[____exports.CollectibleType.CAMBION_CONCEPTION] = "CAMBION_CONCEPTION"
____exports.CollectibleType.IMMACULATE_CONCEPTION = 413
____exports.CollectibleType[____exports.CollectibleType.IMMACULATE_CONCEPTION] = "IMMACULATE_CONCEPTION"
____exports.CollectibleType.MORE_OPTIONS = 414
____exports.CollectibleType[____exports.CollectibleType.MORE_OPTIONS] = "MORE_OPTIONS"
____exports.CollectibleType.CROWN_OF_LIGHT = 415
____exports.CollectibleType[____exports.CollectibleType.CROWN_OF_LIGHT] = "CROWN_OF_LIGHT"
____exports.CollectibleType.DEEP_POCKETS = 416
____exports.CollectibleType[____exports.CollectibleType.DEEP_POCKETS] = "DEEP_POCKETS"
____exports.CollectibleType.SUCCUBUS = 417
____exports.CollectibleType[____exports.CollectibleType.SUCCUBUS] = "SUCCUBUS"
____exports.CollectibleType.FRUIT_CAKE = 418
____exports.CollectibleType[____exports.CollectibleType.FRUIT_CAKE] = "FRUIT_CAKE"
____exports.CollectibleType.TELEPORT_2 = 419
____exports.CollectibleType[____exports.CollectibleType.TELEPORT_2] = "TELEPORT_2"
____exports.CollectibleType.BLACK_POWDER = 420
____exports.CollectibleType[____exports.CollectibleType.BLACK_POWDER] = "BLACK_POWDER"
____exports.CollectibleType.KIDNEY_BEAN = 421
____exports.CollectibleType[____exports.CollectibleType.KIDNEY_BEAN] = "KIDNEY_BEAN"
____exports.CollectibleType.GLOWING_HOUR_GLASS = 422
____exports.CollectibleType[____exports.CollectibleType.GLOWING_HOUR_GLASS] = "GLOWING_HOUR_GLASS"
____exports.CollectibleType.CIRCLE_OF_PROTECTION = 423
____exports.CollectibleType[____exports.CollectibleType.CIRCLE_OF_PROTECTION] = "CIRCLE_OF_PROTECTION"
____exports.CollectibleType.SACK_HEAD = 424
____exports.CollectibleType[____exports.CollectibleType.SACK_HEAD] = "SACK_HEAD"
____exports.CollectibleType.NIGHT_LIGHT = 425
____exports.CollectibleType[____exports.CollectibleType.NIGHT_LIGHT] = "NIGHT_LIGHT"
____exports.CollectibleType.OBSESSED_FAN = 426
____exports.CollectibleType[____exports.CollectibleType.OBSESSED_FAN] = "OBSESSED_FAN"
____exports.CollectibleType.MINE_CRAFTER = 427
____exports.CollectibleType[____exports.CollectibleType.MINE_CRAFTER] = "MINE_CRAFTER"
____exports.CollectibleType.PJS = 428
____exports.CollectibleType[____exports.CollectibleType.PJS] = "PJS"
____exports.CollectibleType.HEAD_OF_THE_KEEPER = 429
____exports.CollectibleType[____exports.CollectibleType.HEAD_OF_THE_KEEPER] = "HEAD_OF_THE_KEEPER"
____exports.CollectibleType.PAPA_FLY = 430
____exports.CollectibleType[____exports.CollectibleType.PAPA_FLY] = "PAPA_FLY"
____exports.CollectibleType.MULTIDIMENSIONAL_BABY = 431
____exports.CollectibleType[____exports.CollectibleType.MULTIDIMENSIONAL_BABY] = "MULTIDIMENSIONAL_BABY"
____exports.CollectibleType.GLITTER_BOMBS = 432
____exports.CollectibleType[____exports.CollectibleType.GLITTER_BOMBS] = "GLITTER_BOMBS"
____exports.CollectibleType.MY_SHADOW = 433
____exports.CollectibleType[____exports.CollectibleType.MY_SHADOW] = "MY_SHADOW"
____exports.CollectibleType.JAR_OF_FLIES = 434
____exports.CollectibleType[____exports.CollectibleType.JAR_OF_FLIES] = "JAR_OF_FLIES"
____exports.CollectibleType.LIL_LOKI = 435
____exports.CollectibleType[____exports.CollectibleType.LIL_LOKI] = "LIL_LOKI"
____exports.CollectibleType.MILK = 436
____exports.CollectibleType[____exports.CollectibleType.MILK] = "MILK"
____exports.CollectibleType.D7 = 437
____exports.CollectibleType[____exports.CollectibleType.D7] = "D7"
____exports.CollectibleType.BINKY = 438
____exports.CollectibleType[____exports.CollectibleType.BINKY] = "BINKY"
____exports.CollectibleType.MOMS_BOX = 439
____exports.CollectibleType[____exports.CollectibleType.MOMS_BOX] = "MOMS_BOX"
____exports.CollectibleType.KIDNEY_STONE = 440
____exports.CollectibleType[____exports.CollectibleType.KIDNEY_STONE] = "KIDNEY_STONE"
____exports.CollectibleType.MEGA_BLAST = 441
____exports.CollectibleType[____exports.CollectibleType.MEGA_BLAST] = "MEGA_BLAST"
____exports.CollectibleType.DARK_PRINCES_CROWN = 442
____exports.CollectibleType[____exports.CollectibleType.DARK_PRINCES_CROWN] = "DARK_PRINCES_CROWN"
____exports.CollectibleType.APPLE = 443
____exports.CollectibleType[____exports.CollectibleType.APPLE] = "APPLE"
____exports.CollectibleType.LEAD_PENCIL = 444
____exports.CollectibleType[____exports.CollectibleType.LEAD_PENCIL] = "LEAD_PENCIL"
____exports.CollectibleType.DOG_TOOTH = 445
____exports.CollectibleType[____exports.CollectibleType.DOG_TOOTH] = "DOG_TOOTH"
____exports.CollectibleType.DEAD_TOOTH = 446
____exports.CollectibleType[____exports.CollectibleType.DEAD_TOOTH] = "DEAD_TOOTH"
____exports.CollectibleType.LINGER_BEAN = 447
____exports.CollectibleType[____exports.CollectibleType.LINGER_BEAN] = "LINGER_BEAN"
____exports.CollectibleType.SHARD_OF_GLASS = 448
____exports.CollectibleType[____exports.CollectibleType.SHARD_OF_GLASS] = "SHARD_OF_GLASS"
____exports.CollectibleType.METAL_PLATE = 449
____exports.CollectibleType[____exports.CollectibleType.METAL_PLATE] = "METAL_PLATE"
____exports.CollectibleType.EYE_OF_GREED = 450
____exports.CollectibleType[____exports.CollectibleType.EYE_OF_GREED] = "EYE_OF_GREED"
____exports.CollectibleType.TAROT_CLOTH = 451
____exports.CollectibleType[____exports.CollectibleType.TAROT_CLOTH] = "TAROT_CLOTH"
____exports.CollectibleType.VARICOSE_VEINS = 452
____exports.CollectibleType[____exports.CollectibleType.VARICOSE_VEINS] = "VARICOSE_VEINS"
____exports.CollectibleType.COMPOUND_FRACTURE = 453
____exports.CollectibleType[____exports.CollectibleType.COMPOUND_FRACTURE] = "COMPOUND_FRACTURE"
____exports.CollectibleType.POLYDACTYLY = 454
____exports.CollectibleType[____exports.CollectibleType.POLYDACTYLY] = "POLYDACTYLY"
____exports.CollectibleType.DADS_LOST_COIN = 455
____exports.CollectibleType[____exports.CollectibleType.DADS_LOST_COIN] = "DADS_LOST_COIN"
____exports.CollectibleType.MIDNIGHT_SNACK = 456
____exports.CollectibleType[____exports.CollectibleType.MIDNIGHT_SNACK] = "MIDNIGHT_SNACK"
____exports.CollectibleType.CONE_HEAD = 457
____exports.CollectibleType[____exports.CollectibleType.CONE_HEAD] = "CONE_HEAD"
____exports.CollectibleType.BELLY_BUTTON = 458
____exports.CollectibleType[____exports.CollectibleType.BELLY_BUTTON] = "BELLY_BUTTON"
____exports.CollectibleType.SINUS_INFECTION = 459
____exports.CollectibleType[____exports.CollectibleType.SINUS_INFECTION] = "SINUS_INFECTION"
____exports.CollectibleType.GLAUCOMA = 460
____exports.CollectibleType[____exports.CollectibleType.GLAUCOMA] = "GLAUCOMA"
____exports.CollectibleType.PARASITOID = 461
____exports.CollectibleType[____exports.CollectibleType.PARASITOID] = "PARASITOID"
____exports.CollectibleType.EYE_OF_BELIAL = 462
____exports.CollectibleType[____exports.CollectibleType.EYE_OF_BELIAL] = "EYE_OF_BELIAL"
____exports.CollectibleType.SULFURIC_ACID = 463
____exports.CollectibleType[____exports.CollectibleType.SULFURIC_ACID] = "SULFURIC_ACID"
____exports.CollectibleType.GLYPH_OF_BALANCE = 464
____exports.CollectibleType[____exports.CollectibleType.GLYPH_OF_BALANCE] = "GLYPH_OF_BALANCE"
____exports.CollectibleType.ANALOG_STICK = 465
____exports.CollectibleType[____exports.CollectibleType.ANALOG_STICK] = "ANALOG_STICK"
____exports.CollectibleType.CONTAGION = 466
____exports.CollectibleType[____exports.CollectibleType.CONTAGION] = "CONTAGION"
____exports.CollectibleType.FINGER = 467
____exports.CollectibleType[____exports.CollectibleType.FINGER] = "FINGER"
____exports.CollectibleType.SHADE = 468
____exports.CollectibleType[____exports.CollectibleType.SHADE] = "SHADE"
____exports.CollectibleType.DEPRESSION = 469
____exports.CollectibleType[____exports.CollectibleType.DEPRESSION] = "DEPRESSION"
____exports.CollectibleType.HUSHY = 470
____exports.CollectibleType[____exports.CollectibleType.HUSHY] = "HUSHY"
____exports.CollectibleType.LIL_MONSTRO = 471
____exports.CollectibleType[____exports.CollectibleType.LIL_MONSTRO] = "LIL_MONSTRO"
____exports.CollectibleType.KING_BABY = 472
____exports.CollectibleType[____exports.CollectibleType.KING_BABY] = "KING_BABY"
____exports.CollectibleType.BIG_CHUBBY = 473
____exports.CollectibleType[____exports.CollectibleType.BIG_CHUBBY] = "BIG_CHUBBY"
____exports.CollectibleType.BROKEN_GLASS_CANNON = 474
____exports.CollectibleType[____exports.CollectibleType.BROKEN_GLASS_CANNON] = "BROKEN_GLASS_CANNON"
____exports.CollectibleType.PLAN_C = 475
____exports.CollectibleType[____exports.CollectibleType.PLAN_C] = "PLAN_C"
____exports.CollectibleType.D1 = 476
____exports.CollectibleType[____exports.CollectibleType.D1] = "D1"
____exports.CollectibleType.VOID = 477
____exports.CollectibleType[____exports.CollectibleType.VOID] = "VOID"
____exports.CollectibleType.PAUSE = 478
____exports.CollectibleType[____exports.CollectibleType.PAUSE] = "PAUSE"
____exports.CollectibleType.SMELTER = 479
____exports.CollectibleType[____exports.CollectibleType.SMELTER] = "SMELTER"
____exports.CollectibleType.COMPOST = 480
____exports.CollectibleType[____exports.CollectibleType.COMPOST] = "COMPOST"
____exports.CollectibleType.DATAMINER = 481
____exports.CollectibleType[____exports.CollectibleType.DATAMINER] = "DATAMINER"
____exports.CollectibleType.CLICKER = 482
____exports.CollectibleType[____exports.CollectibleType.CLICKER] = "CLICKER"
____exports.CollectibleType.MAMA_MEGA = 483
____exports.CollectibleType[____exports.CollectibleType.MAMA_MEGA] = "MAMA_MEGA"
____exports.CollectibleType.WAIT_WHAT = 484
____exports.CollectibleType[____exports.CollectibleType.WAIT_WHAT] = "WAIT_WHAT"
____exports.CollectibleType.CROOKED_PENNY = 485
____exports.CollectibleType[____exports.CollectibleType.CROOKED_PENNY] = "CROOKED_PENNY"
____exports.CollectibleType.DULL_RAZOR = 486
____exports.CollectibleType[____exports.CollectibleType.DULL_RAZOR] = "DULL_RAZOR"
____exports.CollectibleType.POTATO_PEELER = 487
____exports.CollectibleType[____exports.CollectibleType.POTATO_PEELER] = "POTATO_PEELER"
____exports.CollectibleType.METRONOME = 488
____exports.CollectibleType[____exports.CollectibleType.METRONOME] = "METRONOME"
____exports.CollectibleType.D_INFINITY = 489
____exports.CollectibleType[____exports.CollectibleType.D_INFINITY] = "D_INFINITY"
____exports.CollectibleType.EDENS_SOUL = 490
____exports.CollectibleType[____exports.CollectibleType.EDENS_SOUL] = "EDENS_SOUL"
____exports.CollectibleType.ACID_BABY = 491
____exports.CollectibleType[____exports.CollectibleType.ACID_BABY] = "ACID_BABY"
____exports.CollectibleType.YO_LISTEN = 492
____exports.CollectibleType[____exports.CollectibleType.YO_LISTEN] = "YO_LISTEN"
____exports.CollectibleType.ADRENALINE = 493
____exports.CollectibleType[____exports.CollectibleType.ADRENALINE] = "ADRENALINE"
____exports.CollectibleType.JACOBS_LADDER = 494
____exports.CollectibleType[____exports.CollectibleType.JACOBS_LADDER] = "JACOBS_LADDER"
____exports.CollectibleType.GHOST_PEPPER = 495
____exports.CollectibleType[____exports.CollectibleType.GHOST_PEPPER] = "GHOST_PEPPER"
____exports.CollectibleType.EUTHANASIA = 496
____exports.CollectibleType[____exports.CollectibleType.EUTHANASIA] = "EUTHANASIA"
____exports.CollectibleType.CAMO_UNDIES = 497
____exports.CollectibleType[____exports.CollectibleType.CAMO_UNDIES] = "CAMO_UNDIES"
____exports.CollectibleType.DUALITY = 498
____exports.CollectibleType[____exports.CollectibleType.DUALITY] = "DUALITY"
____exports.CollectibleType.EUCHARIST = 499
____exports.CollectibleType[____exports.CollectibleType.EUCHARIST] = "EUCHARIST"
____exports.CollectibleType.SACK_OF_SACKS = 500
____exports.CollectibleType[____exports.CollectibleType.SACK_OF_SACKS] = "SACK_OF_SACKS"
____exports.CollectibleType.GREEDS_GULLET = 501
____exports.CollectibleType[____exports.CollectibleType.GREEDS_GULLET] = "GREEDS_GULLET"
____exports.CollectibleType.LARGE_ZIT = 502
____exports.CollectibleType[____exports.CollectibleType.LARGE_ZIT] = "LARGE_ZIT"
____exports.CollectibleType.LITTLE_HORN = 503
____exports.CollectibleType[____exports.CollectibleType.LITTLE_HORN] = "LITTLE_HORN"
____exports.CollectibleType.BROWN_NUGGET = 504
____exports.CollectibleType[____exports.CollectibleType.BROWN_NUGGET] = "BROWN_NUGGET"
____exports.CollectibleType.POKE_GO = 505
____exports.CollectibleType[____exports.CollectibleType.POKE_GO] = "POKE_GO"
____exports.CollectibleType.BACKSTABBER = 506
____exports.CollectibleType[____exports.CollectibleType.BACKSTABBER] = "BACKSTABBER"
____exports.CollectibleType.SHARP_STRAW = 507
____exports.CollectibleType[____exports.CollectibleType.SHARP_STRAW] = "SHARP_STRAW"
____exports.CollectibleType.MOMS_RAZOR = 508
____exports.CollectibleType[____exports.CollectibleType.MOMS_RAZOR] = "MOMS_RAZOR"
____exports.CollectibleType.BLOODSHOT_EYE = 509
____exports.CollectibleType[____exports.CollectibleType.BLOODSHOT_EYE] = "BLOODSHOT_EYE"
____exports.CollectibleType.DELIRIOUS = 510
____exports.CollectibleType[____exports.CollectibleType.DELIRIOUS] = "DELIRIOUS"
____exports.CollectibleType.ANGRY_FLY = 511
____exports.CollectibleType[____exports.CollectibleType.ANGRY_FLY] = "ANGRY_FLY"
____exports.CollectibleType.BLACK_HOLE = 512
____exports.CollectibleType[____exports.CollectibleType.BLACK_HOLE] = "BLACK_HOLE"
____exports.CollectibleType.BOZO = 513
____exports.CollectibleType[____exports.CollectibleType.BOZO] = "BOZO"
____exports.CollectibleType.BROKEN_MODEM = 514
____exports.CollectibleType[____exports.CollectibleType.BROKEN_MODEM] = "BROKEN_MODEM"
____exports.CollectibleType.MYSTERY_GIFT = 515
____exports.CollectibleType[____exports.CollectibleType.MYSTERY_GIFT] = "MYSTERY_GIFT"
____exports.CollectibleType.SPRINKLER = 516
____exports.CollectibleType[____exports.CollectibleType.SPRINKLER] = "SPRINKLER"
____exports.CollectibleType.FAST_BOMBS = 517
____exports.CollectibleType[____exports.CollectibleType.FAST_BOMBS] = "FAST_BOMBS"
____exports.CollectibleType.BUDDY_IN_A_BOX = 518
____exports.CollectibleType[____exports.CollectibleType.BUDDY_IN_A_BOX] = "BUDDY_IN_A_BOX"
____exports.CollectibleType.LIL_DELIRIUM = 519
____exports.CollectibleType[____exports.CollectibleType.LIL_DELIRIUM] = "LIL_DELIRIUM"
____exports.CollectibleType.JUMPER_CABLES = 520
____exports.CollectibleType[____exports.CollectibleType.JUMPER_CABLES] = "JUMPER_CABLES"
____exports.CollectibleType.COUPON = 521
____exports.CollectibleType[____exports.CollectibleType.COUPON] = "COUPON"
____exports.CollectibleType.TELEKINESIS = 522
____exports.CollectibleType[____exports.CollectibleType.TELEKINESIS] = "TELEKINESIS"
____exports.CollectibleType.MOVING_BOX = 523
____exports.CollectibleType[____exports.CollectibleType.MOVING_BOX] = "MOVING_BOX"
____exports.CollectibleType.TECHNOLOGY_ZERO = 524
____exports.CollectibleType[____exports.CollectibleType.TECHNOLOGY_ZERO] = "TECHNOLOGY_ZERO"
____exports.CollectibleType.LEPROSY = 525
____exports.CollectibleType[____exports.CollectibleType.LEPROSY] = "LEPROSY"
____exports.CollectibleType.SEVEN_SEALS = 526
____exports.CollectibleType[____exports.CollectibleType.SEVEN_SEALS] = "SEVEN_SEALS"
____exports.CollectibleType.MR_ME = 527
____exports.CollectibleType[____exports.CollectibleType.MR_ME] = "MR_ME"
____exports.CollectibleType.ANGELIC_PRISM = 528
____exports.CollectibleType[____exports.CollectibleType.ANGELIC_PRISM] = "ANGELIC_PRISM"
____exports.CollectibleType.POP = 529
____exports.CollectibleType[____exports.CollectibleType.POP] = "POP"
____exports.CollectibleType.DEATHS_LIST = 530
____exports.CollectibleType[____exports.CollectibleType.DEATHS_LIST] = "DEATHS_LIST"
____exports.CollectibleType.HAEMOLACRIA = 531
____exports.CollectibleType[____exports.CollectibleType.HAEMOLACRIA] = "HAEMOLACRIA"
____exports.CollectibleType.LACHRYPHAGY = 532
____exports.CollectibleType[____exports.CollectibleType.LACHRYPHAGY] = "LACHRYPHAGY"
____exports.CollectibleType.TRISAGION = 533
____exports.CollectibleType[____exports.CollectibleType.TRISAGION] = "TRISAGION"
____exports.CollectibleType.SCHOOLBAG = 534
____exports.CollectibleType[____exports.CollectibleType.SCHOOLBAG] = "SCHOOLBAG"
____exports.CollectibleType.BLANKET = 535
____exports.CollectibleType[____exports.CollectibleType.BLANKET] = "BLANKET"
____exports.CollectibleType.SACRIFICIAL_ALTAR = 536
____exports.CollectibleType[____exports.CollectibleType.SACRIFICIAL_ALTAR] = "SACRIFICIAL_ALTAR"
____exports.CollectibleType.LIL_SPEWER = 537
____exports.CollectibleType[____exports.CollectibleType.LIL_SPEWER] = "LIL_SPEWER"
____exports.CollectibleType.MARBLES = 538
____exports.CollectibleType[____exports.CollectibleType.MARBLES] = "MARBLES"
____exports.CollectibleType.MYSTERY_EGG = 539
____exports.CollectibleType[____exports.CollectibleType.MYSTERY_EGG] = "MYSTERY_EGG"
____exports.CollectibleType.FLAT_STONE = 540
____exports.CollectibleType[____exports.CollectibleType.FLAT_STONE] = "FLAT_STONE"
____exports.CollectibleType.MARROW = 541
____exports.CollectibleType[____exports.CollectibleType.MARROW] = "MARROW"
____exports.CollectibleType.SLIPPED_RIB = 542
____exports.CollectibleType[____exports.CollectibleType.SLIPPED_RIB] = "SLIPPED_RIB"
____exports.CollectibleType.HALLOWED_GROUND = 543
____exports.CollectibleType[____exports.CollectibleType.HALLOWED_GROUND] = "HALLOWED_GROUND"
____exports.CollectibleType.POINTY_RIB = 544
____exports.CollectibleType[____exports.CollectibleType.POINTY_RIB] = "POINTY_RIB"
____exports.CollectibleType.BOOK_OF_THE_DEAD = 545
____exports.CollectibleType[____exports.CollectibleType.BOOK_OF_THE_DEAD] = "BOOK_OF_THE_DEAD"
____exports.CollectibleType.DADS_RING = 546
____exports.CollectibleType[____exports.CollectibleType.DADS_RING] = "DADS_RING"
____exports.CollectibleType.DIVORCE_PAPERS = 547
____exports.CollectibleType[____exports.CollectibleType.DIVORCE_PAPERS] = "DIVORCE_PAPERS"
____exports.CollectibleType.JAW_BONE = 548
____exports.CollectibleType[____exports.CollectibleType.JAW_BONE] = "JAW_BONE"
____exports.CollectibleType.BRITTLE_BONES = 549
____exports.CollectibleType[____exports.CollectibleType.BRITTLE_BONES] = "BRITTLE_BONES"
____exports.CollectibleType.BROKEN_SHOVEL_1 = 550
____exports.CollectibleType[____exports.CollectibleType.BROKEN_SHOVEL_1] = "BROKEN_SHOVEL_1"
____exports.CollectibleType.BROKEN_SHOVEL_2 = 551
____exports.CollectibleType[____exports.CollectibleType.BROKEN_SHOVEL_2] = "BROKEN_SHOVEL_2"
____exports.CollectibleType.MOMS_SHOVEL = 552
____exports.CollectibleType[____exports.CollectibleType.MOMS_SHOVEL] = "MOMS_SHOVEL"
____exports.CollectibleType.MUCORMYCOSIS = 553
____exports.CollectibleType[____exports.CollectibleType.MUCORMYCOSIS] = "MUCORMYCOSIS"
____exports.CollectibleType.TWO_SPOOKY = 554
____exports.CollectibleType[____exports.CollectibleType.TWO_SPOOKY] = "TWO_SPOOKY"
____exports.CollectibleType.GOLDEN_RAZOR = 555
____exports.CollectibleType[____exports.CollectibleType.GOLDEN_RAZOR] = "GOLDEN_RAZOR"
____exports.CollectibleType.SULFUR = 556
____exports.CollectibleType[____exports.CollectibleType.SULFUR] = "SULFUR"
____exports.CollectibleType.FORTUNE_COOKIE = 557
____exports.CollectibleType[____exports.CollectibleType.FORTUNE_COOKIE] = "FORTUNE_COOKIE"
____exports.CollectibleType.EYE_SORE = 558
____exports.CollectibleType[____exports.CollectibleType.EYE_SORE] = "EYE_SORE"
____exports.CollectibleType.ONE_HUNDRED_TWENTY_VOLT = 559
____exports.CollectibleType[____exports.CollectibleType.ONE_HUNDRED_TWENTY_VOLT] = "ONE_HUNDRED_TWENTY_VOLT"
____exports.CollectibleType.IT_HURTS = 560
____exports.CollectibleType[____exports.CollectibleType.IT_HURTS] = "IT_HURTS"
____exports.CollectibleType.ALMOND_MILK = 561
____exports.CollectibleType[____exports.CollectibleType.ALMOND_MILK] = "ALMOND_MILK"
____exports.CollectibleType.ROCK_BOTTOM = 562
____exports.CollectibleType[____exports.CollectibleType.ROCK_BOTTOM] = "ROCK_BOTTOM"
____exports.CollectibleType.NANCY_BOMBS = 563
____exports.CollectibleType[____exports.CollectibleType.NANCY_BOMBS] = "NANCY_BOMBS"
____exports.CollectibleType.BAR_OF_SOAP = 564
____exports.CollectibleType[____exports.CollectibleType.BAR_OF_SOAP] = "BAR_OF_SOAP"
____exports.CollectibleType.BLOOD_PUPPY = 565
____exports.CollectibleType[____exports.CollectibleType.BLOOD_PUPPY] = "BLOOD_PUPPY"
____exports.CollectibleType.DREAM_CATCHER = 566
____exports.CollectibleType[____exports.CollectibleType.DREAM_CATCHER] = "DREAM_CATCHER"
____exports.CollectibleType.PASCHAL_CANDLE = 567
____exports.CollectibleType[____exports.CollectibleType.PASCHAL_CANDLE] = "PASCHAL_CANDLE"
____exports.CollectibleType.DIVINE_INTERVENTION = 568
____exports.CollectibleType[____exports.CollectibleType.DIVINE_INTERVENTION] = "DIVINE_INTERVENTION"
____exports.CollectibleType.BLOOD_OATH = 569
____exports.CollectibleType[____exports.CollectibleType.BLOOD_OATH] = "BLOOD_OATH"
____exports.CollectibleType.PLAYDOUGH_COOKIE = 570
____exports.CollectibleType[____exports.CollectibleType.PLAYDOUGH_COOKIE] = "PLAYDOUGH_COOKIE"
____exports.CollectibleType.SOCKS = 571
____exports.CollectibleType[____exports.CollectibleType.SOCKS] = "SOCKS"
____exports.CollectibleType.EYE_OF_THE_OCCULT = 572
____exports.CollectibleType[____exports.CollectibleType.EYE_OF_THE_OCCULT] = "EYE_OF_THE_OCCULT"
____exports.CollectibleType.IMMACULATE_HEART = 573
____exports.CollectibleType[____exports.CollectibleType.IMMACULATE_HEART] = "IMMACULATE_HEART"
____exports.CollectibleType.MONSTRANCE = 574
____exports.CollectibleType[____exports.CollectibleType.MONSTRANCE] = "MONSTRANCE"
____exports.CollectibleType.INTRUDER = 575
____exports.CollectibleType[____exports.CollectibleType.INTRUDER] = "INTRUDER"
____exports.CollectibleType.DIRTY_MIND = 576
____exports.CollectibleType[____exports.CollectibleType.DIRTY_MIND] = "DIRTY_MIND"
____exports.CollectibleType.DAMOCLES = 577
____exports.CollectibleType[____exports.CollectibleType.DAMOCLES] = "DAMOCLES"
____exports.CollectibleType.FREE_LEMONADE = 578
____exports.CollectibleType[____exports.CollectibleType.FREE_LEMONADE] = "FREE_LEMONADE"
____exports.CollectibleType.SPIRIT_SWORD = 579
____exports.CollectibleType[____exports.CollectibleType.SPIRIT_SWORD] = "SPIRIT_SWORD"
____exports.CollectibleType.RED_KEY = 580
____exports.CollectibleType[____exports.CollectibleType.RED_KEY] = "RED_KEY"
____exports.CollectibleType.PSY_FLY = 581
____exports.CollectibleType[____exports.CollectibleType.PSY_FLY] = "PSY_FLY"
____exports.CollectibleType.WAVY_CAP = 582
____exports.CollectibleType[____exports.CollectibleType.WAVY_CAP] = "WAVY_CAP"
____exports.CollectibleType.ROCKET_IN_A_JAR = 583
____exports.CollectibleType[____exports.CollectibleType.ROCKET_IN_A_JAR] = "ROCKET_IN_A_JAR"
____exports.CollectibleType.BOOK_OF_VIRTUES = 584
____exports.CollectibleType[____exports.CollectibleType.BOOK_OF_VIRTUES] = "BOOK_OF_VIRTUES"
____exports.CollectibleType.ALABASTER_BOX = 585
____exports.CollectibleType[____exports.CollectibleType.ALABASTER_BOX] = "ALABASTER_BOX"
____exports.CollectibleType.STAIRWAY = 586
____exports.CollectibleType[____exports.CollectibleType.STAIRWAY] = "STAIRWAY"
____exports.CollectibleType.SOL = 588
____exports.CollectibleType[____exports.CollectibleType.SOL] = "SOL"
____exports.CollectibleType.LUNA = 589
____exports.CollectibleType[____exports.CollectibleType.LUNA] = "LUNA"
____exports.CollectibleType.MERCURIUS = 590
____exports.CollectibleType[____exports.CollectibleType.MERCURIUS] = "MERCURIUS"
____exports.CollectibleType.VENUS = 591
____exports.CollectibleType[____exports.CollectibleType.VENUS] = "VENUS"
____exports.CollectibleType.TERRA = 592
____exports.CollectibleType[____exports.CollectibleType.TERRA] = "TERRA"
____exports.CollectibleType.MARS = 593
____exports.CollectibleType[____exports.CollectibleType.MARS] = "MARS"
____exports.CollectibleType.JUPITER = 594
____exports.CollectibleType[____exports.CollectibleType.JUPITER] = "JUPITER"
____exports.CollectibleType.SATURNUS = 595
____exports.CollectibleType[____exports.CollectibleType.SATURNUS] = "SATURNUS"
____exports.CollectibleType.URANUS = 596
____exports.CollectibleType[____exports.CollectibleType.URANUS] = "URANUS"
____exports.CollectibleType.NEPTUNUS = 597
____exports.CollectibleType[____exports.CollectibleType.NEPTUNUS] = "NEPTUNUS"
____exports.CollectibleType.PLUTO = 598
____exports.CollectibleType[____exports.CollectibleType.PLUTO] = "PLUTO"
____exports.CollectibleType.VOODOO_HEAD = 599
____exports.CollectibleType[____exports.CollectibleType.VOODOO_HEAD] = "VOODOO_HEAD"
____exports.CollectibleType.EYE_DROPS = 600
____exports.CollectibleType[____exports.CollectibleType.EYE_DROPS] = "EYE_DROPS"
____exports.CollectibleType.ACT_OF_CONTRITION = 601
____exports.CollectibleType[____exports.CollectibleType.ACT_OF_CONTRITION] = "ACT_OF_CONTRITION"
____exports.CollectibleType.MEMBER_CARD = 602
____exports.CollectibleType[____exports.CollectibleType.MEMBER_CARD] = "MEMBER_CARD"
____exports.CollectibleType.BATTERY_PACK = 603
____exports.CollectibleType[____exports.CollectibleType.BATTERY_PACK] = "BATTERY_PACK"
____exports.CollectibleType.MOMS_BRACELET = 604
____exports.CollectibleType[____exports.CollectibleType.MOMS_BRACELET] = "MOMS_BRACELET"
____exports.CollectibleType.SCOOPER = 605
____exports.CollectibleType[____exports.CollectibleType.SCOOPER] = "SCOOPER"
____exports.CollectibleType.OCULAR_RIFT = 606
____exports.CollectibleType[____exports.CollectibleType.OCULAR_RIFT] = "OCULAR_RIFT"
____exports.CollectibleType.BOILED_BABY = 607
____exports.CollectibleType[____exports.CollectibleType.BOILED_BABY] = "BOILED_BABY"
____exports.CollectibleType.FREEZER_BABY = 608
____exports.CollectibleType[____exports.CollectibleType.FREEZER_BABY] = "FREEZER_BABY"
____exports.CollectibleType.ETERNAL_D6 = 609
____exports.CollectibleType[____exports.CollectibleType.ETERNAL_D6] = "ETERNAL_D6"
____exports.CollectibleType.BIRD_CAGE = 610
____exports.CollectibleType[____exports.CollectibleType.BIRD_CAGE] = "BIRD_CAGE"
____exports.CollectibleType.LARYNX = 611
____exports.CollectibleType[____exports.CollectibleType.LARYNX] = "LARYNX"
____exports.CollectibleType.LOST_SOUL = 612
____exports.CollectibleType[____exports.CollectibleType.LOST_SOUL] = "LOST_SOUL"
____exports.CollectibleType.BLOOD_BOMBS = 614
____exports.CollectibleType[____exports.CollectibleType.BLOOD_BOMBS] = "BLOOD_BOMBS"
____exports.CollectibleType.LIL_DUMPY = 615
____exports.CollectibleType[____exports.CollectibleType.LIL_DUMPY] = "LIL_DUMPY"
____exports.CollectibleType.BIRDS_EYE = 616
____exports.CollectibleType[____exports.CollectibleType.BIRDS_EYE] = "BIRDS_EYE"
____exports.CollectibleType.LODESTONE = 617
____exports.CollectibleType[____exports.CollectibleType.LODESTONE] = "LODESTONE"
____exports.CollectibleType.ROTTEN_TOMATO = 618
____exports.CollectibleType[____exports.CollectibleType.ROTTEN_TOMATO] = "ROTTEN_TOMATO"
____exports.CollectibleType.BIRTHRIGHT = 619
____exports.CollectibleType[____exports.CollectibleType.BIRTHRIGHT] = "BIRTHRIGHT"
____exports.CollectibleType.RED_STEW = 621
____exports.CollectibleType[____exports.CollectibleType.RED_STEW] = "RED_STEW"
____exports.CollectibleType.GENESIS = 622
____exports.CollectibleType[____exports.CollectibleType.GENESIS] = "GENESIS"
____exports.CollectibleType.SHARP_KEY = 623
____exports.CollectibleType[____exports.CollectibleType.SHARP_KEY] = "SHARP_KEY"
____exports.CollectibleType.BOOSTER_PACK = 624
____exports.CollectibleType[____exports.CollectibleType.BOOSTER_PACK] = "BOOSTER_PACK"
____exports.CollectibleType.MEGA_MUSH = 625
____exports.CollectibleType[____exports.CollectibleType.MEGA_MUSH] = "MEGA_MUSH"
____exports.CollectibleType.KNIFE_PIECE_1 = 626
____exports.CollectibleType[____exports.CollectibleType.KNIFE_PIECE_1] = "KNIFE_PIECE_1"
____exports.CollectibleType.KNIFE_PIECE_2 = 627
____exports.CollectibleType[____exports.CollectibleType.KNIFE_PIECE_2] = "KNIFE_PIECE_2"
____exports.CollectibleType.DEATH_CERTIFICATE = 628
____exports.CollectibleType[____exports.CollectibleType.DEATH_CERTIFICATE] = "DEATH_CERTIFICATE"
____exports.CollectibleType.BOT_FLY = 629
____exports.CollectibleType[____exports.CollectibleType.BOT_FLY] = "BOT_FLY"
____exports.CollectibleType.MEAT_CLEAVER = 631
____exports.CollectibleType[____exports.CollectibleType.MEAT_CLEAVER] = "MEAT_CLEAVER"
____exports.CollectibleType.EVIL_CHARM = 632
____exports.CollectibleType[____exports.CollectibleType.EVIL_CHARM] = "EVIL_CHARM"
____exports.CollectibleType.DOGMA = 633
____exports.CollectibleType[____exports.CollectibleType.DOGMA] = "DOGMA"
____exports.CollectibleType.PURGATORY = 634
____exports.CollectibleType[____exports.CollectibleType.PURGATORY] = "PURGATORY"
____exports.CollectibleType.STITCHES = 635
____exports.CollectibleType[____exports.CollectibleType.STITCHES] = "STITCHES"
____exports.CollectibleType.R_KEY = 636
____exports.CollectibleType[____exports.CollectibleType.R_KEY] = "R_KEY"
____exports.CollectibleType.KNOCKOUT_DROPS = 637
____exports.CollectibleType[____exports.CollectibleType.KNOCKOUT_DROPS] = "KNOCKOUT_DROPS"
____exports.CollectibleType.ERASER = 638
____exports.CollectibleType[____exports.CollectibleType.ERASER] = "ERASER"
____exports.CollectibleType.YUCK_HEART = 639
____exports.CollectibleType[____exports.CollectibleType.YUCK_HEART] = "YUCK_HEART"
____exports.CollectibleType.URN_OF_SOULS = 640
____exports.CollectibleType[____exports.CollectibleType.URN_OF_SOULS] = "URN_OF_SOULS"
____exports.CollectibleType.AKELDAMA = 641
____exports.CollectibleType[____exports.CollectibleType.AKELDAMA] = "AKELDAMA"
____exports.CollectibleType.MAGIC_SKIN = 642
____exports.CollectibleType[____exports.CollectibleType.MAGIC_SKIN] = "MAGIC_SKIN"
____exports.CollectibleType.REVELATION = 643
____exports.CollectibleType[____exports.CollectibleType.REVELATION] = "REVELATION"
____exports.CollectibleType.CONSOLATION_PRIZE = 644
____exports.CollectibleType[____exports.CollectibleType.CONSOLATION_PRIZE] = "CONSOLATION_PRIZE"
____exports.CollectibleType.TINYTOMA = 645
____exports.CollectibleType[____exports.CollectibleType.TINYTOMA] = "TINYTOMA"
____exports.CollectibleType.BRIMSTONE_BOMBS = 646
____exports.CollectibleType[____exports.CollectibleType.BRIMSTONE_BOMBS] = "BRIMSTONE_BOMBS"
____exports.CollectibleType.FOUR_FIVE_VOLT = 647
____exports.CollectibleType[____exports.CollectibleType.FOUR_FIVE_VOLT] = "FOUR_FIVE_VOLT"
____exports.CollectibleType.FRUITY_PLUM = 649
____exports.CollectibleType[____exports.CollectibleType.FRUITY_PLUM] = "FRUITY_PLUM"
____exports.CollectibleType.PLUM_FLUTE = 650
____exports.CollectibleType[____exports.CollectibleType.PLUM_FLUTE] = "PLUM_FLUTE"
____exports.CollectibleType.STAR_OF_BETHLEHEM = 651
____exports.CollectibleType[____exports.CollectibleType.STAR_OF_BETHLEHEM] = "STAR_OF_BETHLEHEM"
____exports.CollectibleType.CUBE_BABY = 652
____exports.CollectibleType[____exports.CollectibleType.CUBE_BABY] = "CUBE_BABY"
____exports.CollectibleType.VADE_RETRO = 653
____exports.CollectibleType[____exports.CollectibleType.VADE_RETRO] = "VADE_RETRO"
____exports.CollectibleType.FALSE_PHD = 654
____exports.CollectibleType[____exports.CollectibleType.FALSE_PHD] = "FALSE_PHD"
____exports.CollectibleType.SPIN_TO_WIN = 655
____exports.CollectibleType[____exports.CollectibleType.SPIN_TO_WIN] = "SPIN_TO_WIN"
____exports.CollectibleType.DAMOCLES_PASSIVE = 656
____exports.CollectibleType[____exports.CollectibleType.DAMOCLES_PASSIVE] = "DAMOCLES_PASSIVE"
____exports.CollectibleType.VASCULITIS = 657
____exports.CollectibleType[____exports.CollectibleType.VASCULITIS] = "VASCULITIS"
____exports.CollectibleType.GIANT_CELL = 658
____exports.CollectibleType[____exports.CollectibleType.GIANT_CELL] = "GIANT_CELL"
____exports.CollectibleType.TROPICAMIDE = 659
____exports.CollectibleType[____exports.CollectibleType.TROPICAMIDE] = "TROPICAMIDE"
____exports.CollectibleType.CARD_READING = 660
____exports.CollectibleType[____exports.CollectibleType.CARD_READING] = "CARD_READING"
____exports.CollectibleType.QUINTS = 661
____exports.CollectibleType[____exports.CollectibleType.QUINTS] = "QUINTS"
____exports.CollectibleType.TOOTH_AND_NAIL = 663
____exports.CollectibleType[____exports.CollectibleType.TOOTH_AND_NAIL] = "TOOTH_AND_NAIL"
____exports.CollectibleType.BINGE_EATER = 664
____exports.CollectibleType[____exports.CollectibleType.BINGE_EATER] = "BINGE_EATER"
____exports.CollectibleType.GUPPYS_EYE = 665
____exports.CollectibleType[____exports.CollectibleType.GUPPYS_EYE] = "GUPPYS_EYE"
____exports.CollectibleType.STRAWMAN = 667
____exports.CollectibleType[____exports.CollectibleType.STRAWMAN] = "STRAWMAN"
____exports.CollectibleType.DADS_NOTE = 668
____exports.CollectibleType[____exports.CollectibleType.DADS_NOTE] = "DADS_NOTE"
____exports.CollectibleType.SAUSAGE = 669
____exports.CollectibleType[____exports.CollectibleType.SAUSAGE] = "SAUSAGE"
____exports.CollectibleType.OPTIONS = 670
____exports.CollectibleType[____exports.CollectibleType.OPTIONS] = "OPTIONS"
____exports.CollectibleType.CANDY_HEART = 671
____exports.CollectibleType[____exports.CollectibleType.CANDY_HEART] = "CANDY_HEART"
____exports.CollectibleType.POUND_OF_FLESH = 672
____exports.CollectibleType[____exports.CollectibleType.POUND_OF_FLESH] = "POUND_OF_FLESH"
____exports.CollectibleType.REDEMPTION = 673
____exports.CollectibleType[____exports.CollectibleType.REDEMPTION] = "REDEMPTION"
____exports.CollectibleType.SPIRIT_SHACKLES = 674
____exports.CollectibleType[____exports.CollectibleType.SPIRIT_SHACKLES] = "SPIRIT_SHACKLES"
____exports.CollectibleType.CRACKED_ORB = 675
____exports.CollectibleType[____exports.CollectibleType.CRACKED_ORB] = "CRACKED_ORB"
____exports.CollectibleType.EMPTY_HEART = 676
____exports.CollectibleType[____exports.CollectibleType.EMPTY_HEART] = "EMPTY_HEART"
____exports.CollectibleType.ASTRAL_PROJECTION = 677
____exports.CollectibleType[____exports.CollectibleType.ASTRAL_PROJECTION] = "ASTRAL_PROJECTION"
____exports.CollectibleType.C_SECTION = 678
____exports.CollectibleType[____exports.CollectibleType.C_SECTION] = "C_SECTION"
____exports.CollectibleType.LIL_ABADDON = 679
____exports.CollectibleType[____exports.CollectibleType.LIL_ABADDON] = "LIL_ABADDON"
____exports.CollectibleType.MONTEZUMAS_REVENGE = 680
____exports.CollectibleType[____exports.CollectibleType.MONTEZUMAS_REVENGE] = "MONTEZUMAS_REVENGE"
____exports.CollectibleType.LIL_PORTAL = 681
____exports.CollectibleType[____exports.CollectibleType.LIL_PORTAL] = "LIL_PORTAL"
____exports.CollectibleType.WORM_FRIEND = 682
____exports.CollectibleType[____exports.CollectibleType.WORM_FRIEND] = "WORM_FRIEND"
____exports.CollectibleType.BONE_SPURS = 683
____exports.CollectibleType[____exports.CollectibleType.BONE_SPURS] = "BONE_SPURS"
____exports.CollectibleType.HUNGRY_SOUL = 684
____exports.CollectibleType[____exports.CollectibleType.HUNGRY_SOUL] = "HUNGRY_SOUL"
____exports.CollectibleType.JAR_OF_WISPS = 685
____exports.CollectibleType[____exports.CollectibleType.JAR_OF_WISPS] = "JAR_OF_WISPS"
____exports.CollectibleType.SOUL_LOCKET = 686
____exports.CollectibleType[____exports.CollectibleType.SOUL_LOCKET] = "SOUL_LOCKET"
____exports.CollectibleType.FRIEND_FINDER = 687
____exports.CollectibleType[____exports.CollectibleType.FRIEND_FINDER] = "FRIEND_FINDER"
____exports.CollectibleType.INNER_CHILD = 688
____exports.CollectibleType[____exports.CollectibleType.INNER_CHILD] = "INNER_CHILD"
____exports.CollectibleType.GLITCHED_CROWN = 689
____exports.CollectibleType[____exports.CollectibleType.GLITCHED_CROWN] = "GLITCHED_CROWN"
____exports.CollectibleType.JELLY_BELLY = 690
____exports.CollectibleType[____exports.CollectibleType.JELLY_BELLY] = "JELLY_BELLY"
____exports.CollectibleType.SACRED_ORB = 691
____exports.CollectibleType[____exports.CollectibleType.SACRED_ORB] = "SACRED_ORB"
____exports.CollectibleType.SANGUINE_BOND = 692
____exports.CollectibleType[____exports.CollectibleType.SANGUINE_BOND] = "SANGUINE_BOND"
____exports.CollectibleType.SWARM = 693
____exports.CollectibleType[____exports.CollectibleType.SWARM] = "SWARM"
____exports.CollectibleType.HEARTBREAK = 694
____exports.CollectibleType[____exports.CollectibleType.HEARTBREAK] = "HEARTBREAK"
____exports.CollectibleType.BLOODY_GUST = 695
____exports.CollectibleType[____exports.CollectibleType.BLOODY_GUST] = "BLOODY_GUST"
____exports.CollectibleType.SALVATION = 696
____exports.CollectibleType[____exports.CollectibleType.SALVATION] = "SALVATION"
____exports.CollectibleType.VANISHING_TWIN = 697
____exports.CollectibleType[____exports.CollectibleType.VANISHING_TWIN] = "VANISHING_TWIN"
____exports.CollectibleType.TWISTED_PAIR = 698
____exports.CollectibleType[____exports.CollectibleType.TWISTED_PAIR] = "TWISTED_PAIR"
____exports.CollectibleType.AZAZELS_RAGE = 699
____exports.CollectibleType[____exports.CollectibleType.AZAZELS_RAGE] = "AZAZELS_RAGE"
____exports.CollectibleType.ECHO_CHAMBER = 700
____exports.CollectibleType[____exports.CollectibleType.ECHO_CHAMBER] = "ECHO_CHAMBER"
____exports.CollectibleType.ISAACS_TOMB = 701
____exports.CollectibleType[____exports.CollectibleType.ISAACS_TOMB] = "ISAACS_TOMB"
____exports.CollectibleType.VENGEFUL_SPIRIT = 702
____exports.CollectibleType[____exports.CollectibleType.VENGEFUL_SPIRIT] = "VENGEFUL_SPIRIT"
____exports.CollectibleType.ESAU_JR = 703
____exports.CollectibleType[____exports.CollectibleType.ESAU_JR] = "ESAU_JR"
____exports.CollectibleType.BERSERK = 704
____exports.CollectibleType[____exports.CollectibleType.BERSERK] = "BERSERK"
____exports.CollectibleType.DARK_ARTS = 705
____exports.CollectibleType[____exports.CollectibleType.DARK_ARTS] = "DARK_ARTS"
____exports.CollectibleType.ABYSS = 706
____exports.CollectibleType[____exports.CollectibleType.ABYSS] = "ABYSS"
____exports.CollectibleType.SUPPER = 707
____exports.CollectibleType[____exports.CollectibleType.SUPPER] = "SUPPER"
____exports.CollectibleType.STAPLER = 708
____exports.CollectibleType[____exports.CollectibleType.STAPLER] = "STAPLER"
____exports.CollectibleType.SUPLEX = 709
____exports.CollectibleType[____exports.CollectibleType.SUPLEX] = "SUPLEX"
____exports.CollectibleType.BAG_OF_CRAFTING = 710
____exports.CollectibleType[____exports.CollectibleType.BAG_OF_CRAFTING] = "BAG_OF_CRAFTING"
____exports.CollectibleType.FLIP = 711
____exports.CollectibleType[____exports.CollectibleType.FLIP] = "FLIP"
____exports.CollectibleType.LEMEGETON = 712
____exports.CollectibleType[____exports.CollectibleType.LEMEGETON] = "LEMEGETON"
____exports.CollectibleType.SUMPTORIUM = 713
____exports.CollectibleType[____exports.CollectibleType.SUMPTORIUM] = "SUMPTORIUM"
____exports.CollectibleType.RECALL = 714
____exports.CollectibleType[____exports.CollectibleType.RECALL] = "RECALL"
____exports.CollectibleType.HOLD = 715
____exports.CollectibleType[____exports.CollectibleType.HOLD] = "HOLD"
____exports.CollectibleType.KEEPERS_SACK = 716
____exports.CollectibleType[____exports.CollectibleType.KEEPERS_SACK] = "KEEPERS_SACK"
____exports.CollectibleType.KEEPERS_KIN = 717
____exports.CollectibleType[____exports.CollectibleType.KEEPERS_KIN] = "KEEPERS_KIN"
____exports.CollectibleType.KEEPERS_BOX = 719
____exports.CollectibleType[____exports.CollectibleType.KEEPERS_BOX] = "KEEPERS_BOX"
____exports.CollectibleType.EVERYTHING_JAR = 720
____exports.CollectibleType[____exports.CollectibleType.EVERYTHING_JAR] = "EVERYTHING_JAR"
____exports.CollectibleType.TMTRAINER = 721
____exports.CollectibleType[____exports.CollectibleType.TMTRAINER] = "TMTRAINER"
____exports.CollectibleType.ANIMA_SOLA = 722
____exports.CollectibleType[____exports.CollectibleType.ANIMA_SOLA] = "ANIMA_SOLA"
____exports.CollectibleType.SPINDOWN_DICE = 723
____exports.CollectibleType[____exports.CollectibleType.SPINDOWN_DICE] = "SPINDOWN_DICE"
____exports.CollectibleType.HYPERCOAGULATION = 724
____exports.CollectibleType[____exports.CollectibleType.HYPERCOAGULATION] = "HYPERCOAGULATION"
____exports.CollectibleType.IBS = 725
____exports.CollectibleType[____exports.CollectibleType.IBS] = "IBS"
____exports.CollectibleType.HEMOPTYSIS = 726
____exports.CollectibleType[____exports.CollectibleType.HEMOPTYSIS] = "HEMOPTYSIS"
____exports.CollectibleType.GHOST_BOMBS = 727
____exports.CollectibleType[____exports.CollectibleType.GHOST_BOMBS] = "GHOST_BOMBS"
____exports.CollectibleType.GELLO = 728
____exports.CollectibleType[____exports.CollectibleType.GELLO] = "GELLO"
____exports.CollectibleType.DECAP_ATTACK = 729
____exports.CollectibleType[____exports.CollectibleType.DECAP_ATTACK] = "DECAP_ATTACK"
____exports.CollectibleType.GLASS_EYE = 730
____exports.CollectibleType[____exports.CollectibleType.GLASS_EYE] = "GLASS_EYE"
____exports.CollectibleType.STYE = 731
____exports.CollectibleType[____exports.CollectibleType.STYE] = "STYE"
____exports.CollectibleType.MOMS_RING = 732
____exports.CollectibleType[____exports.CollectibleType.MOMS_RING] = "MOMS_RING"
--- For `EntityType.PICKUP` (5), `PickupVariant.TAROT_CARD` (300).
-- 
-- This is the sub-type of a card.
-- 
-- This enum was renamed from "Card" to be consistent with the `CollectibleType` and `TrinketType`
-- enums.
____exports.CardType = {}
____exports.CardType.NULL = 0
____exports.CardType[____exports.CardType.NULL] = "NULL"
____exports.CardType.FOOL = 1
____exports.CardType[____exports.CardType.FOOL] = "FOOL"
____exports.CardType.MAGICIAN = 2
____exports.CardType[____exports.CardType.MAGICIAN] = "MAGICIAN"
____exports.CardType.HIGH_PRIESTESS = 3
____exports.CardType[____exports.CardType.HIGH_PRIESTESS] = "HIGH_PRIESTESS"
____exports.CardType.EMPRESS = 4
____exports.CardType[____exports.CardType.EMPRESS] = "EMPRESS"
____exports.CardType.EMPEROR = 5
____exports.CardType[____exports.CardType.EMPEROR] = "EMPEROR"
____exports.CardType.HIEROPHANT = 6
____exports.CardType[____exports.CardType.HIEROPHANT] = "HIEROPHANT"
____exports.CardType.LOVERS = 7
____exports.CardType[____exports.CardType.LOVERS] = "LOVERS"
____exports.CardType.CHARIOT = 8
____exports.CardType[____exports.CardType.CHARIOT] = "CHARIOT"
____exports.CardType.JUSTICE = 9
____exports.CardType[____exports.CardType.JUSTICE] = "JUSTICE"
____exports.CardType.HERMIT = 10
____exports.CardType[____exports.CardType.HERMIT] = "HERMIT"
____exports.CardType.WHEEL_OF_FORTUNE = 11
____exports.CardType[____exports.CardType.WHEEL_OF_FORTUNE] = "WHEEL_OF_FORTUNE"
____exports.CardType.STRENGTH = 12
____exports.CardType[____exports.CardType.STRENGTH] = "STRENGTH"
____exports.CardType.HANGED_MAN = 13
____exports.CardType[____exports.CardType.HANGED_MAN] = "HANGED_MAN"
____exports.CardType.DEATH = 14
____exports.CardType[____exports.CardType.DEATH] = "DEATH"
____exports.CardType.TEMPERANCE = 15
____exports.CardType[____exports.CardType.TEMPERANCE] = "TEMPERANCE"
____exports.CardType.DEVIL = 16
____exports.CardType[____exports.CardType.DEVIL] = "DEVIL"
____exports.CardType.TOWER = 17
____exports.CardType[____exports.CardType.TOWER] = "TOWER"
____exports.CardType.STARS = 18
____exports.CardType[____exports.CardType.STARS] = "STARS"
____exports.CardType.MOON = 19
____exports.CardType[____exports.CardType.MOON] = "MOON"
____exports.CardType.SUN = 20
____exports.CardType[____exports.CardType.SUN] = "SUN"
____exports.CardType.JUDGEMENT = 21
____exports.CardType[____exports.CardType.JUDGEMENT] = "JUDGEMENT"
____exports.CardType.WORLD = 22
____exports.CardType[____exports.CardType.WORLD] = "WORLD"
____exports.CardType.CLUBS_2 = 23
____exports.CardType[____exports.CardType.CLUBS_2] = "CLUBS_2"
____exports.CardType.DIAMONDS_2 = 24
____exports.CardType[____exports.CardType.DIAMONDS_2] = "DIAMONDS_2"
____exports.CardType.SPADES_2 = 25
____exports.CardType[____exports.CardType.SPADES_2] = "SPADES_2"
____exports.CardType.HEARTS_2 = 26
____exports.CardType[____exports.CardType.HEARTS_2] = "HEARTS_2"
____exports.CardType.ACE_OF_CLUBS = 27
____exports.CardType[____exports.CardType.ACE_OF_CLUBS] = "ACE_OF_CLUBS"
____exports.CardType.ACE_OF_DIAMONDS = 28
____exports.CardType[____exports.CardType.ACE_OF_DIAMONDS] = "ACE_OF_DIAMONDS"
____exports.CardType.ACE_OF_SPADES = 29
____exports.CardType[____exports.CardType.ACE_OF_SPADES] = "ACE_OF_SPADES"
____exports.CardType.ACE_OF_HEARTS = 30
____exports.CardType[____exports.CardType.ACE_OF_HEARTS] = "ACE_OF_HEARTS"
____exports.CardType.JOKER = 31
____exports.CardType[____exports.CardType.JOKER] = "JOKER"
____exports.CardType.RUNE_HAGALAZ = 32
____exports.CardType[____exports.CardType.RUNE_HAGALAZ] = "RUNE_HAGALAZ"
____exports.CardType.RUNE_JERA = 33
____exports.CardType[____exports.CardType.RUNE_JERA] = "RUNE_JERA"
____exports.CardType.RUNE_EHWAZ = 34
____exports.CardType[____exports.CardType.RUNE_EHWAZ] = "RUNE_EHWAZ"
____exports.CardType.RUNE_DAGAZ = 35
____exports.CardType[____exports.CardType.RUNE_DAGAZ] = "RUNE_DAGAZ"
____exports.CardType.RUNE_ANSUZ = 36
____exports.CardType[____exports.CardType.RUNE_ANSUZ] = "RUNE_ANSUZ"
____exports.CardType.RUNE_PERTHRO = 37
____exports.CardType[____exports.CardType.RUNE_PERTHRO] = "RUNE_PERTHRO"
____exports.CardType.RUNE_BERKANO = 38
____exports.CardType[____exports.CardType.RUNE_BERKANO] = "RUNE_BERKANO"
____exports.CardType.RUNE_ALGIZ = 39
____exports.CardType[____exports.CardType.RUNE_ALGIZ] = "RUNE_ALGIZ"
____exports.CardType.RUNE_BLANK = 40
____exports.CardType[____exports.CardType.RUNE_BLANK] = "RUNE_BLANK"
____exports.CardType.RUNE_BLACK = 41
____exports.CardType[____exports.CardType.RUNE_BLACK] = "RUNE_BLACK"
____exports.CardType.CHAOS = 42
____exports.CardType[____exports.CardType.CHAOS] = "CHAOS"
____exports.CardType.CREDIT = 43
____exports.CardType[____exports.CardType.CREDIT] = "CREDIT"
____exports.CardType.RULES = 44
____exports.CardType[____exports.CardType.RULES] = "RULES"
____exports.CardType.AGAINST_HUMANITY = 45
____exports.CardType[____exports.CardType.AGAINST_HUMANITY] = "AGAINST_HUMANITY"
____exports.CardType.SUICIDE_KING = 46
____exports.CardType[____exports.CardType.SUICIDE_KING] = "SUICIDE_KING"
____exports.CardType.GET_OUT_OF_JAIL_FREE = 47
____exports.CardType[____exports.CardType.GET_OUT_OF_JAIL_FREE] = "GET_OUT_OF_JAIL_FREE"
____exports.CardType.QUESTION_MARK = 48
____exports.CardType[____exports.CardType.QUESTION_MARK] = "QUESTION_MARK"
____exports.CardType.DICE_SHARD = 49
____exports.CardType[____exports.CardType.DICE_SHARD] = "DICE_SHARD"
____exports.CardType.EMERGENCY_CONTACT = 50
____exports.CardType[____exports.CardType.EMERGENCY_CONTACT] = "EMERGENCY_CONTACT"
____exports.CardType.HOLY = 51
____exports.CardType[____exports.CardType.HOLY] = "HOLY"
____exports.CardType.HUGE_GROWTH = 52
____exports.CardType[____exports.CardType.HUGE_GROWTH] = "HUGE_GROWTH"
____exports.CardType.ANCIENT_RECALL = 53
____exports.CardType[____exports.CardType.ANCIENT_RECALL] = "ANCIENT_RECALL"
____exports.CardType.ERA_WALK = 54
____exports.CardType[____exports.CardType.ERA_WALK] = "ERA_WALK"
____exports.CardType.RUNE_SHARD = 55
____exports.CardType[____exports.CardType.RUNE_SHARD] = "RUNE_SHARD"
____exports.CardType.REVERSE_FOOL = 56
____exports.CardType[____exports.CardType.REVERSE_FOOL] = "REVERSE_FOOL"
____exports.CardType.REVERSE_MAGICIAN = 57
____exports.CardType[____exports.CardType.REVERSE_MAGICIAN] = "REVERSE_MAGICIAN"
____exports.CardType.REVERSE_HIGH_PRIESTESS = 58
____exports.CardType[____exports.CardType.REVERSE_HIGH_PRIESTESS] = "REVERSE_HIGH_PRIESTESS"
____exports.CardType.REVERSE_EMPRESS = 59
____exports.CardType[____exports.CardType.REVERSE_EMPRESS] = "REVERSE_EMPRESS"
____exports.CardType.REVERSE_EMPEROR = 60
____exports.CardType[____exports.CardType.REVERSE_EMPEROR] = "REVERSE_EMPEROR"
____exports.CardType.REVERSE_HIEROPHANT = 61
____exports.CardType[____exports.CardType.REVERSE_HIEROPHANT] = "REVERSE_HIEROPHANT"
____exports.CardType.REVERSE_LOVERS = 62
____exports.CardType[____exports.CardType.REVERSE_LOVERS] = "REVERSE_LOVERS"
____exports.CardType.REVERSE_CHARIOT = 63
____exports.CardType[____exports.CardType.REVERSE_CHARIOT] = "REVERSE_CHARIOT"
____exports.CardType.REVERSE_JUSTICE = 64
____exports.CardType[____exports.CardType.REVERSE_JUSTICE] = "REVERSE_JUSTICE"
____exports.CardType.REVERSE_HERMIT = 65
____exports.CardType[____exports.CardType.REVERSE_HERMIT] = "REVERSE_HERMIT"
____exports.CardType.REVERSE_WHEEL_OF_FORTUNE = 66
____exports.CardType[____exports.CardType.REVERSE_WHEEL_OF_FORTUNE] = "REVERSE_WHEEL_OF_FORTUNE"
____exports.CardType.REVERSE_STRENGTH = 67
____exports.CardType[____exports.CardType.REVERSE_STRENGTH] = "REVERSE_STRENGTH"
____exports.CardType.REVERSE_HANGED_MAN = 68
____exports.CardType[____exports.CardType.REVERSE_HANGED_MAN] = "REVERSE_HANGED_MAN"
____exports.CardType.REVERSE_DEATH = 69
____exports.CardType[____exports.CardType.REVERSE_DEATH] = "REVERSE_DEATH"
____exports.CardType.REVERSE_TEMPERANCE = 70
____exports.CardType[____exports.CardType.REVERSE_TEMPERANCE] = "REVERSE_TEMPERANCE"
____exports.CardType.REVERSE_DEVIL = 71
____exports.CardType[____exports.CardType.REVERSE_DEVIL] = "REVERSE_DEVIL"
____exports.CardType.REVERSE_TOWER = 72
____exports.CardType[____exports.CardType.REVERSE_TOWER] = "REVERSE_TOWER"
____exports.CardType.REVERSE_STARS = 73
____exports.CardType[____exports.CardType.REVERSE_STARS] = "REVERSE_STARS"
____exports.CardType.REVERSE_MOON = 74
____exports.CardType[____exports.CardType.REVERSE_MOON] = "REVERSE_MOON"
____exports.CardType.REVERSE_SUN = 75
____exports.CardType[____exports.CardType.REVERSE_SUN] = "REVERSE_SUN"
____exports.CardType.REVERSE_JUDGEMENT = 76
____exports.CardType[____exports.CardType.REVERSE_JUDGEMENT] = "REVERSE_JUDGEMENT"
____exports.CardType.REVERSE_WORLD = 77
____exports.CardType[____exports.CardType.REVERSE_WORLD] = "REVERSE_WORLD"
____exports.CardType.CRACKED_KEY = 78
____exports.CardType[____exports.CardType.CRACKED_KEY] = "CRACKED_KEY"
____exports.CardType.QUEEN_OF_HEARTS = 79
____exports.CardType[____exports.CardType.QUEEN_OF_HEARTS] = "QUEEN_OF_HEARTS"
____exports.CardType.WILD = 80
____exports.CardType[____exports.CardType.WILD] = "WILD"
____exports.CardType.SOUL_ISAAC = 81
____exports.CardType[____exports.CardType.SOUL_ISAAC] = "SOUL_ISAAC"
____exports.CardType.SOUL_MAGDALENE = 82
____exports.CardType[____exports.CardType.SOUL_MAGDALENE] = "SOUL_MAGDALENE"
____exports.CardType.SOUL_CAIN = 83
____exports.CardType[____exports.CardType.SOUL_CAIN] = "SOUL_CAIN"
____exports.CardType.SOUL_JUDAS = 84
____exports.CardType[____exports.CardType.SOUL_JUDAS] = "SOUL_JUDAS"
____exports.CardType.SOUL_BLUE_BABY = 85
____exports.CardType[____exports.CardType.SOUL_BLUE_BABY] = "SOUL_BLUE_BABY"
____exports.CardType.SOUL_EVE = 86
____exports.CardType[____exports.CardType.SOUL_EVE] = "SOUL_EVE"
____exports.CardType.SOUL_SAMSON = 87
____exports.CardType[____exports.CardType.SOUL_SAMSON] = "SOUL_SAMSON"
____exports.CardType.SOUL_AZAZEL = 88
____exports.CardType[____exports.CardType.SOUL_AZAZEL] = "SOUL_AZAZEL"
____exports.CardType.SOUL_LAZARUS = 89
____exports.CardType[____exports.CardType.SOUL_LAZARUS] = "SOUL_LAZARUS"
____exports.CardType.SOUL_EDEN = 90
____exports.CardType[____exports.CardType.SOUL_EDEN] = "SOUL_EDEN"
____exports.CardType.SOUL_LOST = 91
____exports.CardType[____exports.CardType.SOUL_LOST] = "SOUL_LOST"
____exports.CardType.SOUL_LILITH = 92
____exports.CardType[____exports.CardType.SOUL_LILITH] = "SOUL_LILITH"
____exports.CardType.SOUL_KEEPER = 93
____exports.CardType[____exports.CardType.SOUL_KEEPER] = "SOUL_KEEPER"
____exports.CardType.SOUL_APOLLYON = 94
____exports.CardType[____exports.CardType.SOUL_APOLLYON] = "SOUL_APOLLYON"
____exports.CardType.SOUL_FORGOTTEN = 95
____exports.CardType[____exports.CardType.SOUL_FORGOTTEN] = "SOUL_FORGOTTEN"
____exports.CardType.SOUL_BETHANY = 96
____exports.CardType[____exports.CardType.SOUL_BETHANY] = "SOUL_BETHANY"
____exports.CardType.SOUL_JACOB = 97
____exports.CardType[____exports.CardType.SOUL_JACOB] = "SOUL_JACOB"
--- For `EntityType.PICKUP` (5), `PickupVariant.TRINKET` (350).
-- 
-- This is the sub-type of a trinket.
____exports.TrinketType = {}
____exports.TrinketType.NULL = 0
____exports.TrinketType[____exports.TrinketType.NULL] = "NULL"
____exports.TrinketType.SWALLOWED_PENNY = 1
____exports.TrinketType[____exports.TrinketType.SWALLOWED_PENNY] = "SWALLOWED_PENNY"
____exports.TrinketType.PETRIFIED_POOP = 2
____exports.TrinketType[____exports.TrinketType.PETRIFIED_POOP] = "PETRIFIED_POOP"
____exports.TrinketType.AAA_BATTERY = 3
____exports.TrinketType[____exports.TrinketType.AAA_BATTERY] = "AAA_BATTERY"
____exports.TrinketType.BROKEN_REMOTE = 4
____exports.TrinketType[____exports.TrinketType.BROKEN_REMOTE] = "BROKEN_REMOTE"
____exports.TrinketType.PURPLE_HEART = 5
____exports.TrinketType[____exports.TrinketType.PURPLE_HEART] = "PURPLE_HEART"
____exports.TrinketType.BROKEN_MAGNET = 6
____exports.TrinketType[____exports.TrinketType.BROKEN_MAGNET] = "BROKEN_MAGNET"
____exports.TrinketType.ROSARY_BEAD = 7
____exports.TrinketType[____exports.TrinketType.ROSARY_BEAD] = "ROSARY_BEAD"
____exports.TrinketType.CARTRIDGE = 8
____exports.TrinketType[____exports.TrinketType.CARTRIDGE] = "CARTRIDGE"
____exports.TrinketType.PULSE_WORM = 9
____exports.TrinketType[____exports.TrinketType.PULSE_WORM] = "PULSE_WORM"
____exports.TrinketType.WIGGLE_WORM = 10
____exports.TrinketType[____exports.TrinketType.WIGGLE_WORM] = "WIGGLE_WORM"
____exports.TrinketType.RING_WORM = 11
____exports.TrinketType[____exports.TrinketType.RING_WORM] = "RING_WORM"
____exports.TrinketType.FLAT_WORM = 12
____exports.TrinketType[____exports.TrinketType.FLAT_WORM] = "FLAT_WORM"
____exports.TrinketType.STORE_CREDIT = 13
____exports.TrinketType[____exports.TrinketType.STORE_CREDIT] = "STORE_CREDIT"
____exports.TrinketType.CALLUS = 14
____exports.TrinketType[____exports.TrinketType.CALLUS] = "CALLUS"
____exports.TrinketType.LUCKY_ROCK = 15
____exports.TrinketType[____exports.TrinketType.LUCKY_ROCK] = "LUCKY_ROCK"
____exports.TrinketType.MOMS_TOENAIL = 16
____exports.TrinketType[____exports.TrinketType.MOMS_TOENAIL] = "MOMS_TOENAIL"
____exports.TrinketType.BLACK_LIPSTICK = 17
____exports.TrinketType[____exports.TrinketType.BLACK_LIPSTICK] = "BLACK_LIPSTICK"
____exports.TrinketType.BIBLE_TRACT = 18
____exports.TrinketType[____exports.TrinketType.BIBLE_TRACT] = "BIBLE_TRACT"
____exports.TrinketType.PAPER_CLIP = 19
____exports.TrinketType[____exports.TrinketType.PAPER_CLIP] = "PAPER_CLIP"
____exports.TrinketType.MONKEY_PAW = 20
____exports.TrinketType[____exports.TrinketType.MONKEY_PAW] = "MONKEY_PAW"
____exports.TrinketType.MYSTERIOUS_PAPER = 21
____exports.TrinketType[____exports.TrinketType.MYSTERIOUS_PAPER] = "MYSTERIOUS_PAPER"
____exports.TrinketType.DAEMONS_TAIL = 22
____exports.TrinketType[____exports.TrinketType.DAEMONS_TAIL] = "DAEMONS_TAIL"
____exports.TrinketType.MISSING_POSTER = 23
____exports.TrinketType[____exports.TrinketType.MISSING_POSTER] = "MISSING_POSTER"
____exports.TrinketType.BUTT_PENNY = 24
____exports.TrinketType[____exports.TrinketType.BUTT_PENNY] = "BUTT_PENNY"
____exports.TrinketType.MYSTERIOUS_CANDY = 25
____exports.TrinketType[____exports.TrinketType.MYSTERIOUS_CANDY] = "MYSTERIOUS_CANDY"
____exports.TrinketType.HOOK_WORM = 26
____exports.TrinketType[____exports.TrinketType.HOOK_WORM] = "HOOK_WORM"
____exports.TrinketType.WHIP_WORM = 27
____exports.TrinketType[____exports.TrinketType.WHIP_WORM] = "WHIP_WORM"
____exports.TrinketType.BROKEN_ANKH = 28
____exports.TrinketType[____exports.TrinketType.BROKEN_ANKH] = "BROKEN_ANKH"
____exports.TrinketType.FISH_HEAD = 29
____exports.TrinketType[____exports.TrinketType.FISH_HEAD] = "FISH_HEAD"
____exports.TrinketType.PINKY_EYE = 30
____exports.TrinketType[____exports.TrinketType.PINKY_EYE] = "PINKY_EYE"
____exports.TrinketType.PUSH_PIN = 31
____exports.TrinketType[____exports.TrinketType.PUSH_PIN] = "PUSH_PIN"
____exports.TrinketType.LIBERTY_CAP = 32
____exports.TrinketType[____exports.TrinketType.LIBERTY_CAP] = "LIBERTY_CAP"
____exports.TrinketType.UMBILICAL_CORD = 33
____exports.TrinketType[____exports.TrinketType.UMBILICAL_CORD] = "UMBILICAL_CORD"
____exports.TrinketType.CHILDS_HEART = 34
____exports.TrinketType[____exports.TrinketType.CHILDS_HEART] = "CHILDS_HEART"
____exports.TrinketType.CURVED_HORN = 35
____exports.TrinketType[____exports.TrinketType.CURVED_HORN] = "CURVED_HORN"
____exports.TrinketType.RUSTED_KEY = 36
____exports.TrinketType[____exports.TrinketType.RUSTED_KEY] = "RUSTED_KEY"
____exports.TrinketType.GOAT_HOOF = 37
____exports.TrinketType[____exports.TrinketType.GOAT_HOOF] = "GOAT_HOOF"
____exports.TrinketType.MOMS_PEARL = 38
____exports.TrinketType[____exports.TrinketType.MOMS_PEARL] = "MOMS_PEARL"
____exports.TrinketType.CANCER = 39
____exports.TrinketType[____exports.TrinketType.CANCER] = "CANCER"
____exports.TrinketType.RED_PATCH = 40
____exports.TrinketType[____exports.TrinketType.RED_PATCH] = "RED_PATCH"
____exports.TrinketType.MATCH_STICK = 41
____exports.TrinketType[____exports.TrinketType.MATCH_STICK] = "MATCH_STICK"
____exports.TrinketType.LUCKY_TOE = 42
____exports.TrinketType[____exports.TrinketType.LUCKY_TOE] = "LUCKY_TOE"
____exports.TrinketType.CURSED_SKULL = 43
____exports.TrinketType[____exports.TrinketType.CURSED_SKULL] = "CURSED_SKULL"
____exports.TrinketType.SAFETY_CAP = 44
____exports.TrinketType[____exports.TrinketType.SAFETY_CAP] = "SAFETY_CAP"
____exports.TrinketType.ACE_SPADES = 45
____exports.TrinketType[____exports.TrinketType.ACE_SPADES] = "ACE_SPADES"
____exports.TrinketType.ISAACS_FORK = 46
____exports.TrinketType[____exports.TrinketType.ISAACS_FORK] = "ISAACS_FORK"
____exports.TrinketType.MISSING_PAGE = 48
____exports.TrinketType[____exports.TrinketType.MISSING_PAGE] = "MISSING_PAGE"
____exports.TrinketType.BLOODY_PENNY = 49
____exports.TrinketType[____exports.TrinketType.BLOODY_PENNY] = "BLOODY_PENNY"
____exports.TrinketType.BURNT_PENNY = 50
____exports.TrinketType[____exports.TrinketType.BURNT_PENNY] = "BURNT_PENNY"
____exports.TrinketType.FLAT_PENNY = 51
____exports.TrinketType[____exports.TrinketType.FLAT_PENNY] = "FLAT_PENNY"
____exports.TrinketType.COUNTERFEIT_PENNY = 52
____exports.TrinketType[____exports.TrinketType.COUNTERFEIT_PENNY] = "COUNTERFEIT_PENNY"
____exports.TrinketType.TICK = 53
____exports.TrinketType[____exports.TrinketType.TICK] = "TICK"
____exports.TrinketType.ISAACS_HEAD = 54
____exports.TrinketType[____exports.TrinketType.ISAACS_HEAD] = "ISAACS_HEAD"
____exports.TrinketType.MAGGYS_FAITH = 55
____exports.TrinketType[____exports.TrinketType.MAGGYS_FAITH] = "MAGGYS_FAITH"
____exports.TrinketType.JUDAS_TONGUE = 56
____exports.TrinketType[____exports.TrinketType.JUDAS_TONGUE] = "JUDAS_TONGUE"
____exports.TrinketType.SOUL = 57
____exports.TrinketType[____exports.TrinketType.SOUL] = "SOUL"
____exports.TrinketType.SAMSONS_LOCK = 58
____exports.TrinketType[____exports.TrinketType.SAMSONS_LOCK] = "SAMSONS_LOCK"
____exports.TrinketType.CAINS_EYE = 59
____exports.TrinketType[____exports.TrinketType.CAINS_EYE] = "CAINS_EYE"
____exports.TrinketType.EVES_BIRD_FOOT = 60
____exports.TrinketType[____exports.TrinketType.EVES_BIRD_FOOT] = "EVES_BIRD_FOOT"
____exports.TrinketType.LEFT_HAND = 61
____exports.TrinketType[____exports.TrinketType.LEFT_HAND] = "LEFT_HAND"
____exports.TrinketType.SHINY_ROCK = 62
____exports.TrinketType[____exports.TrinketType.SHINY_ROCK] = "SHINY_ROCK"
____exports.TrinketType.SAFETY_SCISSORS = 63
____exports.TrinketType[____exports.TrinketType.SAFETY_SCISSORS] = "SAFETY_SCISSORS"
____exports.TrinketType.RAINBOW_WORM = 64
____exports.TrinketType[____exports.TrinketType.RAINBOW_WORM] = "RAINBOW_WORM"
____exports.TrinketType.TAPE_WORM = 65
____exports.TrinketType[____exports.TrinketType.TAPE_WORM] = "TAPE_WORM"
____exports.TrinketType.LAZY_WORM = 66
____exports.TrinketType[____exports.TrinketType.LAZY_WORM] = "LAZY_WORM"
____exports.TrinketType.CRACKED_DICE = 67
____exports.TrinketType[____exports.TrinketType.CRACKED_DICE] = "CRACKED_DICE"
____exports.TrinketType.SUPER_MAGNET = 68
____exports.TrinketType[____exports.TrinketType.SUPER_MAGNET] = "SUPER_MAGNET"
____exports.TrinketType.FADED_POLAROID = 69
____exports.TrinketType[____exports.TrinketType.FADED_POLAROID] = "FADED_POLAROID"
____exports.TrinketType.LOUSE = 70
____exports.TrinketType[____exports.TrinketType.LOUSE] = "LOUSE"
____exports.TrinketType.BOBS_BLADDER = 71
____exports.TrinketType[____exports.TrinketType.BOBS_BLADDER] = "BOBS_BLADDER"
____exports.TrinketType.WATCH_BATTERY = 72
____exports.TrinketType[____exports.TrinketType.WATCH_BATTERY] = "WATCH_BATTERY"
____exports.TrinketType.BLASTING_CAP = 73
____exports.TrinketType[____exports.TrinketType.BLASTING_CAP] = "BLASTING_CAP"
____exports.TrinketType.STUD_FINDER = 74
____exports.TrinketType[____exports.TrinketType.STUD_FINDER] = "STUD_FINDER"
____exports.TrinketType.ERROR = 75
____exports.TrinketType[____exports.TrinketType.ERROR] = "ERROR"
____exports.TrinketType.POKER_CHIP = 76
____exports.TrinketType[____exports.TrinketType.POKER_CHIP] = "POKER_CHIP"
____exports.TrinketType.BLISTER = 77
____exports.TrinketType[____exports.TrinketType.BLISTER] = "BLISTER"
____exports.TrinketType.SECOND_HAND = 78
____exports.TrinketType[____exports.TrinketType.SECOND_HAND] = "SECOND_HAND"
____exports.TrinketType.ENDLESS_NAMELESS = 79
____exports.TrinketType[____exports.TrinketType.ENDLESS_NAMELESS] = "ENDLESS_NAMELESS"
____exports.TrinketType.BLACK_FEATHER = 80
____exports.TrinketType[____exports.TrinketType.BLACK_FEATHER] = "BLACK_FEATHER"
____exports.TrinketType.BLIND_RAGE = 81
____exports.TrinketType[____exports.TrinketType.BLIND_RAGE] = "BLIND_RAGE"
____exports.TrinketType.GOLDEN_HORSE_SHOE = 82
____exports.TrinketType[____exports.TrinketType.GOLDEN_HORSE_SHOE] = "GOLDEN_HORSE_SHOE"
____exports.TrinketType.STORE_KEY = 83
____exports.TrinketType[____exports.TrinketType.STORE_KEY] = "STORE_KEY"
____exports.TrinketType.RIB_OF_GREED = 84
____exports.TrinketType[____exports.TrinketType.RIB_OF_GREED] = "RIB_OF_GREED"
____exports.TrinketType.KARMA = 85
____exports.TrinketType[____exports.TrinketType.KARMA] = "KARMA"
____exports.TrinketType.LIL_LARVA = 86
____exports.TrinketType[____exports.TrinketType.LIL_LARVA] = "LIL_LARVA"
____exports.TrinketType.MOMS_LOCKET = 87
____exports.TrinketType[____exports.TrinketType.MOMS_LOCKET] = "MOMS_LOCKET"
____exports.TrinketType.NO = 88
____exports.TrinketType[____exports.TrinketType.NO] = "NO"
____exports.TrinketType.CHILD_LEASH = 89
____exports.TrinketType[____exports.TrinketType.CHILD_LEASH] = "CHILD_LEASH"
____exports.TrinketType.BROWN_CAP = 90
____exports.TrinketType[____exports.TrinketType.BROWN_CAP] = "BROWN_CAP"
____exports.TrinketType.MECONIUM = 91
____exports.TrinketType[____exports.TrinketType.MECONIUM] = "MECONIUM"
____exports.TrinketType.CRACKED_CROWN = 92
____exports.TrinketType[____exports.TrinketType.CRACKED_CROWN] = "CRACKED_CROWN"
____exports.TrinketType.USED_DIAPER = 93
____exports.TrinketType[____exports.TrinketType.USED_DIAPER] = "USED_DIAPER"
____exports.TrinketType.FISH_TAIL = 94
____exports.TrinketType[____exports.TrinketType.FISH_TAIL] = "FISH_TAIL"
____exports.TrinketType.BLACK_TOOTH = 95
____exports.TrinketType[____exports.TrinketType.BLACK_TOOTH] = "BLACK_TOOTH"
____exports.TrinketType.OUROBOROS_WORM = 96
____exports.TrinketType[____exports.TrinketType.OUROBOROS_WORM] = "OUROBOROS_WORM"
____exports.TrinketType.TONSIL = 97
____exports.TrinketType[____exports.TrinketType.TONSIL] = "TONSIL"
____exports.TrinketType.NOSE_GOBLIN = 98
____exports.TrinketType[____exports.TrinketType.NOSE_GOBLIN] = "NOSE_GOBLIN"
____exports.TrinketType.SUPER_BALL = 99
____exports.TrinketType[____exports.TrinketType.SUPER_BALL] = "SUPER_BALL"
____exports.TrinketType.VIBRANT_BULB = 100
____exports.TrinketType[____exports.TrinketType.VIBRANT_BULB] = "VIBRANT_BULB"
____exports.TrinketType.DIM_BULB = 101
____exports.TrinketType[____exports.TrinketType.DIM_BULB] = "DIM_BULB"
____exports.TrinketType.FRAGMENTED_CARD = 102
____exports.TrinketType[____exports.TrinketType.FRAGMENTED_CARD] = "FRAGMENTED_CARD"
____exports.TrinketType.EQUALITY = 103
____exports.TrinketType[____exports.TrinketType.EQUALITY] = "EQUALITY"
____exports.TrinketType.WISH_BONE = 104
____exports.TrinketType[____exports.TrinketType.WISH_BONE] = "WISH_BONE"
____exports.TrinketType.BAG_LUNCH = 105
____exports.TrinketType[____exports.TrinketType.BAG_LUNCH] = "BAG_LUNCH"
____exports.TrinketType.LOST_CORK = 106
____exports.TrinketType[____exports.TrinketType.LOST_CORK] = "LOST_CORK"
____exports.TrinketType.CROW_HEART = 107
____exports.TrinketType[____exports.TrinketType.CROW_HEART] = "CROW_HEART"
____exports.TrinketType.WALNUT = 108
____exports.TrinketType[____exports.TrinketType.WALNUT] = "WALNUT"
____exports.TrinketType.DUCT_TAPE = 109
____exports.TrinketType[____exports.TrinketType.DUCT_TAPE] = "DUCT_TAPE"
____exports.TrinketType.SILVER_DOLLAR = 110
____exports.TrinketType[____exports.TrinketType.SILVER_DOLLAR] = "SILVER_DOLLAR"
____exports.TrinketType.BLOODY_CROWN = 111
____exports.TrinketType[____exports.TrinketType.BLOODY_CROWN] = "BLOODY_CROWN"
____exports.TrinketType.PAY_TO_WIN = 112
____exports.TrinketType[____exports.TrinketType.PAY_TO_WIN] = "PAY_TO_WIN"
____exports.TrinketType.LOCUST_OF_WRATH = 113
____exports.TrinketType[____exports.TrinketType.LOCUST_OF_WRATH] = "LOCUST_OF_WRATH"
____exports.TrinketType.LOCUST_OF_PESTILENCE = 114
____exports.TrinketType[____exports.TrinketType.LOCUST_OF_PESTILENCE] = "LOCUST_OF_PESTILENCE"
____exports.TrinketType.LOCUST_OF_FAMINE = 115
____exports.TrinketType[____exports.TrinketType.LOCUST_OF_FAMINE] = "LOCUST_OF_FAMINE"
____exports.TrinketType.LOCUST_OF_DEATH = 116
____exports.TrinketType[____exports.TrinketType.LOCUST_OF_DEATH] = "LOCUST_OF_DEATH"
____exports.TrinketType.LOCUST_OF_CONQUEST = 117
____exports.TrinketType[____exports.TrinketType.LOCUST_OF_CONQUEST] = "LOCUST_OF_CONQUEST"
____exports.TrinketType.BAT_WING = 118
____exports.TrinketType[____exports.TrinketType.BAT_WING] = "BAT_WING"
____exports.TrinketType.STEM_CELL = 119
____exports.TrinketType[____exports.TrinketType.STEM_CELL] = "STEM_CELL"
____exports.TrinketType.HAIRPIN = 120
____exports.TrinketType[____exports.TrinketType.HAIRPIN] = "HAIRPIN"
____exports.TrinketType.WOODEN_CROSS = 121
____exports.TrinketType[____exports.TrinketType.WOODEN_CROSS] = "WOODEN_CROSS"
____exports.TrinketType.BUTTER = 122
____exports.TrinketType[____exports.TrinketType.BUTTER] = "BUTTER"
____exports.TrinketType.FILIGREE_FEATHERS = 123
____exports.TrinketType[____exports.TrinketType.FILIGREE_FEATHERS] = "FILIGREE_FEATHERS"
____exports.TrinketType.DOOR_STOP = 124
____exports.TrinketType[____exports.TrinketType.DOOR_STOP] = "DOOR_STOP"
____exports.TrinketType.EXTENSION_CORD = 125
____exports.TrinketType[____exports.TrinketType.EXTENSION_CORD] = "EXTENSION_CORD"
____exports.TrinketType.ROTTEN_PENNY = 126
____exports.TrinketType[____exports.TrinketType.ROTTEN_PENNY] = "ROTTEN_PENNY"
____exports.TrinketType.BABY_BENDER = 127
____exports.TrinketType[____exports.TrinketType.BABY_BENDER] = "BABY_BENDER"
____exports.TrinketType.FINGER_BONE = 128
____exports.TrinketType[____exports.TrinketType.FINGER_BONE] = "FINGER_BONE"
____exports.TrinketType.JAW_BREAKER = 129
____exports.TrinketType[____exports.TrinketType.JAW_BREAKER] = "JAW_BREAKER"
____exports.TrinketType.CHEWED_PEN = 130
____exports.TrinketType[____exports.TrinketType.CHEWED_PEN] = "CHEWED_PEN"
____exports.TrinketType.BLESSED_PENNY = 131
____exports.TrinketType[____exports.TrinketType.BLESSED_PENNY] = "BLESSED_PENNY"
____exports.TrinketType.BROKEN_SYRINGE = 132
____exports.TrinketType[____exports.TrinketType.BROKEN_SYRINGE] = "BROKEN_SYRINGE"
____exports.TrinketType.SHORT_FUSE = 133
____exports.TrinketType[____exports.TrinketType.SHORT_FUSE] = "SHORT_FUSE"
____exports.TrinketType.GIGANTE_BEAN = 134
____exports.TrinketType[____exports.TrinketType.GIGANTE_BEAN] = "GIGANTE_BEAN"
____exports.TrinketType.LIGHTER = 135
____exports.TrinketType[____exports.TrinketType.LIGHTER] = "LIGHTER"
____exports.TrinketType.BROKEN_PADLOCK = 136
____exports.TrinketType[____exports.TrinketType.BROKEN_PADLOCK] = "BROKEN_PADLOCK"
____exports.TrinketType.MYOSOTIS = 137
____exports.TrinketType[____exports.TrinketType.MYOSOTIS] = "MYOSOTIS"
____exports.TrinketType.M = 138
____exports.TrinketType[____exports.TrinketType.M] = "M"
____exports.TrinketType.TEARDROP_CHARM = 139
____exports.TrinketType[____exports.TrinketType.TEARDROP_CHARM] = "TEARDROP_CHARM"
____exports.TrinketType.APPLE_OF_SODOM = 140
____exports.TrinketType[____exports.TrinketType.APPLE_OF_SODOM] = "APPLE_OF_SODOM"
____exports.TrinketType.FORGOTTEN_LULLABY = 141
____exports.TrinketType[____exports.TrinketType.FORGOTTEN_LULLABY] = "FORGOTTEN_LULLABY"
____exports.TrinketType.BETHS_FAITH = 142
____exports.TrinketType[____exports.TrinketType.BETHS_FAITH] = "BETHS_FAITH"
____exports.TrinketType.OLD_CAPACITOR = 143
____exports.TrinketType[____exports.TrinketType.OLD_CAPACITOR] = "OLD_CAPACITOR"
____exports.TrinketType.BRAIN_WORM = 144
____exports.TrinketType[____exports.TrinketType.BRAIN_WORM] = "BRAIN_WORM"
____exports.TrinketType.PERFECTION = 145
____exports.TrinketType[____exports.TrinketType.PERFECTION] = "PERFECTION"
____exports.TrinketType.DEVILS_CROWN = 146
____exports.TrinketType[____exports.TrinketType.DEVILS_CROWN] = "DEVILS_CROWN"
____exports.TrinketType.CHARGED_PENNY = 147
____exports.TrinketType[____exports.TrinketType.CHARGED_PENNY] = "CHARGED_PENNY"
____exports.TrinketType.FRIENDSHIP_NECKLACE = 148
____exports.TrinketType[____exports.TrinketType.FRIENDSHIP_NECKLACE] = "FRIENDSHIP_NECKLACE"
____exports.TrinketType.PANIC_BUTTON = 149
____exports.TrinketType[____exports.TrinketType.PANIC_BUTTON] = "PANIC_BUTTON"
____exports.TrinketType.BLUE_KEY = 150
____exports.TrinketType[____exports.TrinketType.BLUE_KEY] = "BLUE_KEY"
____exports.TrinketType.FLAT_FILE = 151
____exports.TrinketType[____exports.TrinketType.FLAT_FILE] = "FLAT_FILE"
____exports.TrinketType.TELESCOPE_LENS = 152
____exports.TrinketType[____exports.TrinketType.TELESCOPE_LENS] = "TELESCOPE_LENS"
____exports.TrinketType.MOMS_LOCK = 153
____exports.TrinketType[____exports.TrinketType.MOMS_LOCK] = "MOMS_LOCK"
____exports.TrinketType.DICE_BAG = 154
____exports.TrinketType[____exports.TrinketType.DICE_BAG] = "DICE_BAG"
____exports.TrinketType.HOLY_CROWN = 155
____exports.TrinketType[____exports.TrinketType.HOLY_CROWN] = "HOLY_CROWN"
____exports.TrinketType.MOTHERS_KISS = 156
____exports.TrinketType[____exports.TrinketType.MOTHERS_KISS] = "MOTHERS_KISS"
____exports.TrinketType.TORN_CARD = 157
____exports.TrinketType[____exports.TrinketType.TORN_CARD] = "TORN_CARD"
____exports.TrinketType.TORN_POCKET = 158
____exports.TrinketType[____exports.TrinketType.TORN_POCKET] = "TORN_POCKET"
____exports.TrinketType.GILDED_KEY = 159
____exports.TrinketType[____exports.TrinketType.GILDED_KEY] = "GILDED_KEY"
____exports.TrinketType.LUCKY_SACK = 160
____exports.TrinketType[____exports.TrinketType.LUCKY_SACK] = "LUCKY_SACK"
____exports.TrinketType.WICKED_CROWN = 161
____exports.TrinketType[____exports.TrinketType.WICKED_CROWN] = "WICKED_CROWN"
____exports.TrinketType.AZAZELS_STUMP = 162
____exports.TrinketType[____exports.TrinketType.AZAZELS_STUMP] = "AZAZELS_STUMP"
____exports.TrinketType.DINGLE_BERRY = 163
____exports.TrinketType[____exports.TrinketType.DINGLE_BERRY] = "DINGLE_BERRY"
____exports.TrinketType.RING_CAP = 164
____exports.TrinketType[____exports.TrinketType.RING_CAP] = "RING_CAP"
____exports.TrinketType.NUH_UH = 165
____exports.TrinketType[____exports.TrinketType.NUH_UH] = "NUH_UH"
____exports.TrinketType.MODELING_CLAY = 166
____exports.TrinketType[____exports.TrinketType.MODELING_CLAY] = "MODELING_CLAY"
____exports.TrinketType.POLISHED_BONE = 167
____exports.TrinketType[____exports.TrinketType.POLISHED_BONE] = "POLISHED_BONE"
____exports.TrinketType.HOLLOW_HEART = 168
____exports.TrinketType[____exports.TrinketType.HOLLOW_HEART] = "HOLLOW_HEART"
____exports.TrinketType.KIDS_DRAWING = 169
____exports.TrinketType[____exports.TrinketType.KIDS_DRAWING] = "KIDS_DRAWING"
____exports.TrinketType.CRYSTAL_KEY = 170
____exports.TrinketType[____exports.TrinketType.CRYSTAL_KEY] = "CRYSTAL_KEY"
____exports.TrinketType.KEEPERS_BARGAIN = 171
____exports.TrinketType[____exports.TrinketType.KEEPERS_BARGAIN] = "KEEPERS_BARGAIN"
____exports.TrinketType.CURSED_PENNY = 172
____exports.TrinketType[____exports.TrinketType.CURSED_PENNY] = "CURSED_PENNY"
____exports.TrinketType.YOUR_SOUL = 173
____exports.TrinketType[____exports.TrinketType.YOUR_SOUL] = "YOUR_SOUL"
____exports.TrinketType.NUMBER_MAGNET = 174
____exports.TrinketType[____exports.TrinketType.NUMBER_MAGNET] = "NUMBER_MAGNET"
____exports.TrinketType.STRANGE_KEY = 175
____exports.TrinketType[____exports.TrinketType.STRANGE_KEY] = "STRANGE_KEY"
____exports.TrinketType.LIL_CLOT = 176
____exports.TrinketType[____exports.TrinketType.LIL_CLOT] = "LIL_CLOT"
____exports.TrinketType.TEMPORARY_TATTOO = 177
____exports.TrinketType[____exports.TrinketType.TEMPORARY_TATTOO] = "TEMPORARY_TATTOO"
____exports.TrinketType.SWALLOWED_M80 = 178
____exports.TrinketType[____exports.TrinketType.SWALLOWED_M80] = "SWALLOWED_M80"
____exports.TrinketType.RC_REMOTE = 179
____exports.TrinketType[____exports.TrinketType.RC_REMOTE] = "RC_REMOTE"
____exports.TrinketType.FOUND_SOUL = 180
____exports.TrinketType[____exports.TrinketType.FOUND_SOUL] = "FOUND_SOUL"
____exports.TrinketType.EXPANSION_PACK = 181
____exports.TrinketType[____exports.TrinketType.EXPANSION_PACK] = "EXPANSION_PACK"
____exports.TrinketType.BETHS_ESSENCE = 182
____exports.TrinketType[____exports.TrinketType.BETHS_ESSENCE] = "BETHS_ESSENCE"
____exports.TrinketType.TWINS = 183
____exports.TrinketType[____exports.TrinketType.TWINS] = "TWINS"
____exports.TrinketType.ADOPTION_PAPERS = 184
____exports.TrinketType[____exports.TrinketType.ADOPTION_PAPERS] = "ADOPTION_PAPERS"
____exports.TrinketType.CRICKET_LEG = 185
____exports.TrinketType[____exports.TrinketType.CRICKET_LEG] = "CRICKET_LEG"
____exports.TrinketType.APOLLYONS_BEST_FRIEND = 186
____exports.TrinketType[____exports.TrinketType.APOLLYONS_BEST_FRIEND] = "APOLLYONS_BEST_FRIEND"
____exports.TrinketType.BROKEN_GLASSES = 187
____exports.TrinketType[____exports.TrinketType.BROKEN_GLASSES] = "BROKEN_GLASSES"
____exports.TrinketType.ICE_CUBE = 188
____exports.TrinketType[____exports.TrinketType.ICE_CUBE] = "ICE_CUBE"
____exports.TrinketType.SIGIL_OF_BAPHOMET = 189
____exports.TrinketType[____exports.TrinketType.SIGIL_OF_BAPHOMET] = "SIGIL_OF_BAPHOMET"
--- For `EntityType.PICKUP` (5), `PickupVariant.BED` (380).
____exports.BedSubType = {}
____exports.BedSubType.ISAAC = 0
____exports.BedSubType[____exports.BedSubType.ISAAC] = "ISAAC"
____exports.BedSubType.MOM = 1
____exports.BedSubType[____exports.BedSubType.MOM] = "MOM"
--- For `EntityType.LASER` (7).
____exports.LaserSubType = {}
____exports.LaserSubType.LINEAR = 0
____exports.LaserSubType[____exports.LaserSubType.LINEAR] = "LINEAR"
____exports.LaserSubType.RING_LUDOVICO = 1
____exports.LaserSubType[____exports.LaserSubType.RING_LUDOVICO] = "RING_LUDOVICO"
____exports.LaserSubType.RING_PROJECTILE = 2
____exports.LaserSubType[____exports.LaserSubType.RING_PROJECTILE] = "RING_PROJECTILE"
____exports.LaserSubType.RING_FOLLOW_PARENT = 3
____exports.LaserSubType[____exports.LaserSubType.RING_FOLLOW_PARENT] = "RING_FOLLOW_PARENT"
____exports.LaserSubType.NO_IMPACT = 4
____exports.LaserSubType[____exports.LaserSubType.NO_IMPACT] = "NO_IMPACT"
--- For `EntityType.CHARGER` (23), `ChargerVariant.CHARGER` (0).
____exports.ChargerSubType = {}
____exports.ChargerSubType.CHARGER = 0
____exports.ChargerSubType[____exports.ChargerSubType.CHARGER] = "CHARGER"
____exports.ChargerSubType.MY_SHADOW = 1
____exports.ChargerSubType[____exports.ChargerSubType.MY_SHADOW] = "MY_SHADOW"
--- For `EntityType.CONSTANT_STONE_SHOOTER` (202),
-- `ConstantStoneShooterVariant.CONSTANT_STONE_SHOOTER` (0).
-- 
-- This is the same as the `Direction` enum.
____exports.ConstantStoneShooterSubType = {}
____exports.ConstantStoneShooterSubType.LEFT = 0
____exports.ConstantStoneShooterSubType[____exports.ConstantStoneShooterSubType.LEFT] = "LEFT"
____exports.ConstantStoneShooterSubType.UP = 1
____exports.ConstantStoneShooterSubType[____exports.ConstantStoneShooterSubType.UP] = "UP"
____exports.ConstantStoneShooterSubType.RIGHT = 2
____exports.ConstantStoneShooterSubType[____exports.ConstantStoneShooterSubType.RIGHT] = "RIGHT"
____exports.ConstantStoneShooterSubType.DOWN = 3
____exports.ConstantStoneShooterSubType[____exports.ConstantStoneShooterSubType.DOWN] = "DOWN"
--- For `EntityType.MOTHER` (912), `MotherVariant.MOTHER_1` (0).
____exports.MotherSubType = {}
____exports.MotherSubType.PHASE_1 = 0
____exports.MotherSubType[____exports.MotherSubType.PHASE_1] = "PHASE_1"
____exports.MotherSubType.PHASE_2 = 1
____exports.MotherSubType[____exports.MotherSubType.PHASE_2] = "PHASE_2"
--- For `EntityType.EFFECT` (1000), `EffectVariant.BLOOD_EXPLOSION` (2).
____exports.BloodExplosionSubType = {}
____exports.BloodExplosionSubType.MEDIUM_WITH_LEFTOVER_BLOOD = 0
____exports.BloodExplosionSubType[____exports.BloodExplosionSubType.MEDIUM_WITH_LEFTOVER_BLOOD] = "MEDIUM_WITH_LEFTOVER_BLOOD"
____exports.BloodExplosionSubType.SMALL = 1
____exports.BloodExplosionSubType[____exports.BloodExplosionSubType.SMALL] = "SMALL"
____exports.BloodExplosionSubType.MEDIUM = 2
____exports.BloodExplosionSubType[____exports.BloodExplosionSubType.MEDIUM] = "MEDIUM"
____exports.BloodExplosionSubType.LARGE = 3
____exports.BloodExplosionSubType[____exports.BloodExplosionSubType.LARGE] = "LARGE"
____exports.BloodExplosionSubType.GIANT = 4
____exports.BloodExplosionSubType[____exports.BloodExplosionSubType.GIANT] = "GIANT"
____exports.BloodExplosionSubType.SWIRL = 5
____exports.BloodExplosionSubType[____exports.BloodExplosionSubType.SWIRL] = "SWIRL"
--- For `EntityType.EFFECT` (1000), `EffectVariant.POOF_1` (15).
____exports.PoofSubType = {}
____exports.PoofSubType.NORMAL = 0
____exports.PoofSubType[____exports.PoofSubType.NORMAL] = "NORMAL"
____exports.PoofSubType.SMALL = 1
____exports.PoofSubType[____exports.PoofSubType.SMALL] = "SMALL"
____exports.PoofSubType.LARGE = 3
____exports.PoofSubType[____exports.PoofSubType.LARGE] = "LARGE"
--- For `EntityType.EFFECT` (1000), `EffectVariant.HEAVEN_LIGHT_DOOR` (39).
____exports.HeavenLightDoorSubType = {}
____exports.HeavenLightDoorSubType.HEAVEN_DOOR = 0
____exports.HeavenLightDoorSubType[____exports.HeavenLightDoorSubType.HEAVEN_DOOR] = "HEAVEN_DOOR"
____exports.HeavenLightDoorSubType.MOONLIGHT = 1
____exports.HeavenLightDoorSubType[____exports.HeavenLightDoorSubType.MOONLIGHT] = "MOONLIGHT"
--- For `EntityType.EFFECT` (1000), `EffectVariant.DICE_FLOOR` (76).
____exports.DiceFloorSubType = {}
____exports.DiceFloorSubType.ONE_PIP = 0
____exports.DiceFloorSubType[____exports.DiceFloorSubType.ONE_PIP] = "ONE_PIP"
____exports.DiceFloorSubType.TWO_PIP = 1
____exports.DiceFloorSubType[____exports.DiceFloorSubType.TWO_PIP] = "TWO_PIP"
____exports.DiceFloorSubType.THREE_PIP = 2
____exports.DiceFloorSubType[____exports.DiceFloorSubType.THREE_PIP] = "THREE_PIP"
____exports.DiceFloorSubType.FOUR_PIP = 3
____exports.DiceFloorSubType[____exports.DiceFloorSubType.FOUR_PIP] = "FOUR_PIP"
____exports.DiceFloorSubType.FIVE_PIP = 4
____exports.DiceFloorSubType[____exports.DiceFloorSubType.FIVE_PIP] = "FIVE_PIP"
____exports.DiceFloorSubType.SIX_PIP = 5
____exports.DiceFloorSubType[____exports.DiceFloorSubType.SIX_PIP] = "SIX_PIP"
--- For `EntityType.EFFECT` (1000), `EffectVariant.TALL_LADDER` (156).
____exports.TallLadderSubType = {}
____exports.TallLadderSubType.TALL_LADDER = 0
____exports.TallLadderSubType[____exports.TallLadderSubType.TALL_LADDER] = "TALL_LADDER"
____exports.TallLadderSubType.STAIRWAY = 1
____exports.TallLadderSubType[____exports.TallLadderSubType.STAIRWAY] = "STAIRWAY"
--- For `EntityType.EFFECT` (1000), `EffectVariant.PURGATORY` (189).
____exports.PurgatorySubType = {}
____exports.PurgatorySubType.RIFT = 0
____exports.PurgatorySubType[____exports.PurgatorySubType.RIFT] = "RIFT"
____exports.PurgatorySubType.GHOST = 1
____exports.PurgatorySubType[____exports.PurgatorySubType.GHOST] = "GHOST"
return ____exports
 end,
["lua_modules.isaac-typescript-definitions.dist.src.enums.collections.variants"] = function(...) 
local ____exports = {}
--- For `EntityType.PLAYER` (1).
____exports.PlayerVariant = {}
____exports.PlayerVariant.PLAYER = 0
____exports.PlayerVariant[____exports.PlayerVariant.PLAYER] = "PLAYER"
____exports.PlayerVariant.COOP_BABY = 1
____exports.PlayerVariant[____exports.PlayerVariant.COOP_BABY] = "COOP_BABY"
--- For `EntityType.TEAR` (2).
-- 
-- Generally, the `TearVariant` affects the graphics of the tear, while the `TearFlag` affects the
-- gameplay mechanic. For example, the Euthanasia collectible grants a chance for needle tears that
-- explode. `TearVariant.NEEDLE` makes the tear look like a needle, and the exploding effect comes
-- from `TearFlag.NEEDLE`.
-- 
-- However, there are some exceptions:
-- - `TearVariant.CHAOS_CARD` (9) - The variant grants the instant-kill property of the tear.
-- - `TearVariant.KEY_BLOOD` (44) - Sharp Key makes Isaac shoot key tears that deal extra damage.
--   Both the graphical effect and the extra damage are granted by this variant.
____exports.TearVariant = {}
____exports.TearVariant.BLUE = 0
____exports.TearVariant[____exports.TearVariant.BLUE] = "BLUE"
____exports.TearVariant.BLOOD = 1
____exports.TearVariant[____exports.TearVariant.BLOOD] = "BLOOD"
____exports.TearVariant.TOOTH = 2
____exports.TearVariant[____exports.TearVariant.TOOTH] = "TOOTH"
____exports.TearVariant.METALLIC = 3
____exports.TearVariant[____exports.TearVariant.METALLIC] = "METALLIC"
____exports.TearVariant.BOBS_HEAD = 4
____exports.TearVariant[____exports.TearVariant.BOBS_HEAD] = "BOBS_HEAD"
____exports.TearVariant.FIRE_MIND = 5
____exports.TearVariant[____exports.TearVariant.FIRE_MIND] = "FIRE_MIND"
____exports.TearVariant.DARK_MATTER = 6
____exports.TearVariant[____exports.TearVariant.DARK_MATTER] = "DARK_MATTER"
____exports.TearVariant.MYSTERIOUS = 7
____exports.TearVariant[____exports.TearVariant.MYSTERIOUS] = "MYSTERIOUS"
____exports.TearVariant.SCHYTHE = 8
____exports.TearVariant[____exports.TearVariant.SCHYTHE] = "SCHYTHE"
____exports.TearVariant.CHAOS_CARD = 9
____exports.TearVariant[____exports.TearVariant.CHAOS_CARD] = "CHAOS_CARD"
____exports.TearVariant.LOST_CONTACT = 10
____exports.TearVariant[____exports.TearVariant.LOST_CONTACT] = "LOST_CONTACT"
____exports.TearVariant.CUPID_BLUE = 11
____exports.TearVariant[____exports.TearVariant.CUPID_BLUE] = "CUPID_BLUE"
____exports.TearVariant.CUPID_BLOOD = 12
____exports.TearVariant[____exports.TearVariant.CUPID_BLOOD] = "CUPID_BLOOD"
____exports.TearVariant.NAIL = 13
____exports.TearVariant[____exports.TearVariant.NAIL] = "NAIL"
____exports.TearVariant.PUPULA = 14
____exports.TearVariant[____exports.TearVariant.PUPULA] = "PUPULA"
____exports.TearVariant.PUPULA_BLOOD = 15
____exports.TearVariant[____exports.TearVariant.PUPULA_BLOOD] = "PUPULA_BLOOD"
____exports.TearVariant.GODS_FLESH = 16
____exports.TearVariant[____exports.TearVariant.GODS_FLESH] = "GODS_FLESH"
____exports.TearVariant.GODS_FLESH_BLOOD = 17
____exports.TearVariant[____exports.TearVariant.GODS_FLESH_BLOOD] = "GODS_FLESH_BLOOD"
____exports.TearVariant.DIAMOND = 18
____exports.TearVariant[____exports.TearVariant.DIAMOND] = "DIAMOND"
____exports.TearVariant.EXPLOSIVO = 19
____exports.TearVariant[____exports.TearVariant.EXPLOSIVO] = "EXPLOSIVO"
____exports.TearVariant.COIN = 20
____exports.TearVariant[____exports.TearVariant.COIN] = "COIN"
____exports.TearVariant.MULTIDIMENSIONAL = 21
____exports.TearVariant[____exports.TearVariant.MULTIDIMENSIONAL] = "MULTIDIMENSIONAL"
____exports.TearVariant.STONE = 22
____exports.TearVariant[____exports.TearVariant.STONE] = "STONE"
____exports.TearVariant.NAIL_BLOOD = 23
____exports.TearVariant[____exports.TearVariant.NAIL_BLOOD] = "NAIL_BLOOD"
____exports.TearVariant.GLAUCOMA = 24
____exports.TearVariant[____exports.TearVariant.GLAUCOMA] = "GLAUCOMA"
____exports.TearVariant.GLAUCOMA_BLOOD = 25
____exports.TearVariant[____exports.TearVariant.GLAUCOMA_BLOOD] = "GLAUCOMA_BLOOD"
____exports.TearVariant.BOOGER = 26
____exports.TearVariant[____exports.TearVariant.BOOGER] = "BOOGER"
____exports.TearVariant.EGG = 27
____exports.TearVariant[____exports.TearVariant.EGG] = "EGG"
____exports.TearVariant.RAZOR = 28
____exports.TearVariant[____exports.TearVariant.RAZOR] = "RAZOR"
____exports.TearVariant.BONE = 29
____exports.TearVariant[____exports.TearVariant.BONE] = "BONE"
____exports.TearVariant.BLACK_TOOTH = 30
____exports.TearVariant[____exports.TearVariant.BLACK_TOOTH] = "BLACK_TOOTH"
____exports.TearVariant.NEEDLE = 31
____exports.TearVariant[____exports.TearVariant.NEEDLE] = "NEEDLE"
____exports.TearVariant.BELIAL = 32
____exports.TearVariant[____exports.TearVariant.BELIAL] = "BELIAL"
____exports.TearVariant.EYE = 33
____exports.TearVariant[____exports.TearVariant.EYE] = "EYE"
____exports.TearVariant.EYE_BLOOD = 34
____exports.TearVariant[____exports.TearVariant.EYE_BLOOD] = "EYE_BLOOD"
____exports.TearVariant.BALLOON = 35
____exports.TearVariant[____exports.TearVariant.BALLOON] = "BALLOON"
____exports.TearVariant.HUNGRY = 36
____exports.TearVariant[____exports.TearVariant.HUNGRY] = "HUNGRY"
____exports.TearVariant.BALLOON_BRIMSTONE = 37
____exports.TearVariant[____exports.TearVariant.BALLOON_BRIMSTONE] = "BALLOON_BRIMSTONE"
____exports.TearVariant.BALLOON_BOMB = 38
____exports.TearVariant[____exports.TearVariant.BALLOON_BOMB] = "BALLOON_BOMB"
____exports.TearVariant.FIST = 39
____exports.TearVariant[____exports.TearVariant.FIST] = "FIST"
____exports.TearVariant.GRID_ENTITY = 40
____exports.TearVariant[____exports.TearVariant.GRID_ENTITY] = "GRID_ENTITY"
____exports.TearVariant.ICE = 41
____exports.TearVariant[____exports.TearVariant.ICE] = "ICE"
____exports.TearVariant.ROCK = 42
____exports.TearVariant[____exports.TearVariant.ROCK] = "ROCK"
____exports.TearVariant.KEY = 43
____exports.TearVariant[____exports.TearVariant.KEY] = "KEY"
____exports.TearVariant.KEY_BLOOD = 44
____exports.TearVariant[____exports.TearVariant.KEY_BLOOD] = "KEY_BLOOD"
____exports.TearVariant.ERASER = 45
____exports.TearVariant[____exports.TearVariant.ERASER] = "ERASER"
____exports.TearVariant.FIRE = 46
____exports.TearVariant[____exports.TearVariant.FIRE] = "FIRE"
____exports.TearVariant.SWORD_BEAM = 47
____exports.TearVariant[____exports.TearVariant.SWORD_BEAM] = "SWORD_BEAM"
____exports.TearVariant.SPORE = 48
____exports.TearVariant[____exports.TearVariant.SPORE] = "SPORE"
____exports.TearVariant.TECH_SWORD_BEAM = 49
____exports.TearVariant[____exports.TearVariant.TECH_SWORD_BEAM] = "TECH_SWORD_BEAM"
--- For `EntityType.FAMILIAR` (3).
____exports.FamiliarVariant = {}
____exports.FamiliarVariant.FAMILIAR_NULL = 0
____exports.FamiliarVariant[____exports.FamiliarVariant.FAMILIAR_NULL] = "FAMILIAR_NULL"
____exports.FamiliarVariant.BROTHER_BOBBY = 1
____exports.FamiliarVariant[____exports.FamiliarVariant.BROTHER_BOBBY] = "BROTHER_BOBBY"
____exports.FamiliarVariant.DEMON_BABY = 2
____exports.FamiliarVariant[____exports.FamiliarVariant.DEMON_BABY] = "DEMON_BABY"
____exports.FamiliarVariant.LITTLE_CHUBBY = 3
____exports.FamiliarVariant[____exports.FamiliarVariant.LITTLE_CHUBBY] = "LITTLE_CHUBBY"
____exports.FamiliarVariant.LITTLE_GISH = 4
____exports.FamiliarVariant[____exports.FamiliarVariant.LITTLE_GISH] = "LITTLE_GISH"
____exports.FamiliarVariant.LITTLE_STEVEN = 5
____exports.FamiliarVariant[____exports.FamiliarVariant.LITTLE_STEVEN] = "LITTLE_STEVEN"
____exports.FamiliarVariant.ROBO_BABY = 6
____exports.FamiliarVariant[____exports.FamiliarVariant.ROBO_BABY] = "ROBO_BABY"
____exports.FamiliarVariant.SISTER_MAGGY = 7
____exports.FamiliarVariant[____exports.FamiliarVariant.SISTER_MAGGY] = "SISTER_MAGGY"
____exports.FamiliarVariant.ABEL = 8
____exports.FamiliarVariant[____exports.FamiliarVariant.ABEL] = "ABEL"
____exports.FamiliarVariant.GHOST_BABY = 9
____exports.FamiliarVariant[____exports.FamiliarVariant.GHOST_BABY] = "GHOST_BABY"
____exports.FamiliarVariant.HARLEQUIN_BABY = 10
____exports.FamiliarVariant[____exports.FamiliarVariant.HARLEQUIN_BABY] = "HARLEQUIN_BABY"
____exports.FamiliarVariant.RAINBOW_BABY = 11
____exports.FamiliarVariant[____exports.FamiliarVariant.RAINBOW_BABY] = "RAINBOW_BABY"
____exports.FamiliarVariant.ISAACS_HEAD = 12
____exports.FamiliarVariant[____exports.FamiliarVariant.ISAACS_HEAD] = "ISAACS_HEAD"
____exports.FamiliarVariant.BLUE_BABY_SOUL = 13
____exports.FamiliarVariant[____exports.FamiliarVariant.BLUE_BABY_SOUL] = "BLUE_BABY_SOUL"
____exports.FamiliarVariant.DEAD_BIRD = 14
____exports.FamiliarVariant[____exports.FamiliarVariant.DEAD_BIRD] = "DEAD_BIRD"
____exports.FamiliarVariant.EVES_BIRD_FOOT = 15
____exports.FamiliarVariant[____exports.FamiliarVariant.EVES_BIRD_FOOT] = "EVES_BIRD_FOOT"
____exports.FamiliarVariant.DADDY_LONGLEGS = 16
____exports.FamiliarVariant[____exports.FamiliarVariant.DADDY_LONGLEGS] = "DADDY_LONGLEGS"
____exports.FamiliarVariant.PEEPER = 17
____exports.FamiliarVariant[____exports.FamiliarVariant.PEEPER] = "PEEPER"
____exports.FamiliarVariant.BOMB_BAG = 20
____exports.FamiliarVariant[____exports.FamiliarVariant.BOMB_BAG] = "BOMB_BAG"
____exports.FamiliarVariant.SACK_OF_PENNIES = 21
____exports.FamiliarVariant[____exports.FamiliarVariant.SACK_OF_PENNIES] = "SACK_OF_PENNIES"
____exports.FamiliarVariant.LITTLE_CHAD = 22
____exports.FamiliarVariant[____exports.FamiliarVariant.LITTLE_CHAD] = "LITTLE_CHAD"
____exports.FamiliarVariant.RELIC = 23
____exports.FamiliarVariant[____exports.FamiliarVariant.RELIC] = "RELIC"
____exports.FamiliarVariant.BUM_FRIEND = 24
____exports.FamiliarVariant[____exports.FamiliarVariant.BUM_FRIEND] = "BUM_FRIEND"
____exports.FamiliarVariant.HOLY_WATER = 25
____exports.FamiliarVariant[____exports.FamiliarVariant.HOLY_WATER] = "HOLY_WATER"
____exports.FamiliarVariant.KEY_PIECE_1 = 26
____exports.FamiliarVariant[____exports.FamiliarVariant.KEY_PIECE_1] = "KEY_PIECE_1"
____exports.FamiliarVariant.KEY_PIECE_2 = 27
____exports.FamiliarVariant[____exports.FamiliarVariant.KEY_PIECE_2] = "KEY_PIECE_2"
____exports.FamiliarVariant.KEY_FULL = 28
____exports.FamiliarVariant[____exports.FamiliarVariant.KEY_FULL] = "KEY_FULL"
____exports.FamiliarVariant.FOREVER_ALONE = 30
____exports.FamiliarVariant[____exports.FamiliarVariant.FOREVER_ALONE] = "FOREVER_ALONE"
____exports.FamiliarVariant.DISTANT_ADMIRATION = 31
____exports.FamiliarVariant[____exports.FamiliarVariant.DISTANT_ADMIRATION] = "DISTANT_ADMIRATION"
____exports.FamiliarVariant.GUARDIAN_ANGEL = 32
____exports.FamiliarVariant[____exports.FamiliarVariant.GUARDIAN_ANGEL] = "GUARDIAN_ANGEL"
____exports.FamiliarVariant.FLY_ORBITAL = 33
____exports.FamiliarVariant[____exports.FamiliarVariant.FLY_ORBITAL] = "FLY_ORBITAL"
____exports.FamiliarVariant.SACRIFICIAL_DAGGER = 35
____exports.FamiliarVariant[____exports.FamiliarVariant.SACRIFICIAL_DAGGER] = "SACRIFICIAL_DAGGER"
____exports.FamiliarVariant.DEAD_CAT = 40
____exports.FamiliarVariant[____exports.FamiliarVariant.DEAD_CAT] = "DEAD_CAT"
____exports.FamiliarVariant.ONE_UP = 41
____exports.FamiliarVariant[____exports.FamiliarVariant.ONE_UP] = "ONE_UP"
____exports.FamiliarVariant.GUPPYS_HAIRBALL = 42
____exports.FamiliarVariant[____exports.FamiliarVariant.GUPPYS_HAIRBALL] = "GUPPYS_HAIRBALL"
____exports.FamiliarVariant.BLUE_FLY = 43
____exports.FamiliarVariant[____exports.FamiliarVariant.BLUE_FLY] = "BLUE_FLY"
____exports.FamiliarVariant.CUBE_OF_MEAT_1 = 44
____exports.FamiliarVariant[____exports.FamiliarVariant.CUBE_OF_MEAT_1] = "CUBE_OF_MEAT_1"
____exports.FamiliarVariant.CUBE_OF_MEAT_2 = 45
____exports.FamiliarVariant[____exports.FamiliarVariant.CUBE_OF_MEAT_2] = "CUBE_OF_MEAT_2"
____exports.FamiliarVariant.CUBE_OF_MEAT_3 = 46
____exports.FamiliarVariant[____exports.FamiliarVariant.CUBE_OF_MEAT_3] = "CUBE_OF_MEAT_3"
____exports.FamiliarVariant.CUBE_OF_MEAT_4 = 47
____exports.FamiliarVariant[____exports.FamiliarVariant.CUBE_OF_MEAT_4] = "CUBE_OF_MEAT_4"
____exports.FamiliarVariant.ISAACS_BODY = 48
____exports.FamiliarVariant[____exports.FamiliarVariant.ISAACS_BODY] = "ISAACS_BODY"
____exports.FamiliarVariant.SMART_FLY = 50
____exports.FamiliarVariant[____exports.FamiliarVariant.SMART_FLY] = "SMART_FLY"
____exports.FamiliarVariant.DRY_BABY = 51
____exports.FamiliarVariant[____exports.FamiliarVariant.DRY_BABY] = "DRY_BABY"
____exports.FamiliarVariant.JUICY_SACK = 52
____exports.FamiliarVariant[____exports.FamiliarVariant.JUICY_SACK] = "JUICY_SACK"
____exports.FamiliarVariant.ROBO_BABY_2 = 53
____exports.FamiliarVariant[____exports.FamiliarVariant.ROBO_BABY_2] = "ROBO_BABY_2"
____exports.FamiliarVariant.ROTTEN_BABY = 54
____exports.FamiliarVariant[____exports.FamiliarVariant.ROTTEN_BABY] = "ROTTEN_BABY"
____exports.FamiliarVariant.HEADLESS_BABY = 55
____exports.FamiliarVariant[____exports.FamiliarVariant.HEADLESS_BABY] = "HEADLESS_BABY"
____exports.FamiliarVariant.LEECH = 56
____exports.FamiliarVariant[____exports.FamiliarVariant.LEECH] = "LEECH"
____exports.FamiliarVariant.MYSTERY_SACK = 57
____exports.FamiliarVariant[____exports.FamiliarVariant.MYSTERY_SACK] = "MYSTERY_SACK"
____exports.FamiliarVariant.BBF = 58
____exports.FamiliarVariant[____exports.FamiliarVariant.BBF] = "BBF"
____exports.FamiliarVariant.BOBS_BRAIN = 59
____exports.FamiliarVariant[____exports.FamiliarVariant.BOBS_BRAIN] = "BOBS_BRAIN"
____exports.FamiliarVariant.BEST_BUD = 60
____exports.FamiliarVariant[____exports.FamiliarVariant.BEST_BUD] = "BEST_BUD"
____exports.FamiliarVariant.LIL_BRIMSTONE = 61
____exports.FamiliarVariant[____exports.FamiliarVariant.LIL_BRIMSTONE] = "LIL_BRIMSTONE"
____exports.FamiliarVariant.ISAACS_HEART = 62
____exports.FamiliarVariant[____exports.FamiliarVariant.ISAACS_HEART] = "ISAACS_HEART"
____exports.FamiliarVariant.LIL_HAUNT = 63
____exports.FamiliarVariant[____exports.FamiliarVariant.LIL_HAUNT] = "LIL_HAUNT"
____exports.FamiliarVariant.DARK_BUM = 64
____exports.FamiliarVariant[____exports.FamiliarVariant.DARK_BUM] = "DARK_BUM"
____exports.FamiliarVariant.BIG_FAN = 65
____exports.FamiliarVariant[____exports.FamiliarVariant.BIG_FAN] = "BIG_FAN"
____exports.FamiliarVariant.SISSY_LONGLEGS = 66
____exports.FamiliarVariant[____exports.FamiliarVariant.SISSY_LONGLEGS] = "SISSY_LONGLEGS"
____exports.FamiliarVariant.PUNCHING_BAG = 67
____exports.FamiliarVariant[____exports.FamiliarVariant.PUNCHING_BAG] = "PUNCHING_BAG"
____exports.FamiliarVariant.GUILLOTINE = 68
____exports.FamiliarVariant[____exports.FamiliarVariant.GUILLOTINE] = "GUILLOTINE"
____exports.FamiliarVariant.BALL_OF_BANDAGES_1 = 69
____exports.FamiliarVariant[____exports.FamiliarVariant.BALL_OF_BANDAGES_1] = "BALL_OF_BANDAGES_1"
____exports.FamiliarVariant.BALL_OF_BANDAGES_2 = 70
____exports.FamiliarVariant[____exports.FamiliarVariant.BALL_OF_BANDAGES_2] = "BALL_OF_BANDAGES_2"
____exports.FamiliarVariant.BALL_OF_BANDAGES_3 = 71
____exports.FamiliarVariant[____exports.FamiliarVariant.BALL_OF_BANDAGES_3] = "BALL_OF_BANDAGES_3"
____exports.FamiliarVariant.BALL_OF_BANDAGES_4 = 72
____exports.FamiliarVariant[____exports.FamiliarVariant.BALL_OF_BANDAGES_4] = "BALL_OF_BANDAGES_4"
____exports.FamiliarVariant.BLUE_SPIDER = 73
____exports.FamiliarVariant[____exports.FamiliarVariant.BLUE_SPIDER] = "BLUE_SPIDER"
____exports.FamiliarVariant.MONGO_BABY = 74
____exports.FamiliarVariant[____exports.FamiliarVariant.MONGO_BABY] = "MONGO_BABY"
____exports.FamiliarVariant.SAMSONS_CHAINS = 75
____exports.FamiliarVariant[____exports.FamiliarVariant.SAMSONS_CHAINS] = "SAMSONS_CHAINS"
____exports.FamiliarVariant.CAINS_OTHER_EYE = 76
____exports.FamiliarVariant[____exports.FamiliarVariant.CAINS_OTHER_EYE] = "CAINS_OTHER_EYE"
____exports.FamiliarVariant.BLUE_BABYS_ONLY_FRIEND = 77
____exports.FamiliarVariant[____exports.FamiliarVariant.BLUE_BABYS_ONLY_FRIEND] = "BLUE_BABYS_ONLY_FRIEND"
____exports.FamiliarVariant.SCISSORS = 78
____exports.FamiliarVariant[____exports.FamiliarVariant.SCISSORS] = "SCISSORS"
____exports.FamiliarVariant.GEMINI = 79
____exports.FamiliarVariant[____exports.FamiliarVariant.GEMINI] = "GEMINI"
____exports.FamiliarVariant.INCUBUS = 80
____exports.FamiliarVariant[____exports.FamiliarVariant.INCUBUS] = "INCUBUS"
____exports.FamiliarVariant.FATES_REWARD = 81
____exports.FamiliarVariant[____exports.FamiliarVariant.FATES_REWARD] = "FATES_REWARD"
____exports.FamiliarVariant.LIL_CHEST = 82
____exports.FamiliarVariant[____exports.FamiliarVariant.LIL_CHEST] = "LIL_CHEST"
____exports.FamiliarVariant.SWORN_PROTECTOR = 83
____exports.FamiliarVariant[____exports.FamiliarVariant.SWORN_PROTECTOR] = "SWORN_PROTECTOR"
____exports.FamiliarVariant.FRIEND_ZONE = 84
____exports.FamiliarVariant[____exports.FamiliarVariant.FRIEND_ZONE] = "FRIEND_ZONE"
____exports.FamiliarVariant.LOST_FLY = 85
____exports.FamiliarVariant[____exports.FamiliarVariant.LOST_FLY] = "LOST_FLY"
____exports.FamiliarVariant.CHARGED_BABY = 86
____exports.FamiliarVariant[____exports.FamiliarVariant.CHARGED_BABY] = "CHARGED_BABY"
____exports.FamiliarVariant.LIL_GURDY = 87
____exports.FamiliarVariant[____exports.FamiliarVariant.LIL_GURDY] = "LIL_GURDY"
____exports.FamiliarVariant.BUMBO = 88
____exports.FamiliarVariant[____exports.FamiliarVariant.BUMBO] = "BUMBO"
____exports.FamiliarVariant.CENSER = 89
____exports.FamiliarVariant[____exports.FamiliarVariant.CENSER] = "CENSER"
____exports.FamiliarVariant.KEY_BUM = 90
____exports.FamiliarVariant[____exports.FamiliarVariant.KEY_BUM] = "KEY_BUM"
____exports.FamiliarVariant.RUNE_BAG = 91
____exports.FamiliarVariant[____exports.FamiliarVariant.RUNE_BAG] = "RUNE_BAG"
____exports.FamiliarVariant.SERAPHIM = 92
____exports.FamiliarVariant[____exports.FamiliarVariant.SERAPHIM] = "SERAPHIM"
____exports.FamiliarVariant.GB_BUG = 93
____exports.FamiliarVariant[____exports.FamiliarVariant.GB_BUG] = "GB_BUG"
____exports.FamiliarVariant.SPIDER_MOD = 94
____exports.FamiliarVariant[____exports.FamiliarVariant.SPIDER_MOD] = "SPIDER_MOD"
____exports.FamiliarVariant.FARTING_BABY = 95
____exports.FamiliarVariant[____exports.FamiliarVariant.FARTING_BABY] = "FARTING_BABY"
____exports.FamiliarVariant.SUCCUBUS = 96
____exports.FamiliarVariant[____exports.FamiliarVariant.SUCCUBUS] = "SUCCUBUS"
____exports.FamiliarVariant.LIL_LOKI = 97
____exports.FamiliarVariant[____exports.FamiliarVariant.LIL_LOKI] = "LIL_LOKI"
____exports.FamiliarVariant.OBSESSED_FAN = 98
____exports.FamiliarVariant[____exports.FamiliarVariant.OBSESSED_FAN] = "OBSESSED_FAN"
____exports.FamiliarVariant.PAPA_FLY = 99
____exports.FamiliarVariant[____exports.FamiliarVariant.PAPA_FLY] = "PAPA_FLY"
____exports.FamiliarVariant.MILK = 100
____exports.FamiliarVariant[____exports.FamiliarVariant.MILK] = "MILK"
____exports.FamiliarVariant.MULTIDIMENSIONAL_BABY = 101
____exports.FamiliarVariant[____exports.FamiliarVariant.MULTIDIMENSIONAL_BABY] = "MULTIDIMENSIONAL_BABY"
____exports.FamiliarVariant.SUPER_BUM = 102
____exports.FamiliarVariant[____exports.FamiliarVariant.SUPER_BUM] = "SUPER_BUM"
____exports.FamiliarVariant.TONSIL = 103
____exports.FamiliarVariant[____exports.FamiliarVariant.TONSIL] = "TONSIL"
____exports.FamiliarVariant.BIG_CHUBBY = 104
____exports.FamiliarVariant[____exports.FamiliarVariant.BIG_CHUBBY] = "BIG_CHUBBY"
____exports.FamiliarVariant.DEPRESSION = 105
____exports.FamiliarVariant[____exports.FamiliarVariant.DEPRESSION] = "DEPRESSION"
____exports.FamiliarVariant.SHADE = 106
____exports.FamiliarVariant[____exports.FamiliarVariant.SHADE] = "SHADE"
____exports.FamiliarVariant.HUSHY = 107
____exports.FamiliarVariant[____exports.FamiliarVariant.HUSHY] = "HUSHY"
____exports.FamiliarVariant.LIL_MONSTRO = 108
____exports.FamiliarVariant[____exports.FamiliarVariant.LIL_MONSTRO] = "LIL_MONSTRO"
____exports.FamiliarVariant.KING_BABY = 109
____exports.FamiliarVariant[____exports.FamiliarVariant.KING_BABY] = "KING_BABY"
____exports.FamiliarVariant.FINGER = 110
____exports.FamiliarVariant[____exports.FamiliarVariant.FINGER] = "FINGER"
____exports.FamiliarVariant.YO_LISTEN = 111
____exports.FamiliarVariant[____exports.FamiliarVariant.YO_LISTEN] = "YO_LISTEN"
____exports.FamiliarVariant.ACID_BABY = 112
____exports.FamiliarVariant[____exports.FamiliarVariant.ACID_BABY] = "ACID_BABY"
____exports.FamiliarVariant.SPIDER_BABY = 113
____exports.FamiliarVariant[____exports.FamiliarVariant.SPIDER_BABY] = "SPIDER_BABY"
____exports.FamiliarVariant.SACK_OF_SACKS = 114
____exports.FamiliarVariant[____exports.FamiliarVariant.SACK_OF_SACKS] = "SACK_OF_SACKS"
____exports.FamiliarVariant.BROWN_NUGGET_POOTER = 115
____exports.FamiliarVariant[____exports.FamiliarVariant.BROWN_NUGGET_POOTER] = "BROWN_NUGGET_POOTER"
____exports.FamiliarVariant.BLOODSHOT_EYE = 116
____exports.FamiliarVariant[____exports.FamiliarVariant.BLOODSHOT_EYE] = "BLOODSHOT_EYE"
____exports.FamiliarVariant.MOMS_RAZOR = 117
____exports.FamiliarVariant[____exports.FamiliarVariant.MOMS_RAZOR] = "MOMS_RAZOR"
____exports.FamiliarVariant.ANGRY_FLY = 118
____exports.FamiliarVariant[____exports.FamiliarVariant.ANGRY_FLY] = "ANGRY_FLY"
____exports.FamiliarVariant.BUDDY_IN_A_BOX = 119
____exports.FamiliarVariant[____exports.FamiliarVariant.BUDDY_IN_A_BOX] = "BUDDY_IN_A_BOX"
____exports.FamiliarVariant.SPRINKLER = 120
____exports.FamiliarVariant[____exports.FamiliarVariant.SPRINKLER] = "SPRINKLER"
____exports.FamiliarVariant.LEPROSY = 121
____exports.FamiliarVariant[____exports.FamiliarVariant.LEPROSY] = "LEPROSY"
____exports.FamiliarVariant.LIL_HARBINGERS = 122
____exports.FamiliarVariant[____exports.FamiliarVariant.LIL_HARBINGERS] = "LIL_HARBINGERS"
____exports.FamiliarVariant.ANGELIC_PRISM = 123
____exports.FamiliarVariant[____exports.FamiliarVariant.ANGELIC_PRISM] = "ANGELIC_PRISM"
____exports.FamiliarVariant.MYSTERY_EGG = 124
____exports.FamiliarVariant[____exports.FamiliarVariant.MYSTERY_EGG] = "MYSTERY_EGG"
____exports.FamiliarVariant.LIL_SPEWER = 125
____exports.FamiliarVariant[____exports.FamiliarVariant.LIL_SPEWER] = "LIL_SPEWER"
____exports.FamiliarVariant.SLIPPED_RIB = 126
____exports.FamiliarVariant[____exports.FamiliarVariant.SLIPPED_RIB] = "SLIPPED_RIB"
____exports.FamiliarVariant.POINTY_RIB = 127
____exports.FamiliarVariant[____exports.FamiliarVariant.POINTY_RIB] = "POINTY_RIB"
____exports.FamiliarVariant.BONE_ORBITAL = 128
____exports.FamiliarVariant[____exports.FamiliarVariant.BONE_ORBITAL] = "BONE_ORBITAL"
____exports.FamiliarVariant.HALLOWED_GROUND = 129
____exports.FamiliarVariant[____exports.FamiliarVariant.HALLOWED_GROUND] = "HALLOWED_GROUND"
____exports.FamiliarVariant.JAW_BONE = 130
____exports.FamiliarVariant[____exports.FamiliarVariant.JAW_BONE] = "JAW_BONE"
____exports.FamiliarVariant.INTRUDER = 200
____exports.FamiliarVariant[____exports.FamiliarVariant.INTRUDER] = "INTRUDER"
____exports.FamiliarVariant.DIP = 201
____exports.FamiliarVariant[____exports.FamiliarVariant.DIP] = "DIP"
____exports.FamiliarVariant.DAMOCLES = 202
____exports.FamiliarVariant[____exports.FamiliarVariant.DAMOCLES] = "DAMOCLES"
____exports.FamiliarVariant.BLOOD_OATH = 203
____exports.FamiliarVariant[____exports.FamiliarVariant.BLOOD_OATH] = "BLOOD_OATH"
____exports.FamiliarVariant.PSY_FLY = 204
____exports.FamiliarVariant[____exports.FamiliarVariant.PSY_FLY] = "PSY_FLY"
____exports.FamiliarVariant.MENORAH = 205
____exports.FamiliarVariant[____exports.FamiliarVariant.MENORAH] = "MENORAH"
____exports.FamiliarVariant.WISP = 206
____exports.FamiliarVariant[____exports.FamiliarVariant.WISP] = "WISP"
____exports.FamiliarVariant.PEEPER_2 = 207
____exports.FamiliarVariant[____exports.FamiliarVariant.PEEPER_2] = "PEEPER_2"
____exports.FamiliarVariant.BOILED_BABY = 208
____exports.FamiliarVariant[____exports.FamiliarVariant.BOILED_BABY] = "BOILED_BABY"
____exports.FamiliarVariant.FREEZER_BABY = 209
____exports.FamiliarVariant[____exports.FamiliarVariant.FREEZER_BABY] = "FREEZER_BABY"
____exports.FamiliarVariant.BIRD_CAGE = 210
____exports.FamiliarVariant[____exports.FamiliarVariant.BIRD_CAGE] = "BIRD_CAGE"
____exports.FamiliarVariant.LOST_SOUL = 211
____exports.FamiliarVariant[____exports.FamiliarVariant.LOST_SOUL] = "LOST_SOUL"
____exports.FamiliarVariant.LIL_DUMPY = 212
____exports.FamiliarVariant[____exports.FamiliarVariant.LIL_DUMPY] = "LIL_DUMPY"
____exports.FamiliarVariant.KNIFE_PIECE_1 = 213
____exports.FamiliarVariant[____exports.FamiliarVariant.KNIFE_PIECE_1] = "KNIFE_PIECE_1"
____exports.FamiliarVariant.KNIFE_PIECE_2 = 214
____exports.FamiliarVariant[____exports.FamiliarVariant.KNIFE_PIECE_2] = "KNIFE_PIECE_2"
____exports.FamiliarVariant.TINYTOMA = 216
____exports.FamiliarVariant[____exports.FamiliarVariant.TINYTOMA] = "TINYTOMA"
____exports.FamiliarVariant.TINYTOMA_2 = 217
____exports.FamiliarVariant[____exports.FamiliarVariant.TINYTOMA_2] = "TINYTOMA_2"
____exports.FamiliarVariant.BOT_FLY = 218
____exports.FamiliarVariant[____exports.FamiliarVariant.BOT_FLY] = "BOT_FLY"
____exports.FamiliarVariant.SIREN_MINION = 220
____exports.FamiliarVariant[____exports.FamiliarVariant.SIREN_MINION] = "SIREN_MINION"
____exports.FamiliarVariant.PASCHAL_CANDLE = 221
____exports.FamiliarVariant[____exports.FamiliarVariant.PASCHAL_CANDLE] = "PASCHAL_CANDLE"
____exports.FamiliarVariant.STITCHES = 222
____exports.FamiliarVariant[____exports.FamiliarVariant.STITCHES] = "STITCHES"
____exports.FamiliarVariant.KNIFE_FULL = 223
____exports.FamiliarVariant[____exports.FamiliarVariant.KNIFE_FULL] = "KNIFE_FULL"
____exports.FamiliarVariant.BABY_PLUM = 224
____exports.FamiliarVariant[____exports.FamiliarVariant.BABY_PLUM] = "BABY_PLUM"
____exports.FamiliarVariant.FRUITY_PLUM = 225
____exports.FamiliarVariant[____exports.FamiliarVariant.FRUITY_PLUM] = "FRUITY_PLUM"
____exports.FamiliarVariant.SPIN_TO_WIN = 226
____exports.FamiliarVariant[____exports.FamiliarVariant.SPIN_TO_WIN] = "SPIN_TO_WIN"
____exports.FamiliarVariant.MINISAAC = 228
____exports.FamiliarVariant[____exports.FamiliarVariant.MINISAAC] = "MINISAAC"
____exports.FamiliarVariant.SWARM_FLY_ORBITAL = 229
____exports.FamiliarVariant[____exports.FamiliarVariant.SWARM_FLY_ORBITAL] = "SWARM_FLY_ORBITAL"
____exports.FamiliarVariant.LIL_ABADDON = 230
____exports.FamiliarVariant[____exports.FamiliarVariant.LIL_ABADDON] = "LIL_ABADDON"
____exports.FamiliarVariant.ABYSS_LOCUST = 231
____exports.FamiliarVariant[____exports.FamiliarVariant.ABYSS_LOCUST] = "ABYSS_LOCUST"
____exports.FamiliarVariant.LIL_PORTAL = 232
____exports.FamiliarVariant[____exports.FamiliarVariant.LIL_PORTAL] = "LIL_PORTAL"
____exports.FamiliarVariant.WORM_FRIEND = 233
____exports.FamiliarVariant[____exports.FamiliarVariant.WORM_FRIEND] = "WORM_FRIEND"
____exports.FamiliarVariant.BONE_SPUR = 234
____exports.FamiliarVariant[____exports.FamiliarVariant.BONE_SPUR] = "BONE_SPUR"
____exports.FamiliarVariant.TWISTED_BABY = 235
____exports.FamiliarVariant[____exports.FamiliarVariant.TWISTED_BABY] = "TWISTED_BABY"
____exports.FamiliarVariant.STAR_OF_BETHLEHEM = 236
____exports.FamiliarVariant[____exports.FamiliarVariant.STAR_OF_BETHLEHEM] = "STAR_OF_BETHLEHEM"
____exports.FamiliarVariant.ITEM_WISP = 237
____exports.FamiliarVariant[____exports.FamiliarVariant.ITEM_WISP] = "ITEM_WISP"
____exports.FamiliarVariant.BLOOD_BABY = 238
____exports.FamiliarVariant[____exports.FamiliarVariant.BLOOD_BABY] = "BLOOD_BABY"
____exports.FamiliarVariant.CUBE_BABY = 239
____exports.FamiliarVariant[____exports.FamiliarVariant.CUBE_BABY] = "CUBE_BABY"
____exports.FamiliarVariant.UMBILICAL_BABY = 240
____exports.FamiliarVariant[____exports.FamiliarVariant.UMBILICAL_BABY] = "UMBILICAL_BABY"
____exports.FamiliarVariant.BLOOD_PUPPY = 241
____exports.FamiliarVariant[____exports.FamiliarVariant.BLOOD_PUPPY] = "BLOOD_PUPPY"
____exports.FamiliarVariant.VANISHING_TWIN = 242
____exports.FamiliarVariant[____exports.FamiliarVariant.VANISHING_TWIN] = "VANISHING_TWIN"
____exports.FamiliarVariant.DECAP_ATTACK = 243
____exports.FamiliarVariant[____exports.FamiliarVariant.DECAP_ATTACK] = "DECAP_ATTACK"
____exports.FamiliarVariant.FORGOTTEN_BODY = 900
____exports.FamiliarVariant[____exports.FamiliarVariant.FORGOTTEN_BODY] = "FORGOTTEN_BODY"
--- For `EntityType.BOMB` (4).
____exports.BombVariant = {}
____exports.BombVariant.NORMAL = 0
____exports.BombVariant[____exports.BombVariant.NORMAL] = "NORMAL"
____exports.BombVariant.BIG = 1
____exports.BombVariant[____exports.BombVariant.BIG] = "BIG"
____exports.BombVariant.DECOY = 2
____exports.BombVariant[____exports.BombVariant.DECOY] = "DECOY"
____exports.BombVariant.TROLL = 3
____exports.BombVariant[____exports.BombVariant.TROLL] = "TROLL"
____exports.BombVariant.MEGA_TROLL = 4
____exports.BombVariant[____exports.BombVariant.MEGA_TROLL] = "MEGA_TROLL"
____exports.BombVariant.POISON = 5
____exports.BombVariant[____exports.BombVariant.POISON] = "POISON"
____exports.BombVariant.POISON_BIG = 6
____exports.BombVariant[____exports.BombVariant.POISON_BIG] = "POISON_BIG"
____exports.BombVariant.SAD = 7
____exports.BombVariant[____exports.BombVariant.SAD] = "SAD"
____exports.BombVariant.HOT = 8
____exports.BombVariant[____exports.BombVariant.HOT] = "HOT"
____exports.BombVariant.BUTT = 9
____exports.BombVariant[____exports.BombVariant.BUTT] = "BUTT"
____exports.BombVariant.MR_MEGA = 10
____exports.BombVariant[____exports.BombVariant.MR_MEGA] = "MR_MEGA"
____exports.BombVariant.BOBBY = 11
____exports.BombVariant[____exports.BombVariant.BOBBY] = "BOBBY"
____exports.BombVariant.GLITTER = 12
____exports.BombVariant[____exports.BombVariant.GLITTER] = "GLITTER"
____exports.BombVariant.THROWABLE = 13
____exports.BombVariant[____exports.BombVariant.THROWABLE] = "THROWABLE"
____exports.BombVariant.SMALL = 14
____exports.BombVariant[____exports.BombVariant.SMALL] = "SMALL"
____exports.BombVariant.BRIMSTONE = 15
____exports.BombVariant[____exports.BombVariant.BRIMSTONE] = "BRIMSTONE"
____exports.BombVariant.SAD_BLOOD = 16
____exports.BombVariant[____exports.BombVariant.SAD_BLOOD] = "SAD_BLOOD"
____exports.BombVariant.GIGA = 17
____exports.BombVariant[____exports.BombVariant.GIGA] = "GIGA"
____exports.BombVariant.GOLDEN_TROLL = 18
____exports.BombVariant[____exports.BombVariant.GOLDEN_TROLL] = "GOLDEN_TROLL"
____exports.BombVariant.ROCKET = 19
____exports.BombVariant[____exports.BombVariant.ROCKET] = "ROCKET"
____exports.BombVariant.ROCKET_GIGA = 20
____exports.BombVariant[____exports.BombVariant.ROCKET_GIGA] = "ROCKET_GIGA"
--- For `EntityType.PICKUP` (5).
____exports.PickupVariant = {}
____exports.PickupVariant.NULL = 0
____exports.PickupVariant[____exports.PickupVariant.NULL] = "NULL"
____exports.PickupVariant.HEART = 10
____exports.PickupVariant[____exports.PickupVariant.HEART] = "HEART"
____exports.PickupVariant.COIN = 20
____exports.PickupVariant[____exports.PickupVariant.COIN] = "COIN"
____exports.PickupVariant.KEY = 30
____exports.PickupVariant[____exports.PickupVariant.KEY] = "KEY"
____exports.PickupVariant.BOMB = 40
____exports.PickupVariant[____exports.PickupVariant.BOMB] = "BOMB"
____exports.PickupVariant.THROWABLE_BOMB = 41
____exports.PickupVariant[____exports.PickupVariant.THROWABLE_BOMB] = "THROWABLE_BOMB"
____exports.PickupVariant.POOP = 42
____exports.PickupVariant[____exports.PickupVariant.POOP] = "POOP"
____exports.PickupVariant.CHEST = 50
____exports.PickupVariant[____exports.PickupVariant.CHEST] = "CHEST"
____exports.PickupVariant.BOMB_CHEST = 51
____exports.PickupVariant[____exports.PickupVariant.BOMB_CHEST] = "BOMB_CHEST"
____exports.PickupVariant.SPIKED_CHEST = 52
____exports.PickupVariant[____exports.PickupVariant.SPIKED_CHEST] = "SPIKED_CHEST"
____exports.PickupVariant.ETERNAL_CHEST = 53
____exports.PickupVariant[____exports.PickupVariant.ETERNAL_CHEST] = "ETERNAL_CHEST"
____exports.PickupVariant.MIMIC_CHEST = 54
____exports.PickupVariant[____exports.PickupVariant.MIMIC_CHEST] = "MIMIC_CHEST"
____exports.PickupVariant.OLD_CHEST = 55
____exports.PickupVariant[____exports.PickupVariant.OLD_CHEST] = "OLD_CHEST"
____exports.PickupVariant.WOODEN_CHEST = 56
____exports.PickupVariant[____exports.PickupVariant.WOODEN_CHEST] = "WOODEN_CHEST"
____exports.PickupVariant.MEGA_CHEST = 57
____exports.PickupVariant[____exports.PickupVariant.MEGA_CHEST] = "MEGA_CHEST"
____exports.PickupVariant.HAUNTED_CHEST = 58
____exports.PickupVariant[____exports.PickupVariant.HAUNTED_CHEST] = "HAUNTED_CHEST"
____exports.PickupVariant.LOCKED_CHEST = 60
____exports.PickupVariant[____exports.PickupVariant.LOCKED_CHEST] = "LOCKED_CHEST"
____exports.PickupVariant.SACK = 69
____exports.PickupVariant[____exports.PickupVariant.SACK] = "SACK"
____exports.PickupVariant.PILL = 70
____exports.PickupVariant[____exports.PickupVariant.PILL] = "PILL"
____exports.PickupVariant.LIL_BATTERY = 90
____exports.PickupVariant[____exports.PickupVariant.LIL_BATTERY] = "LIL_BATTERY"
____exports.PickupVariant.COLLECTIBLE = 100
____exports.PickupVariant[____exports.PickupVariant.COLLECTIBLE] = "COLLECTIBLE"
____exports.PickupVariant.BROKEN_SHOVEL = 110
____exports.PickupVariant[____exports.PickupVariant.BROKEN_SHOVEL] = "BROKEN_SHOVEL"
____exports.PickupVariant.SHOP_ITEM = 150
____exports.PickupVariant[____exports.PickupVariant.SHOP_ITEM] = "SHOP_ITEM"
____exports.PickupVariant.TAROT_CARD = 300
____exports.PickupVariant[____exports.PickupVariant.TAROT_CARD] = "TAROT_CARD"
____exports.PickupVariant.BIG_CHEST = 340
____exports.PickupVariant[____exports.PickupVariant.BIG_CHEST] = "BIG_CHEST"
____exports.PickupVariant.TRINKET = 350
____exports.PickupVariant[____exports.PickupVariant.TRINKET] = "TRINKET"
____exports.PickupVariant.RED_CHEST = 360
____exports.PickupVariant[____exports.PickupVariant.RED_CHEST] = "RED_CHEST"
____exports.PickupVariant.TROPHY = 370
____exports.PickupVariant[____exports.PickupVariant.TROPHY] = "TROPHY"
____exports.PickupVariant.BED = 380
____exports.PickupVariant[____exports.PickupVariant.BED] = "BED"
____exports.PickupVariant.MOMS_CHEST = 390
____exports.PickupVariant[____exports.PickupVariant.MOMS_CHEST] = "MOMS_CHEST"
--- For `EntityType.SLOT` (6).
____exports.SlotVariant = {}
____exports.SlotVariant.SLOT_MACHINE = 1
____exports.SlotVariant[____exports.SlotVariant.SLOT_MACHINE] = "SLOT_MACHINE"
____exports.SlotVariant.BLOOD_DONATION_MACHINE = 2
____exports.SlotVariant[____exports.SlotVariant.BLOOD_DONATION_MACHINE] = "BLOOD_DONATION_MACHINE"
____exports.SlotVariant.FORTUNE_TELLING_MACHINE = 3
____exports.SlotVariant[____exports.SlotVariant.FORTUNE_TELLING_MACHINE] = "FORTUNE_TELLING_MACHINE"
____exports.SlotVariant.BEGGAR = 4
____exports.SlotVariant[____exports.SlotVariant.BEGGAR] = "BEGGAR"
____exports.SlotVariant.DEVIL_BEGGAR = 5
____exports.SlotVariant[____exports.SlotVariant.DEVIL_BEGGAR] = "DEVIL_BEGGAR"
____exports.SlotVariant.SHELL_GAME = 6
____exports.SlotVariant[____exports.SlotVariant.SHELL_GAME] = "SHELL_GAME"
____exports.SlotVariant.KEY_MASTER = 7
____exports.SlotVariant[____exports.SlotVariant.KEY_MASTER] = "KEY_MASTER"
____exports.SlotVariant.DONATION_MACHINE = 8
____exports.SlotVariant[____exports.SlotVariant.DONATION_MACHINE] = "DONATION_MACHINE"
____exports.SlotVariant.BOMB_BUM = 9
____exports.SlotVariant[____exports.SlotVariant.BOMB_BUM] = "BOMB_BUM"
____exports.SlotVariant.SHOP_RESTOCK_MACHINE = 10
____exports.SlotVariant[____exports.SlotVariant.SHOP_RESTOCK_MACHINE] = "SHOP_RESTOCK_MACHINE"
____exports.SlotVariant.GREED_DONATION_MACHINE = 11
____exports.SlotVariant[____exports.SlotVariant.GREED_DONATION_MACHINE] = "GREED_DONATION_MACHINE"
____exports.SlotVariant.MOMS_DRESSING_TABLE = 12
____exports.SlotVariant[____exports.SlotVariant.MOMS_DRESSING_TABLE] = "MOMS_DRESSING_TABLE"
____exports.SlotVariant.BATTERY_BUM = 13
____exports.SlotVariant[____exports.SlotVariant.BATTERY_BUM] = "BATTERY_BUM"
____exports.SlotVariant.ISAAC_SECRET = 14
____exports.SlotVariant[____exports.SlotVariant.ISAAC_SECRET] = "ISAAC_SECRET"
____exports.SlotVariant.HELL_GAME = 15
____exports.SlotVariant[____exports.SlotVariant.HELL_GAME] = "HELL_GAME"
____exports.SlotVariant.CRANE_GAME = 16
____exports.SlotVariant[____exports.SlotVariant.CRANE_GAME] = "CRANE_GAME"
____exports.SlotVariant.CONFESSIONAL = 17
____exports.SlotVariant[____exports.SlotVariant.CONFESSIONAL] = "CONFESSIONAL"
____exports.SlotVariant.ROTTEN_BEGGAR = 18
____exports.SlotVariant[____exports.SlotVariant.ROTTEN_BEGGAR] = "ROTTEN_BEGGAR"
--- For `EntityType.LASER` (7).
____exports.LaserVariant = {}
____exports.LaserVariant.THICK_RED = 1
____exports.LaserVariant[____exports.LaserVariant.THICK_RED] = "THICK_RED"
____exports.LaserVariant.THIN_RED = 2
____exports.LaserVariant[____exports.LaserVariant.THIN_RED] = "THIN_RED"
____exports.LaserVariant.SHOOP_DA_WHOOP = 3
____exports.LaserVariant[____exports.LaserVariant.SHOOP_DA_WHOOP] = "SHOOP_DA_WHOOP"
____exports.LaserVariant.PRIDE = 4
____exports.LaserVariant[____exports.LaserVariant.PRIDE] = "PRIDE"
____exports.LaserVariant.LIGHT_BEAM = 5
____exports.LaserVariant[____exports.LaserVariant.LIGHT_BEAM] = "LIGHT_BEAM"
____exports.LaserVariant.GIANT_RED = 6
____exports.LaserVariant[____exports.LaserVariant.GIANT_RED] = "GIANT_RED"
____exports.LaserVariant.TRACTOR_BEAM = 7
____exports.LaserVariant[____exports.LaserVariant.TRACTOR_BEAM] = "TRACTOR_BEAM"
____exports.LaserVariant.LIGHT_RING = 8
____exports.LaserVariant[____exports.LaserVariant.LIGHT_RING] = "LIGHT_RING"
____exports.LaserVariant.BRIMSTONE_TECHNOLOGY = 9
____exports.LaserVariant[____exports.LaserVariant.BRIMSTONE_TECHNOLOGY] = "BRIMSTONE_TECHNOLOGY"
____exports.LaserVariant.ELECTRIC = 10
____exports.LaserVariant[____exports.LaserVariant.ELECTRIC] = "ELECTRIC"
____exports.LaserVariant.THICKER_RED = 11
____exports.LaserVariant[____exports.LaserVariant.THICKER_RED] = "THICKER_RED"
____exports.LaserVariant.THICK_BROWN = 12
____exports.LaserVariant[____exports.LaserVariant.THICK_BROWN] = "THICK_BROWN"
____exports.LaserVariant.BEAST = 13
____exports.LaserVariant[____exports.LaserVariant.BEAST] = "BEAST"
____exports.LaserVariant.THICKER_BRIMSTONE_TECHNOLOGY = 14
____exports.LaserVariant[____exports.LaserVariant.THICKER_BRIMSTONE_TECHNOLOGY] = "THICKER_BRIMSTONE_TECHNOLOGY"
____exports.LaserVariant.GIANT_BRIMSTONE_TECHNOLOGY = 15
____exports.LaserVariant[____exports.LaserVariant.GIANT_BRIMSTONE_TECHNOLOGY] = "GIANT_BRIMSTONE_TECHNOLOGY"
--- For `EntityType.KNIFE` (8).
____exports.KnifeVariant = {}
____exports.KnifeVariant.MOMS_KNIFE = 8
____exports.KnifeVariant[____exports.KnifeVariant.MOMS_KNIFE] = "MOMS_KNIFE"
____exports.KnifeVariant.BONE_CLUB = 1
____exports.KnifeVariant[____exports.KnifeVariant.BONE_CLUB] = "BONE_CLUB"
____exports.KnifeVariant.BONE_SCYTHE = 2
____exports.KnifeVariant[____exports.KnifeVariant.BONE_SCYTHE] = "BONE_SCYTHE"
____exports.KnifeVariant.DONKEY_JAWBONE = 3
____exports.KnifeVariant[____exports.KnifeVariant.DONKEY_JAWBONE] = "DONKEY_JAWBONE"
____exports.KnifeVariant.BAG_OF_CRAFTING = 4
____exports.KnifeVariant[____exports.KnifeVariant.BAG_OF_CRAFTING] = "BAG_OF_CRAFTING"
____exports.KnifeVariant.SUMPTORIUM = 5
____exports.KnifeVariant[____exports.KnifeVariant.SUMPTORIUM] = "SUMPTORIUM"
____exports.KnifeVariant.NOTCHED_AXE = 9
____exports.KnifeVariant[____exports.KnifeVariant.NOTCHED_AXE] = "NOTCHED_AXE"
____exports.KnifeVariant.SPIRIT_SWORD = 10
____exports.KnifeVariant[____exports.KnifeVariant.SPIRIT_SWORD] = "SPIRIT_SWORD"
____exports.KnifeVariant.TECH_SWORD = 11
____exports.KnifeVariant[____exports.KnifeVariant.TECH_SWORD] = "TECH_SWORD"
--- For `EntityType.PROJECTILE` (9).
____exports.ProjectileVariant = {}
____exports.ProjectileVariant.NORMAL = 0
____exports.ProjectileVariant[____exports.ProjectileVariant.NORMAL] = "NORMAL"
____exports.ProjectileVariant.BONE = 1
____exports.ProjectileVariant[____exports.ProjectileVariant.BONE] = "BONE"
____exports.ProjectileVariant.FIRE = 2
____exports.ProjectileVariant[____exports.ProjectileVariant.FIRE] = "FIRE"
____exports.ProjectileVariant.PUKE = 3
____exports.ProjectileVariant[____exports.ProjectileVariant.PUKE] = "PUKE"
____exports.ProjectileVariant.TEAR = 4
____exports.ProjectileVariant[____exports.ProjectileVariant.TEAR] = "TEAR"
____exports.ProjectileVariant.CORN = 5
____exports.ProjectileVariant[____exports.ProjectileVariant.CORN] = "CORN"
____exports.ProjectileVariant.HUSH = 6
____exports.ProjectileVariant[____exports.ProjectileVariant.HUSH] = "HUSH"
____exports.ProjectileVariant.COIN = 7
____exports.ProjectileVariant[____exports.ProjectileVariant.COIN] = "COIN"
____exports.ProjectileVariant.GRID = 8
____exports.ProjectileVariant[____exports.ProjectileVariant.GRID] = "GRID"
____exports.ProjectileVariant.ROCK = 9
____exports.ProjectileVariant[____exports.ProjectileVariant.ROCK] = "ROCK"
____exports.ProjectileVariant.RING = 10
____exports.ProjectileVariant[____exports.ProjectileVariant.RING] = "RING"
____exports.ProjectileVariant.MEAT = 11
____exports.ProjectileVariant[____exports.ProjectileVariant.MEAT] = "MEAT"
____exports.ProjectileVariant.FCUK = 12
____exports.ProjectileVariant[____exports.ProjectileVariant.FCUK] = "FCUK"
____exports.ProjectileVariant.WING = 13
____exports.ProjectileVariant[____exports.ProjectileVariant.WING] = "WING"
____exports.ProjectileVariant.LAVA = 14
____exports.ProjectileVariant[____exports.ProjectileVariant.LAVA] = "LAVA"
____exports.ProjectileVariant.HEAD = 15
____exports.ProjectileVariant[____exports.ProjectileVariant.HEAD] = "HEAD"
____exports.ProjectileVariant.PEEP = 16
____exports.ProjectileVariant[____exports.ProjectileVariant.PEEP] = "PEEP"
--- For `EntityType.GAPER` (10).
____exports.GaperVariant = {}
____exports.GaperVariant.FROWNING_GAPER = 0
____exports.GaperVariant[____exports.GaperVariant.FROWNING_GAPER] = "FROWNING_GAPER"
____exports.GaperVariant.GAPER = 1
____exports.GaperVariant[____exports.GaperVariant.GAPER] = "GAPER"
____exports.GaperVariant.FLAMING_GAPER = 2
____exports.GaperVariant[____exports.GaperVariant.FLAMING_GAPER] = "FLAMING_GAPER"
____exports.GaperVariant.ROTTEN_GAPER = 3
____exports.GaperVariant[____exports.GaperVariant.ROTTEN_GAPER] = "ROTTEN_GAPER"
--- For `EntityType.GUSHER` (11).
____exports.GusherVariant = {}
____exports.GusherVariant.GUSHER = 0
____exports.GusherVariant[____exports.GusherVariant.GUSHER] = "GUSHER"
____exports.GusherVariant.PACER = 1
____exports.GusherVariant[____exports.GusherVariant.PACER] = "PACER"
--- For `EntityType.POOTER` (14).
____exports.PooterVariant = {}
____exports.PooterVariant.POOTER = 0
____exports.PooterVariant[____exports.PooterVariant.POOTER] = "POOTER"
____exports.PooterVariant.SUPER_POOTER = 1
____exports.PooterVariant[____exports.PooterVariant.SUPER_POOTER] = "SUPER_POOTER"
____exports.PooterVariant.TAINTED_POOTER = 2
____exports.PooterVariant[____exports.PooterVariant.TAINTED_POOTER] = "TAINTED_POOTER"
--- For `EntityType.CLOTTY` (15).
____exports.ClottyVariant = {}
____exports.ClottyVariant.CLOTTY = 0
____exports.ClottyVariant[____exports.ClottyVariant.CLOTTY] = "CLOTTY"
____exports.ClottyVariant.CLOT = 1
____exports.ClottyVariant[____exports.ClottyVariant.CLOT] = "CLOT"
____exports.ClottyVariant.BLOB = 2
____exports.ClottyVariant[____exports.ClottyVariant.BLOB] = "BLOB"
____exports.ClottyVariant.GRILLED_CLOTTY = 3
____exports.ClottyVariant[____exports.ClottyVariant.GRILLED_CLOTTY] = "GRILLED_CLOTTY"
--- For `EntityType.MULLIGAN` (16).
____exports.MulliganVariant = {}
____exports.MulliganVariant.MULLIGAN = 0
____exports.MulliganVariant[____exports.MulliganVariant.MULLIGAN] = "MULLIGAN"
____exports.MulliganVariant.MULLIGOON = 1
____exports.MulliganVariant[____exports.MulliganVariant.MULLIGOON] = "MULLIGOON"
____exports.MulliganVariant.MULLIBOOM = 2
____exports.MulliganVariant[____exports.MulliganVariant.MULLIBOOM] = "MULLIBOOM"
--- For `EntityType.SHOPKEEPER` (17).
____exports.ShopkeeperVariant = {}
____exports.ShopkeeperVariant.SHOPKEEPER = 0
____exports.ShopkeeperVariant[____exports.ShopkeeperVariant.SHOPKEEPER] = "SHOPKEEPER"
____exports.ShopkeeperVariant.SECRET_ROOM_KEEPER = 1
____exports.ShopkeeperVariant[____exports.ShopkeeperVariant.SECRET_ROOM_KEEPER] = "SECRET_ROOM_KEEPER"
____exports.ShopkeeperVariant.ERROR_ROOM_KEEPER = 2
____exports.ShopkeeperVariant[____exports.ShopkeeperVariant.ERROR_ROOM_KEEPER] = "ERROR_ROOM_KEEPER"
____exports.ShopkeeperVariant.SPECIAL_SHOPKEEPER = 3
____exports.ShopkeeperVariant[____exports.ShopkeeperVariant.SPECIAL_SHOPKEEPER] = "SPECIAL_SHOPKEEPER"
____exports.ShopkeeperVariant.SPECIAL_SECRET_ROOM_KEEPER = 4
____exports.ShopkeeperVariant[____exports.ShopkeeperVariant.SPECIAL_SECRET_ROOM_KEEPER] = "SPECIAL_SECRET_ROOM_KEEPER"
--- For `EntityType.LARRY_JR` (19).
____exports.LarryJrVariant = {}
____exports.LarryJrVariant.LARRY_JR = 0
____exports.LarryJrVariant[____exports.LarryJrVariant.LARRY_JR] = "LARRY_JR"
____exports.LarryJrVariant.THE_HOLLOW = 1
____exports.LarryJrVariant[____exports.LarryJrVariant.THE_HOLLOW] = "THE_HOLLOW"
____exports.LarryJrVariant.TUFF_TWIN = 2
____exports.LarryJrVariant[____exports.LarryJrVariant.TUFF_TWIN] = "TUFF_TWIN"
____exports.LarryJrVariant.THE_SHELL = 3
____exports.LarryJrVariant[____exports.LarryJrVariant.THE_SHELL] = "THE_SHELL"
--- For `EntityType.HIVE` (22).
____exports.HiveVariant = {}
____exports.HiveVariant.HIVE = 0
____exports.HiveVariant[____exports.HiveVariant.HIVE] = "HIVE"
____exports.HiveVariant.DROWNED_HIVE = 1
____exports.HiveVariant[____exports.HiveVariant.DROWNED_HIVE] = "DROWNED_HIVE"
____exports.HiveVariant.HOLY_MULLIGAN = 2
____exports.HiveVariant[____exports.HiveVariant.HOLY_MULLIGAN] = "HOLY_MULLIGAN"
____exports.HiveVariant.TAINTED_MULLIGAN = 3
____exports.HiveVariant[____exports.HiveVariant.TAINTED_MULLIGAN] = "TAINTED_MULLIGAN"
--- For `EntityType.CHARGER` (23).
____exports.ChargerVariant = {}
____exports.ChargerVariant.CHARGER = 0
____exports.ChargerVariant[____exports.ChargerVariant.CHARGER] = "CHARGER"
____exports.ChargerVariant.DROWNED_CHARGER = 1
____exports.ChargerVariant[____exports.ChargerVariant.DROWNED_CHARGER] = "DROWNED_CHARGER"
____exports.ChargerVariant.DANK_CHARGER = 2
____exports.ChargerVariant[____exports.ChargerVariant.DANK_CHARGER] = "DANK_CHARGER"
____exports.ChargerVariant.CARRION_PRINCESS = 3
____exports.ChargerVariant[____exports.ChargerVariant.CARRION_PRINCESS] = "CARRION_PRINCESS"
--- For `EntityType.GLOBIN` (24).
____exports.GlobinVariant = {}
____exports.GlobinVariant.GLOBIN = 0
____exports.GlobinVariant[____exports.GlobinVariant.GLOBIN] = "GLOBIN"
____exports.GlobinVariant.GAZING_GLOBIN = 1
____exports.GlobinVariant[____exports.GlobinVariant.GAZING_GLOBIN] = "GAZING_GLOBIN"
____exports.GlobinVariant.DANK_GLOBIN = 2
____exports.GlobinVariant[____exports.GlobinVariant.DANK_GLOBIN] = "DANK_GLOBIN"
____exports.GlobinVariant.CURSED_GLOBIN = 3
____exports.GlobinVariant[____exports.GlobinVariant.CURSED_GLOBIN] = "CURSED_GLOBIN"
--- For `EntityType.BOOM_FLY` (25).
____exports.BoomFlyVariant = {}
____exports.BoomFlyVariant.BOOM_FLY = 0
____exports.BoomFlyVariant[____exports.BoomFlyVariant.BOOM_FLY] = "BOOM_FLY"
____exports.BoomFlyVariant.RED_BOOM_FLY = 1
____exports.BoomFlyVariant[____exports.BoomFlyVariant.RED_BOOM_FLY] = "RED_BOOM_FLY"
____exports.BoomFlyVariant.DROWNED_BOOM_FLY = 2
____exports.BoomFlyVariant[____exports.BoomFlyVariant.DROWNED_BOOM_FLY] = "DROWNED_BOOM_FLY"
____exports.BoomFlyVariant.DRAGON_FLY = 3
____exports.BoomFlyVariant[____exports.BoomFlyVariant.DRAGON_FLY] = "DRAGON_FLY"
____exports.BoomFlyVariant.BONE_FLY = 4
____exports.BoomFlyVariant[____exports.BoomFlyVariant.BONE_FLY] = "BONE_FLY"
____exports.BoomFlyVariant.SICK_BOOM_FLY = 5
____exports.BoomFlyVariant[____exports.BoomFlyVariant.SICK_BOOM_FLY] = "SICK_BOOM_FLY"
____exports.BoomFlyVariant.TAINTED_BOOM_FLY = 6
____exports.BoomFlyVariant[____exports.BoomFlyVariant.TAINTED_BOOM_FLY] = "TAINTED_BOOM_FLY"
--- For `EntityType.MAW` (26).
____exports.MawVariant = {}
____exports.MawVariant.MAW = 0
____exports.MawVariant[____exports.MawVariant.MAW] = "MAW"
____exports.MawVariant.RED_MAW = 1
____exports.MawVariant[____exports.MawVariant.RED_MAW] = "RED_MAW"
____exports.MawVariant.PSYCHIC_MAW = 2
____exports.MawVariant[____exports.MawVariant.PSYCHIC_MAW] = "PSYCHIC_MAW"
--- For `EntityType.HOST` (27).
____exports.HostVariant = {}
____exports.HostVariant.HOST = 0
____exports.HostVariant[____exports.HostVariant.HOST] = "HOST"
____exports.HostVariant.RED_HOST = 1
____exports.HostVariant[____exports.HostVariant.RED_HOST] = "RED_HOST"
____exports.HostVariant.HARD_HOST = 2
____exports.HostVariant[____exports.HostVariant.HARD_HOST] = "HARD_HOST"
--- For `EntityType.CHUB` (28).
____exports.ChubVariant = {}
____exports.ChubVariant.CHUB = 0
____exports.ChubVariant[____exports.ChubVariant.CHUB] = "CHUB"
____exports.ChubVariant.CHAD = 1
____exports.ChubVariant[____exports.ChubVariant.CHAD] = "CHAD"
____exports.ChubVariant.CARRION_QUEEN = 2
____exports.ChubVariant[____exports.ChubVariant.CARRION_QUEEN] = "CARRION_QUEEN"
--- For `EntityType.HOPPER` (29).
____exports.HopperVariant = {}
____exports.HopperVariant.HOPPER = 0
____exports.HopperVariant[____exports.HopperVariant.HOPPER] = "HOPPER"
____exports.HopperVariant.TRITE = 1
____exports.HopperVariant[____exports.HopperVariant.TRITE] = "TRITE"
____exports.HopperVariant.EGGY = 2
____exports.HopperVariant[____exports.HopperVariant.EGGY] = "EGGY"
____exports.HopperVariant.TAINTED_HOPPER = 3
____exports.HopperVariant[____exports.HopperVariant.TAINTED_HOPPER] = "TAINTED_HOPPER"
--- For `EntityType.BOIL` (30).
____exports.BoilVariant = {}
____exports.BoilVariant.BOIL = 0
____exports.BoilVariant[____exports.BoilVariant.BOIL] = "BOIL"
____exports.BoilVariant.GUT = 1
____exports.BoilVariant[____exports.BoilVariant.GUT] = "GUT"
____exports.BoilVariant.SACK = 2
____exports.BoilVariant[____exports.BoilVariant.SACK] = "SACK"
--- For `EntityType.SPITTY` (31).
____exports.SpittyVariant = {}
____exports.SpittyVariant.SPITTY = 0
____exports.SpittyVariant[____exports.SpittyVariant.SPITTY] = "SPITTY"
____exports.SpittyVariant.TAINTED_SPITTY = 1
____exports.SpittyVariant[____exports.SpittyVariant.TAINTED_SPITTY] = "TAINTED_SPITTY"
--- For `EntityType.FIREPLACE` (33).
-- 
-- Also see the `FireplaceGridEntityVariant` enum, which is different and used for the grid entity
-- version.
____exports.FireplaceVariant = {}
____exports.FireplaceVariant.NORMAL = 0
____exports.FireplaceVariant[____exports.FireplaceVariant.NORMAL] = "NORMAL"
____exports.FireplaceVariant.RED = 1
____exports.FireplaceVariant[____exports.FireplaceVariant.RED] = "RED"
____exports.FireplaceVariant.BLUE = 2
____exports.FireplaceVariant[____exports.FireplaceVariant.BLUE] = "BLUE"
____exports.FireplaceVariant.PURPLE = 3
____exports.FireplaceVariant[____exports.FireplaceVariant.PURPLE] = "PURPLE"
____exports.FireplaceVariant.WHITE = 4
____exports.FireplaceVariant[____exports.FireplaceVariant.WHITE] = "WHITE"
____exports.FireplaceVariant.MOVEABLE = 10
____exports.FireplaceVariant[____exports.FireplaceVariant.MOVEABLE] = "MOVEABLE"
____exports.FireplaceVariant.COAL = 11
____exports.FireplaceVariant[____exports.FireplaceVariant.COAL] = "COAL"
____exports.FireplaceVariant.MOVEABLE_BLUE = 12
____exports.FireplaceVariant[____exports.FireplaceVariant.MOVEABLE_BLUE] = "MOVEABLE_BLUE"
____exports.FireplaceVariant.MOVEABLE_PURPLE = 13
____exports.FireplaceVariant[____exports.FireplaceVariant.MOVEABLE_PURPLE] = "MOVEABLE_PURPLE"
--- For `EntityType.LEAPER` (34).
____exports.LeaperVariant = {}
____exports.LeaperVariant.LEAPER = 0
____exports.LeaperVariant[____exports.LeaperVariant.LEAPER] = "LEAPER"
____exports.LeaperVariant.STICKY_LEAPER = 1
____exports.LeaperVariant[____exports.LeaperVariant.STICKY_LEAPER] = "STICKY_LEAPER"
--- For `EntityType.MR_MAW` (35).
____exports.MrMawVariant = {}
____exports.MrMawVariant.MR_MAW = 0
____exports.MrMawVariant[____exports.MrMawVariant.MR_MAW] = "MR_MAW"
____exports.MrMawVariant.MR_MAW_HEAD = 1
____exports.MrMawVariant[____exports.MrMawVariant.MR_MAW_HEAD] = "MR_MAW_HEAD"
____exports.MrMawVariant.MR_RED_MAW = 2
____exports.MrMawVariant[____exports.MrMawVariant.MR_RED_MAW] = "MR_RED_MAW"
____exports.MrMawVariant.MR_RED_MAW_HEAD = 3
____exports.MrMawVariant[____exports.MrMawVariant.MR_RED_MAW_HEAD] = "MR_RED_MAW_HEAD"
____exports.MrMawVariant.MR_MAW_NECK = 10
____exports.MrMawVariant[____exports.MrMawVariant.MR_MAW_NECK] = "MR_MAW_NECK"
--- For `EntityType.BABY` (38).
____exports.BabyVariant = {}
____exports.BabyVariant.BABY = 0
____exports.BabyVariant[____exports.BabyVariant.BABY] = "BABY"
____exports.BabyVariant.ANGELIC_BABY = 1
____exports.BabyVariant[____exports.BabyVariant.ANGELIC_BABY] = "ANGELIC_BABY"
____exports.BabyVariant.ULTRA_PRIDE_BABY = 2
____exports.BabyVariant[____exports.BabyVariant.ULTRA_PRIDE_BABY] = "ULTRA_PRIDE_BABY"
____exports.BabyVariant.WRINKLY_BABY = 3
____exports.BabyVariant[____exports.BabyVariant.WRINKLY_BABY] = "WRINKLY_BABY"
--- For `EntityType.VIS` (39).
____exports.VisVariant = {}
____exports.VisVariant.VIS = 0
____exports.VisVariant[____exports.VisVariant.VIS] = "VIS"
____exports.VisVariant.DOUBLE_VIS = 1
____exports.VisVariant[____exports.VisVariant.DOUBLE_VIS] = "DOUBLE_VIS"
____exports.VisVariant.CHUBBER = 2
____exports.VisVariant[____exports.VisVariant.CHUBBER] = "CHUBBER"
____exports.VisVariant.SCARRED_DOUBLE_VIS = 3
____exports.VisVariant[____exports.VisVariant.SCARRED_DOUBLE_VIS] = "SCARRED_DOUBLE_VIS"
____exports.VisVariant.CHUBBER_PROJECTILE = 22
____exports.VisVariant[____exports.VisVariant.CHUBBER_PROJECTILE] = "CHUBBER_PROJECTILE"
--- For `EntityType.GUTS` (40).
____exports.GutsVariant = {}
____exports.GutsVariant.GUTS = 0
____exports.GutsVariant[____exports.GutsVariant.GUTS] = "GUTS"
____exports.GutsVariant.SCARRED_GUTS = 1
____exports.GutsVariant[____exports.GutsVariant.SCARRED_GUTS] = "SCARRED_GUTS"
____exports.GutsVariant.SLOG = 2
____exports.GutsVariant[____exports.GutsVariant.SLOG] = "SLOG"
--- For `EntityType.KNIGHT` (41).
____exports.KnightVariant = {}
____exports.KnightVariant.KNIGHT = 0
____exports.KnightVariant[____exports.KnightVariant.KNIGHT] = "KNIGHT"
____exports.KnightVariant.SELFLESS_KNIGHT = 1
____exports.KnightVariant[____exports.KnightVariant.SELFLESS_KNIGHT] = "SELFLESS_KNIGHT"
____exports.KnightVariant.LOOSE_KNIGHT = 2
____exports.KnightVariant[____exports.KnightVariant.LOOSE_KNIGHT] = "LOOSE_KNIGHT"
____exports.KnightVariant.BRAINLESS_KNIGHT = 3
____exports.KnightVariant[____exports.KnightVariant.BRAINLESS_KNIGHT] = "BRAINLESS_KNIGHT"
____exports.KnightVariant.BLACK_KNIGHT = 4
____exports.KnightVariant[____exports.KnightVariant.BLACK_KNIGHT] = "BLACK_KNIGHT"
--- For `EntityType.GRIMACE` (42).
____exports.GrimaceVariant = {}
____exports.GrimaceVariant.STONE_GRIMACE = 0
____exports.GrimaceVariant[____exports.GrimaceVariant.STONE_GRIMACE] = "STONE_GRIMACE"
____exports.GrimaceVariant.VOMIT_GRIMACE = 1
____exports.GrimaceVariant[____exports.GrimaceVariant.VOMIT_GRIMACE] = "VOMIT_GRIMACE"
____exports.GrimaceVariant.TRIPLE_GRIMACE = 2
____exports.GrimaceVariant[____exports.GrimaceVariant.TRIPLE_GRIMACE] = "TRIPLE_GRIMACE"
--- For `EntityType.MONSTRO_2` (43).
____exports.Monstro2Variant = {}
____exports.Monstro2Variant.MONSTRO_2 = 0
____exports.Monstro2Variant[____exports.Monstro2Variant.MONSTRO_2] = "MONSTRO_2"
____exports.Monstro2Variant.GISH = 1
____exports.Monstro2Variant[____exports.Monstro2Variant.GISH] = "GISH"
--- For `EntityType.POKY` (44).
____exports.PokyVariant = {}
____exports.PokyVariant.POKY = 0
____exports.PokyVariant[____exports.PokyVariant.POKY] = "POKY"
____exports.PokyVariant.SLIDE = 1
____exports.PokyVariant[____exports.PokyVariant.SLIDE] = "SLIDE"
--- For `EntityType.MOM` (45).
____exports.MomVariant = {}
____exports.MomVariant.MOM = 0
____exports.MomVariant[____exports.MomVariant.MOM] = "MOM"
____exports.MomVariant.STOMP = 10
____exports.MomVariant[____exports.MomVariant.STOMP] = "STOMP"
--- For `EntityType.SLOTH` (46).
____exports.SlothVariant = {}
____exports.SlothVariant.SLOTH = 0
____exports.SlothVariant[____exports.SlothVariant.SLOTH] = "SLOTH"
____exports.SlothVariant.SUPER_SLOTH = 1
____exports.SlothVariant[____exports.SlothVariant.SUPER_SLOTH] = "SUPER_SLOTH"
____exports.SlothVariant.ULTRA_PRIDE = 2
____exports.SlothVariant[____exports.SlothVariant.ULTRA_PRIDE] = "ULTRA_PRIDE"
--- For `EntityType.LUST` (47).
____exports.LustVariant = {}
____exports.LustVariant.LUST = 0
____exports.LustVariant[____exports.LustVariant.LUST] = "LUST"
____exports.LustVariant.SUPER_LUST = 1
____exports.LustVariant[____exports.LustVariant.SUPER_LUST] = "SUPER_LUST"
--- For `EntityType.WRATH` (48).
____exports.WrathVariant = {}
____exports.WrathVariant.WRATH = 0
____exports.WrathVariant[____exports.WrathVariant.WRATH] = "WRATH"
____exports.WrathVariant.SUPER_WRATH = 1
____exports.WrathVariant[____exports.WrathVariant.SUPER_WRATH] = "SUPER_WRATH"
--- For `EntityType.GLUTTONY` (49).
____exports.GluttonyVariant = {}
____exports.GluttonyVariant.GLUTTONY = 0
____exports.GluttonyVariant[____exports.GluttonyVariant.GLUTTONY] = "GLUTTONY"
____exports.GluttonyVariant.SUPER_GLUTTONY = 1
____exports.GluttonyVariant[____exports.GluttonyVariant.SUPER_GLUTTONY] = "SUPER_GLUTTONY"
--- For `EntityType.GREED` (50).
____exports.GreedVariant = {}
____exports.GreedVariant.GREED = 0
____exports.GreedVariant[____exports.GreedVariant.GREED] = "GREED"
____exports.GreedVariant.SUPER_GREED = 1
____exports.GreedVariant[____exports.GreedVariant.SUPER_GREED] = "SUPER_GREED"
--- For `EntityType.ENVY` (51).
____exports.EnvyVariant = {}
____exports.EnvyVariant.ENVY = 0
____exports.EnvyVariant[____exports.EnvyVariant.ENVY] = "ENVY"
____exports.EnvyVariant.SUPER_ENVY = 1
____exports.EnvyVariant[____exports.EnvyVariant.SUPER_ENVY] = "SUPER_ENVY"
____exports.EnvyVariant.ENVY_BIG = 10
____exports.EnvyVariant[____exports.EnvyVariant.ENVY_BIG] = "ENVY_BIG"
____exports.EnvyVariant.SUPER_ENVY_BIG = 11
____exports.EnvyVariant[____exports.EnvyVariant.SUPER_ENVY_BIG] = "SUPER_ENVY_BIG"
____exports.EnvyVariant.ENVY_MEDIUM = 20
____exports.EnvyVariant[____exports.EnvyVariant.ENVY_MEDIUM] = "ENVY_MEDIUM"
____exports.EnvyVariant.SUPER_ENVY_MEDIUM = 21
____exports.EnvyVariant[____exports.EnvyVariant.SUPER_ENVY_MEDIUM] = "SUPER_ENVY_MEDIUM"
____exports.EnvyVariant.ENVY_SMALL = 30
____exports.EnvyVariant[____exports.EnvyVariant.ENVY_SMALL] = "ENVY_SMALL"
____exports.EnvyVariant.SUPER_ENVY_SMALL = 31
____exports.EnvyVariant[____exports.EnvyVariant.SUPER_ENVY_SMALL] = "SUPER_ENVY_SMALL"
--- For `EntityType.PRIDE` (52).
____exports.PrideVariant = {}
____exports.PrideVariant.PRIDE = 0
____exports.PrideVariant[____exports.PrideVariant.PRIDE] = "PRIDE"
____exports.PrideVariant.SUPER_PRIDE = 1
____exports.PrideVariant[____exports.PrideVariant.SUPER_PRIDE] = "SUPER_PRIDE"
--- For `EntityType.DOPLE` (53).
____exports.DopleVariant = {}
____exports.DopleVariant.DOPLE = 0
____exports.DopleVariant[____exports.DopleVariant.DOPLE] = "DOPLE"
____exports.DopleVariant.EVIL_TWIN = 1
____exports.DopleVariant[____exports.DopleVariant.EVIL_TWIN] = "EVIL_TWIN"
--- For `EntityType.LEECH` (55).
____exports.LeechVariant = {}
____exports.LeechVariant.LEECH = 0
____exports.LeechVariant[____exports.LeechVariant.LEECH] = "LEECH"
____exports.LeechVariant.KAMIKAZE_LEECH = 1
____exports.LeechVariant[____exports.LeechVariant.KAMIKAZE_LEECH] = "KAMIKAZE_LEECH"
____exports.LeechVariant.HOLY_LEECH = 2
____exports.LeechVariant[____exports.LeechVariant.HOLY_LEECH] = "HOLY_LEECH"
--- For `EntityType.MEMBRAIN` (57).
____exports.MemBrainVariant = {}
____exports.MemBrainVariant.MEMBRAIN = 0
____exports.MemBrainVariant[____exports.MemBrainVariant.MEMBRAIN] = "MEMBRAIN"
____exports.MemBrainVariant.MAMA_GUTS = 1
____exports.MemBrainVariant[____exports.MemBrainVariant.MAMA_GUTS] = "MAMA_GUTS"
____exports.MemBrainVariant.DEAD_MEAT = 2
____exports.MemBrainVariant[____exports.MemBrainVariant.DEAD_MEAT] = "DEAD_MEAT"
--- For `EntityType.PARA_BITE` (58).
____exports.ParaBiteVariant = {}
____exports.ParaBiteVariant.PARA_BITE = 0
____exports.ParaBiteVariant[____exports.ParaBiteVariant.PARA_BITE] = "PARA_BITE"
____exports.ParaBiteVariant.SCARRED_PARA_BITE = 1
____exports.ParaBiteVariant[____exports.ParaBiteVariant.SCARRED_PARA_BITE] = "SCARRED_PARA_BITE"
--- For `EntityType.EYE` (60).
____exports.EyeVariant = {}
____exports.EyeVariant.EYE = 0
____exports.EyeVariant[____exports.EyeVariant.EYE] = "EYE"
____exports.EyeVariant.BLOODSHOT_EYE = 1
____exports.EyeVariant[____exports.EyeVariant.BLOODSHOT_EYE] = "BLOODSHOT_EYE"
____exports.EyeVariant.HOLY_EYE = 2
____exports.EyeVariant[____exports.EyeVariant.HOLY_EYE] = "HOLY_EYE"
--- For `EntityType.SUCKER` (61).
____exports.SuckerVariant = {}
____exports.SuckerVariant.SUCKER = 0
____exports.SuckerVariant[____exports.SuckerVariant.SUCKER] = "SUCKER"
____exports.SuckerVariant.SPIT = 1
____exports.SuckerVariant[____exports.SuckerVariant.SPIT] = "SPIT"
____exports.SuckerVariant.SOUL_SUCKER = 2
____exports.SuckerVariant[____exports.SuckerVariant.SOUL_SUCKER] = "SOUL_SUCKER"
____exports.SuckerVariant.INK = 3
____exports.SuckerVariant[____exports.SuckerVariant.INK] = "INK"
____exports.SuckerVariant.MAMA_FLY = 4
____exports.SuckerVariant[____exports.SuckerVariant.MAMA_FLY] = "MAMA_FLY"
____exports.SuckerVariant.BULB = 5
____exports.SuckerVariant[____exports.SuckerVariant.BULB] = "BULB"
____exports.SuckerVariant.BLOOD_FLY = 6
____exports.SuckerVariant[____exports.SuckerVariant.BLOOD_FLY] = "BLOOD_FLY"
____exports.SuckerVariant.TAINTED_SUCKER = 7
____exports.SuckerVariant[____exports.SuckerVariant.TAINTED_SUCKER] = "TAINTED_SUCKER"
--- For `EntityType.PIN` (62).
____exports.PinVariant = {}
____exports.PinVariant.PIN = 0
____exports.PinVariant[____exports.PinVariant.PIN] = "PIN"
____exports.PinVariant.SCOLEX = 1
____exports.PinVariant[____exports.PinVariant.SCOLEX] = "SCOLEX"
____exports.PinVariant.FRAIL = 2
____exports.PinVariant[____exports.PinVariant.FRAIL] = "FRAIL"
____exports.PinVariant.WORMWOOD = 3
____exports.PinVariant[____exports.PinVariant.WORMWOOD] = "WORMWOOD"
--- For `EntityType.WAR` (65).
____exports.WarVariant = {}
____exports.WarVariant.WAR = 0
____exports.WarVariant[____exports.WarVariant.WAR] = "WAR"
____exports.WarVariant.CONQUEST = 1
____exports.WarVariant[____exports.WarVariant.CONQUEST] = "CONQUEST"
____exports.WarVariant.WAR_WITHOUT_HORSE = 2
____exports.WarVariant[____exports.WarVariant.WAR_WITHOUT_HORSE] = "WAR_WITHOUT_HORSE"
--- For `EntityType.DEATH` (66).
____exports.DeathVariant = {}
____exports.DeathVariant.DEATH = 0
____exports.DeathVariant[____exports.DeathVariant.DEATH] = "DEATH"
____exports.DeathVariant.DEATH_SCYTHE = 10
____exports.DeathVariant[____exports.DeathVariant.DEATH_SCYTHE] = "DEATH_SCYTHE"
____exports.DeathVariant.DEATH_HORSE = 20
____exports.DeathVariant[____exports.DeathVariant.DEATH_HORSE] = "DEATH_HORSE"
____exports.DeathVariant.DEATH_WITHOUT_HORSE = 30
____exports.DeathVariant[____exports.DeathVariant.DEATH_WITHOUT_HORSE] = "DEATH_WITHOUT_HORSE"
--- For `EntityType.DUKE` (67).
____exports.DukeVariant = {}
____exports.DukeVariant.DUKE_OF_FLIES = 0
____exports.DukeVariant[____exports.DukeVariant.DUKE_OF_FLIES] = "DUKE_OF_FLIES"
____exports.DukeVariant.THE_HUSK = 1
____exports.DukeVariant[____exports.DukeVariant.THE_HUSK] = "THE_HUSK"
--- For `EntityType.PEEP` (68).
____exports.PeepVariant = {}
____exports.PeepVariant.PEEP = 0
____exports.PeepVariant[____exports.PeepVariant.PEEP] = "PEEP"
____exports.PeepVariant.BLOAT = 1
____exports.PeepVariant[____exports.PeepVariant.BLOAT] = "BLOAT"
____exports.PeepVariant.PEEP_EYE = 10
____exports.PeepVariant[____exports.PeepVariant.PEEP_EYE] = "PEEP_EYE"
____exports.PeepVariant.BLOAT_EYE = 11
____exports.PeepVariant[____exports.PeepVariant.BLOAT_EYE] = "BLOAT_EYE"
--- For `EntityType.LOKI` (69).
____exports.LokiVariant = {}
____exports.LokiVariant.LOKI = 0
____exports.LokiVariant[____exports.LokiVariant.LOKI] = "LOKI"
____exports.LokiVariant.LOKII = 1
____exports.LokiVariant[____exports.LokiVariant.LOKII] = "LOKII"
--- For:
-- - `EntityType.FISTULA_BIG` (71)
-- - `EntityType.FISTULA_MEDIUM` (72)
-- - `EntityType.FISTULA_SMALL` (73)
____exports.FistulaVariant = {}
____exports.FistulaVariant.FISTULA = 0
____exports.FistulaVariant[____exports.FistulaVariant.FISTULA] = "FISTULA"
____exports.FistulaVariant.TERATOMA = 1
____exports.FistulaVariant[____exports.FistulaVariant.TERATOMA] = "TERATOMA"
--- For `EntityType.MOMS_HEART` (78).
____exports.MomsHeartVariant = {}
____exports.MomsHeartVariant.MOMS_HEART = 0
____exports.MomsHeartVariant[____exports.MomsHeartVariant.MOMS_HEART] = "MOMS_HEART"
____exports.MomsHeartVariant.IT_LIVES = 1
____exports.MomsHeartVariant[____exports.MomsHeartVariant.IT_LIVES] = "IT_LIVES"
____exports.MomsHeartVariant.MOMS_GUTS = 2
____exports.MomsHeartVariant[____exports.MomsHeartVariant.MOMS_GUTS] = "MOMS_GUTS"
--- For `EntityType.GEMINI` (79).
____exports.GeminiVariant = {}
____exports.GeminiVariant.GEMINI = 0
____exports.GeminiVariant[____exports.GeminiVariant.GEMINI] = "GEMINI"
____exports.GeminiVariant.STEVEN = 1
____exports.GeminiVariant[____exports.GeminiVariant.STEVEN] = "STEVEN"
____exports.GeminiVariant.BLIGHTED_OVUM = 2
____exports.GeminiVariant[____exports.GeminiVariant.BLIGHTED_OVUM] = "BLIGHTED_OVUM"
____exports.GeminiVariant.GEMINI_BABY = 10
____exports.GeminiVariant[____exports.GeminiVariant.GEMINI_BABY] = "GEMINI_BABY"
____exports.GeminiVariant.STEVEN_BABY = 11
____exports.GeminiVariant[____exports.GeminiVariant.STEVEN_BABY] = "STEVEN_BABY"
____exports.GeminiVariant.BLIGHTED_OVUM_BABY = 12
____exports.GeminiVariant[____exports.GeminiVariant.BLIGHTED_OVUM_BABY] = "BLIGHTED_OVUM_BABY"
____exports.GeminiVariant.UMBILICAL_CORD = 20
____exports.GeminiVariant[____exports.GeminiVariant.UMBILICAL_CORD] = "UMBILICAL_CORD"
--- For `EntityType.FALLEN` (81).
____exports.FallenVariant = {}
____exports.FallenVariant.FALLEN = 0
____exports.FallenVariant[____exports.FallenVariant.FALLEN] = "FALLEN"
____exports.FallenVariant.KRAMPUS = 1
____exports.FallenVariant[____exports.FallenVariant.KRAMPUS] = "KRAMPUS"
--- For `EntityType.SATAN` (84).
____exports.SatanVariant = {}
____exports.SatanVariant.SATAN = 0
____exports.SatanVariant[____exports.SatanVariant.SATAN] = "SATAN"
____exports.SatanVariant.STOMP = 10
____exports.SatanVariant[____exports.SatanVariant.STOMP] = "STOMP"
--- For `EntityType.GURGLE` (87).
____exports.GurgleVariant = {}
____exports.GurgleVariant.GURGLE = 0
____exports.GurgleVariant[____exports.GurgleVariant.GURGLE] = "GURGLE"
____exports.GurgleVariant.CRACKLE = 1
____exports.GurgleVariant[____exports.GurgleVariant.CRACKLE] = "CRACKLE"
--- For `EntityType.WALKING_BOIL` (88).
____exports.WalkingBoilVariant = {}
____exports.WalkingBoilVariant.WALKING_BOIL = 0
____exports.WalkingBoilVariant[____exports.WalkingBoilVariant.WALKING_BOIL] = "WALKING_BOIL"
____exports.WalkingBoilVariant.WALKING_GUT = 1
____exports.WalkingBoilVariant[____exports.WalkingBoilVariant.WALKING_GUT] = "WALKING_GUT"
____exports.WalkingBoilVariant.WALKING_SACK = 2
____exports.WalkingBoilVariant[____exports.WalkingBoilVariant.WALKING_SACK] = "WALKING_SACK"
--- For `EntityType.HEART` (92).
____exports.HeartVariant = {}
____exports.HeartVariant.HEART = 0
____exports.HeartVariant[____exports.HeartVariant.HEART] = "HEART"
____exports.HeartVariant.HALF_HEART = 1
____exports.HeartVariant[____exports.HeartVariant.HALF_HEART] = "HALF_HEART"
--- For `EntityType.MASK` (93).
____exports.MaskVariant = {}
____exports.MaskVariant.MASK = 0
____exports.MaskVariant[____exports.MaskVariant.MASK] = "MASK"
____exports.MaskVariant.MASK_2 = 1
____exports.MaskVariant[____exports.MaskVariant.MASK_2] = "MASK_2"
--- For `EntityType.WIDOW` (100).
____exports.WidowVariant = {}
____exports.WidowVariant.WIDOW = 0
____exports.WidowVariant[____exports.WidowVariant.WIDOW] = "WIDOW"
____exports.WidowVariant.THE_WRETCHED = 1
____exports.WidowVariant[____exports.WidowVariant.THE_WRETCHED] = "THE_WRETCHED"
--- For `EntityType.DADDY_LONG_LEGS` (101).
____exports.DaddyLongLegsVariant = {}
____exports.DaddyLongLegsVariant.DADDY_LONG_LEGS = 0
____exports.DaddyLongLegsVariant[____exports.DaddyLongLegsVariant.DADDY_LONG_LEGS] = "DADDY_LONG_LEGS"
____exports.DaddyLongLegsVariant.TRIACHNID = 1
____exports.DaddyLongLegsVariant[____exports.DaddyLongLegsVariant.TRIACHNID] = "TRIACHNID"
--- For `EntityType.ISAAC` (102).
____exports.IsaacVariant = {}
____exports.IsaacVariant.ISAAC = 0
____exports.IsaacVariant[____exports.IsaacVariant.ISAAC] = "ISAAC"
____exports.IsaacVariant.BLUE_BABY = 1
____exports.IsaacVariant[____exports.IsaacVariant.BLUE_BABY] = "BLUE_BABY"
____exports.IsaacVariant.BLUE_BABY_HUSH = 2
____exports.IsaacVariant[____exports.IsaacVariant.BLUE_BABY_HUSH] = "BLUE_BABY_HUSH"
--- For `EntityType.CONSTANT_STONE_SHOOTER` (202).
____exports.ConstantStoneShooterVariant = {}
____exports.ConstantStoneShooterVariant.CONSTANT_STONE_SHOOTER = 0
____exports.ConstantStoneShooterVariant[____exports.ConstantStoneShooterVariant.CONSTANT_STONE_SHOOTER] = "CONSTANT_STONE_SHOOTER"
____exports.ConstantStoneShooterVariant.CROSS_STONE_SHOOTER = 10
____exports.ConstantStoneShooterVariant[____exports.ConstantStoneShooterVariant.CROSS_STONE_SHOOTER] = "CROSS_STONE_SHOOTER"
____exports.ConstantStoneShooterVariant.CROSS_STONE_SHOOTER_ALWAYS_ON = 11
____exports.ConstantStoneShooterVariant[____exports.ConstantStoneShooterVariant.CROSS_STONE_SHOOTER_ALWAYS_ON] = "CROSS_STONE_SHOOTER_ALWAYS_ON"
--- For `EntityType.BABY_LONG_LEGS` (206).
____exports.BabyLongLegsVariant = {}
____exports.BabyLongLegsVariant.BABY_LONG_LEGS = 0
____exports.BabyLongLegsVariant[____exports.BabyLongLegsVariant.BABY_LONG_LEGS] = "BABY_LONG_LEGS"
____exports.BabyLongLegsVariant.SMALL_BABY_LONG_LEGS = 1
____exports.BabyLongLegsVariant[____exports.BabyLongLegsVariant.SMALL_BABY_LONG_LEGS] = "SMALL_BABY_LONG_LEGS"
--- For `EntityType.CRAZY_LONG_LEGS` (207).
____exports.CrazyLongLegsVariant = {}
____exports.CrazyLongLegsVariant.CRAZY_LONG_LEGS = 0
____exports.CrazyLongLegsVariant[____exports.CrazyLongLegsVariant.CRAZY_LONG_LEGS] = "CRAZY_LONG_LEGS"
____exports.CrazyLongLegsVariant.SMALL_CRAZY_LONG_LEGS = 1
____exports.CrazyLongLegsVariant[____exports.CrazyLongLegsVariant.SMALL_CRAZY_LONG_LEGS] = "SMALL_CRAZY_LONG_LEGS"
--- For `EntityType.FATTY` (208).
____exports.FattyVariant = {}
____exports.FattyVariant.FATTY = 0
____exports.FattyVariant[____exports.FattyVariant.FATTY] = "FATTY"
____exports.FattyVariant.PALE_FATTY = 1
____exports.FattyVariant[____exports.FattyVariant.PALE_FATTY] = "PALE_FATTY"
____exports.FattyVariant.FLAMING_FATTY = 2
____exports.FattyVariant[____exports.FattyVariant.FLAMING_FATTY] = "FLAMING_FATTY"
--- For `EntityType.DEATHS_HEAD` (212).
____exports.DeathsHeadVariant = {}
____exports.DeathsHeadVariant.DEATHS_HEAD = 0
____exports.DeathsHeadVariant[____exports.DeathsHeadVariant.DEATHS_HEAD] = "DEATHS_HEAD"
____exports.DeathsHeadVariant.DANK_DEATHS_HEAD = 1
____exports.DeathsHeadVariant[____exports.DeathsHeadVariant.DANK_DEATHS_HEAD] = "DANK_DEATHS_HEAD"
____exports.DeathsHeadVariant.CURSED_DEATHS_HEAD = 2
____exports.DeathsHeadVariant[____exports.DeathsHeadVariant.CURSED_DEATHS_HEAD] = "CURSED_DEATHS_HEAD"
____exports.DeathsHeadVariant.BRIMSTONE_DEATHS_HEAD = 3
____exports.DeathsHeadVariant[____exports.DeathsHeadVariant.BRIMSTONE_DEATHS_HEAD] = "BRIMSTONE_DEATHS_HEAD"
____exports.DeathsHeadVariant.RED_SKULL = 4
____exports.DeathsHeadVariant[____exports.DeathsHeadVariant.RED_SKULL] = "RED_SKULL"
--- For `EntityType.SWINGER` (216).
____exports.SwingerVariant = {}
____exports.SwingerVariant.SWINGER = 0
____exports.SwingerVariant[____exports.SwingerVariant.SWINGER] = "SWINGER"
____exports.SwingerVariant.SWINGER_HEAD = 1
____exports.SwingerVariant[____exports.SwingerVariant.SWINGER_HEAD] = "SWINGER_HEAD"
____exports.SwingerVariant.SWINGER_NECK = 10
____exports.SwingerVariant[____exports.SwingerVariant.SWINGER_NECK] = "SWINGER_NECK"
--- For `EntityType.DIP` (217).
____exports.DipVariant = {}
____exports.DipVariant.DIP = 0
____exports.DipVariant[____exports.DipVariant.DIP] = "DIP"
____exports.DipVariant.CORN = 1
____exports.DipVariant[____exports.DipVariant.CORN] = "CORN"
____exports.DipVariant.BROWNIE_CORN = 2
____exports.DipVariant[____exports.DipVariant.BROWNIE_CORN] = "BROWNIE_CORN"
____exports.DipVariant.BIG_CORN = 3
____exports.DipVariant[____exports.DipVariant.BIG_CORN] = "BIG_CORN"
--- For `EntityType.SQUIRT` (220).
____exports.SquirtVariant = {}
____exports.SquirtVariant.SQUIRT = 0
____exports.SquirtVariant[____exports.SquirtVariant.SQUIRT] = "SQUIRT"
____exports.SquirtVariant.DANK_SQUIRT = 1
____exports.SquirtVariant[____exports.SquirtVariant.DANK_SQUIRT] = "DANK_SQUIRT"
--- For `EntityType.SKINNY` (226).
____exports.SkinnyVariant = {}
____exports.SkinnyVariant.SKINNY = 0
____exports.SkinnyVariant[____exports.SkinnyVariant.SKINNY] = "SKINNY"
____exports.SkinnyVariant.ROTTY = 1
____exports.SkinnyVariant[____exports.SkinnyVariant.ROTTY] = "ROTTY"
____exports.SkinnyVariant.CRISPY = 2
____exports.SkinnyVariant[____exports.SkinnyVariant.CRISPY] = "CRISPY"
--- For `EntityType.BONY` (227).
____exports.BonyVariant = {}
____exports.BonyVariant.BONY = 0
____exports.BonyVariant[____exports.BonyVariant.BONY] = "BONY"
____exports.BonyVariant.HOLY_BONY = 1
____exports.BonyVariant[____exports.BonyVariant.HOLY_BONY] = "HOLY_BONY"
--- For `EntityType.HOMUNCULUS` (228).
____exports.HomunculusVariant = {}
____exports.HomunculusVariant.HOMUNCULUS = 0
____exports.HomunculusVariant[____exports.HomunculusVariant.HOMUNCULUS] = "HOMUNCULUS"
____exports.HomunculusVariant.HOMUNCULUS_CORD = 10
____exports.HomunculusVariant[____exports.HomunculusVariant.HOMUNCULUS_CORD] = "HOMUNCULUS_CORD"
--- For `EntityType.TUMOR` (229).
____exports.TumorVariant = {}
____exports.TumorVariant.TUMOR = 0
____exports.TumorVariant[____exports.TumorVariant.TUMOR] = "TUMOR"
____exports.TumorVariant.PLANETOID = 1
____exports.TumorVariant[____exports.TumorVariant.PLANETOID] = "PLANETOID"
--- For `EntityType.NERVE_ENDING` (231).
____exports.NerveEndingVariant = {}
____exports.NerveEndingVariant.NERVE_ENDING = 0
____exports.NerveEndingVariant[____exports.NerveEndingVariant.NERVE_ENDING] = "NERVE_ENDING"
____exports.NerveEndingVariant.NERVE_ENDING_2 = 1
____exports.NerveEndingVariant[____exports.NerveEndingVariant.NERVE_ENDING_2] = "NERVE_ENDING_2"
--- For `EntityType.GURGLING` (237).
____exports.GurglingVariant = {}
____exports.GurglingVariant.GURGLING = 0
____exports.GurglingVariant[____exports.GurglingVariant.GURGLING] = "GURGLING"
____exports.GurglingVariant.GURGLING_BOSS = 1
____exports.GurglingVariant[____exports.GurglingVariant.GURGLING_BOSS] = "GURGLING_BOSS"
____exports.GurglingVariant.TURDLING = 2
____exports.GurglingVariant[____exports.GurglingVariant.TURDLING] = "TURDLING"
--- For `EntityType.GRUB` (239).
____exports.GrubVariant = {}
____exports.GrubVariant.GRUB = 0
____exports.GrubVariant[____exports.GrubVariant.GRUB] = "GRUB"
____exports.GrubVariant.CORPSE_EATER = 1
____exports.GrubVariant[____exports.GrubVariant.CORPSE_EATER] = "CORPSE_EATER"
____exports.GrubVariant.CARRION_RIDER = 2
____exports.GrubVariant[____exports.GrubVariant.CARRION_RIDER] = "CARRION_RIDER"
--- For `EntityType.WALL_CREEP` (240).
____exports.WallCreepVariant = {}
____exports.WallCreepVariant.WALL_CREEP = 0
____exports.WallCreepVariant[____exports.WallCreepVariant.WALL_CREEP] = "WALL_CREEP"
____exports.WallCreepVariant.SOY_CREEP = 1
____exports.WallCreepVariant[____exports.WallCreepVariant.SOY_CREEP] = "SOY_CREEP"
____exports.WallCreepVariant.RAG_CREEP = 2
____exports.WallCreepVariant[____exports.WallCreepVariant.RAG_CREEP] = "RAG_CREEP"
____exports.WallCreepVariant.TAINTED_SOY_CREEP = 3
____exports.WallCreepVariant[____exports.WallCreepVariant.TAINTED_SOY_CREEP] = "TAINTED_SOY_CREEP"
--- For `EntityType.RAGE_CREEP` (241).
____exports.RageCreepVariant = {}
____exports.RageCreepVariant.RAGE_CREEP = 0
____exports.RageCreepVariant[____exports.RageCreepVariant.RAGE_CREEP] = "RAGE_CREEP"
____exports.RageCreepVariant.SPLIT_RAGE_CREEP = 1
____exports.RageCreepVariant[____exports.RageCreepVariant.SPLIT_RAGE_CREEP] = "SPLIT_RAGE_CREEP"
--- For `EntityType.ROUND_WORM` (244).
____exports.RoundWormVariant = {}
____exports.RoundWormVariant.ROUND_WORM = 0
____exports.RoundWormVariant[____exports.RoundWormVariant.ROUND_WORM] = "ROUND_WORM"
____exports.RoundWormVariant.TUBE_WORM = 1
____exports.RoundWormVariant[____exports.RoundWormVariant.TUBE_WORM] = "TUBE_WORM"
____exports.RoundWormVariant.TAINTED_ROUND_WORM = 2
____exports.RoundWormVariant[____exports.RoundWormVariant.TAINTED_ROUND_WORM] = "TAINTED_ROUND_WORM"
____exports.RoundWormVariant.TAINTED_TUBE_WORM = 3
____exports.RoundWormVariant[____exports.RoundWormVariant.TAINTED_TUBE_WORM] = "TAINTED_TUBE_WORM"
--- For `EntityType.POOP` (245).
____exports.PoopEntityVariant = {}
____exports.PoopEntityVariant.NORMAL = 0
____exports.PoopEntityVariant[____exports.PoopEntityVariant.NORMAL] = "NORMAL"
____exports.PoopEntityVariant.GOLDEN = 1
____exports.PoopEntityVariant[____exports.PoopEntityVariant.GOLDEN] = "GOLDEN"
____exports.PoopEntityVariant.STONE = 11
____exports.PoopEntityVariant[____exports.PoopEntityVariant.STONE] = "STONE"
____exports.PoopEntityVariant.CORNY = 12
____exports.PoopEntityVariant[____exports.PoopEntityVariant.CORNY] = "CORNY"
____exports.PoopEntityVariant.BURNING = 13
____exports.PoopEntityVariant[____exports.PoopEntityVariant.BURNING] = "BURNING"
____exports.PoopEntityVariant.STINKY = 14
____exports.PoopEntityVariant[____exports.PoopEntityVariant.STINKY] = "STINKY"
____exports.PoopEntityVariant.BLACK = 15
____exports.PoopEntityVariant[____exports.PoopEntityVariant.BLACK] = "BLACK"
____exports.PoopEntityVariant.HOLY = 16
____exports.PoopEntityVariant[____exports.PoopEntityVariant.HOLY] = "HOLY"
--- For `EntityType.RAGLING` (246).
____exports.RaglingVariant = {}
____exports.RaglingVariant.RAGLING = 0
____exports.RaglingVariant[____exports.RaglingVariant.RAGLING] = "RAGLING"
____exports.RaglingVariant.RAG_MANS_RAGLING = 1
____exports.RaglingVariant[____exports.RaglingVariant.RAG_MANS_RAGLING] = "RAG_MANS_RAGLING"
--- For `EntityType.BEGOTTEN` (251).
____exports.BegottenVariant = {}
____exports.BegottenVariant.BEGOTTEN = 0
____exports.BegottenVariant[____exports.BegottenVariant.BEGOTTEN] = "BEGOTTEN"
____exports.BegottenVariant.BEGOTTEN_CHAIN = 10
____exports.BegottenVariant[____exports.BegottenVariant.BEGOTTEN_CHAIN] = "BEGOTTEN_CHAIN"
--- For `EntityType.CONJOINED_FATTY` (257).
____exports.ConjoinedFattyVariant = {}
____exports.ConjoinedFattyVariant.CONJOINED_FATTY = 0
____exports.ConjoinedFattyVariant[____exports.ConjoinedFattyVariant.CONJOINED_FATTY] = "CONJOINED_FATTY"
____exports.ConjoinedFattyVariant.BLUE_CONJOINED_FATTY = 1
____exports.ConjoinedFattyVariant[____exports.ConjoinedFattyVariant.BLUE_CONJOINED_FATTY] = "BLUE_CONJOINED_FATTY"
--- For `EntityType.THE_HAUNT` (260).
____exports.HauntVariant = {}
____exports.HauntVariant.HAUNT = 0
____exports.HauntVariant[____exports.HauntVariant.HAUNT] = "HAUNT"
____exports.HauntVariant.LIL_HAUNT = 10
____exports.HauntVariant[____exports.HauntVariant.LIL_HAUNT] = "LIL_HAUNT"
--- For `EntityType.DINGLE` (261).
____exports.DingleVariant = {}
____exports.DingleVariant.DINGLE = 0
____exports.DingleVariant[____exports.DingleVariant.DINGLE] = "DINGLE"
____exports.DingleVariant.DANGLE = 1
____exports.DingleVariant[____exports.DingleVariant.DANGLE] = "DANGLE"
--- For `EntityType.MAMA_GURDY` (266).
____exports.MamaGurdyVariant = {}
____exports.MamaGurdyVariant.MAMA_GURDY = 0
____exports.MamaGurdyVariant[____exports.MamaGurdyVariant.MAMA_GURDY] = "MAMA_GURDY"
____exports.MamaGurdyVariant.LEFT_HAND = 1
____exports.MamaGurdyVariant[____exports.MamaGurdyVariant.LEFT_HAND] = "LEFT_HAND"
____exports.MamaGurdyVariant.RIGHT_HAND = 2
____exports.MamaGurdyVariant[____exports.MamaGurdyVariant.RIGHT_HAND] = "RIGHT_HAND"
--- For `EntityType.POLYCEPHALUS` (269).
____exports.PolycephalusVariant = {}
____exports.PolycephalusVariant.POLYCEPHALUS = 0
____exports.PolycephalusVariant[____exports.PolycephalusVariant.POLYCEPHALUS] = "POLYCEPHALUS"
____exports.PolycephalusVariant.THE_PILE = 1
____exports.PolycephalusVariant[____exports.PolycephalusVariant.THE_PILE] = "THE_PILE"
--- For `EntityType.URIEL` (271) and `EntityType.GABRIEL` (272).
____exports.AngelVariant = {}
____exports.AngelVariant.NORMAL = 0
____exports.AngelVariant[____exports.AngelVariant.NORMAL] = "NORMAL"
____exports.AngelVariant.FALLEN = 1
____exports.AngelVariant[____exports.AngelVariant.FALLEN] = "FALLEN"
--- For `EntityType.THE_LAMB` (273).
____exports.LambVariant = {}
____exports.LambVariant.LAMB = 0
____exports.LambVariant[____exports.LambVariant.LAMB] = "LAMB"
____exports.LambVariant.BODY = 10
____exports.LambVariant[____exports.LambVariant.BODY] = "BODY"
--- For `EntityType.MEGA_SATAN` (274) and `EntityType.MEGA_SATAN_2` (275).
____exports.MegaSatanVariant = {}
____exports.MegaSatanVariant.MEGA_SATAN = 0
____exports.MegaSatanVariant[____exports.MegaSatanVariant.MEGA_SATAN] = "MEGA_SATAN"
____exports.MegaSatanVariant.MEGA_SATAN_RIGHT_HAND = 1
____exports.MegaSatanVariant[____exports.MegaSatanVariant.MEGA_SATAN_RIGHT_HAND] = "MEGA_SATAN_RIGHT_HAND"
____exports.MegaSatanVariant.MEGA_SATAN_LEFT_HAND = 2
____exports.MegaSatanVariant[____exports.MegaSatanVariant.MEGA_SATAN_LEFT_HAND] = "MEGA_SATAN_LEFT_HAND"
--- For `EntityType.PITFALL` (291).
____exports.PitfallVariant = {}
____exports.PitfallVariant.PITFALL = 0
____exports.PitfallVariant[____exports.PitfallVariant.PITFALL] = "PITFALL"
____exports.PitfallVariant.SUCTION_PITFALL = 1
____exports.PitfallVariant[____exports.PitfallVariant.SUCTION_PITFALL] = "SUCTION_PITFALL"
____exports.PitfallVariant.TELEPORT_PITFALL = 2
____exports.PitfallVariant[____exports.PitfallVariant.TELEPORT_PITFALL] = "TELEPORT_PITFALL"
--- For `EntityType.MOVABLE_TNT` (292).
____exports.MoveableTNTVariant = {}
____exports.MoveableTNTVariant.MOVEABLE_TNT = 0
____exports.MoveableTNTVariant[____exports.MoveableTNTVariant.MOVEABLE_TNT] = "MOVEABLE_TNT"
____exports.MoveableTNTVariant.MINE_CRAFTER = 1
____exports.MoveableTNTVariant[____exports.MoveableTNTVariant.MINE_CRAFTER] = "MINE_CRAFTER"
--- For `EntityType.ULTRA_COIN` (293).
____exports.UltraCoinVariant = {}
____exports.UltraCoinVariant.SPINNER = 0
____exports.UltraCoinVariant[____exports.UltraCoinVariant.SPINNER] = "SPINNER"
____exports.UltraCoinVariant.KEY = 1
____exports.UltraCoinVariant[____exports.UltraCoinVariant.KEY] = "KEY"
____exports.UltraCoinVariant.BOMB = 2
____exports.UltraCoinVariant[____exports.UltraCoinVariant.BOMB] = "BOMB"
____exports.UltraCoinVariant.HEART = 3
____exports.UltraCoinVariant[____exports.UltraCoinVariant.HEART] = "HEART"
--- For `EntityType.STONEY` (302).
____exports.StoneyVariant = {}
____exports.StoneyVariant.STONEY = 0
____exports.StoneyVariant[____exports.StoneyVariant.STONEY] = "STONEY"
____exports.StoneyVariant.CROSS_STONEY = 10
____exports.StoneyVariant[____exports.StoneyVariant.CROSS_STONEY] = "CROSS_STONEY"
--- For `EntityType.PORTAL` (306).
____exports.PortalVariant = {}
____exports.PortalVariant.PORTAL = 0
____exports.PortalVariant[____exports.PortalVariant.PORTAL] = "PORTAL"
____exports.PortalVariant.LIL_PORTAL = 1
____exports.PortalVariant[____exports.PortalVariant.LIL_PORTAL] = "LIL_PORTAL"
--- For `EntityType.LEPER` (310).
____exports.LeperVariant = {}
____exports.LeperVariant.LEPER = 0
____exports.LeperVariant[____exports.LeperVariant.LEPER] = "LEPER"
____exports.LeperVariant.LEPER_FLESH = 1
____exports.LeperVariant[____exports.LeperVariant.LEPER_FLESH] = "LEPER_FLESH"
--- For `EntityType.MR_MINE` (311).
____exports.MrMineVariant = {}
____exports.MrMineVariant.MR_MINE = 0
____exports.MrMineVariant[____exports.MrMineVariant.MR_MINE] = "MR_MINE"
____exports.MrMineVariant.MR_MINE_NECK = 10
____exports.MrMineVariant[____exports.MrMineVariant.MR_MINE_NECK] = "MR_MINE_NECK"
--- For `EntityType.LITTLE_HORN` (404).
____exports.LittleHornVariant = {}
____exports.LittleHornVariant.LITTLE_HORN = 0
____exports.LittleHornVariant[____exports.LittleHornVariant.LITTLE_HORN] = "LITTLE_HORN"
____exports.LittleHornVariant.DARK_BALL = 1
____exports.LittleHornVariant[____exports.LittleHornVariant.DARK_BALL] = "DARK_BALL"
--- For `EntityType.RAG_MAN` (405).
____exports.RagManVariant = {}
____exports.RagManVariant.RAG_MAN = 0
____exports.RagManVariant[____exports.RagManVariant.RAG_MAN] = "RAG_MAN"
____exports.RagManVariant.RAG_MAN_HEAD = 1
____exports.RagManVariant[____exports.RagManVariant.RAG_MAN_HEAD] = "RAG_MAN_HEAD"
--- For `EntityType.ULTRA_GREED` (406).
____exports.UltraGreedVariant = {}
____exports.UltraGreedVariant.ULTRA_GREED = 0
____exports.UltraGreedVariant[____exports.UltraGreedVariant.ULTRA_GREED] = "ULTRA_GREED"
____exports.UltraGreedVariant.ULTRA_GREEDIER = 1
____exports.UltraGreedVariant[____exports.UltraGreedVariant.ULTRA_GREEDIER] = "ULTRA_GREEDIER"
--- For `EntityType.RAG_MEGA` (409).
____exports.RagMegaVariant = {}
____exports.RagMegaVariant.RAG_MEGA = 0
____exports.RagMegaVariant[____exports.RagMegaVariant.RAG_MEGA] = "RAG_MEGA"
____exports.RagMegaVariant.PURPLE_BALL = 1
____exports.RagMegaVariant[____exports.RagMegaVariant.PURPLE_BALL] = "PURPLE_BALL"
____exports.RagMegaVariant.REBIRTH_PILLAR = 2
____exports.RagMegaVariant[____exports.RagMegaVariant.REBIRTH_PILLAR] = "REBIRTH_PILLAR"
--- For `EntityType.BIG_HORN` (411).
____exports.BigHornVariant = {}
____exports.BigHornVariant.BIG_HORN = 0
____exports.BigHornVariant[____exports.BigHornVariant.BIG_HORN] = "BIG_HORN"
____exports.BigHornVariant.SMALL_HOLE = 1
____exports.BigHornVariant[____exports.BigHornVariant.SMALL_HOLE] = "SMALL_HOLE"
____exports.BigHornVariant.BIG_HOLE = 2
____exports.BigHornVariant[____exports.BigHornVariant.BIG_HOLE] = "BIG_HOLE"
--- For `EntityType.BLOOD_PUPPY` (802).
____exports.BloodPuppyVariant = {}
____exports.BloodPuppyVariant.SMALL = 0
____exports.BloodPuppyVariant[____exports.BloodPuppyVariant.SMALL] = "SMALL"
____exports.BloodPuppyVariant.LARGE = 1
____exports.BloodPuppyVariant[____exports.BloodPuppyVariant.LARGE] = "LARGE"
--- For `EntityType.SUB_HORF` (812).
____exports.SubHorfVariant = {}
____exports.SubHorfVariant.SUB_HORF = 0
____exports.SubHorfVariant[____exports.SubHorfVariant.SUB_HORF] = "SUB_HORF"
____exports.SubHorfVariant.TAINTED_SUB_HORF = 1
____exports.SubHorfVariant[____exports.SubHorfVariant.TAINTED_SUB_HORF] = "TAINTED_SUB_HORF"
--- For `EntityType.POLTY` (816).
____exports.PoltyVariant = {}
____exports.PoltyVariant.POLTY = 0
____exports.PoltyVariant[____exports.PoltyVariant.POLTY] = "POLTY"
____exports.PoltyVariant.KINETI = 1
____exports.PoltyVariant[____exports.PoltyVariant.KINETI] = "KINETI"
--- For `EntityType.PREY` (817).
____exports.PreyVariant = {}
____exports.PreyVariant.PREY = 0
____exports.PreyVariant[____exports.PreyVariant.PREY] = "PREY"
____exports.PreyVariant.MULLIGHOUL = 1
____exports.PreyVariant[____exports.PreyVariant.MULLIGHOUL] = "MULLIGHOUL"
--- For `EntityType.ROCK_SPIDER` (818).
____exports.RockSpiderVariant = {}
____exports.RockSpiderVariant.ROCK_SPIDER = 0
____exports.RockSpiderVariant[____exports.RockSpiderVariant.ROCK_SPIDER] = "ROCK_SPIDER"
____exports.RockSpiderVariant.TINTED_ROCK_SPIDER = 1
____exports.RockSpiderVariant[____exports.RockSpiderVariant.TINTED_ROCK_SPIDER] = "TINTED_ROCK_SPIDER"
____exports.RockSpiderVariant.COAL_SPIDER = 2
____exports.RockSpiderVariant[____exports.RockSpiderVariant.COAL_SPIDER] = "COAL_SPIDER"
--- For `EntityType.FLY_BOMB` (819).
____exports.FlyBombVariant = {}
____exports.FlyBombVariant.FLY_BOMB = 0
____exports.FlyBombVariant[____exports.FlyBombVariant.FLY_BOMB] = "FLY_BOMB"
____exports.FlyBombVariant.ETERNAL_FLY_BOMB = 1
____exports.FlyBombVariant[____exports.FlyBombVariant.ETERNAL_FLY_BOMB] = "ETERNAL_FLY_BOMB"
--- For `EntityType.DANNY` (820).
____exports.DannyVariant = {}
____exports.DannyVariant.DANNY = 0
____exports.DannyVariant[____exports.DannyVariant.DANNY] = "DANNY"
____exports.DannyVariant.COAL_BOY = 1
____exports.DannyVariant[____exports.DannyVariant.COAL_BOY] = "COAL_BOY"
--- For `EntityType.GYRO` (824).
____exports.GyroVariant = {}
____exports.GyroVariant.GYRO = 0
____exports.GyroVariant[____exports.GyroVariant.GYRO] = "GYRO"
____exports.GyroVariant.GRILLED_GYRO = 1
____exports.GyroVariant[____exports.GyroVariant.GRILLED_GYRO] = "GRILLED_GYRO"
--- For `EntityType.FACELESS` (827).
____exports.FacelessVariant = {}
____exports.FacelessVariant.FACELESS = 0
____exports.FacelessVariant[____exports.FacelessVariant.FACELESS] = "FACELESS"
____exports.FacelessVariant.TAINTED_FACELESS = 1
____exports.FacelessVariant[____exports.FacelessVariant.TAINTED_FACELESS] = "TAINTED_FACELESS"
--- For `EntityType.MOLE` (829).
____exports.MoleVariant = {}
____exports.MoleVariant.MOLE = 0
____exports.MoleVariant[____exports.MoleVariant.MOLE] = "MOLE"
____exports.MoleVariant.TAINTED_MOLE = 1
____exports.MoleVariant[____exports.MoleVariant.TAINTED_MOLE] = "TAINTED_MOLE"
--- For `EntityType.BIG_BONY` (830).
____exports.BigBonyVariant = {}
____exports.BigBonyVariant.BIG_BONY = 0
____exports.BigBonyVariant[____exports.BigBonyVariant.BIG_BONY] = "BIG_BONY"
____exports.BigBonyVariant.BIG_BONE = 10
____exports.BigBonyVariant[____exports.BigBonyVariant.BIG_BONE] = "BIG_BONE"
--- For `EntityType.GUTTED_FATTY` (831).
____exports.GuttyFattyVariant = {}
____exports.GuttyFattyVariant.GUTTED_FATTY = 0
____exports.GuttyFattyVariant[____exports.GuttyFattyVariant.GUTTED_FATTY] = "GUTTED_FATTY"
____exports.GuttyFattyVariant.GUTTY_FATTY_EYE = 10
____exports.GuttyFattyVariant[____exports.GuttyFattyVariant.GUTTY_FATTY_EYE] = "GUTTY_FATTY_EYE"
____exports.GuttyFattyVariant.FESTERING_GUTS = 20
____exports.GuttyFattyVariant[____exports.GuttyFattyVariant.FESTERING_GUTS] = "FESTERING_GUTS"
--- For `EntityType.EXORCIST` (832).
____exports.ExorcistVariant = {}
____exports.ExorcistVariant.EXORCIST = 0
____exports.ExorcistVariant[____exports.ExorcistVariant.EXORCIST] = "EXORCIST"
____exports.ExorcistVariant.FANATIC = 1
____exports.ExorcistVariant[____exports.ExorcistVariant.FANATIC] = "FANATIC"
--- For `EntityType.WHIPPER` (834).
____exports.WhipperVariant = {}
____exports.WhipperVariant.WHIPPER = 0
____exports.WhipperVariant[____exports.WhipperVariant.WHIPPER] = "WHIPPER"
____exports.WhipperVariant.SNAPPER = 1
____exports.WhipperVariant[____exports.WhipperVariant.SNAPPER] = "SNAPPER"
____exports.WhipperVariant.FLAGELLANT = 2
____exports.WhipperVariant[____exports.WhipperVariant.FLAGELLANT] = "FLAGELLANT"
--- For `EntityType.PEEPER_FATTY` (835).
____exports.PeeperFattyVariant = {}
____exports.PeeperFattyVariant.PEEPING_FATTY = 0
____exports.PeeperFattyVariant[____exports.PeeperFattyVariant.PEEPING_FATTY] = "PEEPING_FATTY"
____exports.PeeperFattyVariant.PEEPING_FATTY_EYE = 10
____exports.PeeperFattyVariant[____exports.PeeperFattyVariant.PEEPING_FATTY_EYE] = "PEEPING_FATTY_EYE"
--- For `EntityType.REVENANT` (841).
____exports.RevenantVariant = {}
____exports.RevenantVariant.REVENANT = 0
____exports.RevenantVariant[____exports.RevenantVariant.REVENANT] = "REVENANT"
____exports.RevenantVariant.QUAD_REVENANT = 1
____exports.RevenantVariant[____exports.RevenantVariant.QUAD_REVENANT] = "QUAD_REVENANT"
--- For `EntityType.CANARY` (843).
____exports.CanaryVariant = {}
____exports.CanaryVariant.CANARY = 0
____exports.CanaryVariant[____exports.CanaryVariant.CANARY] = "CANARY"
____exports.CanaryVariant.FOREIGNER = 1
____exports.CanaryVariant[____exports.CanaryVariant.FOREIGNER] = "FOREIGNER"
--- For `EntityType.GAPER_L2` (850).
____exports.Gaper2Variant = {}
____exports.Gaper2Variant.GAPER = 0
____exports.Gaper2Variant[____exports.Gaper2Variant.GAPER] = "GAPER"
____exports.Gaper2Variant.HORF = 1
____exports.Gaper2Variant[____exports.Gaper2Variant.HORF] = "HORF"
____exports.Gaper2Variant.GUSHER = 2
____exports.Gaper2Variant[____exports.Gaper2Variant.GUSHER] = "GUSHER"
--- For `EntityType.CHARGER_L2` (855).
____exports.Charger2Variant = {}
____exports.Charger2Variant.CHARGER = 0
____exports.Charger2Variant[____exports.Charger2Variant.CHARGER] = "CHARGER"
____exports.Charger2Variant.ELLEECH = 1
____exports.Charger2Variant[____exports.Charger2Variant.ELLEECH] = "ELLEECH"
--- For `EntityType.EVIS` (865).
____exports.EvisVariant = {}
____exports.EvisVariant.EVIS = 0
____exports.EvisVariant[____exports.EvisVariant.EVIS] = "EVIS"
____exports.EvisVariant.EVIS_GUTS = 10
____exports.EvisVariant[____exports.EvisVariant.EVIS_GUTS] = "EVIS_GUTS"
--- For `EntityType.DARK_ESAU` (866).
____exports.DarkEsauVariant = {}
____exports.DarkEsauVariant.DARK_ESAU = 0
____exports.DarkEsauVariant[____exports.DarkEsauVariant.DARK_ESAU] = "DARK_ESAU"
____exports.DarkEsauVariant.PIT = 1
____exports.DarkEsauVariant[____exports.DarkEsauVariant.PIT] = "PIT"
--- For `EntityType.DUMP` (876).
____exports.DumpVariant = {}
____exports.DumpVariant.DUMP = 0
____exports.DumpVariant[____exports.DumpVariant.DUMP] = "DUMP"
____exports.DumpVariant.DUMP_HEAD = 1
____exports.DumpVariant[____exports.DumpVariant.DUMP_HEAD] = "DUMP_HEAD"
--- For `EntityType.NEEDLE` (881).
____exports.NeedleVariant = {}
____exports.NeedleVariant.NEEDLE = 0
____exports.NeedleVariant[____exports.NeedleVariant.NEEDLE] = "NEEDLE"
____exports.NeedleVariant.PASTY = 1
____exports.NeedleVariant[____exports.NeedleVariant.PASTY] = "PASTY"
--- For `EntityType.CULTIST` (885).
____exports.CultistVariant = {}
____exports.CultistVariant.CULTIST = 0
____exports.CultistVariant[____exports.CultistVariant.CULTIST] = "CULTIST"
____exports.CultistVariant.BLOOD_CULTIST = 1
____exports.CultistVariant[____exports.CultistVariant.BLOOD_CULTIST] = "BLOOD_CULTIST"
____exports.CultistVariant.BONE_TRAP = 10
____exports.CultistVariant[____exports.CultistVariant.BONE_TRAP] = "BONE_TRAP"
--- For `EntityType.VIS_FATTY` (886).
____exports.VisFattyVariant = {}
____exports.VisFattyVariant.VIS_FATTY = 0
____exports.VisFattyVariant[____exports.VisFattyVariant.VIS_FATTY] = "VIS_FATTY"
____exports.VisFattyVariant.FETAL_DEMON = 1
____exports.VisFattyVariant[____exports.VisFattyVariant.FETAL_DEMON] = "FETAL_DEMON"
--- For `EntityType.GOAT` (891).
____exports.GoatVariant = {}
____exports.GoatVariant.GOAT = 0
____exports.GoatVariant[____exports.GoatVariant.GOAT] = "GOAT"
____exports.GoatVariant.BLACK_GOAT = 1
____exports.GoatVariant[____exports.GoatVariant.BLACK_GOAT] = "BLACK_GOAT"
--- For `EntityType.VISAGE` (903).
____exports.VisageVariant = {}
____exports.VisageVariant.VISAGE = 0
____exports.VisageVariant[____exports.VisageVariant.VISAGE] = "VISAGE"
____exports.VisageVariant.VISAGE_MASK = 1
____exports.VisageVariant[____exports.VisageVariant.VISAGE_MASK] = "VISAGE_MASK"
____exports.VisageVariant.VISAGE_CHAIN = 10
____exports.VisageVariant[____exports.VisageVariant.VISAGE_CHAIN] = "VISAGE_CHAIN"
____exports.VisageVariant.VISAGE_PLASMA = 20
____exports.VisageVariant[____exports.VisageVariant.VISAGE_PLASMA] = "VISAGE_PLASMA"
--- For `EntityType.SIREN` (904).
____exports.SirenVariant = {}
____exports.SirenVariant.SIREN = 0
____exports.SirenVariant[____exports.SirenVariant.SIREN] = "SIREN"
____exports.SirenVariant.SIREN_SKULL = 1
____exports.SirenVariant[____exports.SirenVariant.SIREN_SKULL] = "SIREN_SKULL"
____exports.SirenVariant.SIREN_HELPER_PROJECTILE = 10
____exports.SirenVariant[____exports.SirenVariant.SIREN_HELPER_PROJECTILE] = "SIREN_HELPER_PROJECTILE"
--- For `EntityType.SCOURGE` (909).
____exports.ScourgeVariant = {}
____exports.ScourgeVariant.SCOURGE = 0
____exports.ScourgeVariant[____exports.ScourgeVariant.SCOURGE] = "SCOURGE"
____exports.ScourgeVariant.SCOURGE_CHAIN = 10
____exports.ScourgeVariant[____exports.ScourgeVariant.SCOURGE_CHAIN] = "SCOURGE_CHAIN"
--- For `EntityType.CHIMERA` (910).
____exports.ChimeraVariant = {}
____exports.ChimeraVariant.CHIMERA = 0
____exports.ChimeraVariant[____exports.ChimeraVariant.CHIMERA] = "CHIMERA"
____exports.ChimeraVariant.CHIMERA_BODY = 1
____exports.ChimeraVariant[____exports.ChimeraVariant.CHIMERA_BODY] = "CHIMERA_BODY"
____exports.ChimeraVariant.CHIMERA_HEAD = 2
____exports.ChimeraVariant[____exports.ChimeraVariant.CHIMERA_HEAD] = "CHIMERA_HEAD"
--- For `EntityType.ROTGUT` (911).
____exports.RotgutVariant = {}
____exports.RotgutVariant.PHASE_1_HEAD = 0
____exports.RotgutVariant[____exports.RotgutVariant.PHASE_1_HEAD] = "PHASE_1_HEAD"
____exports.RotgutVariant.PHASE_2_MAGGOT = 1
____exports.RotgutVariant[____exports.RotgutVariant.PHASE_2_MAGGOT] = "PHASE_2_MAGGOT"
____exports.RotgutVariant.PHASE_3_HEART = 2
____exports.RotgutVariant[____exports.RotgutVariant.PHASE_3_HEART] = "PHASE_3_HEART"
--- For `EntityType.MOTHER` (912).
____exports.MotherVariant = {}
____exports.MotherVariant.MOTHER_1 = 0
____exports.MotherVariant[____exports.MotherVariant.MOTHER_1] = "MOTHER_1"
____exports.MotherVariant.MOTHER_2 = 10
____exports.MotherVariant[____exports.MotherVariant.MOTHER_2] = "MOTHER_2"
____exports.MotherVariant.BALL = 100
____exports.MotherVariant[____exports.MotherVariant.BALL] = "BALL"
--- For `EntityType.SINGE` (915).
____exports.SingeVariant = {}
____exports.SingeVariant.SINGE = 0
____exports.SingeVariant[____exports.SingeVariant.SINGE] = "SINGE"
____exports.SingeVariant.SINGE_BALL = 1
____exports.SingeVariant[____exports.SingeVariant.SINGE_BALL] = "SINGE_BALL"
--- For `EntityType.RAGLICH` (919).
____exports.RaglichVariant = {}
____exports.RaglichVariant.RAGLICH = 0
____exports.RaglichVariant[____exports.RaglichVariant.RAGLICH] = "RAGLICH"
____exports.RaglichVariant.RAGLICH_ARM = 1
____exports.RaglichVariant[____exports.RaglichVariant.RAGLICH_ARM] = "RAGLICH_ARM"
--- For `EntityType.CLUTCH` (921).
____exports.ClutchVariant = {}
____exports.ClutchVariant.CLUTCH = 0
____exports.ClutchVariant[____exports.ClutchVariant.CLUTCH] = "CLUTCH"
____exports.ClutchVariant.CLUTCH_ORBITAL = 1
____exports.ClutchVariant[____exports.ClutchVariant.CLUTCH_ORBITAL] = "CLUTCH_ORBITAL"
--- For `EntityType.DOGMA` (950).
____exports.DogmaVariant = {}
____exports.DogmaVariant.DOGMA_PHASE_1 = 0
____exports.DogmaVariant[____exports.DogmaVariant.DOGMA_PHASE_1] = "DOGMA_PHASE_1"
____exports.DogmaVariant.TV = 1
____exports.DogmaVariant[____exports.DogmaVariant.TV] = "TV"
____exports.DogmaVariant.ANGEL_PHASE_2 = 2
____exports.DogmaVariant[____exports.DogmaVariant.ANGEL_PHASE_2] = "ANGEL_PHASE_2"
____exports.DogmaVariant.ANGEL_BABY_UNUSED = 10
____exports.DogmaVariant[____exports.DogmaVariant.ANGEL_BABY_UNUSED] = "ANGEL_BABY_UNUSED"
--- For `EntityType.BEAST` (951).
____exports.BeastVariant = {}
____exports.BeastVariant.BEAST = 0
____exports.BeastVariant[____exports.BeastVariant.BEAST] = "BEAST"
____exports.BeastVariant.STALACTITE = 1
____exports.BeastVariant[____exports.BeastVariant.STALACTITE] = "STALACTITE"
____exports.BeastVariant.ROCK_PROJECTILE = 2
____exports.BeastVariant[____exports.BeastVariant.ROCK_PROJECTILE] = "ROCK_PROJECTILE"
____exports.BeastVariant.SOUL = 3
____exports.BeastVariant[____exports.BeastVariant.SOUL] = "SOUL"
____exports.BeastVariant.ULTRA_FAMINE = 10
____exports.BeastVariant[____exports.BeastVariant.ULTRA_FAMINE] = "ULTRA_FAMINE"
____exports.BeastVariant.ULTRA_FAMINE_FLY = 11
____exports.BeastVariant[____exports.BeastVariant.ULTRA_FAMINE_FLY] = "ULTRA_FAMINE_FLY"
____exports.BeastVariant.ULTRA_PESTILENCE = 20
____exports.BeastVariant[____exports.BeastVariant.ULTRA_PESTILENCE] = "ULTRA_PESTILENCE"
____exports.BeastVariant.ULTRA_PESTILENCE_FLY = 21
____exports.BeastVariant[____exports.BeastVariant.ULTRA_PESTILENCE_FLY] = "ULTRA_PESTILENCE_FLY"
____exports.BeastVariant.ULTRA_PESTILENCE_MAGGOT = 22
____exports.BeastVariant[____exports.BeastVariant.ULTRA_PESTILENCE_MAGGOT] = "ULTRA_PESTILENCE_MAGGOT"
____exports.BeastVariant.ULTRA_PESTILENCE_FLY_BALL = 23
____exports.BeastVariant[____exports.BeastVariant.ULTRA_PESTILENCE_FLY_BALL] = "ULTRA_PESTILENCE_FLY_BALL"
____exports.BeastVariant.ULTRA_WAR = 30
____exports.BeastVariant[____exports.BeastVariant.ULTRA_WAR] = "ULTRA_WAR"
____exports.BeastVariant.ULTRA_WAR_BOMB = 31
____exports.BeastVariant[____exports.BeastVariant.ULTRA_WAR_BOMB] = "ULTRA_WAR_BOMB"
____exports.BeastVariant.ULTRA_DEATH = 40
____exports.BeastVariant[____exports.BeastVariant.ULTRA_DEATH] = "ULTRA_DEATH"
____exports.BeastVariant.ULTRA_DEATH_SCYTHE = 41
____exports.BeastVariant[____exports.BeastVariant.ULTRA_DEATH_SCYTHE] = "ULTRA_DEATH_SCYTHE"
____exports.BeastVariant.ULTRA_DEATH_HEAD = 42
____exports.BeastVariant[____exports.BeastVariant.ULTRA_DEATH_HEAD] = "ULTRA_DEATH_HEAD"
____exports.BeastVariant.BACKGROUND_BEAST = 100
____exports.BeastVariant[____exports.BeastVariant.BACKGROUND_BEAST] = "BACKGROUND_BEAST"
____exports.BeastVariant.BACKGROUND_FAMINE = 101
____exports.BeastVariant[____exports.BeastVariant.BACKGROUND_FAMINE] = "BACKGROUND_FAMINE"
____exports.BeastVariant.BACKGROUND_PESTILENCE = 102
____exports.BeastVariant[____exports.BeastVariant.BACKGROUND_PESTILENCE] = "BACKGROUND_PESTILENCE"
____exports.BeastVariant.BACKGROUND_WAR = 103
____exports.BeastVariant[____exports.BeastVariant.BACKGROUND_WAR] = "BACKGROUND_WAR"
____exports.BeastVariant.BACKGROUND_DEATH = 104
____exports.BeastVariant[____exports.BeastVariant.BACKGROUND_DEATH] = "BACKGROUND_DEATH"
--- For `EntityType.GENERIC_PROP` (960).
____exports.GenericPropVariant = {}
____exports.GenericPropVariant.GENERIC_PROP = 0
____exports.GenericPropVariant[____exports.GenericPropVariant.GENERIC_PROP] = "GENERIC_PROP"
____exports.GenericPropVariant.MOMS_DRESSER = 1
____exports.GenericPropVariant[____exports.GenericPropVariant.MOMS_DRESSER] = "MOMS_DRESSER"
____exports.GenericPropVariant.MOMS_VANITY = 2
____exports.GenericPropVariant[____exports.GenericPropVariant.MOMS_VANITY] = "MOMS_VANITY"
____exports.GenericPropVariant.COUCH = 3
____exports.GenericPropVariant[____exports.GenericPropVariant.COUCH] = "COUCH"
____exports.GenericPropVariant.TV = 4
____exports.GenericPropVariant[____exports.GenericPropVariant.TV] = "TV"
--- For `EntityType.EFFECT` (1000).
____exports.EffectVariant = {}
____exports.EffectVariant.EFFECT_NULL = 0
____exports.EffectVariant[____exports.EffectVariant.EFFECT_NULL] = "EFFECT_NULL"
____exports.EffectVariant.BOMB_EXPLOSION = 1
____exports.EffectVariant[____exports.EffectVariant.BOMB_EXPLOSION] = "BOMB_EXPLOSION"
____exports.EffectVariant.BLOOD_EXPLOSION = 2
____exports.EffectVariant[____exports.EffectVariant.BLOOD_EXPLOSION] = "BLOOD_EXPLOSION"
____exports.EffectVariant.FLY_EXPLOSION = 3
____exports.EffectVariant[____exports.EffectVariant.FLY_EXPLOSION] = "FLY_EXPLOSION"
____exports.EffectVariant.ROCK_PARTICLE = 4
____exports.EffectVariant[____exports.EffectVariant.ROCK_PARTICLE] = "ROCK_PARTICLE"
____exports.EffectVariant.BLOOD_PARTICLE = 5
____exports.EffectVariant[____exports.EffectVariant.BLOOD_PARTICLE] = "BLOOD_PARTICLE"
____exports.EffectVariant.DEVIL = 6
____exports.EffectVariant[____exports.EffectVariant.DEVIL] = "DEVIL"
____exports.EffectVariant.BLOOD_SPLAT = 7
____exports.EffectVariant[____exports.EffectVariant.BLOOD_SPLAT] = "BLOOD_SPLAT"
____exports.EffectVariant.LADDER = 8
____exports.EffectVariant[____exports.EffectVariant.LADDER] = "LADDER"
____exports.EffectVariant.ANGEL = 9
____exports.EffectVariant[____exports.EffectVariant.ANGEL] = "ANGEL"
____exports.EffectVariant.BLUE_FLAME = 10
____exports.EffectVariant[____exports.EffectVariant.BLUE_FLAME] = "BLUE_FLAME"
____exports.EffectVariant.BULLET_POOF = 11
____exports.EffectVariant[____exports.EffectVariant.BULLET_POOF] = "BULLET_POOF"
____exports.EffectVariant.TEAR_POOF_A = 12
____exports.EffectVariant[____exports.EffectVariant.TEAR_POOF_A] = "TEAR_POOF_A"
____exports.EffectVariant.TEAR_POOF_B = 13
____exports.EffectVariant[____exports.EffectVariant.TEAR_POOF_B] = "TEAR_POOF_B"
____exports.EffectVariant.RIPPLE_POOF = 14
____exports.EffectVariant[____exports.EffectVariant.RIPPLE_POOF] = "RIPPLE_POOF"
____exports.EffectVariant.POOF_1 = 15
____exports.EffectVariant[____exports.EffectVariant.POOF_1] = "POOF_1"
____exports.EffectVariant.POOF_2 = 16
____exports.EffectVariant[____exports.EffectVariant.POOF_2] = "POOF_2"
____exports.EffectVariant.POOF_4 = 17
____exports.EffectVariant[____exports.EffectVariant.POOF_4] = "POOF_4"
____exports.EffectVariant.BOMB_CRATER = 18
____exports.EffectVariant[____exports.EffectVariant.BOMB_CRATER] = "BOMB_CRATER"
____exports.EffectVariant.CRACK_THE_SKY = 19
____exports.EffectVariant[____exports.EffectVariant.CRACK_THE_SKY] = "CRACK_THE_SKY"
____exports.EffectVariant.SCYTHE_BREAK = 20
____exports.EffectVariant[____exports.EffectVariant.SCYTHE_BREAK] = "SCYTHE_BREAK"
____exports.EffectVariant.TINY_BUG = 21
____exports.EffectVariant[____exports.EffectVariant.TINY_BUG] = "TINY_BUG"
____exports.EffectVariant.CREEP_RED = 22
____exports.EffectVariant[____exports.EffectVariant.CREEP_RED] = "CREEP_RED"
____exports.EffectVariant.CREEP_GREEN = 23
____exports.EffectVariant[____exports.EffectVariant.CREEP_GREEN] = "CREEP_GREEN"
____exports.EffectVariant.CREEP_YELLOW = 24
____exports.EffectVariant[____exports.EffectVariant.CREEP_YELLOW] = "CREEP_YELLOW"
____exports.EffectVariant.CREEP_WHITE = 25
____exports.EffectVariant[____exports.EffectVariant.CREEP_WHITE] = "CREEP_WHITE"
____exports.EffectVariant.CREEP_BLACK = 26
____exports.EffectVariant[____exports.EffectVariant.CREEP_BLACK] = "CREEP_BLACK"
____exports.EffectVariant.WOOD_PARTICLE = 27
____exports.EffectVariant[____exports.EffectVariant.WOOD_PARTICLE] = "WOOD_PARTICLE"
____exports.EffectVariant.MONSTROS_TOOTH = 28
____exports.EffectVariant[____exports.EffectVariant.MONSTROS_TOOTH] = "MONSTROS_TOOTH"
____exports.EffectVariant.MOM_FOOT_STOMP = 29
____exports.EffectVariant[____exports.EffectVariant.MOM_FOOT_STOMP] = "MOM_FOOT_STOMP"
____exports.EffectVariant.TARGET = 30
____exports.EffectVariant[____exports.EffectVariant.TARGET] = "TARGET"
____exports.EffectVariant.ROCKET = 31
____exports.EffectVariant[____exports.EffectVariant.ROCKET] = "ROCKET"
____exports.EffectVariant.PLAYER_CREEP_LEMON_MISHAP = 32
____exports.EffectVariant[____exports.EffectVariant.PLAYER_CREEP_LEMON_MISHAP] = "PLAYER_CREEP_LEMON_MISHAP"
____exports.EffectVariant.TINY_FLY = 33
____exports.EffectVariant[____exports.EffectVariant.TINY_FLY] = "TINY_FLY"
____exports.EffectVariant.FART = 34
____exports.EffectVariant[____exports.EffectVariant.FART] = "FART"
____exports.EffectVariant.TOOTH_PARTICLE = 35
____exports.EffectVariant[____exports.EffectVariant.TOOTH_PARTICLE] = "TOOTH_PARTICLE"
____exports.EffectVariant.XRAY_WALL = 36
____exports.EffectVariant[____exports.EffectVariant.XRAY_WALL] = "XRAY_WALL"
____exports.EffectVariant.PLAYER_CREEP_HOLY_WATER = 37
____exports.EffectVariant[____exports.EffectVariant.PLAYER_CREEP_HOLY_WATER] = "PLAYER_CREEP_HOLY_WATER"
____exports.EffectVariant.SPIDER_EXPLOSION = 38
____exports.EffectVariant[____exports.EffectVariant.SPIDER_EXPLOSION] = "SPIDER_EXPLOSION"
____exports.EffectVariant.HEAVEN_LIGHT_DOOR = 39
____exports.EffectVariant[____exports.EffectVariant.HEAVEN_LIGHT_DOOR] = "HEAVEN_LIGHT_DOOR"
____exports.EffectVariant.STAR_FLASH = 40
____exports.EffectVariant[____exports.EffectVariant.STAR_FLASH] = "STAR_FLASH"
____exports.EffectVariant.WATER_DROPLET = 41
____exports.EffectVariant[____exports.EffectVariant.WATER_DROPLET] = "WATER_DROPLET"
____exports.EffectVariant.BLOOD_GUSH = 42
____exports.EffectVariant[____exports.EffectVariant.BLOOD_GUSH] = "BLOOD_GUSH"
____exports.EffectVariant.POOP_EXPLOSION = 43
____exports.EffectVariant[____exports.EffectVariant.POOP_EXPLOSION] = "POOP_EXPLOSION"
____exports.EffectVariant.PLAYER_CREEP_WHITE = 44
____exports.EffectVariant[____exports.EffectVariant.PLAYER_CREEP_WHITE] = "PLAYER_CREEP_WHITE"
____exports.EffectVariant.PLAYER_CREEP_BLACK = 45
____exports.EffectVariant[____exports.EffectVariant.PLAYER_CREEP_BLACK] = "PLAYER_CREEP_BLACK"
____exports.EffectVariant.PLAYER_CREEP_RED = 46
____exports.EffectVariant[____exports.EffectVariant.PLAYER_CREEP_RED] = "PLAYER_CREEP_RED"
____exports.EffectVariant.TRINITY_SHIELD = 47
____exports.EffectVariant[____exports.EffectVariant.TRINITY_SHIELD] = "TRINITY_SHIELD"
____exports.EffectVariant.BATTERY = 48
____exports.EffectVariant[____exports.EffectVariant.BATTERY] = "BATTERY"
____exports.EffectVariant.HEART = 49
____exports.EffectVariant[____exports.EffectVariant.HEART] = "HEART"
____exports.EffectVariant.LASER_IMPACT = 50
____exports.EffectVariant[____exports.EffectVariant.LASER_IMPACT] = "LASER_IMPACT"
____exports.EffectVariant.HOT_BOMB_FIRE = 51
____exports.EffectVariant[____exports.EffectVariant.HOT_BOMB_FIRE] = "HOT_BOMB_FIRE"
____exports.EffectVariant.RED_CANDLE_FLAME = 52
____exports.EffectVariant[____exports.EffectVariant.RED_CANDLE_FLAME] = "RED_CANDLE_FLAME"
____exports.EffectVariant.PLAYER_CREEP_GREEN = 53
____exports.EffectVariant[____exports.EffectVariant.PLAYER_CREEP_GREEN] = "PLAYER_CREEP_GREEN"
____exports.EffectVariant.PLAYER_CREEP_HOLY_WATER_TRAIL = 54
____exports.EffectVariant[____exports.EffectVariant.PLAYER_CREEP_HOLY_WATER_TRAIL] = "PLAYER_CREEP_HOLY_WATER_TRAIL"
____exports.EffectVariant.SPIKE = 55
____exports.EffectVariant[____exports.EffectVariant.SPIKE] = "SPIKE"
____exports.EffectVariant.CREEP_BROWN = 56
____exports.EffectVariant[____exports.EffectVariant.CREEP_BROWN] = "CREEP_BROWN"
____exports.EffectVariant.PULLING_EFFECT = 57
____exports.EffectVariant[____exports.EffectVariant.PULLING_EFFECT] = "PULLING_EFFECT"
____exports.EffectVariant.POOP_PARTICLE = 58
____exports.EffectVariant[____exports.EffectVariant.POOP_PARTICLE] = "POOP_PARTICLE"
____exports.EffectVariant.DUST_CLOUD = 59
____exports.EffectVariant[____exports.EffectVariant.DUST_CLOUD] = "DUST_CLOUD"
____exports.EffectVariant.BOOMERANG = 60
____exports.EffectVariant[____exports.EffectVariant.BOOMERANG] = "BOOMERANG"
____exports.EffectVariant.SHOCKWAVE = 61
____exports.EffectVariant[____exports.EffectVariant.SHOCKWAVE] = "SHOCKWAVE"
____exports.EffectVariant.ROCK_EXPLOSION = 62
____exports.EffectVariant[____exports.EffectVariant.ROCK_EXPLOSION] = "ROCK_EXPLOSION"
____exports.EffectVariant.WORM = 63
____exports.EffectVariant[____exports.EffectVariant.WORM] = "WORM"
____exports.EffectVariant.BEETLE = 64
____exports.EffectVariant[____exports.EffectVariant.BEETLE] = "BEETLE"
____exports.EffectVariant.WISP = 65
____exports.EffectVariant[____exports.EffectVariant.WISP] = "WISP"
____exports.EffectVariant.EMBER_PARTICLE = 66
____exports.EffectVariant[____exports.EffectVariant.EMBER_PARTICLE] = "EMBER_PARTICLE"
____exports.EffectVariant.SHOCKWAVE_DIRECTIONAL = 67
____exports.EffectVariant[____exports.EffectVariant.SHOCKWAVE_DIRECTIONAL] = "SHOCKWAVE_DIRECTIONAL"
____exports.EffectVariant.WALL_BUG = 68
____exports.EffectVariant[____exports.EffectVariant.WALL_BUG] = "WALL_BUG"
____exports.EffectVariant.BUTTERFLY = 69
____exports.EffectVariant[____exports.EffectVariant.BUTTERFLY] = "BUTTERFLY"
____exports.EffectVariant.BLOOD_DROP = 70
____exports.EffectVariant[____exports.EffectVariant.BLOOD_DROP] = "BLOOD_DROP"
____exports.EffectVariant.BRIMSTONE_SWIRL = 71
____exports.EffectVariant[____exports.EffectVariant.BRIMSTONE_SWIRL] = "BRIMSTONE_SWIRL"
____exports.EffectVariant.CRACK_WAVE = 72
____exports.EffectVariant[____exports.EffectVariant.CRACK_WAVE] = "CRACK_WAVE"
____exports.EffectVariant.SHOCKWAVE_RANDOM = 73
____exports.EffectVariant[____exports.EffectVariant.SHOCKWAVE_RANDOM] = "SHOCKWAVE_RANDOM"
____exports.EffectVariant.ISAACS_CARPET = 74
____exports.EffectVariant[____exports.EffectVariant.ISAACS_CARPET] = "ISAACS_CARPET"
____exports.EffectVariant.BAR_PARTICLE = 75
____exports.EffectVariant[____exports.EffectVariant.BAR_PARTICLE] = "BAR_PARTICLE"
____exports.EffectVariant.DICE_FLOOR = 76
____exports.EffectVariant[____exports.EffectVariant.DICE_FLOOR] = "DICE_FLOOR"
____exports.EffectVariant.LARGE_BLOOD_EXPLOSION = 77
____exports.EffectVariant[____exports.EffectVariant.LARGE_BLOOD_EXPLOSION] = "LARGE_BLOOD_EXPLOSION"
____exports.EffectVariant.PLAYER_CREEP_LEMON_PARTY = 78
____exports.EffectVariant[____exports.EffectVariant.PLAYER_CREEP_LEMON_PARTY] = "PLAYER_CREEP_LEMON_PARTY"
____exports.EffectVariant.TEAR_POOF_SMALL = 79
____exports.EffectVariant[____exports.EffectVariant.TEAR_POOF_SMALL] = "TEAR_POOF_SMALL"
____exports.EffectVariant.TEAR_POOF_VERY_SMALL = 80
____exports.EffectVariant[____exports.EffectVariant.TEAR_POOF_VERY_SMALL] = "TEAR_POOF_VERY_SMALL"
____exports.EffectVariant.FRIEND_BALL = 81
____exports.EffectVariant[____exports.EffectVariant.FRIEND_BALL] = "FRIEND_BALL"
____exports.EffectVariant.WOMB_TELEPORT = 82
____exports.EffectVariant[____exports.EffectVariant.WOMB_TELEPORT] = "WOMB_TELEPORT"
____exports.EffectVariant.SPEAR_OF_DESTINY = 83
____exports.EffectVariant[____exports.EffectVariant.SPEAR_OF_DESTINY] = "SPEAR_OF_DESTINY"
____exports.EffectVariant.EVIL_EYE = 84
____exports.EffectVariant[____exports.EffectVariant.EVIL_EYE] = "EVIL_EYE"
____exports.EffectVariant.DIAMOND_PARTICLE = 85
____exports.EffectVariant[____exports.EffectVariant.DIAMOND_PARTICLE] = "DIAMOND_PARTICLE"
____exports.EffectVariant.NAIL_PARTICLE = 86
____exports.EffectVariant[____exports.EffectVariant.NAIL_PARTICLE] = "NAIL_PARTICLE"
____exports.EffectVariant.FALLING_EMBER = 87
____exports.EffectVariant[____exports.EffectVariant.FALLING_EMBER] = "FALLING_EMBER"
____exports.EffectVariant.DARK_BALL_SMOKE_PARTICLE = 88
____exports.EffectVariant[____exports.EffectVariant.DARK_BALL_SMOKE_PARTICLE] = "DARK_BALL_SMOKE_PARTICLE"
____exports.EffectVariant.ULTRA_GREED_FOOTPRINT = 89
____exports.EffectVariant[____exports.EffectVariant.ULTRA_GREED_FOOTPRINT] = "ULTRA_GREED_FOOTPRINT"
____exports.EffectVariant.PLAYER_CREEP_PUDDLE_MILK = 90
____exports.EffectVariant[____exports.EffectVariant.PLAYER_CREEP_PUDDLE_MILK] = "PLAYER_CREEP_PUDDLE_MILK"
____exports.EffectVariant.MOMS_HAND = 91
____exports.EffectVariant[____exports.EffectVariant.MOMS_HAND] = "MOMS_HAND"
____exports.EffectVariant.PLAYER_CREEP_BLACK_POWDER = 92
____exports.EffectVariant[____exports.EffectVariant.PLAYER_CREEP_BLACK_POWDER] = "PLAYER_CREEP_BLACK_POWDER"
____exports.EffectVariant.PENTAGRAM_BLACK_POWDER = 93
____exports.EffectVariant[____exports.EffectVariant.PENTAGRAM_BLACK_POWDER] = "PENTAGRAM_BLACK_POWDER"
____exports.EffectVariant.CREEP_SLIPPERY_BROWN = 94
____exports.EffectVariant[____exports.EffectVariant.CREEP_SLIPPERY_BROWN] = "CREEP_SLIPPERY_BROWN"
____exports.EffectVariant.GOLD_PARTICLE = 95
____exports.EffectVariant[____exports.EffectVariant.GOLD_PARTICLE] = "GOLD_PARTICLE"
____exports.EffectVariant.HUSH_LASER = 96
____exports.EffectVariant[____exports.EffectVariant.HUSH_LASER] = "HUSH_LASER"
____exports.EffectVariant.IMPACT = 97
____exports.EffectVariant[____exports.EffectVariant.IMPACT] = "IMPACT"
____exports.EffectVariant.COIN_PARTICLE = 98
____exports.EffectVariant[____exports.EffectVariant.COIN_PARTICLE] = "COIN_PARTICLE"
____exports.EffectVariant.WATER_SPLASH = 99
____exports.EffectVariant[____exports.EffectVariant.WATER_SPLASH] = "WATER_SPLASH"
____exports.EffectVariant.HUSH_ASHES = 100
____exports.EffectVariant[____exports.EffectVariant.HUSH_ASHES] = "HUSH_ASHES"
____exports.EffectVariant.HUSH_LASER_UP = 101
____exports.EffectVariant[____exports.EffectVariant.HUSH_LASER_UP] = "HUSH_LASER_UP"
____exports.EffectVariant.BULLET_POOF_HUSH = 102
____exports.EffectVariant[____exports.EffectVariant.BULLET_POOF_HUSH] = "BULLET_POOF_HUSH"
____exports.EffectVariant.ULTRA_GREED_BLING = 103
____exports.EffectVariant[____exports.EffectVariant.ULTRA_GREED_BLING] = "ULTRA_GREED_BLING"
____exports.EffectVariant.FIREWORKS = 104
____exports.EffectVariant[____exports.EffectVariant.FIREWORKS] = "FIREWORKS"
____exports.EffectVariant.BROWN_CLOUD = 105
____exports.EffectVariant[____exports.EffectVariant.BROWN_CLOUD] = "BROWN_CLOUD"
____exports.EffectVariant.FART_RING = 106
____exports.EffectVariant[____exports.EffectVariant.FART_RING] = "FART_RING"
____exports.EffectVariant.BLACK_HOLE = 107
____exports.EffectVariant[____exports.EffectVariant.BLACK_HOLE] = "BLACK_HOLE"
____exports.EffectVariant.MR_ME = 108
____exports.EffectVariant[____exports.EffectVariant.MR_ME] = "MR_ME"
____exports.EffectVariant.DEATH_SKULL = 109
____exports.EffectVariant[____exports.EffectVariant.DEATH_SKULL] = "DEATH_SKULL"
____exports.EffectVariant.ENEMY_BRIMSTONE_SWIRL = 110
____exports.EffectVariant[____exports.EffectVariant.ENEMY_BRIMSTONE_SWIRL] = "ENEMY_BRIMSTONE_SWIRL"
____exports.EffectVariant.HAEMO_TRAIL = 111
____exports.EffectVariant[____exports.EffectVariant.HAEMO_TRAIL] = "HAEMO_TRAIL"
____exports.EffectVariant.HALLOWED_GROUND = 112
____exports.EffectVariant[____exports.EffectVariant.HALLOWED_GROUND] = "HALLOWED_GROUND"
____exports.EffectVariant.BRIMSTONE_BALL = 113
____exports.EffectVariant[____exports.EffectVariant.BRIMSTONE_BALL] = "BRIMSTONE_BALL"
____exports.EffectVariant.FORGOTTEN_CHAIN = 114
____exports.EffectVariant[____exports.EffectVariant.FORGOTTEN_CHAIN] = "FORGOTTEN_CHAIN"
____exports.EffectVariant.BROKEN_SHOVEL_SHADOW = 115
____exports.EffectVariant[____exports.EffectVariant.BROKEN_SHOVEL_SHADOW] = "BROKEN_SHOVEL_SHADOW"
____exports.EffectVariant.DIRT_PATCH = 116
____exports.EffectVariant[____exports.EffectVariant.DIRT_PATCH] = "DIRT_PATCH"
____exports.EffectVariant.FORGOTTEN_SOUL = 117
____exports.EffectVariant[____exports.EffectVariant.FORGOTTEN_SOUL] = "FORGOTTEN_SOUL"
____exports.EffectVariant.SMALL_ROCKET = 118
____exports.EffectVariant[____exports.EffectVariant.SMALL_ROCKET] = "SMALL_ROCKET"
____exports.EffectVariant.TIMER = 119
____exports.EffectVariant[____exports.EffectVariant.TIMER] = "TIMER"
____exports.EffectVariant.SPAWNER = 120
____exports.EffectVariant[____exports.EffectVariant.SPAWNER] = "SPAWNER"
____exports.EffectVariant.LIGHT = 121
____exports.EffectVariant[____exports.EffectVariant.LIGHT] = "LIGHT"
____exports.EffectVariant.BIG_HORN_HOLE_HELPER = 122
____exports.EffectVariant[____exports.EffectVariant.BIG_HORN_HOLE_HELPER] = "BIG_HORN_HOLE_HELPER"
____exports.EffectVariant.HALO = 123
____exports.EffectVariant[____exports.EffectVariant.HALO] = "HALO"
____exports.EffectVariant.TAR_BUBBLE = 124
____exports.EffectVariant[____exports.EffectVariant.TAR_BUBBLE] = "TAR_BUBBLE"
____exports.EffectVariant.BIG_HORN_HAND = 125
____exports.EffectVariant[____exports.EffectVariant.BIG_HORN_HAND] = "BIG_HORN_HAND"
____exports.EffectVariant.TECH_DOT = 126
____exports.EffectVariant[____exports.EffectVariant.TECH_DOT] = "TECH_DOT"
____exports.EffectVariant.MAMA_MEGA_EXPLOSION = 127
____exports.EffectVariant[____exports.EffectVariant.MAMA_MEGA_EXPLOSION] = "MAMA_MEGA_EXPLOSION"
____exports.EffectVariant.OPTION_LINE = 128
____exports.EffectVariant[____exports.EffectVariant.OPTION_LINE] = "OPTION_LINE"
____exports.EffectVariant.LEECH_EXPLOSION = 130
____exports.EffectVariant[____exports.EffectVariant.LEECH_EXPLOSION] = "LEECH_EXPLOSION"
____exports.EffectVariant.MAGGOT_EXPLOSION = 131
____exports.EffectVariant[____exports.EffectVariant.MAGGOT_EXPLOSION] = "MAGGOT_EXPLOSION"
____exports.EffectVariant.BIG_SPLASH = 132
____exports.EffectVariant[____exports.EffectVariant.BIG_SPLASH] = "BIG_SPLASH"
____exports.EffectVariant.WATER_RIPPLE = 133
____exports.EffectVariant[____exports.EffectVariant.WATER_RIPPLE] = "WATER_RIPPLE"
____exports.EffectVariant.PEDESTAL_RIPPLE = 134
____exports.EffectVariant[____exports.EffectVariant.PEDESTAL_RIPPLE] = "PEDESTAL_RIPPLE"
____exports.EffectVariant.RAIN_DROP = 135
____exports.EffectVariant[____exports.EffectVariant.RAIN_DROP] = "RAIN_DROP"
____exports.EffectVariant.GRID_ENTITY_PROJECTILE_HELPER = 136
____exports.EffectVariant[____exports.EffectVariant.GRID_ENTITY_PROJECTILE_HELPER] = "GRID_ENTITY_PROJECTILE_HELPER"
____exports.EffectVariant.WORMWOOD_HOLE = 137
____exports.EffectVariant[____exports.EffectVariant.WORMWOOD_HOLE] = "WORMWOOD_HOLE"
____exports.EffectVariant.MIST = 138
____exports.EffectVariant[____exports.EffectVariant.MIST] = "MIST"
____exports.EffectVariant.TRAPDOOR_COVER = 139
____exports.EffectVariant[____exports.EffectVariant.TRAPDOOR_COVER] = "TRAPDOOR_COVER"
____exports.EffectVariant.BACKDROP_DECORATION = 140
____exports.EffectVariant[____exports.EffectVariant.BACKDROP_DECORATION] = "BACKDROP_DECORATION"
____exports.EffectVariant.SMOKE_CLOUD = 141
____exports.EffectVariant[____exports.EffectVariant.SMOKE_CLOUD] = "SMOKE_CLOUD"
____exports.EffectVariant.WHIRLPOOL = 142
____exports.EffectVariant[____exports.EffectVariant.WHIRLPOOL] = "WHIRLPOOL"
____exports.EffectVariant.FART_WAVE = 143
____exports.EffectVariant[____exports.EffectVariant.FART_WAVE] = "FART_WAVE"
____exports.EffectVariant.ENEMY_GHOST = 144
____exports.EffectVariant[____exports.EffectVariant.ENEMY_GHOST] = "ENEMY_GHOST"
____exports.EffectVariant.ROCK_POOF = 145
____exports.EffectVariant[____exports.EffectVariant.ROCK_POOF] = "ROCK_POOF"
____exports.EffectVariant.DIRT_PILE = 146
____exports.EffectVariant[____exports.EffectVariant.DIRT_PILE] = "DIRT_PILE"
____exports.EffectVariant.FIRE_JET = 147
____exports.EffectVariant[____exports.EffectVariant.FIRE_JET] = "FIRE_JET"
____exports.EffectVariant.FIRE_WAVE = 148
____exports.EffectVariant[____exports.EffectVariant.FIRE_WAVE] = "FIRE_WAVE"
____exports.EffectVariant.BIG_ROCK_EXPLOSION = 149
____exports.EffectVariant[____exports.EffectVariant.BIG_ROCK_EXPLOSION] = "BIG_ROCK_EXPLOSION"
____exports.EffectVariant.BIG_CRACK_WAVE = 150
____exports.EffectVariant[____exports.EffectVariant.BIG_CRACK_WAVE] = "BIG_CRACK_WAVE"
____exports.EffectVariant.BIG_ATTRACT = 151
____exports.EffectVariant[____exports.EffectVariant.BIG_ATTRACT] = "BIG_ATTRACT"
____exports.EffectVariant.HORNFEL_ROOM_CONTROLLER = 152
____exports.EffectVariant[____exports.EffectVariant.HORNFEL_ROOM_CONTROLLER] = "HORNFEL_ROOM_CONTROLLER"
____exports.EffectVariant.OCCULT_TARGET = 153
____exports.EffectVariant[____exports.EffectVariant.OCCULT_TARGET] = "OCCULT_TARGET"
____exports.EffectVariant.DOOR_OUTLINE = 154
____exports.EffectVariant[____exports.EffectVariant.DOOR_OUTLINE] = "DOOR_OUTLINE"
____exports.EffectVariant.CREEP_SLIPPERY_BROWN_GROWING = 155
____exports.EffectVariant[____exports.EffectVariant.CREEP_SLIPPERY_BROWN_GROWING] = "CREEP_SLIPPERY_BROWN_GROWING"
____exports.EffectVariant.TALL_LADDER = 156
____exports.EffectVariant[____exports.EffectVariant.TALL_LADDER] = "TALL_LADDER"
____exports.EffectVariant.WILLO_SPAWNER = 157
____exports.EffectVariant[____exports.EffectVariant.WILLO_SPAWNER] = "WILLO_SPAWNER"
____exports.EffectVariant.TADPOLE = 158
____exports.EffectVariant[____exports.EffectVariant.TADPOLE] = "TADPOLE"
____exports.EffectVariant.LIL_GHOST = 159
____exports.EffectVariant[____exports.EffectVariant.LIL_GHOST] = "LIL_GHOST"
____exports.EffectVariant.BISHOP_SHIELD = 160
____exports.EffectVariant[____exports.EffectVariant.BISHOP_SHIELD] = "BISHOP_SHIELD"
____exports.EffectVariant.PORTAL_TELEPORT = 161
____exports.EffectVariant[____exports.EffectVariant.PORTAL_TELEPORT] = "PORTAL_TELEPORT"
____exports.EffectVariant.HERETIC_PENTAGRAM = 162
____exports.EffectVariant[____exports.EffectVariant.HERETIC_PENTAGRAM] = "HERETIC_PENTAGRAM"
____exports.EffectVariant.CHAIN_GIB = 163
____exports.EffectVariant[____exports.EffectVariant.CHAIN_GIB] = "CHAIN_GIB"
____exports.EffectVariant.SIREN_RING = 164
____exports.EffectVariant[____exports.EffectVariant.SIREN_RING] = "SIREN_RING"
____exports.EffectVariant.CHARM_EFFECT = 165
____exports.EffectVariant[____exports.EffectVariant.CHARM_EFFECT] = "CHARM_EFFECT"
____exports.EffectVariant.SPRITE_TRAIL = 166
____exports.EffectVariant[____exports.EffectVariant.SPRITE_TRAIL] = "SPRITE_TRAIL"
____exports.EffectVariant.CHAIN_LIGHTNING = 167
____exports.EffectVariant[____exports.EffectVariant.CHAIN_LIGHTNING] = "CHAIN_LIGHTNING"
____exports.EffectVariant.COLOSTOMIA_PUDDLE = 168
____exports.EffectVariant[____exports.EffectVariant.COLOSTOMIA_PUDDLE] = "COLOSTOMIA_PUDDLE"
____exports.EffectVariant.CREEP_STATIC = 169
____exports.EffectVariant[____exports.EffectVariant.CREEP_STATIC] = "CREEP_STATIC"
____exports.EffectVariant.DOGMA_DEBRIS = 170
____exports.EffectVariant[____exports.EffectVariant.DOGMA_DEBRIS] = "DOGMA_DEBRIS"
____exports.EffectVariant.DOGMA_BLACK_HOLE = 171
____exports.EffectVariant[____exports.EffectVariant.DOGMA_BLACK_HOLE] = "DOGMA_BLACK_HOLE"
____exports.EffectVariant.DOGMA_ORB = 172
____exports.EffectVariant[____exports.EffectVariant.DOGMA_ORB] = "DOGMA_ORB"
____exports.EffectVariant.CRACKED_ORB_POOF = 173
____exports.EffectVariant[____exports.EffectVariant.CRACKED_ORB_POOF] = "CRACKED_ORB_POOF"
____exports.EffectVariant.SHOP_SPIKES = 174
____exports.EffectVariant[____exports.EffectVariant.SHOP_SPIKES] = "SHOP_SPIKES"
____exports.EffectVariant.KINETI_BEAM = 175
____exports.EffectVariant[____exports.EffectVariant.KINETI_BEAM] = "KINETI_BEAM"
____exports.EffectVariant.CLEAVER_SLASH = 176
____exports.EffectVariant[____exports.EffectVariant.CLEAVER_SLASH] = "CLEAVER_SLASH"
____exports.EffectVariant.REVERSE_EXPLOSION = 177
____exports.EffectVariant[____exports.EffectVariant.REVERSE_EXPLOSION] = "REVERSE_EXPLOSION"
____exports.EffectVariant.URN_OF_SOULS = 178
____exports.EffectVariant[____exports.EffectVariant.URN_OF_SOULS] = "URN_OF_SOULS"
____exports.EffectVariant.ENEMY_SOUL = 179
____exports.EffectVariant[____exports.EffectVariant.ENEMY_SOUL] = "ENEMY_SOUL"
____exports.EffectVariant.RIFT = 180
____exports.EffectVariant[____exports.EffectVariant.RIFT] = "RIFT"
____exports.EffectVariant.LAVA_SPAWNER = 181
____exports.EffectVariant[____exports.EffectVariant.LAVA_SPAWNER] = "LAVA_SPAWNER"
____exports.EffectVariant.BIG_KNIFE = 182
____exports.EffectVariant[____exports.EffectVariant.BIG_KNIFE] = "BIG_KNIFE"
____exports.EffectVariant.MOTHER_SHOCKWAVE = 183
____exports.EffectVariant[____exports.EffectVariant.MOTHER_SHOCKWAVE] = "MOTHER_SHOCKWAVE"
____exports.EffectVariant.WORM_FRIEND_SNARE = 184
____exports.EffectVariant[____exports.EffectVariant.WORM_FRIEND_SNARE] = "WORM_FRIEND_SNARE"
____exports.EffectVariant.REDEMPTION = 185
____exports.EffectVariant[____exports.EffectVariant.REDEMPTION] = "REDEMPTION"
____exports.EffectVariant.HUNGRY_SOUL = 186
____exports.EffectVariant[____exports.EffectVariant.HUNGRY_SOUL] = "HUNGRY_SOUL"
____exports.EffectVariant.EXPLOSION_WAVE = 187
____exports.EffectVariant[____exports.EffectVariant.EXPLOSION_WAVE] = "EXPLOSION_WAVE"
____exports.EffectVariant.DIVINE_INTERVENTION = 188
____exports.EffectVariant[____exports.EffectVariant.DIVINE_INTERVENTION] = "DIVINE_INTERVENTION"
____exports.EffectVariant.PURGATORY = 189
____exports.EffectVariant[____exports.EffectVariant.PURGATORY] = "PURGATORY"
____exports.EffectVariant.MOTHER_TRACER = 190
____exports.EffectVariant[____exports.EffectVariant.MOTHER_TRACER] = "MOTHER_TRACER"
____exports.EffectVariant.PICKUP_GHOST = 191
____exports.EffectVariant[____exports.EffectVariant.PICKUP_GHOST] = "PICKUP_GHOST"
____exports.EffectVariant.FISSURE_SPAWNER = 192
____exports.EffectVariant[____exports.EffectVariant.FISSURE_SPAWNER] = "FISSURE_SPAWNER"
____exports.EffectVariant.ANIMA_CHAIN = 193
____exports.EffectVariant[____exports.EffectVariant.ANIMA_CHAIN] = "ANIMA_CHAIN"
____exports.EffectVariant.DARK_SNARE = 194
____exports.EffectVariant[____exports.EffectVariant.DARK_SNARE] = "DARK_SNARE"
____exports.EffectVariant.CREEP_LIQUID_POOP = 195
____exports.EffectVariant[____exports.EffectVariant.CREEP_LIQUID_POOP] = "CREEP_LIQUID_POOP"
____exports.EffectVariant.GROUND_GLOW = 196
____exports.EffectVariant[____exports.EffectVariant.GROUND_GLOW] = "GROUND_GLOW"
____exports.EffectVariant.DEAD_BIRD = 197
____exports.EffectVariant[____exports.EffectVariant.DEAD_BIRD] = "DEAD_BIRD"
____exports.EffectVariant.GENERIC_TRACER = 198
____exports.EffectVariant[____exports.EffectVariant.GENERIC_TRACER] = "GENERIC_TRACER"
____exports.EffectVariant.ULTRA_DEATH_SCYTHE = 199
____exports.EffectVariant[____exports.EffectVariant.ULTRA_DEATH_SCYTHE] = "ULTRA_DEATH_SCYTHE"
return ____exports
 end,
["lua_modules.isaac-typescript-definitions.dist.src.enums.Controller"] = function(...) 
local ____exports = {}
--- These enums loop after 31, so 32 = D_PAD_LEFT, 63 = D_PAD_LEFT, and so on.
-- 
-- There appears to be no input key for joystick movement.
____exports.Controller = {}
____exports.Controller.D_PAD_LEFT = 0
____exports.Controller[____exports.Controller.D_PAD_LEFT] = "D_PAD_LEFT"
____exports.Controller.D_PAD_RIGHT = 1
____exports.Controller[____exports.Controller.D_PAD_RIGHT] = "D_PAD_RIGHT"
____exports.Controller.D_PAD_UP = 2
____exports.Controller[____exports.Controller.D_PAD_UP] = "D_PAD_UP"
____exports.Controller.D_PAD_DOWN = 3
____exports.Controller[____exports.Controller.D_PAD_DOWN] = "D_PAD_DOWN"
____exports.Controller.BUTTON_A = 4
____exports.Controller[____exports.Controller.BUTTON_A] = "BUTTON_A"
____exports.Controller.BUTTON_B = 5
____exports.Controller[____exports.Controller.BUTTON_B] = "BUTTON_B"
____exports.Controller.BUTTON_X = 6
____exports.Controller[____exports.Controller.BUTTON_X] = "BUTTON_X"
____exports.Controller.BUTTON_Y = 7
____exports.Controller[____exports.Controller.BUTTON_Y] = "BUTTON_Y"
____exports.Controller.BUMPER_LEFT = 8
____exports.Controller[____exports.Controller.BUMPER_LEFT] = "BUMPER_LEFT"
____exports.Controller.TRIGGER_LEFT = 9
____exports.Controller[____exports.Controller.TRIGGER_LEFT] = "TRIGGER_LEFT"
____exports.Controller.STICK_LEFT = 10
____exports.Controller[____exports.Controller.STICK_LEFT] = "STICK_LEFT"
____exports.Controller.BUMPER_RIGHT = 11
____exports.Controller[____exports.Controller.BUMPER_RIGHT] = "BUMPER_RIGHT"
____exports.Controller.TRIGGER_RIGHT = 12
____exports.Controller[____exports.Controller.TRIGGER_RIGHT] = "TRIGGER_RIGHT"
____exports.Controller.STICK_RIGHT = 13
____exports.Controller[____exports.Controller.STICK_RIGHT] = "STICK_RIGHT"
____exports.Controller.BUTTON_BACK = 14
____exports.Controller[____exports.Controller.BUTTON_BACK] = "BUTTON_BACK"
____exports.Controller.BUTTON_START = 15
____exports.Controller[____exports.Controller.BUTTON_START] = "BUTTON_START"
return ____exports
 end,
["lua_modules.isaac-typescript-definitions.dist.src.enums.ControllerIndex"] = function(...) 
local ____exports = {}
____exports.ControllerIndex = {}
____exports.ControllerIndex.KEYBOARD = 0
____exports.ControllerIndex[____exports.ControllerIndex.KEYBOARD] = "KEYBOARD"
____exports.ControllerIndex.CONTROLLER_1 = 1
____exports.ControllerIndex[____exports.ControllerIndex.CONTROLLER_1] = "CONTROLLER_1"
____exports.ControllerIndex.CONTROLLER_2 = 2
____exports.ControllerIndex[____exports.ControllerIndex.CONTROLLER_2] = "CONTROLLER_2"
____exports.ControllerIndex.CONTROLLER_3 = 3
____exports.ControllerIndex[____exports.ControllerIndex.CONTROLLER_3] = "CONTROLLER_3"
return ____exports
 end,
["lua_modules.isaac-typescript-definitions.dist.src.enums.CopyableIsaacAPIClassType"] = function(...) 
local ____exports = {}
--- An enum containing the Isaac API classes that can be safely copied / serialized.
____exports.CopyableIsaacAPIClassType = {}
____exports.CopyableIsaacAPIClassType.BIT_SET_128 = "BitSet128"
____exports.CopyableIsaacAPIClassType.COLOR = "Color"
____exports.CopyableIsaacAPIClassType.K_COLOR = "KColor"
____exports.CopyableIsaacAPIClassType.RNG = "RNG"
____exports.CopyableIsaacAPIClassType.VECTOR = "Vector"
return ____exports
 end,
["lua_modules.isaac-typescript-definitions.dist.src.enums.CurseID"] = function(...) 
local ____exports = {}
--- Matches the "id" field in the "resources/curses.xml" file. This is used to compute the
-- `LevelCurse` enum.
-- 
-- The values of this enum are integers. Do not use this enum to check for the presence of curses;
-- use the `LevelCurse` enum instead, which has bit flag values.
____exports.CurseID = {}
____exports.CurseID.DARKNESS = 1
____exports.CurseID[____exports.CurseID.DARKNESS] = "DARKNESS"
____exports.CurseID.LABYRINTH = 2
____exports.CurseID[____exports.CurseID.LABYRINTH] = "LABYRINTH"
____exports.CurseID.LOST = 3
____exports.CurseID[____exports.CurseID.LOST] = "LOST"
____exports.CurseID.UNKNOWN = 4
____exports.CurseID[____exports.CurseID.UNKNOWN] = "UNKNOWN"
____exports.CurseID.CURSED = 5
____exports.CurseID[____exports.CurseID.CURSED] = "CURSED"
____exports.CurseID.MAZE = 6
____exports.CurseID[____exports.CurseID.MAZE] = "MAZE"
____exports.CurseID.BLIND = 7
____exports.CurseID[____exports.CurseID.BLIND] = "BLIND"
____exports.CurseID.GIANT = 8
____exports.CurseID[____exports.CurseID.GIANT] = "GIANT"
return ____exports
 end,
["lua_modules.isaac-typescript-definitions.dist.src.enums.Difficulty"] = function(...) 
local ____exports = {}
____exports.Difficulty = {}
____exports.Difficulty.NORMAL = 0
____exports.Difficulty[____exports.Difficulty.NORMAL] = "NORMAL"
____exports.Difficulty.HARD = 1
____exports.Difficulty[____exports.Difficulty.HARD] = "HARD"
____exports.Difficulty.GREED = 2
____exports.Difficulty[____exports.Difficulty.GREED] = "GREED"
____exports.Difficulty.GREEDIER = 3
____exports.Difficulty[____exports.Difficulty.GREEDIER] = "GREEDIER"
return ____exports
 end,
["lua_modules.isaac-typescript-definitions.dist.src.enums.Dimension"] = function(...) 
local ____exports = {}
____exports.Dimension = {}
____exports.Dimension.CURRENT = -1
____exports.Dimension[____exports.Dimension.CURRENT] = "CURRENT"
____exports.Dimension.MAIN = 0
____exports.Dimension[____exports.Dimension.MAIN] = "MAIN"
____exports.Dimension.SECONDARY = 1
____exports.Dimension[____exports.Dimension.SECONDARY] = "SECONDARY"
____exports.Dimension.DEATH_CERTIFICATE = 2
____exports.Dimension[____exports.Dimension.DEATH_CERTIFICATE] = "DEATH_CERTIFICATE"
return ____exports
 end,
["lua_modules.isaac-typescript-definitions.dist.src.enums.Direction"] = function(...) 
local ____exports = {}
____exports.Direction = {}
____exports.Direction.NO_DIRECTION = -1
____exports.Direction[____exports.Direction.NO_DIRECTION] = "NO_DIRECTION"
____exports.Direction.LEFT = 0
____exports.Direction[____exports.Direction.LEFT] = "LEFT"
____exports.Direction.UP = 1
____exports.Direction[____exports.Direction.UP] = "UP"
____exports.Direction.RIGHT = 2
____exports.Direction[____exports.Direction.RIGHT] = "RIGHT"
____exports.Direction.DOWN = 3
____exports.Direction[____exports.Direction.DOWN] = "DOWN"
return ____exports
 end,
["lua_modules.isaac-typescript-definitions.dist.src.enums.DoorSlot"] = function(...) 
local ____exports = {}
____exports.DoorSlot = {}
____exports.DoorSlot.NO_DOOR_SLOT = -1
____exports.DoorSlot[____exports.DoorSlot.NO_DOOR_SLOT] = "NO_DOOR_SLOT"
____exports.DoorSlot.LEFT_0 = 0
____exports.DoorSlot[____exports.DoorSlot.LEFT_0] = "LEFT_0"
____exports.DoorSlot.UP_0 = 1
____exports.DoorSlot[____exports.DoorSlot.UP_0] = "UP_0"
____exports.DoorSlot.RIGHT_0 = 2
____exports.DoorSlot[____exports.DoorSlot.RIGHT_0] = "RIGHT_0"
____exports.DoorSlot.DOWN_0 = 3
____exports.DoorSlot[____exports.DoorSlot.DOWN_0] = "DOWN_0"
____exports.DoorSlot.LEFT_1 = 4
____exports.DoorSlot[____exports.DoorSlot.LEFT_1] = "LEFT_1"
____exports.DoorSlot.UP_1 = 5
____exports.DoorSlot[____exports.DoorSlot.UP_1] = "UP_1"
____exports.DoorSlot.RIGHT_1 = 6
____exports.DoorSlot[____exports.DoorSlot.RIGHT_1] = "RIGHT_1"
____exports.DoorSlot.DOWN_1 = 7
____exports.DoorSlot[____exports.DoorSlot.DOWN_1] = "DOWN_1"
return ____exports
 end,
["lua_modules.isaac-typescript-definitions.dist.src.enums.Ending"] = function(...) 
local ____exports = {}
--- Matches the entries in the "cutscenes.xml" file.
____exports.Ending = {}
____exports.Ending.INTRO = 1
____exports.Ending[____exports.Ending.INTRO] = "INTRO"
____exports.Ending.CREDITS = 2
____exports.Ending[____exports.Ending.CREDITS] = "CREDITS"
____exports.Ending.EPILOGUE = 3
____exports.Ending[____exports.Ending.EPILOGUE] = "EPILOGUE"
____exports.Ending.WOMB_EDEN = 4
____exports.Ending[____exports.Ending.WOMB_EDEN] = "WOMB_EDEN"
____exports.Ending.WOMB_RUBBER_CEMENT = 5
____exports.Ending[____exports.Ending.WOMB_RUBBER_CEMENT] = "WOMB_RUBBER_CEMENT"
____exports.Ending.WOMB_NOOSE = 6
____exports.Ending[____exports.Ending.WOMB_NOOSE] = "WOMB_NOOSE"
____exports.Ending.WOMB_WIRE_COAT_HANGER = 7
____exports.Ending[____exports.Ending.WOMB_WIRE_COAT_HANGER] = "WOMB_WIRE_COAT_HANGER"
____exports.Ending.WOMB_EVERYTHING_IS_TERRIBLE = 8
____exports.Ending[____exports.Ending.WOMB_EVERYTHING_IS_TERRIBLE] = "WOMB_EVERYTHING_IS_TERRIBLE"
____exports.Ending.WOMB_IPECAC = 9
____exports.Ending[____exports.Ending.WOMB_IPECAC] = "WOMB_IPECAC"
____exports.Ending.WOMB_EXPERIMENTAL_TREATMENT = 10
____exports.Ending[____exports.Ending.WOMB_EXPERIMENTAL_TREATMENT] = "WOMB_EXPERIMENTAL_TREATMENT"
____exports.Ending.WOMB_A_QUARTER = 11
____exports.Ending[____exports.Ending.WOMB_A_QUARTER] = "WOMB_A_QUARTER"
____exports.Ending.WOMB_DR_FETUS = 12
____exports.Ending[____exports.Ending.WOMB_DR_FETUS] = "WOMB_DR_FETUS"
____exports.Ending.WOMB_BLUE_BABY = 13
____exports.Ending[____exports.Ending.WOMB_BLUE_BABY] = "WOMB_BLUE_BABY"
____exports.Ending.WOMB_IT_LIVES = 14
____exports.Ending[____exports.Ending.WOMB_IT_LIVES] = "WOMB_IT_LIVES"
____exports.Ending.SHEOL = 15
____exports.Ending[____exports.Ending.SHEOL] = "SHEOL"
____exports.Ending.CATHEDRAL = 16
____exports.Ending[____exports.Ending.CATHEDRAL] = "CATHEDRAL"
____exports.Ending.CHEST = 17
____exports.Ending[____exports.Ending.CHEST] = "CHEST"
____exports.Ending.DARK_ROOM = 18
____exports.Ending[____exports.Ending.DARK_ROOM] = "DARK_ROOM"
____exports.Ending.MEGA_SATAN = 19
____exports.Ending[____exports.Ending.MEGA_SATAN] = "MEGA_SATAN"
____exports.Ending.BLUE_WOMB = 20
____exports.Ending[____exports.Ending.BLUE_WOMB] = "BLUE_WOMB"
____exports.Ending.GREED_MODE = 21
____exports.Ending[____exports.Ending.GREED_MODE] = "GREED_MODE"
____exports.Ending.THE_VOID = 22
____exports.Ending[____exports.Ending.THE_VOID] = "THE_VOID"
____exports.Ending.GREEDIER = 23
____exports.Ending[____exports.Ending.GREEDIER] = "GREEDIER"
____exports.Ending.MOTHER = 24
____exports.Ending[____exports.Ending.MOTHER] = "MOTHER"
____exports.Ending.DOGMA = 25
____exports.Ending[____exports.Ending.DOGMA] = "DOGMA"
____exports.Ending.BEAST = 26
____exports.Ending[____exports.Ending.BEAST] = "BEAST"
return ____exports
 end,
["lua_modules.isaac-typescript-definitions.dist.src.enums.EntityCollisionClass"] = function(...) 
local ____exports = {}
____exports.EntityCollisionClass = {}
____exports.EntityCollisionClass.NONE = 0
____exports.EntityCollisionClass[____exports.EntityCollisionClass.NONE] = "NONE"
____exports.EntityCollisionClass.PLAYER_ONLY = 1
____exports.EntityCollisionClass[____exports.EntityCollisionClass.PLAYER_ONLY] = "PLAYER_ONLY"
____exports.EntityCollisionClass.PLAYER_OBJECTS = 2
____exports.EntityCollisionClass[____exports.EntityCollisionClass.PLAYER_OBJECTS] = "PLAYER_OBJECTS"
____exports.EntityCollisionClass.ENEMIES = 3
____exports.EntityCollisionClass[____exports.EntityCollisionClass.ENEMIES] = "ENEMIES"
____exports.EntityCollisionClass.ALL = 4
____exports.EntityCollisionClass[____exports.EntityCollisionClass.ALL] = "ALL"
return ____exports
 end,
["lua_modules.isaac-typescript-definitions.dist.src.enums.EntityGridCollisionClass"] = function(...) 
local ____exports = {}
____exports.EntityGridCollisionClass = {}
____exports.EntityGridCollisionClass.NONE = 0
____exports.EntityGridCollisionClass[____exports.EntityGridCollisionClass.NONE] = "NONE"
____exports.EntityGridCollisionClass.WALLS_X = 1
____exports.EntityGridCollisionClass[____exports.EntityGridCollisionClass.WALLS_X] = "WALLS_X"
____exports.EntityGridCollisionClass.WALLS_Y = 2
____exports.EntityGridCollisionClass[____exports.EntityGridCollisionClass.WALLS_Y] = "WALLS_Y"
____exports.EntityGridCollisionClass.WALLS = 3
____exports.EntityGridCollisionClass[____exports.EntityGridCollisionClass.WALLS] = "WALLS"
____exports.EntityGridCollisionClass.BULLET = 4
____exports.EntityGridCollisionClass[____exports.EntityGridCollisionClass.BULLET] = "BULLET"
____exports.EntityGridCollisionClass.GROUND = 5
____exports.EntityGridCollisionClass[____exports.EntityGridCollisionClass.GROUND] = "GROUND"
____exports.EntityGridCollisionClass.NO_PITS = 6
____exports.EntityGridCollisionClass[____exports.EntityGridCollisionClass.NO_PITS] = "NO_PITS"
____exports.EntityGridCollisionClass.PITS_ONLY = 7
____exports.EntityGridCollisionClass[____exports.EntityGridCollisionClass.PITS_ONLY] = "PITS_ONLY"
return ____exports
 end,
["lua_modules.isaac-typescript-definitions.dist.src.enums.EntityType"] = function(...) 
local ____exports = {}
____exports.EntityType = {}
____exports.EntityType.NULL = 0
____exports.EntityType[____exports.EntityType.NULL] = "NULL"
____exports.EntityType.PLAYER = 1
____exports.EntityType[____exports.EntityType.PLAYER] = "PLAYER"
____exports.EntityType.TEAR = 2
____exports.EntityType[____exports.EntityType.TEAR] = "TEAR"
____exports.EntityType.FAMILIAR = 3
____exports.EntityType[____exports.EntityType.FAMILIAR] = "FAMILIAR"
____exports.EntityType.BOMB = 4
____exports.EntityType[____exports.EntityType.BOMB] = "BOMB"
____exports.EntityType.PICKUP = 5
____exports.EntityType[____exports.EntityType.PICKUP] = "PICKUP"
____exports.EntityType.SLOT = 6
____exports.EntityType[____exports.EntityType.SLOT] = "SLOT"
____exports.EntityType.LASER = 7
____exports.EntityType[____exports.EntityType.LASER] = "LASER"
____exports.EntityType.KNIFE = 8
____exports.EntityType[____exports.EntityType.KNIFE] = "KNIFE"
____exports.EntityType.PROJECTILE = 9
____exports.EntityType[____exports.EntityType.PROJECTILE] = "PROJECTILE"
____exports.EntityType.GAPER = 10
____exports.EntityType[____exports.EntityType.GAPER] = "GAPER"
____exports.EntityType.GUSHER = 11
____exports.EntityType[____exports.EntityType.GUSHER] = "GUSHER"
____exports.EntityType.HORF = 12
____exports.EntityType[____exports.EntityType.HORF] = "HORF"
____exports.EntityType.FLY = 13
____exports.EntityType[____exports.EntityType.FLY] = "FLY"
____exports.EntityType.POOTER = 14
____exports.EntityType[____exports.EntityType.POOTER] = "POOTER"
____exports.EntityType.CLOTTY = 15
____exports.EntityType[____exports.EntityType.CLOTTY] = "CLOTTY"
____exports.EntityType.MULLIGAN = 16
____exports.EntityType[____exports.EntityType.MULLIGAN] = "MULLIGAN"
____exports.EntityType.SHOPKEEPER = 17
____exports.EntityType[____exports.EntityType.SHOPKEEPER] = "SHOPKEEPER"
____exports.EntityType.ATTACK_FLY = 18
____exports.EntityType[____exports.EntityType.ATTACK_FLY] = "ATTACK_FLY"
____exports.EntityType.LARRY_JR = 19
____exports.EntityType[____exports.EntityType.LARRY_JR] = "LARRY_JR"
____exports.EntityType.MONSTRO = 20
____exports.EntityType[____exports.EntityType.MONSTRO] = "MONSTRO"
____exports.EntityType.MAGGOT = 21
____exports.EntityType[____exports.EntityType.MAGGOT] = "MAGGOT"
____exports.EntityType.HIVE = 22
____exports.EntityType[____exports.EntityType.HIVE] = "HIVE"
____exports.EntityType.CHARGER = 23
____exports.EntityType[____exports.EntityType.CHARGER] = "CHARGER"
____exports.EntityType.GLOBIN = 24
____exports.EntityType[____exports.EntityType.GLOBIN] = "GLOBIN"
____exports.EntityType.BOOM_FLY = 25
____exports.EntityType[____exports.EntityType.BOOM_FLY] = "BOOM_FLY"
____exports.EntityType.MAW = 26
____exports.EntityType[____exports.EntityType.MAW] = "MAW"
____exports.EntityType.HOST = 27
____exports.EntityType[____exports.EntityType.HOST] = "HOST"
____exports.EntityType.CHUB = 28
____exports.EntityType[____exports.EntityType.CHUB] = "CHUB"
____exports.EntityType.HOPPER = 29
____exports.EntityType[____exports.EntityType.HOPPER] = "HOPPER"
____exports.EntityType.BOIL = 30
____exports.EntityType[____exports.EntityType.BOIL] = "BOIL"
____exports.EntityType.SPITTY = 31
____exports.EntityType[____exports.EntityType.SPITTY] = "SPITTY"
____exports.EntityType.BRAIN = 32
____exports.EntityType[____exports.EntityType.BRAIN] = "BRAIN"
____exports.EntityType.FIREPLACE = 33
____exports.EntityType[____exports.EntityType.FIREPLACE] = "FIREPLACE"
____exports.EntityType.LEAPER = 34
____exports.EntityType[____exports.EntityType.LEAPER] = "LEAPER"
____exports.EntityType.MR_MAW = 35
____exports.EntityType[____exports.EntityType.MR_MAW] = "MR_MAW"
____exports.EntityType.GURDY = 36
____exports.EntityType[____exports.EntityType.GURDY] = "GURDY"
____exports.EntityType.BABY = 38
____exports.EntityType[____exports.EntityType.BABY] = "BABY"
____exports.EntityType.VIS = 39
____exports.EntityType[____exports.EntityType.VIS] = "VIS"
____exports.EntityType.GUTS = 40
____exports.EntityType[____exports.EntityType.GUTS] = "GUTS"
____exports.EntityType.KNIGHT = 41
____exports.EntityType[____exports.EntityType.KNIGHT] = "KNIGHT"
____exports.EntityType.GRIMACE = 42
____exports.EntityType[____exports.EntityType.GRIMACE] = "GRIMACE"
____exports.EntityType.MONSTRO_2 = 43
____exports.EntityType[____exports.EntityType.MONSTRO_2] = "MONSTRO_2"
____exports.EntityType.POKY = 44
____exports.EntityType[____exports.EntityType.POKY] = "POKY"
____exports.EntityType.MOM = 45
____exports.EntityType[____exports.EntityType.MOM] = "MOM"
____exports.EntityType.SLOTH = 46
____exports.EntityType[____exports.EntityType.SLOTH] = "SLOTH"
____exports.EntityType.LUST = 47
____exports.EntityType[____exports.EntityType.LUST] = "LUST"
____exports.EntityType.WRATH = 48
____exports.EntityType[____exports.EntityType.WRATH] = "WRATH"
____exports.EntityType.GLUTTONY = 49
____exports.EntityType[____exports.EntityType.GLUTTONY] = "GLUTTONY"
____exports.EntityType.GREED = 50
____exports.EntityType[____exports.EntityType.GREED] = "GREED"
____exports.EntityType.ENVY = 51
____exports.EntityType[____exports.EntityType.ENVY] = "ENVY"
____exports.EntityType.PRIDE = 52
____exports.EntityType[____exports.EntityType.PRIDE] = "PRIDE"
____exports.EntityType.DOPLE = 53
____exports.EntityType[____exports.EntityType.DOPLE] = "DOPLE"
____exports.EntityType.FLAMING_HOPPER = 54
____exports.EntityType[____exports.EntityType.FLAMING_HOPPER] = "FLAMING_HOPPER"
____exports.EntityType.LEECH = 55
____exports.EntityType[____exports.EntityType.LEECH] = "LEECH"
____exports.EntityType.LUMP = 56
____exports.EntityType[____exports.EntityType.LUMP] = "LUMP"
____exports.EntityType.MEMBRAIN = 57
____exports.EntityType[____exports.EntityType.MEMBRAIN] = "MEMBRAIN"
____exports.EntityType.PARA_BITE = 58
____exports.EntityType[____exports.EntityType.PARA_BITE] = "PARA_BITE"
____exports.EntityType.FRED = 59
____exports.EntityType[____exports.EntityType.FRED] = "FRED"
____exports.EntityType.EYE = 60
____exports.EntityType[____exports.EntityType.EYE] = "EYE"
____exports.EntityType.SUCKER = 61
____exports.EntityType[____exports.EntityType.SUCKER] = "SUCKER"
____exports.EntityType.PIN = 62
____exports.EntityType[____exports.EntityType.PIN] = "PIN"
____exports.EntityType.FAMINE = 63
____exports.EntityType[____exports.EntityType.FAMINE] = "FAMINE"
____exports.EntityType.PESTILENCE = 64
____exports.EntityType[____exports.EntityType.PESTILENCE] = "PESTILENCE"
____exports.EntityType.WAR = 65
____exports.EntityType[____exports.EntityType.WAR] = "WAR"
____exports.EntityType.DEATH = 66
____exports.EntityType[____exports.EntityType.DEATH] = "DEATH"
____exports.EntityType.DUKE = 67
____exports.EntityType[____exports.EntityType.DUKE] = "DUKE"
____exports.EntityType.PEEP = 68
____exports.EntityType[____exports.EntityType.PEEP] = "PEEP"
____exports.EntityType.LOKI = 69
____exports.EntityType[____exports.EntityType.LOKI] = "LOKI"
____exports.EntityType.FISTULA_BIG = 71
____exports.EntityType[____exports.EntityType.FISTULA_BIG] = "FISTULA_BIG"
____exports.EntityType.FISTULA_MEDIUM = 72
____exports.EntityType[____exports.EntityType.FISTULA_MEDIUM] = "FISTULA_MEDIUM"
____exports.EntityType.FISTULA_SMALL = 73
____exports.EntityType[____exports.EntityType.FISTULA_SMALL] = "FISTULA_SMALL"
____exports.EntityType.BLASTOCYST_BIG = 74
____exports.EntityType[____exports.EntityType.BLASTOCYST_BIG] = "BLASTOCYST_BIG"
____exports.EntityType.BLASTOCYST_MEDIUM = 75
____exports.EntityType[____exports.EntityType.BLASTOCYST_MEDIUM] = "BLASTOCYST_MEDIUM"
____exports.EntityType.BLASTOCYST_SMALL = 76
____exports.EntityType[____exports.EntityType.BLASTOCYST_SMALL] = "BLASTOCYST_SMALL"
____exports.EntityType.EMBRYO = 77
____exports.EntityType[____exports.EntityType.EMBRYO] = "EMBRYO"
____exports.EntityType.MOMS_HEART = 78
____exports.EntityType[____exports.EntityType.MOMS_HEART] = "MOMS_HEART"
____exports.EntityType.GEMINI = 79
____exports.EntityType[____exports.EntityType.GEMINI] = "GEMINI"
____exports.EntityType.MOTER = 80
____exports.EntityType[____exports.EntityType.MOTER] = "MOTER"
____exports.EntityType.FALLEN = 81
____exports.EntityType[____exports.EntityType.FALLEN] = "FALLEN"
____exports.EntityType.HEADLESS_HORSEMAN = 82
____exports.EntityType[____exports.EntityType.HEADLESS_HORSEMAN] = "HEADLESS_HORSEMAN"
____exports.EntityType.HORSEMAN_HEAD = 83
____exports.EntityType[____exports.EntityType.HORSEMAN_HEAD] = "HORSEMAN_HEAD"
____exports.EntityType.SATAN = 84
____exports.EntityType[____exports.EntityType.SATAN] = "SATAN"
____exports.EntityType.SPIDER = 85
____exports.EntityType[____exports.EntityType.SPIDER] = "SPIDER"
____exports.EntityType.KEEPER = 86
____exports.EntityType[____exports.EntityType.KEEPER] = "KEEPER"
____exports.EntityType.GURGLE = 87
____exports.EntityType[____exports.EntityType.GURGLE] = "GURGLE"
____exports.EntityType.WALKING_BOIL = 88
____exports.EntityType[____exports.EntityType.WALKING_BOIL] = "WALKING_BOIL"
____exports.EntityType.BUTTLICKER = 89
____exports.EntityType[____exports.EntityType.BUTTLICKER] = "BUTTLICKER"
____exports.EntityType.HANGER = 90
____exports.EntityType[____exports.EntityType.HANGER] = "HANGER"
____exports.EntityType.SWARMER = 91
____exports.EntityType[____exports.EntityType.SWARMER] = "SWARMER"
____exports.EntityType.HEART = 92
____exports.EntityType[____exports.EntityType.HEART] = "HEART"
____exports.EntityType.MASK = 93
____exports.EntityType[____exports.EntityType.MASK] = "MASK"
____exports.EntityType.BIG_SPIDER = 94
____exports.EntityType[____exports.EntityType.BIG_SPIDER] = "BIG_SPIDER"
____exports.EntityType.ETERNAL_FLY = 96
____exports.EntityType[____exports.EntityType.ETERNAL_FLY] = "ETERNAL_FLY"
____exports.EntityType.MASK_OF_INFAMY = 97
____exports.EntityType[____exports.EntityType.MASK_OF_INFAMY] = "MASK_OF_INFAMY"
____exports.EntityType.HEART_OF_INFAMY = 98
____exports.EntityType[____exports.EntityType.HEART_OF_INFAMY] = "HEART_OF_INFAMY"
____exports.EntityType.GURDY_JR = 99
____exports.EntityType[____exports.EntityType.GURDY_JR] = "GURDY_JR"
____exports.EntityType.WIDOW = 100
____exports.EntityType[____exports.EntityType.WIDOW] = "WIDOW"
____exports.EntityType.DADDY_LONG_LEGS = 101
____exports.EntityType[____exports.EntityType.DADDY_LONG_LEGS] = "DADDY_LONG_LEGS"
____exports.EntityType.ISAAC = 102
____exports.EntityType[____exports.EntityType.ISAAC] = "ISAAC"
____exports.EntityType.STONE_EYE = 201
____exports.EntityType[____exports.EntityType.STONE_EYE] = "STONE_EYE"
____exports.EntityType.CONSTANT_STONE_SHOOTER = 202
____exports.EntityType[____exports.EntityType.CONSTANT_STONE_SHOOTER] = "CONSTANT_STONE_SHOOTER"
____exports.EntityType.BRIMSTONE_HEAD = 203
____exports.EntityType[____exports.EntityType.BRIMSTONE_HEAD] = "BRIMSTONE_HEAD"
____exports.EntityType.MOBILE_HOST = 204
____exports.EntityType[____exports.EntityType.MOBILE_HOST] = "MOBILE_HOST"
____exports.EntityType.NEST = 205
____exports.EntityType[____exports.EntityType.NEST] = "NEST"
____exports.EntityType.BABY_LONG_LEGS = 206
____exports.EntityType[____exports.EntityType.BABY_LONG_LEGS] = "BABY_LONG_LEGS"
____exports.EntityType.CRAZY_LONG_LEGS = 207
____exports.EntityType[____exports.EntityType.CRAZY_LONG_LEGS] = "CRAZY_LONG_LEGS"
____exports.EntityType.FATTY = 208
____exports.EntityType[____exports.EntityType.FATTY] = "FATTY"
____exports.EntityType.FAT_SACK = 209
____exports.EntityType[____exports.EntityType.FAT_SACK] = "FAT_SACK"
____exports.EntityType.BLUBBER = 210
____exports.EntityType[____exports.EntityType.BLUBBER] = "BLUBBER"
____exports.EntityType.HALF_SACK = 211
____exports.EntityType[____exports.EntityType.HALF_SACK] = "HALF_SACK"
____exports.EntityType.DEATHS_HEAD = 212
____exports.EntityType[____exports.EntityType.DEATHS_HEAD] = "DEATHS_HEAD"
____exports.EntityType.MOMS_HAND = 213
____exports.EntityType[____exports.EntityType.MOMS_HAND] = "MOMS_HAND"
____exports.EntityType.FLY_L2 = 214
____exports.EntityType[____exports.EntityType.FLY_L2] = "FLY_L2"
____exports.EntityType.SPIDER_L2 = 215
____exports.EntityType[____exports.EntityType.SPIDER_L2] = "SPIDER_L2"
____exports.EntityType.SWINGER = 216
____exports.EntityType[____exports.EntityType.SWINGER] = "SWINGER"
____exports.EntityType.DIP = 217
____exports.EntityType[____exports.EntityType.DIP] = "DIP"
____exports.EntityType.WALL_HUGGER = 218
____exports.EntityType[____exports.EntityType.WALL_HUGGER] = "WALL_HUGGER"
____exports.EntityType.WIZOOB = 219
____exports.EntityType[____exports.EntityType.WIZOOB] = "WIZOOB"
____exports.EntityType.SQUIRT = 220
____exports.EntityType[____exports.EntityType.SQUIRT] = "SQUIRT"
____exports.EntityType.COD_WORM = 221
____exports.EntityType[____exports.EntityType.COD_WORM] = "COD_WORM"
____exports.EntityType.RING_OF_FLIES = 222
____exports.EntityType[____exports.EntityType.RING_OF_FLIES] = "RING_OF_FLIES"
____exports.EntityType.DINGA = 223
____exports.EntityType[____exports.EntityType.DINGA] = "DINGA"
____exports.EntityType.OOB = 224
____exports.EntityType[____exports.EntityType.OOB] = "OOB"
____exports.EntityType.BLACK_MAW = 225
____exports.EntityType[____exports.EntityType.BLACK_MAW] = "BLACK_MAW"
____exports.EntityType.SKINNY = 226
____exports.EntityType[____exports.EntityType.SKINNY] = "SKINNY"
____exports.EntityType.BONY = 227
____exports.EntityType[____exports.EntityType.BONY] = "BONY"
____exports.EntityType.HOMUNCULUS = 228
____exports.EntityType[____exports.EntityType.HOMUNCULUS] = "HOMUNCULUS"
____exports.EntityType.TUMOR = 229
____exports.EntityType[____exports.EntityType.TUMOR] = "TUMOR"
____exports.EntityType.CAMILLO_JR = 230
____exports.EntityType[____exports.EntityType.CAMILLO_JR] = "CAMILLO_JR"
____exports.EntityType.NERVE_ENDING = 231
____exports.EntityType[____exports.EntityType.NERVE_ENDING] = "NERVE_ENDING"
____exports.EntityType.ONE_TOOTH = 234
____exports.EntityType[____exports.EntityType.ONE_TOOTH] = "ONE_TOOTH"
____exports.EntityType.GAPING_MAW = 235
____exports.EntityType[____exports.EntityType.GAPING_MAW] = "GAPING_MAW"
____exports.EntityType.BROKEN_GAPING_MAW = 236
____exports.EntityType[____exports.EntityType.BROKEN_GAPING_MAW] = "BROKEN_GAPING_MAW"
____exports.EntityType.GURGLING = 237
____exports.EntityType[____exports.EntityType.GURGLING] = "GURGLING"
____exports.EntityType.SPLASHER = 238
____exports.EntityType[____exports.EntityType.SPLASHER] = "SPLASHER"
____exports.EntityType.GRUB = 239
____exports.EntityType[____exports.EntityType.GRUB] = "GRUB"
____exports.EntityType.WALL_CREEP = 240
____exports.EntityType[____exports.EntityType.WALL_CREEP] = "WALL_CREEP"
____exports.EntityType.RAGE_CREEP = 241
____exports.EntityType[____exports.EntityType.RAGE_CREEP] = "RAGE_CREEP"
____exports.EntityType.BLIND_CREEP = 242
____exports.EntityType[____exports.EntityType.BLIND_CREEP] = "BLIND_CREEP"
____exports.EntityType.CONJOINED_SPITTY = 243
____exports.EntityType[____exports.EntityType.CONJOINED_SPITTY] = "CONJOINED_SPITTY"
____exports.EntityType.ROUND_WORM = 244
____exports.EntityType[____exports.EntityType.ROUND_WORM] = "ROUND_WORM"
____exports.EntityType.POOP = 245
____exports.EntityType[____exports.EntityType.POOP] = "POOP"
____exports.EntityType.RAGLING = 246
____exports.EntityType[____exports.EntityType.RAGLING] = "RAGLING"
____exports.EntityType.FLESH_MOBILE_HOST = 247
____exports.EntityType[____exports.EntityType.FLESH_MOBILE_HOST] = "FLESH_MOBILE_HOST"
____exports.EntityType.PSY_HORF = 248
____exports.EntityType[____exports.EntityType.PSY_HORF] = "PSY_HORF"
____exports.EntityType.FULL_FLY = 249
____exports.EntityType[____exports.EntityType.FULL_FLY] = "FULL_FLY"
____exports.EntityType.TICKING_SPIDER = 250
____exports.EntityType[____exports.EntityType.TICKING_SPIDER] = "TICKING_SPIDER"
____exports.EntityType.BEGOTTEN = 251
____exports.EntityType[____exports.EntityType.BEGOTTEN] = "BEGOTTEN"
____exports.EntityType.NULLS = 252
____exports.EntityType[____exports.EntityType.NULLS] = "NULLS"
____exports.EntityType.PSY_TUMOR = 253
____exports.EntityType[____exports.EntityType.PSY_TUMOR] = "PSY_TUMOR"
____exports.EntityType.FLOATING_KNIGHT = 254
____exports.EntityType[____exports.EntityType.FLOATING_KNIGHT] = "FLOATING_KNIGHT"
____exports.EntityType.NIGHT_CRAWLER = 255
____exports.EntityType[____exports.EntityType.NIGHT_CRAWLER] = "NIGHT_CRAWLER"
____exports.EntityType.DART_FLY = 256
____exports.EntityType[____exports.EntityType.DART_FLY] = "DART_FLY"
____exports.EntityType.CONJOINED_FATTY = 257
____exports.EntityType[____exports.EntityType.CONJOINED_FATTY] = "CONJOINED_FATTY"
____exports.EntityType.FAT_BAT = 258
____exports.EntityType[____exports.EntityType.FAT_BAT] = "FAT_BAT"
____exports.EntityType.IMP = 259
____exports.EntityType[____exports.EntityType.IMP] = "IMP"
____exports.EntityType.THE_HAUNT = 260
____exports.EntityType[____exports.EntityType.THE_HAUNT] = "THE_HAUNT"
____exports.EntityType.DINGLE = 261
____exports.EntityType[____exports.EntityType.DINGLE] = "DINGLE"
____exports.EntityType.MEGA_MAW = 262
____exports.EntityType[____exports.EntityType.MEGA_MAW] = "MEGA_MAW"
____exports.EntityType.GATE = 263
____exports.EntityType[____exports.EntityType.GATE] = "GATE"
____exports.EntityType.MEGA_FATTY = 264
____exports.EntityType[____exports.EntityType.MEGA_FATTY] = "MEGA_FATTY"
____exports.EntityType.CAGE = 265
____exports.EntityType[____exports.EntityType.CAGE] = "CAGE"
____exports.EntityType.MAMA_GURDY = 266
____exports.EntityType[____exports.EntityType.MAMA_GURDY] = "MAMA_GURDY"
____exports.EntityType.DARK_ONE = 267
____exports.EntityType[____exports.EntityType.DARK_ONE] = "DARK_ONE"
____exports.EntityType.ADVERSARY = 268
____exports.EntityType[____exports.EntityType.ADVERSARY] = "ADVERSARY"
____exports.EntityType.POLYCEPHALUS = 269
____exports.EntityType[____exports.EntityType.POLYCEPHALUS] = "POLYCEPHALUS"
____exports.EntityType.MR_FRED = 270
____exports.EntityType[____exports.EntityType.MR_FRED] = "MR_FRED"
____exports.EntityType.URIEL = 271
____exports.EntityType[____exports.EntityType.URIEL] = "URIEL"
____exports.EntityType.GABRIEL = 272
____exports.EntityType[____exports.EntityType.GABRIEL] = "GABRIEL"
____exports.EntityType.THE_LAMB = 273
____exports.EntityType[____exports.EntityType.THE_LAMB] = "THE_LAMB"
____exports.EntityType.MEGA_SATAN = 274
____exports.EntityType[____exports.EntityType.MEGA_SATAN] = "MEGA_SATAN"
____exports.EntityType.MEGA_SATAN_2 = 275
____exports.EntityType[____exports.EntityType.MEGA_SATAN_2] = "MEGA_SATAN_2"
____exports.EntityType.ROUNDY = 276
____exports.EntityType[____exports.EntityType.ROUNDY] = "ROUNDY"
____exports.EntityType.BLACK_BONY = 277
____exports.EntityType[____exports.EntityType.BLACK_BONY] = "BLACK_BONY"
____exports.EntityType.BLACK_GLOBIN = 278
____exports.EntityType[____exports.EntityType.BLACK_GLOBIN] = "BLACK_GLOBIN"
____exports.EntityType.BLACK_GLOBIN_HEAD = 279
____exports.EntityType[____exports.EntityType.BLACK_GLOBIN_HEAD] = "BLACK_GLOBIN_HEAD"
____exports.EntityType.BLACK_GLOBIN_BODY = 280
____exports.EntityType[____exports.EntityType.BLACK_GLOBIN_BODY] = "BLACK_GLOBIN_BODY"
____exports.EntityType.SWARM = 281
____exports.EntityType[____exports.EntityType.SWARM] = "SWARM"
____exports.EntityType.MEGA_CLOTTY = 282
____exports.EntityType[____exports.EntityType.MEGA_CLOTTY] = "MEGA_CLOTTY"
____exports.EntityType.BONE_KNIGHT = 283
____exports.EntityType[____exports.EntityType.BONE_KNIGHT] = "BONE_KNIGHT"
____exports.EntityType.CYCLOPIA = 284
____exports.EntityType[____exports.EntityType.CYCLOPIA] = "CYCLOPIA"
____exports.EntityType.RED_GHOST = 285
____exports.EntityType[____exports.EntityType.RED_GHOST] = "RED_GHOST"
____exports.EntityType.FLESH_DEATHS_HEAD = 286
____exports.EntityType[____exports.EntityType.FLESH_DEATHS_HEAD] = "FLESH_DEATHS_HEAD"
____exports.EntityType.MOMS_DEAD_HAND = 287
____exports.EntityType[____exports.EntityType.MOMS_DEAD_HAND] = "MOMS_DEAD_HAND"
____exports.EntityType.DUKIE = 288
____exports.EntityType[____exports.EntityType.DUKIE] = "DUKIE"
____exports.EntityType.ULCER = 289
____exports.EntityType[____exports.EntityType.ULCER] = "ULCER"
____exports.EntityType.MEATBALL = 290
____exports.EntityType[____exports.EntityType.MEATBALL] = "MEATBALL"
____exports.EntityType.PITFALL = 291
____exports.EntityType[____exports.EntityType.PITFALL] = "PITFALL"
____exports.EntityType.MOVABLE_TNT = 292
____exports.EntityType[____exports.EntityType.MOVABLE_TNT] = "MOVABLE_TNT"
____exports.EntityType.ULTRA_COIN = 293
____exports.EntityType[____exports.EntityType.ULTRA_COIN] = "ULTRA_COIN"
____exports.EntityType.ULTRA_DOOR = 294
____exports.EntityType[____exports.EntityType.ULTRA_DOOR] = "ULTRA_DOOR"
____exports.EntityType.CORN_MINE = 295
____exports.EntityType[____exports.EntityType.CORN_MINE] = "CORN_MINE"
____exports.EntityType.HUSH_FLY = 296
____exports.EntityType[____exports.EntityType.HUSH_FLY] = "HUSH_FLY"
____exports.EntityType.HUSH_GAPER = 297
____exports.EntityType[____exports.EntityType.HUSH_GAPER] = "HUSH_GAPER"
____exports.EntityType.HUSH_BOIL = 298
____exports.EntityType[____exports.EntityType.HUSH_BOIL] = "HUSH_BOIL"
____exports.EntityType.GREED_GAPER = 299
____exports.EntityType[____exports.EntityType.GREED_GAPER] = "GREED_GAPER"
____exports.EntityType.MUSHROOM = 300
____exports.EntityType[____exports.EntityType.MUSHROOM] = "MUSHROOM"
____exports.EntityType.POISON_MIND = 301
____exports.EntityType[____exports.EntityType.POISON_MIND] = "POISON_MIND"
____exports.EntityType.STONEY = 302
____exports.EntityType[____exports.EntityType.STONEY] = "STONEY"
____exports.EntityType.BLISTER = 303
____exports.EntityType[____exports.EntityType.BLISTER] = "BLISTER"
____exports.EntityType.THE_THING = 304
____exports.EntityType[____exports.EntityType.THE_THING] = "THE_THING"
____exports.EntityType.MINISTRO = 305
____exports.EntityType[____exports.EntityType.MINISTRO] = "MINISTRO"
____exports.EntityType.PORTAL = 306
____exports.EntityType[____exports.EntityType.PORTAL] = "PORTAL"
____exports.EntityType.TAR_BOY = 307
____exports.EntityType[____exports.EntityType.TAR_BOY] = "TAR_BOY"
____exports.EntityType.FISTULOID = 308
____exports.EntityType[____exports.EntityType.FISTULOID] = "FISTULOID"
____exports.EntityType.GUSH = 309
____exports.EntityType[____exports.EntityType.GUSH] = "GUSH"
____exports.EntityType.LEPER = 310
____exports.EntityType[____exports.EntityType.LEPER] = "LEPER"
____exports.EntityType.MR_MINE = 311
____exports.EntityType[____exports.EntityType.MR_MINE] = "MR_MINE"
____exports.EntityType.STAIN = 401
____exports.EntityType[____exports.EntityType.STAIN] = "STAIN"
____exports.EntityType.BROWNIE = 402
____exports.EntityType[____exports.EntityType.BROWNIE] = "BROWNIE"
____exports.EntityType.FORSAKEN = 403
____exports.EntityType[____exports.EntityType.FORSAKEN] = "FORSAKEN"
____exports.EntityType.LITTLE_HORN = 404
____exports.EntityType[____exports.EntityType.LITTLE_HORN] = "LITTLE_HORN"
____exports.EntityType.RAG_MAN = 405
____exports.EntityType[____exports.EntityType.RAG_MAN] = "RAG_MAN"
____exports.EntityType.ULTRA_GREED = 406
____exports.EntityType[____exports.EntityType.ULTRA_GREED] = "ULTRA_GREED"
____exports.EntityType.HUSH = 407
____exports.EntityType[____exports.EntityType.HUSH] = "HUSH"
____exports.EntityType.HUSH_SKINLESS = 408
____exports.EntityType[____exports.EntityType.HUSH_SKINLESS] = "HUSH_SKINLESS"
____exports.EntityType.RAG_MEGA = 409
____exports.EntityType[____exports.EntityType.RAG_MEGA] = "RAG_MEGA"
____exports.EntityType.SISTERS_VIS = 410
____exports.EntityType[____exports.EntityType.SISTERS_VIS] = "SISTERS_VIS"
____exports.EntityType.BIG_HORN = 411
____exports.EntityType[____exports.EntityType.BIG_HORN] = "BIG_HORN"
____exports.EntityType.DELIRIUM = 412
____exports.EntityType[____exports.EntityType.DELIRIUM] = "DELIRIUM"
____exports.EntityType.MATRIARCH = 413
____exports.EntityType[____exports.EntityType.MATRIARCH] = "MATRIARCH"
____exports.EntityType.BLOOD_PUPPY = 802
____exports.EntityType[____exports.EntityType.BLOOD_PUPPY] = "BLOOD_PUPPY"
____exports.EntityType.QUAKE_GRIMACE = 804
____exports.EntityType[____exports.EntityType.QUAKE_GRIMACE] = "QUAKE_GRIMACE"
____exports.EntityType.BISHOP = 805
____exports.EntityType[____exports.EntityType.BISHOP] = "BISHOP"
____exports.EntityType.BUBBLES = 806
____exports.EntityType[____exports.EntityType.BUBBLES] = "BUBBLES"
____exports.EntityType.WRAITH = 807
____exports.EntityType[____exports.EntityType.WRAITH] = "WRAITH"
____exports.EntityType.WILLO = 808
____exports.EntityType[____exports.EntityType.WILLO] = "WILLO"
____exports.EntityType.BOMB_GRIMACE = 809
____exports.EntityType[____exports.EntityType.BOMB_GRIMACE] = "BOMB_GRIMACE"
____exports.EntityType.SMALL_LEECH = 810
____exports.EntityType[____exports.EntityType.SMALL_LEECH] = "SMALL_LEECH"
____exports.EntityType.DEEP_GAPER = 811
____exports.EntityType[____exports.EntityType.DEEP_GAPER] = "DEEP_GAPER"
____exports.EntityType.SUB_HORF = 812
____exports.EntityType[____exports.EntityType.SUB_HORF] = "SUB_HORF"
____exports.EntityType.BLURB = 813
____exports.EntityType[____exports.EntityType.BLURB] = "BLURB"
____exports.EntityType.STRIDER = 814
____exports.EntityType[____exports.EntityType.STRIDER] = "STRIDER"
____exports.EntityType.FISSURE = 815
____exports.EntityType[____exports.EntityType.FISSURE] = "FISSURE"
____exports.EntityType.POLTY = 816
____exports.EntityType[____exports.EntityType.POLTY] = "POLTY"
____exports.EntityType.PREY = 817
____exports.EntityType[____exports.EntityType.PREY] = "PREY"
____exports.EntityType.ROCK_SPIDER = 818
____exports.EntityType[____exports.EntityType.ROCK_SPIDER] = "ROCK_SPIDER"
____exports.EntityType.FLY_BOMB = 819
____exports.EntityType[____exports.EntityType.FLY_BOMB] = "FLY_BOMB"
____exports.EntityType.DANNY = 820
____exports.EntityType[____exports.EntityType.DANNY] = "DANNY"
____exports.EntityType.BLASTER = 821
____exports.EntityType[____exports.EntityType.BLASTER] = "BLASTER"
____exports.EntityType.BOUNCER = 822
____exports.EntityType[____exports.EntityType.BOUNCER] = "BOUNCER"
____exports.EntityType.QUAKEY = 823
____exports.EntityType[____exports.EntityType.QUAKEY] = "QUAKEY"
____exports.EntityType.GYRO = 824
____exports.EntityType[____exports.EntityType.GYRO] = "GYRO"
____exports.EntityType.FIRE_WORM = 825
____exports.EntityType[____exports.EntityType.FIRE_WORM] = "FIRE_WORM"
____exports.EntityType.HARDY = 826
____exports.EntityType[____exports.EntityType.HARDY] = "HARDY"
____exports.EntityType.FACELESS = 827
____exports.EntityType[____exports.EntityType.FACELESS] = "FACELESS"
____exports.EntityType.NECRO = 828
____exports.EntityType[____exports.EntityType.NECRO] = "NECRO"
____exports.EntityType.MOLE = 829
____exports.EntityType[____exports.EntityType.MOLE] = "MOLE"
____exports.EntityType.BIG_BONY = 830
____exports.EntityType[____exports.EntityType.BIG_BONY] = "BIG_BONY"
____exports.EntityType.GUTTED_FATTY = 831
____exports.EntityType[____exports.EntityType.GUTTED_FATTY] = "GUTTED_FATTY"
____exports.EntityType.EXORCIST = 832
____exports.EntityType[____exports.EntityType.EXORCIST] = "EXORCIST"
____exports.EntityType.CANDLER = 833
____exports.EntityType[____exports.EntityType.CANDLER] = "CANDLER"
____exports.EntityType.WHIPPER = 834
____exports.EntityType[____exports.EntityType.WHIPPER] = "WHIPPER"
____exports.EntityType.PEEPER_FATTY = 835
____exports.EntityType[____exports.EntityType.PEEPER_FATTY] = "PEEPER_FATTY"
____exports.EntityType.VIS_VERSA = 836
____exports.EntityType[____exports.EntityType.VIS_VERSA] = "VIS_VERSA"
____exports.EntityType.HENRY = 837
____exports.EntityType[____exports.EntityType.HENRY] = "HENRY"
____exports.EntityType.WILLO_L2 = 838
____exports.EntityType[____exports.EntityType.WILLO_L2] = "WILLO_L2"
____exports.EntityType.PON = 840
____exports.EntityType[____exports.EntityType.PON] = "PON"
____exports.EntityType.REVENANT = 841
____exports.EntityType[____exports.EntityType.REVENANT] = "REVENANT"
____exports.EntityType.BOMBGAGGER = 844
____exports.EntityType[____exports.EntityType.BOMBGAGGER] = "BOMBGAGGER"
____exports.EntityType.GAPER_L2 = 850
____exports.EntityType[____exports.EntityType.GAPER_L2] = "GAPER_L2"
____exports.EntityType.TWITCHY = 851
____exports.EntityType[____exports.EntityType.TWITCHY] = "TWITCHY"
____exports.EntityType.SPIKEBALL = 852
____exports.EntityType[____exports.EntityType.SPIKEBALL] = "SPIKEBALL"
____exports.EntityType.SMALL_MAGGOT = 853
____exports.EntityType[____exports.EntityType.SMALL_MAGGOT] = "SMALL_MAGGOT"
____exports.EntityType.ADULT_LEECH = 854
____exports.EntityType[____exports.EntityType.ADULT_LEECH] = "ADULT_LEECH"
____exports.EntityType.CHARGER_L2 = 855
____exports.EntityType[____exports.EntityType.CHARGER_L2] = "CHARGER_L2"
____exports.EntityType.GASBAG = 856
____exports.EntityType[____exports.EntityType.GASBAG] = "GASBAG"
____exports.EntityType.COHORT = 857
____exports.EntityType[____exports.EntityType.COHORT] = "COHORT"
____exports.EntityType.FLOATING_HOST = 859
____exports.EntityType[____exports.EntityType.FLOATING_HOST] = "FLOATING_HOST"
____exports.EntityType.UNBORN = 860
____exports.EntityType[____exports.EntityType.UNBORN] = "UNBORN"
____exports.EntityType.PUSTULE = 861
____exports.EntityType[____exports.EntityType.PUSTULE] = "PUSTULE"
____exports.EntityType.CYST = 862
____exports.EntityType[____exports.EntityType.CYST] = "CYST"
____exports.EntityType.MORNINGSTAR = 863
____exports.EntityType[____exports.EntityType.MORNINGSTAR] = "MORNINGSTAR"
____exports.EntityType.MOCKULUS = 864
____exports.EntityType[____exports.EntityType.MOCKULUS] = "MOCKULUS"
____exports.EntityType.EVIS = 865
____exports.EntityType[____exports.EntityType.EVIS] = "EVIS"
____exports.EntityType.DARK_ESAU = 866
____exports.EntityType[____exports.EntityType.DARK_ESAU] = "DARK_ESAU"
____exports.EntityType.MOTHERS_SHADOW = 867
____exports.EntityType[____exports.EntityType.MOTHERS_SHADOW] = "MOTHERS_SHADOW"
____exports.EntityType.ARMY_FLY = 868
____exports.EntityType[____exports.EntityType.ARMY_FLY] = "ARMY_FLY"
____exports.EntityType.MIGRAINE = 869
____exports.EntityType[____exports.EntityType.MIGRAINE] = "MIGRAINE"
____exports.EntityType.DRIP = 870
____exports.EntityType[____exports.EntityType.DRIP] = "DRIP"
____exports.EntityType.SPLURT = 871
____exports.EntityType[____exports.EntityType.SPLURT] = "SPLURT"
____exports.EntityType.CLOGGY = 872
____exports.EntityType[____exports.EntityType.CLOGGY] = "CLOGGY"
____exports.EntityType.FLY_TRAP = 873
____exports.EntityType[____exports.EntityType.FLY_TRAP] = "FLY_TRAP"
____exports.EntityType.GAS_DWARF = 874
____exports.EntityType[____exports.EntityType.GAS_DWARF] = "GAS_DWARF"
____exports.EntityType.POOT_MINE = 875
____exports.EntityType[____exports.EntityType.POOT_MINE] = "POOT_MINE"
____exports.EntityType.DUMP = 876
____exports.EntityType[____exports.EntityType.DUMP] = "DUMP"
____exports.EntityType.GRUDGE = 877
____exports.EntityType[____exports.EntityType.GRUDGE] = "GRUDGE"
____exports.EntityType.BUTT_SLICKER = 878
____exports.EntityType[____exports.EntityType.BUTT_SLICKER] = "BUTT_SLICKER"
____exports.EntityType.BLOATY = 879
____exports.EntityType[____exports.EntityType.BLOATY] = "BLOATY"
____exports.EntityType.FLESH_MAIDEN = 880
____exports.EntityType[____exports.EntityType.FLESH_MAIDEN] = "FLESH_MAIDEN"
____exports.EntityType.NEEDLE = 881
____exports.EntityType[____exports.EntityType.NEEDLE] = "NEEDLE"
____exports.EntityType.DUST = 882
____exports.EntityType[____exports.EntityType.DUST] = "DUST"
____exports.EntityType.BABY_BEGOTTEN = 883
____exports.EntityType[____exports.EntityType.BABY_BEGOTTEN] = "BABY_BEGOTTEN"
____exports.EntityType.SWARM_SPIDER = 884
____exports.EntityType[____exports.EntityType.SWARM_SPIDER] = "SWARM_SPIDER"
____exports.EntityType.CULTIST = 885
____exports.EntityType[____exports.EntityType.CULTIST] = "CULTIST"
____exports.EntityType.VIS_FATTY = 886
____exports.EntityType[____exports.EntityType.VIS_FATTY] = "VIS_FATTY"
____exports.EntityType.DUSTY_DEATHS_HEAD = 887
____exports.EntityType[____exports.EntityType.DUSTY_DEATHS_HEAD] = "DUSTY_DEATHS_HEAD"
____exports.EntityType.SHADY = 888
____exports.EntityType[____exports.EntityType.SHADY] = "SHADY"
____exports.EntityType.CLICKETY_CLACK = 889
____exports.EntityType[____exports.EntityType.CLICKETY_CLACK] = "CLICKETY_CLACK"
____exports.EntityType.MAZE_ROAMER = 890
____exports.EntityType[____exports.EntityType.MAZE_ROAMER] = "MAZE_ROAMER"
____exports.EntityType.GOAT = 891
____exports.EntityType[____exports.EntityType.GOAT] = "GOAT"
____exports.EntityType.POOFER = 892
____exports.EntityType[____exports.EntityType.POOFER] = "POOFER"
____exports.EntityType.BALL_AND_CHAIN = 893
____exports.EntityType[____exports.EntityType.BALL_AND_CHAIN] = "BALL_AND_CHAIN"
____exports.EntityType.REAP_CREEP = 900
____exports.EntityType[____exports.EntityType.REAP_CREEP] = "REAP_CREEP"
____exports.EntityType.LIL_BLUB = 901
____exports.EntityType[____exports.EntityType.LIL_BLUB] = "LIL_BLUB"
____exports.EntityType.RAINMAKER = 902
____exports.EntityType[____exports.EntityType.RAINMAKER] = "RAINMAKER"
____exports.EntityType.VISAGE = 903
____exports.EntityType[____exports.EntityType.VISAGE] = "VISAGE"
____exports.EntityType.SIREN = 904
____exports.EntityType[____exports.EntityType.SIREN] = "SIREN"
____exports.EntityType.HERETIC = 905
____exports.EntityType[____exports.EntityType.HERETIC] = "HERETIC"
____exports.EntityType.HORNFEL = 906
____exports.EntityType[____exports.EntityType.HORNFEL] = "HORNFEL"
____exports.EntityType.GREAT_GIDEON = 907
____exports.EntityType[____exports.EntityType.GREAT_GIDEON] = "GREAT_GIDEON"
____exports.EntityType.BABY_PLUM = 908
____exports.EntityType[____exports.EntityType.BABY_PLUM] = "BABY_PLUM"
____exports.EntityType.SCOURGE = 909
____exports.EntityType[____exports.EntityType.SCOURGE] = "SCOURGE"
____exports.EntityType.CHIMERA = 910
____exports.EntityType[____exports.EntityType.CHIMERA] = "CHIMERA"
____exports.EntityType.ROTGUT = 911
____exports.EntityType[____exports.EntityType.ROTGUT] = "ROTGUT"
____exports.EntityType.MOTHER = 912
____exports.EntityType[____exports.EntityType.MOTHER] = "MOTHER"
____exports.EntityType.MIN_MIN = 913
____exports.EntityType[____exports.EntityType.MIN_MIN] = "MIN_MIN"
____exports.EntityType.CLOG = 914
____exports.EntityType[____exports.EntityType.CLOG] = "CLOG"
____exports.EntityType.SINGE = 915
____exports.EntityType[____exports.EntityType.SINGE] = "SINGE"
____exports.EntityType.BUMBINO = 916
____exports.EntityType[____exports.EntityType.BUMBINO] = "BUMBINO"
____exports.EntityType.COLOSTOMIA = 917
____exports.EntityType[____exports.EntityType.COLOSTOMIA] = "COLOSTOMIA"
____exports.EntityType.TURDLET = 918
____exports.EntityType[____exports.EntityType.TURDLET] = "TURDLET"
____exports.EntityType.RAGLICH = 919
____exports.EntityType[____exports.EntityType.RAGLICH] = "RAGLICH"
____exports.EntityType.HORNY_BOYS = 920
____exports.EntityType[____exports.EntityType.HORNY_BOYS] = "HORNY_BOYS"
____exports.EntityType.CLUTCH = 921
____exports.EntityType[____exports.EntityType.CLUTCH] = "CLUTCH"
____exports.EntityType.DOGMA = 950
____exports.EntityType[____exports.EntityType.DOGMA] = "DOGMA"
____exports.EntityType.BEAST = 951
____exports.EntityType[____exports.EntityType.BEAST] = "BEAST"
____exports.EntityType.GENERIC_PROP = 960
____exports.EntityType[____exports.EntityType.GENERIC_PROP] = "GENERIC_PROP"
____exports.EntityType.FROZEN_ENEMY = 963
____exports.EntityType[____exports.EntityType.FROZEN_ENEMY] = "FROZEN_ENEMY"
____exports.EntityType.DUMMY = 964
____exports.EntityType[____exports.EntityType.DUMMY] = "DUMMY"
____exports.EntityType.MINECART = 965
____exports.EntityType[____exports.EntityType.MINECART] = "MINECART"
____exports.EntityType.SIREN_HELPER = 966
____exports.EntityType[____exports.EntityType.SIREN_HELPER] = "SIREN_HELPER"
____exports.EntityType.HORNFEL_DOOR = 967
____exports.EntityType[____exports.EntityType.HORNFEL_DOOR] = "HORNFEL_DOOR"
____exports.EntityType.EFFECT = 1000
____exports.EntityType[____exports.EntityType.EFFECT] = "EFFECT"
____exports.EntityType.TEXT = 9001
____exports.EntityType[____exports.EntityType.TEXT] = "TEXT"
return ____exports
 end,
["lua_modules.isaac-typescript-definitions.dist.src.enums.FadeoutTarget"] = function(...) 
local ____exports = {}
____exports.FadeoutTarget = {}
____exports.FadeoutTarget.NONE = 0
____exports.FadeoutTarget[____exports.FadeoutTarget.NONE] = "NONE"
____exports.FadeoutTarget.FILE_SELECT = 1
____exports.FadeoutTarget[____exports.FadeoutTarget.FILE_SELECT] = "FILE_SELECT"
____exports.FadeoutTarget.MAIN_MENU = 2
____exports.FadeoutTarget[____exports.FadeoutTarget.MAIN_MENU] = "MAIN_MENU"
____exports.FadeoutTarget.TITLE_SCREEN = 3
____exports.FadeoutTarget[____exports.FadeoutTarget.TITLE_SCREEN] = "TITLE_SCREEN"
____exports.FadeoutTarget.RESTART_RUN = 4
____exports.FadeoutTarget[____exports.FadeoutTarget.RESTART_RUN] = "RESTART_RUN"
return ____exports
 end,
["lua_modules.isaac-typescript-definitions.dist.src.enums.flags.ActionTrigger"] = function(...) 
local ____exports = {}
--- This is represented as an object instead of an enum due to limitations with TypeScript enums. (We
-- want this type to be a child of the `BitFlag` type.)
-- 
-- @enum
-- @notExported
-- @rename ActionTrigger
local ActionTriggerInternal = {
    NONE = 1 << -1,
    BOMB_PLACED = 1 << 0,
    MOVED = 1 << 1,
    SHOOTING = 1 << 2,
    CARD_PILL_USED = 1 << 3,
    ITEM_ACTIVATED = 1 << 4,
    ITEMS_DROPPED = 1 << 5
}
____exports.ActionTrigger = ActionTriggerInternal
____exports.ActionTriggerZero = 0
return ____exports
 end,
["lua_modules.isaac-typescript-definitions.dist.src.enums.flags.CacheFlag"] = function(...) 
local ____exports = {}
--- This is represented as an object instead of an enum due to limitations with TypeScript enums. (We
-- want this type to be a child of the `BitFlag` type.)
-- 
-- @enum
-- @notExported
-- @rename CacheFlag
local CacheFlagInternal = {
    DAMAGE = 1 << 0,
    FIRE_DELAY = 1 << 1,
    SHOT_SPEED = 1 << 2,
    RANGE = 1 << 3,
    SPEED = 1 << 4,
    TEAR_FLAG = 1 << 5,
    TEAR_COLOR = 1 << 6,
    FLYING = 1 << 7,
    WEAPON = 1 << 8,
    FAMILIARS = 1 << 9,
    LUCK = 1 << 10,
    SIZE = 1 << 11,
    COLOR = 1 << 12,
    PICKUP_VISION = 1 << 13,
    ALL = (1 << 16) - 1,
    TWIN_SYNC = 1 << 31
}
____exports.CacheFlag = CacheFlagInternal
____exports.CacheFlagZero = 0
return ____exports
 end,
["lua_modules.isaac-typescript-definitions.dist.src.enums.flags.DamageFlag"] = function(...) 
local ____exports = {}
--- This is represented as an object instead of an enum due to limitations with TypeScript enums. (We
-- want this type to be a child of the `BitFlag` type.)
-- 
-- @enum
-- @notExported
-- @rename DamageFlag
local DamageFlagInternal = {
    NO_KILL = 1 << 0,
    FIRE = 1 << 1,
    EXPLOSION = 1 << 2,
    LASER = 1 << 3,
    ACID = 1 << 4,
    RED_HEARTS = 1 << 5,
    COUNTDOWN = 1 << 6,
    SPIKES = 1 << 7,
    CLONES = 1 << 8,
    POOP = 1 << 9,
    DEVIL = 1 << 10,
    ISSAC_HEART = 1 << 11,
    TNT = 1 << 12,
    INVINCIBLE = 1 << 13,
    SPAWN_FLY = 1 << 14,
    POISON_BURN = 1 << 15,
    CURSED_DOOR = 1 << 16,
    TIMER = 1 << 17,
    IV_BAG = 1 << 18,
    PITFALL = 1 << 19,
    CHEST = 1 << 20,
    FAKE = 1 << 21,
    BOOGER = 1 << 22,
    SPAWN_BLACK_HEART = 1 << 23,
    CRUSH = 1 << 24,
    NO_MODIFIERS = 1 << 25,
    SPAWN_RED_HEART = 1 << 26,
    SPAWN_COIN = 1 << 27,
    NO_PENALTIES = 1 << 28,
    SPAWN_TEMP_HEART = 1 << 29,
    IGNORE_ARMOR = 1 << 30,
    SPAWN_CARD = 1 << 31,
    SPAWN_RUNE = 1 << 32
}
____exports.DamageFlag = DamageFlagInternal
____exports.DamageFlagZero = 0
return ____exports
 end,
["lua_modules.isaac-typescript-definitions.dist.src.enums.flags.DisplayFlag"] = function(...) 
local ____exports = {}
--- This is represented as an object instead of an enum due to limitations with TypeScript enums. (We
-- want this type to be a child of the `BitFlag` type.)
-- 
-- @enum
-- @notExported
-- @rename DisplayFlag
local DisplayFlagInternal = {INVISIBLE = 1 << -1, VISIBLE = 1 << 0, SHADOW = 1 << 1, SHOW_ICON = 1 << 2}
____exports.DisplayFlag = DisplayFlagInternal
____exports.DisplayFlagZero = 0
return ____exports
 end,
["lua_modules.isaac-typescript-definitions.dist.src.enums.flags.DoorSlotFlag"] = function(...) 
local ____exports = {}
local ____DoorSlot = require("lua_modules.isaac-typescript-definitions.dist.src.enums.DoorSlot")
local DoorSlot = ____DoorSlot.DoorSlot
--- For `GridEntityType.DOOR` (16).
-- 
-- This is represented as an object instead of an enum due to limitations with TypeScript enums. (We
-- want this type to be a child of the `BitFlag` type.)
-- 
-- @enum
-- @notExported
-- @rename DoorSlotFlag
local DoorSlotFlagInternal = {
    LEFT_0 = 1 << DoorSlot.LEFT_0,
    UP_0 = 1 << DoorSlot.UP_0,
    RIGHT_0 = 1 << DoorSlot.RIGHT_0,
    DOWN_0 = 1 << DoorSlot.DOWN_0,
    LEFT_1 = 1 << DoorSlot.LEFT_1,
    UP_1 = 1 << DoorSlot.UP_1,
    RIGHT_1 = 1 << DoorSlot.RIGHT_1,
    DOWN_1 = 1 << DoorSlot.DOWN_1
}
____exports.DoorSlotFlag = DoorSlotFlagInternal
____exports.DoorSlotFlagZero = 0
return ____exports
 end,
["lua_modules.isaac-typescript-definitions.dist.src.enums.flags.EntityFlag"] = function(...) 
local ____exports = {}
--- This is represented as an object instead of an enum due to limitations with TypeScript enums. (We
-- want this type to be a child of the `BitFlag` type.)
-- 
-- @enum
-- @notExported
-- @rename EntityFlag
local EntityFlagInternal = {
    NO_STATUS_EFFECTS = 1 << 0,
    NO_INTERPOLATE = 1 << 1,
    APPEAR = 1 << 2,
    RENDER_FLOOR = 1 << 3,
    NO_TARGET = 1 << 4,
    FREEZE = 1 << 5,
    POISON = 1 << 6,
    SLOW = 1 << 7,
    CHARM = 1 << 8,
    CONFUSION = 1 << 9,
    MIDAS_FREEZE = 1 << 10,
    FEAR = 1 << 11,
    BURN = 1 << 12,
    RENDER_WALL = 1 << 13,
    INTERPOLATION_UPDATE = 1 << 14,
    APPLY_GRAVITY = 1 << 15,
    NO_BLOOD_SPLASH = 1 << 16,
    NO_REMOVE_ON_TEX_RENDER = 1 << 17,
    NO_DEATH_TRIGGER = 1 << 18,
    NO_SPIKE_DAMAGE = 1 << 19,
    LASER_POP = 1 << 19,
    ITEM_SHOULD_DUPLICATE = 1 << 19,
    BOSS_DEATH_TRIGGERED = 1 << 20,
    DONT_OVERWRITE = 1 << 21,
    SPAWN_STICKY_SPIDERS = 1 << 22,
    SPAWN_BLACK_HP = 1 << 23,
    SHRINK = 1 << 24,
    NO_FLASH_ON_DAMAGE = 1 << 25,
    NO_KNOCKBACK = 1 << 26,
    SLIPPERY_PHYSICS = 1 << 27,
    ADD_JAR_FLY = 1 << 28,
    FRIENDLY = 1 << 29,
    NO_PHYSICS_KNOCKBACK = 1 << 30,
    DONT_COUNT_BOSS_HP = 1 << 31,
    NO_SPRITE_UPDATE = 1 << 32,
    CONTAGIOUS = 1 << 33,
    BLEED_OUT = 1 << 34,
    HIDE_HP_BAR = 1 << 35,
    NO_DAMAGE_BLINK = 1 << 36,
    PERSISTENT = 1 << 37,
    BACKDROP_DETAIL = 1 << 38,
    AMBUSH = 1 << 39,
    GLITCH = 1 << 40,
    SPIN = 1 << 41,
    NO_REWARD = 1 << 42,
    REDUCE_GIBS = 1 << 43,
    TRANSITION_UPDATE = 1 << 44,
    NO_PLAYER_CONTROL = 1 << 45,
    NO_QUERY = 1 << 46,
    KNOCKED_BACK = 1 << 47,
    APPLY_IMPACT_DAMAGE = 1 << 48,
    ICE_FROZEN = 1 << 49,
    ICE = 1 << 50,
    MAGNETIZED = 1 << 51,
    BAITED = 1 << 52,
    KILL_SWITCH = 1 << 53,
    WEAKNESS = 1 << 54,
    EXTRA_GORE = 1 << 55,
    BRIMSTONE_MARKED = 1 << 56,
    HELD = 1 << 57,
    THROWN = 1 << 58,
    FRIENDLY_BALL = 1 << 59
}
____exports.EntityFlag = EntityFlagInternal
____exports.EntityFlagZero = 0
return ____exports
 end,
["lua_modules.isaac-typescript-definitions.dist.src.enums.flags.EntityPartition"] = function(...) 
local ____exports = {}
--- This is represented as an object instead of an enum due to limitations with TypeScript enums. (We
-- want this type to be a child of the `BitFlag` type.)
-- 
-- @enum
-- @notExported
-- @rename EntityPartition
local EntityPartitionInternal = {
    FAMILIAR = 1 << 0,
    BULLET = 1 << 1,
    TEAR = 1 << 2,
    ENEMY = 1 << 3,
    PICKUP = 1 << 4,
    PLAYER = 1 << 5,
    EFFECT = 1 << 6
}
____exports.EntityPartition = EntityPartitionInternal
____exports.EntityPartitionZero = 0
return ____exports
 end,
["lua_modules.isaac-typescript-definitions.dist.src.enums.flags.ItemConfigTag"] = function(...) 
local ____exports = {}
--- Matches the ItemConfig.TAG_ members of the ItemConfig class. In IsaacScript, we re-implement this
-- as an object instead, since it is cleaner.
-- 
-- This is represented as an object instead of an enum due to limitations with TypeScript enums. (We
-- want this type to be a child of the `BitFlag` type.)
-- 
-- @enum
-- @notExported
-- @rename ItemConfigTag
local ItemConfigTagInternal = {
    DEAD = 1 << 0,
    SYRINGE = 1 << 1,
    MOM = 1 << 2,
    TECH = 1 << 3,
    BATTERY = 1 << 4,
    GUPPY = 1 << 5,
    FLY = 1 << 6,
    BOB = 1 << 7,
    MUSHROOM = 1 << 8,
    BABY = 1 << 9,
    ANGEL = 1 << 10,
    DEVIL = 1 << 11,
    POOP = 1 << 12,
    BOOK = 1 << 13,
    SPIDER = 1 << 14,
    QUEST = 1 << 15,
    MONSTER_MANUAL = 1 << 16,
    NO_GREED = 1 << 17,
    FOOD = 1 << 18,
    TEARS_UP = 1 << 19,
    OFFENSIVE = 1 << 20,
    NO_KEEPER = 1 << 21,
    NO_LOST_BR = 1 << 22,
    STARS = 1 << 23,
    SUMMONABLE = 1 << 24,
    NO_CANTRIP = 1 << 25,
    WISP = 1 << 26,
    UNIQUE_FAMILIAR = 1 << 27,
    NO_CHALLENGE = 1 << 28,
    NO_DAILY = 1 << 29,
    LAZ_SHARED = 1 << 30,
    LAZ_SHARED_GLOBAL = 1 << 31,
    NO_EDEN = 1 << 32
}
____exports.ItemConfigTag = ItemConfigTagInternal
____exports.ItemConfigTagZero = 0
return ____exports
 end,
["lua_modules.isaac-typescript-definitions.dist.src.enums.flags.LevelCurse"] = function(...) 
local ____exports = {}
local getLevelCurse
local ____CurseID = require("lua_modules.isaac-typescript-definitions.dist.src.enums.CurseID")
local CurseID = ____CurseID.CurseID
function getLevelCurse(self, curseID)
    return 1 << curseID - 1
end
--- This is represented as an object instead of an enum due to limitations with TypeScript enums. (We
-- want this type to be a child of the `BitFlag` type.)
-- 
-- @enum
-- @notExported
-- @rename LevelCurse
local LevelCurseInternal = {
    NONE = 0,
    DARKNESS = getLevelCurse(nil, CurseID.DARKNESS),
    LABYRINTH = getLevelCurse(nil, CurseID.LABYRINTH),
    LOST = getLevelCurse(nil, CurseID.LOST),
    UNKNOWN = getLevelCurse(nil, CurseID.UNKNOWN),
    CURSED = getLevelCurse(nil, CurseID.CURSED),
    MAZE = getLevelCurse(nil, CurseID.MAZE),
    BLIND = getLevelCurse(nil, CurseID.BLIND),
    GIANT = getLevelCurse(nil, CurseID.GIANT)
}
____exports.LevelCurse = LevelCurseInternal
____exports.LevelCurseZero = 0
return ____exports
 end,
["lua_modules.isaac-typescript-definitions.dist.src.enums.flags.ProjectileFlag"] = function(...) 
local ____exports = {}
--- For `EntityType.PROJECTILE` (9).
-- 
-- This enum was renamed from "ProjectileFlags" to be consistent with the other flag enums.
-- 
-- This is represented as an object instead of an enum due to limitations with TypeScript enums. (We
-- want this type to be a child of the `BitFlag` type.)
-- 
-- @enum
-- @notExported
-- @rename ProjectileFlag
local ProjectileFlagInternal = {
    SMART = 1 << 0,
    EXPLODE = 1 << 1,
    ACID_GREEN = 1 << 2,
    GOO = 1 << 3,
    GHOST = 1 << 4,
    WIGGLE = 1 << 5,
    BOOMERANG = 1 << 6,
    HIT_ENEMIES = 1 << 7,
    ACID_RED = 1 << 8,
    GREED = 1 << 9,
    RED_CREEP = 1 << 10,
    ORBIT_CW = 1 << 11,
    ORBIT_CCW = 1 << 12,
    NO_WALL_COLLIDE = 1 << 13,
    CREEP_BROWN = 1 << 14,
    FIRE = 1 << 15,
    BURST = 1 << 16,
    ANY_HEIGHT_ENTITY_HIT = 1 << 17,
    CURVE_LEFT = 1 << 18,
    CURVE_RIGHT = 1 << 19,
    TURN_HORIZONTAL = 1 << 20,
    SINE_VELOCITY = 1 << 21,
    MEGA_WIGGLE = 1 << 22,
    SAWTOOTH_WIGGLE = 1 << 23,
    SLOWED = 1 << 24,
    TRIANGLE = 1 << 25,
    MOVE_TO_PARENT = 1 << 26,
    ACCELERATE = 1 << 27,
    DECELERATE = 1 << 28,
    BURST3 = 1 << 29,
    CONTINUUM = 1 << 30,
    CANT_HIT_PLAYER = 1 << 31,
    CHANGE_FLAGS_AFTER_TIMEOUT = 1 << 32,
    CHANGE_VELOCITY_AFTER_TIMEOUT = 1 << 33,
    STASIS = 1 << 34,
    FIRE_WAVE = 1 << 35,
    FIRE_WAVE_X = 1 << 36,
    ACCELERATE_EX = 1 << 37,
    BURST8 = 1 << 38,
    FIRE_SPAWN = 1 << 39,
    ANTI_GRAVITY = 1 << 40,
    TRACTOR_BEAM = 1 << 41,
    BOUNCE = 1 << 42,
    BOUNCE_FLOOR = 1 << 43,
    SHIELDED = 1 << 44,
    BLUE_FIRE_SPAWN = 1 << 45,
    LASER_SHOT = 1 << 46,
    GODHEAD = 1 << 47,
    SMART_PERFECT = 1 << 48,
    BURST_SPLIT = 1 << 49,
    WIGGLE_ROTGUT = 1 << 50,
    FREEZE = 1 << 51,
    ACCELERATE_TO_POSITION = 1 << 52,
    BROCCOLI = 1 << 53,
    BACK_SPLIT = 1 << 54,
    SIDE_WAVE = 1 << 55,
    ORBIT_PARENT = 1 << 56,
    FADEOUT = 1 << 57
}
____exports.ProjectileFlag = ProjectileFlagInternal
____exports.ProjectileFlagZero = 0
return ____exports
 end,
["lua_modules.isaac-typescript-definitions.dist.src.enums.flags.RoomDescriptorFlag"] = function(...) 
local ____exports = {}
--- Matches the `RoomDescriptor.FLAG_*` members of the `RoomDescriptor` class. In IsaacScript, we
-- reimplement this as an object instead, since it is cleaner.
-- 
-- This is represented as an object instead of an enum due to limitations with TypeScript enums. (We
-- want this type to be a child of the `BitFlag` type.)
-- 
-- @enum
-- @notExported
-- @rename RoomDescriptorFlag
local RoomDescriptorFlagInternal = {
    CLEAR = 1 << 0,
    PRESSURE_PLATES_TRIGGERED = 1 << 1,
    SACRIFICE_DONE = 1 << 2,
    CHALLENGE_DONE = 1 << 3,
    SURPRISE_MINIBOSS = 1 << 4,
    HAS_WATER = 1 << 5,
    ALT_BOSS_MUSIC = 1 << 6,
    NO_REWARD = 1 << 7,
    FLOODED = 1 << 8,
    PITCH_BLACK = 1 << 9,
    RED_ROOM = 1 << 10,
    DEVIL_TREASURE = 1 << 11,
    USE_ALTERNATE_BACKDROP = 1 << 12,
    CURSED_MIST = 1 << 13,
    MAMA_MEGA = 1 << 14,
    NO_WALLS = 1 << 15,
    ROTGUT_CLEARED = 1 << 16,
    PORTAL_LINKED = 1 << 17,
    BLUE_REDIRECT = 1 << 18
}
____exports.RoomDescriptorFlag = RoomDescriptorFlagInternal
____exports.RoomDescriptorFlagZero = 0
return ____exports
 end,
["lua_modules.isaac-typescript-definitions.dist.src.enums.flags.TargetFlag"] = function(...) 
local ____exports = {}
--- This is represented as an object instead of an enum due to limitations with TypeScript enums. (We
-- want this type to be a child of the `BitFlag` type.)
-- 
-- @enum
-- @notExported
-- @rename TargetFlag
local TargetFlagInternal = {
    ALLOW_SWITCHING = 1 << 0,
    DONT_PRIORITIZE_ENEMIES_CLOSE_TO_PLAYER = 1 << 1,
    PRIORITIZE_ENEMIES_WITH_HIGH_HP = 1 << 2,
    PRIORITIZE_ENEMIES_WITH_LOW_HP = 1 << 3,
    GIVE_LOWER_PRIORITY_TO_CURRENT_TARGET = 1 << 4
}
____exports.TargetFlag = TargetFlagInternal
____exports.TargetFlagZero = 0
return ____exports
 end,
["lua_modules.isaac-typescript-definitions.dist.src.enums.flags.TearFlag"] = function(...) 
local ____exports = {}
local getTearFlag
function getTearFlag(self, shift)
    return shift >= 64 and BitSet128(0, 1 << shift - 64) or BitSet128(1 << shift, 0)
end
--- For `EntityType.TEAR` (2).
-- 
-- This enum was renamed from "TearFlags" to be consistent with the other flag enums.
-- 
-- This is represented as an object instead of an enum due to limitations with TypeScript enums. (We
-- want this type to be a child of the `BitFlag` type. Furthermore, enums cannot be instantiated
-- with `BitSet128` objects.)
-- 
-- Generally, the `TearVariant` affects the graphics of the tear, while the `TearFlag` affects the
-- gameplay mechanic. For example, the Euthanasia collectible grants a chance for needle tears that
-- explode. `TearVariant.NEEDLE` makes the tear look like a needle, and the exploding effect comes
-- from `TearFlag.NEEDLE`.
-- 
-- However, there are some exceptions. For example, Sharp Key makes Isaac shoot key tears that deal
-- extra damage. Both the graphical effect and the extra damage are granted by
-- `TearVariant.KEY_BLOOD`.
-- 
-- @enum
-- @notExported
-- @rename TearFlag
local TearFlagInternal = {
    NORMAL = BitSet128(0, 0),
    SPECTRAL = getTearFlag(nil, 0),
    PIERCING = getTearFlag(nil, 1),
    HOMING = getTearFlag(nil, 2),
    SLOW = getTearFlag(nil, 3),
    POISON = getTearFlag(nil, 4),
    FREEZE = getTearFlag(nil, 5),
    SPLIT = getTearFlag(nil, 6),
    GROW = getTearFlag(nil, 7),
    BOOMERANG = getTearFlag(nil, 8),
    PERSISTENT = getTearFlag(nil, 9),
    WIGGLE = getTearFlag(nil, 10),
    MULLIGAN = getTearFlag(nil, 11),
    EXPLOSIVE = getTearFlag(nil, 12),
    CHARM = getTearFlag(nil, 13),
    CONFUSION = getTearFlag(nil, 14),
    HP_DROP = getTearFlag(nil, 15),
    ORBIT = getTearFlag(nil, 16),
    WAIT = getTearFlag(nil, 17),
    QUAD_SPLIT = getTearFlag(nil, 18),
    BOUNCE = getTearFlag(nil, 19),
    FEAR = getTearFlag(nil, 20),
    SHRINK = getTearFlag(nil, 21),
    BURN = getTearFlag(nil, 22),
    ATTRACTOR = getTearFlag(nil, 23),
    KNOCKBACK = getTearFlag(nil, 24),
    PULSE = getTearFlag(nil, 25),
    SPIRAL = getTearFlag(nil, 26),
    FLAT = getTearFlag(nil, 27),
    SAD_BOMB = getTearFlag(nil, 28),
    BUTT_BOMB = getTearFlag(nil, 29),
    SQUARE = getTearFlag(nil, 30),
    GLOW = getTearFlag(nil, 31),
    GISH = getTearFlag(nil, 32),
    MYSTERIOUS_LIQUID_CREEP = getTearFlag(nil, 33),
    SHIELDED = getTearFlag(nil, 34),
    GLITTER_BOMB = getTearFlag(nil, 35),
    SCATTER_BOMB = getTearFlag(nil, 36),
    STICKY = getTearFlag(nil, 37),
    CONTINUUM = getTearFlag(nil, 38),
    LIGHT_FROM_HEAVEN = getTearFlag(nil, 39),
    COIN_DROP = getTearFlag(nil, 40),
    BLACK_HP_DROP = getTearFlag(nil, 41),
    TRACTOR_BEAM = getTearFlag(nil, 42),
    GODS_FLESH = getTearFlag(nil, 43),
    GREED_COIN = getTearFlag(nil, 44),
    CROSS_BOMB = getTearFlag(nil, 45),
    BIG_SPIRAL = getTearFlag(nil, 46),
    PERMANENT_CONFUSION = getTearFlag(nil, 47),
    BOOGER = getTearFlag(nil, 48),
    EGG = getTearFlag(nil, 49),
    ACID = getTearFlag(nil, 50),
    BONE = getTearFlag(nil, 51),
    BELIAL = getTearFlag(nil, 52),
    MIDAS = getTearFlag(nil, 53),
    NEEDLE = getTearFlag(nil, 54),
    JACOBS = getTearFlag(nil, 55),
    HORN = getTearFlag(nil, 56),
    LASER = getTearFlag(nil, 57),
    POP = getTearFlag(nil, 58),
    ABSORB = getTearFlag(nil, 59),
    LASER_SHOT = getTearFlag(nil, 60),
    HYDRO_BOUNCE = getTearFlag(nil, 61),
    BURST_SPLIT = getTearFlag(nil, 62),
    CREEP_TRAIL = getTearFlag(nil, 63),
    PUNCH = getTearFlag(nil, 64),
    ICE = getTearFlag(nil, 65),
    MAGNETIZE = getTearFlag(nil, 66),
    BAIT = getTearFlag(nil, 67),
    OCCULT = getTearFlag(nil, 68),
    ORBIT_ADVANCED = getTearFlag(nil, 69),
    ROCK = getTearFlag(nil, 70),
    TURN_HORIZONTAL = getTearFlag(nil, 71),
    BLOOD_BOMB = getTearFlag(nil, 72),
    ECOLI = getTearFlag(nil, 73),
    COIN_DROP_DEATH = getTearFlag(nil, 74),
    BRIMSTONE_BOMB = getTearFlag(nil, 75),
    RIFT = getTearFlag(nil, 76),
    SPORE = getTearFlag(nil, 77),
    GHOST_BOMB = getTearFlag(nil, 78),
    CARD_DROP_DEATH = getTearFlag(nil, 79),
    RUNE_DROP_DEATH = getTearFlag(nil, 80),
    TELEPORT = getTearFlag(nil, 81),
    TEAR_DECELERATE = getTearFlag(nil, 82),
    TEAR_ACCELERATE = getTearFlag(nil, 83),
    BOUNCE_WALLS_ONLY = getTearFlag(nil, 104),
    NO_GRID_DAMAGE = getTearFlag(nil, 105),
    BACKSTAB = getTearFlag(nil, 106),
    FETUS_SWORD = getTearFlag(nil, 107),
    FETUS_BONE = getTearFlag(nil, 108),
    FETUS_KNIFE = getTearFlag(nil, 109),
    FETUS_TECH_X = getTearFlag(nil, 110),
    FETUS_TECH = getTearFlag(nil, 111),
    FETUS_BRIMSTONE = getTearFlag(nil, 112),
    FETUS_BOMBER = getTearFlag(nil, 113),
    FETUS = getTearFlag(nil, 114),
    REROLL_ROCK_WISP = getTearFlag(nil, 115),
    MOM_STOMP_WISP = getTearFlag(nil, 116),
    ENEMY_TO_WISP = getTearFlag(nil, 117),
    REROLL_ENEMY = getTearFlag(nil, 118),
    GIGA_BOMB = getTearFlag(nil, 119),
    EXTRA_GORE = getTearFlag(nil, 120),
    RAINBOW = getTearFlag(nil, 121),
    DETONATE = getTearFlag(nil, 122),
    CHAIN = getTearFlag(nil, 123),
    DARK_MATTER = getTearFlag(nil, 124),
    GOLDEN_BOMB = getTearFlag(nil, 125),
    FAST_BOMB = getTearFlag(nil, 126),
    LUDOVICO = getTearFlag(nil, 127)
}
____exports.TearFlag = TearFlagInternal
____exports.TearFlagZero = ____exports.TearFlag.NORMAL
return ____exports
 end,
["lua_modules.isaac-typescript-definitions.dist.src.enums.flags.UseFlag"] = function(...) 
local ____exports = {}
--- This is represented as an object instead of an enum due to limitations with TypeScript enums. (We
-- want this type to be a child of the `BitFlag` type.)
-- 
-- @enum
-- @notExported
-- @rename UseFlag
local UseFlagInternal = {
    NO_ANIMATION = 1 << 0,
    NO_COSTUME = 1 << 1,
    OWNED = 1 << 2,
    ALLOW_NON_MAIN_PLAYERS = 1 << 3,
    REMOVE_ACTIVE = 1 << 4,
    CAR_BATTERY = 1 << 5,
    VOID = 1 << 6,
    MIMIC = 1 << 7,
    NO_ANNOUNCER_VOICE = 1 << 8,
    ALLOW_WISP_SPAWN = 1 << 9,
    CUSTOM_VARDATA = 1 << 10,
    NO_HUD = 1 << 11
}
____exports.UseFlag = UseFlagInternal
____exports.UseFlagZero = 0
return ____exports
 end,
["lua_modules.isaac-typescript-definitions.dist.src.enums.GameStateFlag"] = function(...) 
local ____exports = {}
--- Used with the `Game.GetStateFlag` and `Game.SetStateFlag` methods.
____exports.GameStateFlag = {}
____exports.GameStateFlag.FAMINE_SPAWNED = 0
____exports.GameStateFlag[____exports.GameStateFlag.FAMINE_SPAWNED] = "FAMINE_SPAWNED"
____exports.GameStateFlag.PESTILENCE_SPAWNED = 1
____exports.GameStateFlag[____exports.GameStateFlag.PESTILENCE_SPAWNED] = "PESTILENCE_SPAWNED"
____exports.GameStateFlag.WAR_SPAWNED = 2
____exports.GameStateFlag[____exports.GameStateFlag.WAR_SPAWNED] = "WAR_SPAWNED"
____exports.GameStateFlag.DEATH_SPAWNED = 3
____exports.GameStateFlag[____exports.GameStateFlag.DEATH_SPAWNED] = "DEATH_SPAWNED"
____exports.GameStateFlag.BOSS_POOL_SWITCHED = 4
____exports.GameStateFlag[____exports.GameStateFlag.BOSS_POOL_SWITCHED] = "BOSS_POOL_SWITCHED"
____exports.GameStateFlag.DEVIL_ROOM_SPAWNED = 5
____exports.GameStateFlag[____exports.GameStateFlag.DEVIL_ROOM_SPAWNED] = "DEVIL_ROOM_SPAWNED"
____exports.GameStateFlag.DEVIL_ROOM_VISITED = 6
____exports.GameStateFlag[____exports.GameStateFlag.DEVIL_ROOM_VISITED] = "DEVIL_ROOM_VISITED"
____exports.GameStateFlag.BOOK_REVELATIONS_USED = 7
____exports.GameStateFlag[____exports.GameStateFlag.BOOK_REVELATIONS_USED] = "BOOK_REVELATIONS_USED"
____exports.GameStateFlag.BOOK_PICKED_UP = 8
____exports.GameStateFlag[____exports.GameStateFlag.BOOK_PICKED_UP] = "BOOK_PICKED_UP"
____exports.GameStateFlag.WRATH_SPAWNED = 9
____exports.GameStateFlag[____exports.GameStateFlag.WRATH_SPAWNED] = "WRATH_SPAWNED"
____exports.GameStateFlag.GLUTTONY_SPAWNED = 10
____exports.GameStateFlag[____exports.GameStateFlag.GLUTTONY_SPAWNED] = "GLUTTONY_SPAWNED"
____exports.GameStateFlag.LUST_SPAWNED = 11
____exports.GameStateFlag[____exports.GameStateFlag.LUST_SPAWNED] = "LUST_SPAWNED"
____exports.GameStateFlag.SLOTH_SPAWNED = 12
____exports.GameStateFlag[____exports.GameStateFlag.SLOTH_SPAWNED] = "SLOTH_SPAWNED"
____exports.GameStateFlag.ENVY_SPAWNED = 13
____exports.GameStateFlag[____exports.GameStateFlag.ENVY_SPAWNED] = "ENVY_SPAWNED"
____exports.GameStateFlag.PRIDE_SPAWNED = 14
____exports.GameStateFlag[____exports.GameStateFlag.PRIDE_SPAWNED] = "PRIDE_SPAWNED"
____exports.GameStateFlag.GREED_SPAWNED = 15
____exports.GameStateFlag[____exports.GameStateFlag.GREED_SPAWNED] = "GREED_SPAWNED"
____exports.GameStateFlag.SUPER_GREED_SPAWNED = 16
____exports.GameStateFlag[____exports.GameStateFlag.SUPER_GREED_SPAWNED] = "SUPER_GREED_SPAWNED"
____exports.GameStateFlag.DONATION_SLOT_BROKEN = 17
____exports.GameStateFlag[____exports.GameStateFlag.DONATION_SLOT_BROKEN] = "DONATION_SLOT_BROKEN"
____exports.GameStateFlag.DONATION_SLOT_JAMMED = 18
____exports.GameStateFlag[____exports.GameStateFlag.DONATION_SLOT_JAMMED] = "DONATION_SLOT_JAMMED"
____exports.GameStateFlag.HEAVEN_PATH = 19
____exports.GameStateFlag[____exports.GameStateFlag.HEAVEN_PATH] = "HEAVEN_PATH"
____exports.GameStateFlag.REBIRTH_BOSS_SWITCHED = 20
____exports.GameStateFlag[____exports.GameStateFlag.REBIRTH_BOSS_SWITCHED] = "REBIRTH_BOSS_SWITCHED"
____exports.GameStateFlag.HAUNT_SELECTED = 21
____exports.GameStateFlag[____exports.GameStateFlag.HAUNT_SELECTED] = "HAUNT_SELECTED"
____exports.GameStateFlag.ADVERSARY_SELECTED = 22
____exports.GameStateFlag[____exports.GameStateFlag.ADVERSARY_SELECTED] = "ADVERSARY_SELECTED"
____exports.GameStateFlag.MR_FRED_SELECTED = 23
____exports.GameStateFlag[____exports.GameStateFlag.MR_FRED_SELECTED] = "MR_FRED_SELECTED"
____exports.GameStateFlag.MAMA_GURDY_SELECTED = 24
____exports.GameStateFlag[____exports.GameStateFlag.MAMA_GURDY_SELECTED] = "MAMA_GURDY_SELECTED"
____exports.GameStateFlag.URIEL_SPAWNED = 25
____exports.GameStateFlag[____exports.GameStateFlag.URIEL_SPAWNED] = "URIEL_SPAWNED"
____exports.GameStateFlag.GABRIEL_SPAWNED = 26
____exports.GameStateFlag[____exports.GameStateFlag.GABRIEL_SPAWNED] = "GABRIEL_SPAWNED"
____exports.GameStateFlag.FALLEN_SPAWNED = 27
____exports.GameStateFlag[____exports.GameStateFlag.FALLEN_SPAWNED] = "FALLEN_SPAWNED"
____exports.GameStateFlag.HEADLESS_HORSEMAN_SPAWNED = 28
____exports.GameStateFlag[____exports.GameStateFlag.HEADLESS_HORSEMAN_SPAWNED] = "HEADLESS_HORSEMAN_SPAWNED"
____exports.GameStateFlag.KRAMPUS_SPAWNED = 29
____exports.GameStateFlag[____exports.GameStateFlag.KRAMPUS_SPAWNED] = "KRAMPUS_SPAWNED"
____exports.GameStateFlag.DONATION_SLOT_BLOWN = 30
____exports.GameStateFlag[____exports.GameStateFlag.DONATION_SLOT_BLOWN] = "DONATION_SLOT_BLOWN"
____exports.GameStateFlag.SHOPKEEPER_KILLED = 31
____exports.GameStateFlag[____exports.GameStateFlag.SHOPKEEPER_KILLED] = "SHOPKEEPER_KILLED"
____exports.GameStateFlag.ULTRA_PRIDE_SPAWNED = 32
____exports.GameStateFlag[____exports.GameStateFlag.ULTRA_PRIDE_SPAWNED] = "ULTRA_PRIDE_SPAWNED"
____exports.GameStateFlag.BOSS_RUSH_DONE = 33
____exports.GameStateFlag[____exports.GameStateFlag.BOSS_RUSH_DONE] = "BOSS_RUSH_DONE"
____exports.GameStateFlag.GREED_SLOT_JAMMED = 34
____exports.GameStateFlag[____exports.GameStateFlag.GREED_SLOT_JAMMED] = "GREED_SLOT_JAMMED"
____exports.GameStateFlag.AFTERBIRTH_BOSS_SWITCHED = 35
____exports.GameStateFlag[____exports.GameStateFlag.AFTERBIRTH_BOSS_SWITCHED] = "AFTERBIRTH_BOSS_SWITCHED"
____exports.GameStateFlag.BROWNIE_SELECTED = 36
____exports.GameStateFlag[____exports.GameStateFlag.BROWNIE_SELECTED] = "BROWNIE_SELECTED"
____exports.GameStateFlag.SUPER_BUM_APPEARED = 37
____exports.GameStateFlag[____exports.GameStateFlag.SUPER_BUM_APPEARED] = "SUPER_BUM_APPEARED"
____exports.GameStateFlag.BOSS_RUSH_DOOR_SPAWNED = 38
____exports.GameStateFlag[____exports.GameStateFlag.BOSS_RUSH_DOOR_SPAWNED] = "BOSS_RUSH_DOOR_SPAWNED"
____exports.GameStateFlag.BLUE_WOMB_DOOR_SPAWNED = 39
____exports.GameStateFlag[____exports.GameStateFlag.BLUE_WOMB_DOOR_SPAWNED] = "BLUE_WOMB_DOOR_SPAWNED"
____exports.GameStateFlag.BLUE_WOMB_DONE = 40
____exports.GameStateFlag[____exports.GameStateFlag.BLUE_WOMB_DONE] = "BLUE_WOMB_DONE"
____exports.GameStateFlag.HEART_BOMB_COIN_PICKED = 41
____exports.GameStateFlag[____exports.GameStateFlag.HEART_BOMB_COIN_PICKED] = "HEART_BOMB_COIN_PICKED"
____exports.GameStateFlag.AFTERBIRTH_PLUS_BOSS_SWITCHED = 42
____exports.GameStateFlag[____exports.GameStateFlag.AFTERBIRTH_PLUS_BOSS_SWITCHED] = "AFTERBIRTH_PLUS_BOSS_SWITCHED"
____exports.GameStateFlag.MAX_COINS_OBTAINED = 43
____exports.GameStateFlag[____exports.GameStateFlag.MAX_COINS_OBTAINED] = "MAX_COINS_OBTAINED"
____exports.GameStateFlag.SECRET_PATH = 44
____exports.GameStateFlag[____exports.GameStateFlag.SECRET_PATH] = "SECRET_PATH"
____exports.GameStateFlag.PERFECTION_SPAWNED = 45
____exports.GameStateFlag[____exports.GameStateFlag.PERFECTION_SPAWNED] = "PERFECTION_SPAWNED"
____exports.GameStateFlag.MAUSOLEUM_HEART_KILLED = 46
____exports.GameStateFlag[____exports.GameStateFlag.MAUSOLEUM_HEART_KILLED] = "MAUSOLEUM_HEART_KILLED"
____exports.GameStateFlag.BACKWARDS_PATH_INIT = 47
____exports.GameStateFlag[____exports.GameStateFlag.BACKWARDS_PATH_INIT] = "BACKWARDS_PATH_INIT"
____exports.GameStateFlag.BACKWARDS_PATH = 48
____exports.GameStateFlag[____exports.GameStateFlag.BACKWARDS_PATH] = "BACKWARDS_PATH"
return ____exports
 end,
["lua_modules.isaac-typescript-definitions.dist.src.enums.GridCollisionClass"] = function(...) 
local ____exports = {}
____exports.GridCollisionClass = {}
____exports.GridCollisionClass.NONE = 0
____exports.GridCollisionClass[____exports.GridCollisionClass.NONE] = "NONE"
____exports.GridCollisionClass.PIT = 1
____exports.GridCollisionClass[____exports.GridCollisionClass.PIT] = "PIT"
____exports.GridCollisionClass.OBJECT = 2
____exports.GridCollisionClass[____exports.GridCollisionClass.OBJECT] = "OBJECT"
____exports.GridCollisionClass.SOLID = 3
____exports.GridCollisionClass[____exports.GridCollisionClass.SOLID] = "SOLID"
____exports.GridCollisionClass.WALL = 4
____exports.GridCollisionClass[____exports.GridCollisionClass.WALL] = "WALL"
____exports.GridCollisionClass.WALL_EXCEPT_PLAYER = 5
____exports.GridCollisionClass[____exports.GridCollisionClass.WALL_EXCEPT_PLAYER] = "WALL_EXCEPT_PLAYER"
return ____exports
 end,
["lua_modules.isaac-typescript-definitions.dist.src.enums.GridEntityType"] = function(...) 
local ____exports = {}
____exports.GridEntityType = {}
____exports.GridEntityType.NULL = 0
____exports.GridEntityType[____exports.GridEntityType.NULL] = "NULL"
____exports.GridEntityType.DECORATION = 1
____exports.GridEntityType[____exports.GridEntityType.DECORATION] = "DECORATION"
____exports.GridEntityType.ROCK = 2
____exports.GridEntityType[____exports.GridEntityType.ROCK] = "ROCK"
____exports.GridEntityType.BLOCK = 3
____exports.GridEntityType[____exports.GridEntityType.BLOCK] = "BLOCK"
____exports.GridEntityType.ROCK_TINTED = 4
____exports.GridEntityType[____exports.GridEntityType.ROCK_TINTED] = "ROCK_TINTED"
____exports.GridEntityType.ROCK_BOMB = 5
____exports.GridEntityType[____exports.GridEntityType.ROCK_BOMB] = "ROCK_BOMB"
____exports.GridEntityType.ROCK_ALT = 6
____exports.GridEntityType[____exports.GridEntityType.ROCK_ALT] = "ROCK_ALT"
____exports.GridEntityType.PIT = 7
____exports.GridEntityType[____exports.GridEntityType.PIT] = "PIT"
____exports.GridEntityType.SPIKES = 8
____exports.GridEntityType[____exports.GridEntityType.SPIKES] = "SPIKES"
____exports.GridEntityType.SPIKES_ON_OFF = 9
____exports.GridEntityType[____exports.GridEntityType.SPIKES_ON_OFF] = "SPIKES_ON_OFF"
____exports.GridEntityType.SPIDER_WEB = 10
____exports.GridEntityType[____exports.GridEntityType.SPIDER_WEB] = "SPIDER_WEB"
____exports.GridEntityType.LOCK = 11
____exports.GridEntityType[____exports.GridEntityType.LOCK] = "LOCK"
____exports.GridEntityType.TNT = 12
____exports.GridEntityType[____exports.GridEntityType.TNT] = "TNT"
____exports.GridEntityType.FIREPLACE = 13
____exports.GridEntityType[____exports.GridEntityType.FIREPLACE] = "FIREPLACE"
____exports.GridEntityType.POOP = 14
____exports.GridEntityType[____exports.GridEntityType.POOP] = "POOP"
____exports.GridEntityType.WALL = 15
____exports.GridEntityType[____exports.GridEntityType.WALL] = "WALL"
____exports.GridEntityType.DOOR = 16
____exports.GridEntityType[____exports.GridEntityType.DOOR] = "DOOR"
____exports.GridEntityType.TRAPDOOR = 17
____exports.GridEntityType[____exports.GridEntityType.TRAPDOOR] = "TRAPDOOR"
____exports.GridEntityType.CRAWL_SPACE = 18
____exports.GridEntityType[____exports.GridEntityType.CRAWL_SPACE] = "CRAWL_SPACE"
____exports.GridEntityType.GRAVITY = 19
____exports.GridEntityType[____exports.GridEntityType.GRAVITY] = "GRAVITY"
____exports.GridEntityType.PRESSURE_PLATE = 20
____exports.GridEntityType[____exports.GridEntityType.PRESSURE_PLATE] = "PRESSURE_PLATE"
____exports.GridEntityType.STATUE = 21
____exports.GridEntityType[____exports.GridEntityType.STATUE] = "STATUE"
____exports.GridEntityType.ROCK_SUPER_SPECIAL = 22
____exports.GridEntityType[____exports.GridEntityType.ROCK_SUPER_SPECIAL] = "ROCK_SUPER_SPECIAL"
____exports.GridEntityType.TELEPORTER = 23
____exports.GridEntityType[____exports.GridEntityType.TELEPORTER] = "TELEPORTER"
____exports.GridEntityType.PILLAR = 24
____exports.GridEntityType[____exports.GridEntityType.PILLAR] = "PILLAR"
____exports.GridEntityType.ROCK_SPIKED = 25
____exports.GridEntityType[____exports.GridEntityType.ROCK_SPIKED] = "ROCK_SPIKED"
____exports.GridEntityType.ROCK_ALT_2 = 26
____exports.GridEntityType[____exports.GridEntityType.ROCK_ALT_2] = "ROCK_ALT_2"
____exports.GridEntityType.ROCK_GOLD = 27
____exports.GridEntityType[____exports.GridEntityType.ROCK_GOLD] = "ROCK_GOLD"
return ____exports
 end,
["lua_modules.isaac-typescript-definitions.dist.src.enums.GridEntityXMLType"] = function(...) 
local ____exports = {}
--- The type of a grid entity as represented in a room XML/STB file.
-- 
-- This is converted by the game to the GridEntityType enum.
-- 
-- The `gridspawn` console command accepts `GridEntityXMLType` instead of `GridEntityType`.
____exports.GridEntityXMLType = {}
____exports.GridEntityXMLType.DECORATION = 0
____exports.GridEntityXMLType[____exports.GridEntityXMLType.DECORATION] = "DECORATION"
____exports.GridEntityXMLType.ROCK = 1000
____exports.GridEntityXMLType[____exports.GridEntityXMLType.ROCK] = "ROCK"
____exports.GridEntityXMLType.ROCK_BOMB = 1001
____exports.GridEntityXMLType[____exports.GridEntityXMLType.ROCK_BOMB] = "ROCK_BOMB"
____exports.GridEntityXMLType.ROCK_ALT = 1002
____exports.GridEntityXMLType[____exports.GridEntityXMLType.ROCK_ALT] = "ROCK_ALT"
____exports.GridEntityXMLType.ROCK_TINTED = 1003
____exports.GridEntityXMLType[____exports.GridEntityXMLType.ROCK_TINTED] = "ROCK_TINTED"
____exports.GridEntityXMLType.ROCK_ALT_2 = 1008
____exports.GridEntityXMLType[____exports.GridEntityXMLType.ROCK_ALT_2] = "ROCK_ALT_2"
____exports.GridEntityXMLType.ROCK_EVENT = 1009
____exports.GridEntityXMLType[____exports.GridEntityXMLType.ROCK_EVENT] = "ROCK_EVENT"
____exports.GridEntityXMLType.ROCK_SPIKED = 1010
____exports.GridEntityXMLType[____exports.GridEntityXMLType.ROCK_SPIKED] = "ROCK_SPIKED"
____exports.GridEntityXMLType.ROCK_GOLD = 1011
____exports.GridEntityXMLType[____exports.GridEntityXMLType.ROCK_GOLD] = "ROCK_GOLD"
____exports.GridEntityXMLType.TNT = 1300
____exports.GridEntityXMLType[____exports.GridEntityXMLType.TNT] = "TNT"
____exports.GridEntityXMLType.FIREPLACE = 1400
____exports.GridEntityXMLType[____exports.GridEntityXMLType.FIREPLACE] = "FIREPLACE"
____exports.GridEntityXMLType.RED_FIREPLACE = 1410
____exports.GridEntityXMLType[____exports.GridEntityXMLType.RED_FIREPLACE] = "RED_FIREPLACE"
____exports.GridEntityXMLType.POOP_RED = 1490
____exports.GridEntityXMLType[____exports.GridEntityXMLType.POOP_RED] = "POOP_RED"
____exports.GridEntityXMLType.POOP_RAINBOW = 1494
____exports.GridEntityXMLType[____exports.GridEntityXMLType.POOP_RAINBOW] = "POOP_RAINBOW"
____exports.GridEntityXMLType.POOP_CORN = 1495
____exports.GridEntityXMLType[____exports.GridEntityXMLType.POOP_CORN] = "POOP_CORN"
____exports.GridEntityXMLType.POOP_GOLDEN = 1496
____exports.GridEntityXMLType[____exports.GridEntityXMLType.POOP_GOLDEN] = "POOP_GOLDEN"
____exports.GridEntityXMLType.POOP_BLACK = 1497
____exports.GridEntityXMLType[____exports.GridEntityXMLType.POOP_BLACK] = "POOP_BLACK"
____exports.GridEntityXMLType.POOP_WHITE = 1498
____exports.GridEntityXMLType[____exports.GridEntityXMLType.POOP_WHITE] = "POOP_WHITE"
____exports.GridEntityXMLType.POOP_GIGA = 1499
____exports.GridEntityXMLType[____exports.GridEntityXMLType.POOP_GIGA] = "POOP_GIGA"
____exports.GridEntityXMLType.POOP = 1500
____exports.GridEntityXMLType[____exports.GridEntityXMLType.POOP] = "POOP"
____exports.GridEntityXMLType.POOP_CHARMING = 1501
____exports.GridEntityXMLType[____exports.GridEntityXMLType.POOP_CHARMING] = "POOP_CHARMING"
____exports.GridEntityXMLType.BLOCK = 1900
____exports.GridEntityXMLType[____exports.GridEntityXMLType.BLOCK] = "BLOCK"
____exports.GridEntityXMLType.PILLAR = 1901
____exports.GridEntityXMLType[____exports.GridEntityXMLType.PILLAR] = "PILLAR"
____exports.GridEntityXMLType.SPIKES = 1930
____exports.GridEntityXMLType[____exports.GridEntityXMLType.SPIKES] = "SPIKES"
____exports.GridEntityXMLType.SPIKES_ON_OFF = 1931
____exports.GridEntityXMLType[____exports.GridEntityXMLType.SPIKES_ON_OFF] = "SPIKES_ON_OFF"
____exports.GridEntityXMLType.SPIDER_WEB = 1940
____exports.GridEntityXMLType[____exports.GridEntityXMLType.SPIDER_WEB] = "SPIDER_WEB"
____exports.GridEntityXMLType.WALL = 1999
____exports.GridEntityXMLType[____exports.GridEntityXMLType.WALL] = "WALL"
____exports.GridEntityXMLType.PIT = 3000
____exports.GridEntityXMLType[____exports.GridEntityXMLType.PIT] = "PIT"
____exports.GridEntityXMLType.FISSURE_SPAWNER = 3001
____exports.GridEntityXMLType[____exports.GridEntityXMLType.FISSURE_SPAWNER] = "FISSURE_SPAWNER"
____exports.GridEntityXMLType.PIT_EVENT = 3009
____exports.GridEntityXMLType[____exports.GridEntityXMLType.PIT_EVENT] = "PIT_EVENT"
____exports.GridEntityXMLType.LOCK = 4000
____exports.GridEntityXMLType[____exports.GridEntityXMLType.LOCK] = "LOCK"
____exports.GridEntityXMLType.PRESSURE_PLATE = 4500
____exports.GridEntityXMLType[____exports.GridEntityXMLType.PRESSURE_PLATE] = "PRESSURE_PLATE"
____exports.GridEntityXMLType.STATUE_DEVIL = 5000
____exports.GridEntityXMLType[____exports.GridEntityXMLType.STATUE_DEVIL] = "STATUE_DEVIL"
____exports.GridEntityXMLType.STATUE_ANGEL = 5001
____exports.GridEntityXMLType[____exports.GridEntityXMLType.STATUE_ANGEL] = "STATUE_ANGEL"
____exports.GridEntityXMLType.TELEPORTER = 6100
____exports.GridEntityXMLType[____exports.GridEntityXMLType.TELEPORTER] = "TELEPORTER"
____exports.GridEntityXMLType.TRAPDOOR = 9000
____exports.GridEntityXMLType[____exports.GridEntityXMLType.TRAPDOOR] = "TRAPDOOR"
____exports.GridEntityXMLType.CRAWL_SPACE = 9100
____exports.GridEntityXMLType[____exports.GridEntityXMLType.CRAWL_SPACE] = "CRAWL_SPACE"
____exports.GridEntityXMLType.GRAVITY = 10000
____exports.GridEntityXMLType[____exports.GridEntityXMLType.GRAVITY] = "GRAVITY"
return ____exports
 end,
["lua_modules.isaac-typescript-definitions.dist.src.enums.GridPath"] = function(...) 
local ____exports = {}
--- GridPath is not an enum, but rather a variable integer that represents the cost it would take for
-- an entity to pass through a grid entity. This enum lists some standard cost values that the
-- vanilla game uses.
____exports.GridPath = {}
____exports.GridPath.NONE = 0
____exports.GridPath[____exports.GridPath.NONE] = "NONE"
____exports.GridPath.WALKED_TILE = 900
____exports.GridPath[____exports.GridPath.WALKED_TILE] = "WALKED_TILE"
____exports.GridPath.FIREPLACE = 950
____exports.GridPath[____exports.GridPath.FIREPLACE] = "FIREPLACE"
____exports.GridPath.ROCK = 1000
____exports.GridPath[____exports.GridPath.ROCK] = "ROCK"
____exports.GridPath.PIT = 3000
____exports.GridPath[____exports.GridPath.PIT] = "PIT"
____exports.GridPath.GRIMACE = 3999
____exports.GridPath[____exports.GridPath.GRIMACE] = "GRIMACE"
return ____exports
 end,
["lua_modules.isaac-typescript-definitions.dist.src.enums.GridRoom"] = function(...) 
local ____exports = {}
____exports.GridRoom = {}
____exports.GridRoom.DEVIL = -1
____exports.GridRoom[____exports.GridRoom.DEVIL] = "DEVIL"
____exports.GridRoom.ERROR = -2
____exports.GridRoom[____exports.GridRoom.ERROR] = "ERROR"
____exports.GridRoom.DEBUG = -3
____exports.GridRoom[____exports.GridRoom.DEBUG] = "DEBUG"
____exports.GridRoom.DUNGEON = -4
____exports.GridRoom[____exports.GridRoom.DUNGEON] = "DUNGEON"
____exports.GridRoom.BOSS_RUSH = -5
____exports.GridRoom[____exports.GridRoom.BOSS_RUSH] = "BOSS_RUSH"
____exports.GridRoom.BLACK_MARKET = -6
____exports.GridRoom[____exports.GridRoom.BLACK_MARKET] = "BLACK_MARKET"
____exports.GridRoom.MEGA_SATAN = -7
____exports.GridRoom[____exports.GridRoom.MEGA_SATAN] = "MEGA_SATAN"
____exports.GridRoom.BLUE_WOMB = -8
____exports.GridRoom[____exports.GridRoom.BLUE_WOMB] = "BLUE_WOMB"
____exports.GridRoom.THE_VOID = -9
____exports.GridRoom[____exports.GridRoom.THE_VOID] = "THE_VOID"
____exports.GridRoom.SECRET_EXIT = -10
____exports.GridRoom[____exports.GridRoom.SECRET_EXIT] = "SECRET_EXIT"
____exports.GridRoom.GIDEON_DUNGEON = -11
____exports.GridRoom[____exports.GridRoom.GIDEON_DUNGEON] = "GIDEON_DUNGEON"
____exports.GridRoom.GENESIS = -12
____exports.GridRoom[____exports.GridRoom.GENESIS] = "GENESIS"
____exports.GridRoom.SECRET_SHOP = -13
____exports.GridRoom[____exports.GridRoom.SECRET_SHOP] = "SECRET_SHOP"
____exports.GridRoom.ROTGUT_DUNGEON_1 = -14
____exports.GridRoom[____exports.GridRoom.ROTGUT_DUNGEON_1] = "ROTGUT_DUNGEON_1"
____exports.GridRoom.ROTGUT_DUNGEON_2 = -15
____exports.GridRoom[____exports.GridRoom.ROTGUT_DUNGEON_2] = "ROTGUT_DUNGEON_2"
____exports.GridRoom.BLUE_ROOM = -16
____exports.GridRoom[____exports.GridRoom.BLUE_ROOM] = "BLUE_ROOM"
____exports.GridRoom.EXTRA_BOSS = -17
____exports.GridRoom[____exports.GridRoom.EXTRA_BOSS] = "EXTRA_BOSS"
____exports.GridRoom.ANGEL_SHOP = -18
____exports.GridRoom[____exports.GridRoom.ANGEL_SHOP] = "ANGEL_SHOP"
return ____exports
 end,
["lua_modules.isaac-typescript-definitions.dist.src.enums.InputHook"] = function(...) 
local ____exports = {}
____exports.InputHook = {}
____exports.InputHook.IS_ACTION_PRESSED = 0
____exports.InputHook[____exports.InputHook.IS_ACTION_PRESSED] = "IS_ACTION_PRESSED"
____exports.InputHook.IS_ACTION_TRIGGERED = 1
____exports.InputHook[____exports.InputHook.IS_ACTION_TRIGGERED] = "IS_ACTION_TRIGGERED"
____exports.InputHook.GET_ACTION_VALUE = 2
____exports.InputHook[____exports.InputHook.GET_ACTION_VALUE] = "GET_ACTION_VALUE"
return ____exports
 end,
["lua_modules.isaac-typescript-definitions.dist.src.enums.ItemConfigCardType"] = function(...) 
local ____exports = {}
--- Corresponds to the "type" attribute in the "pocketitems.xml" file.
-- 
-- Matches the `ItemConfig.CARDTYPE_` members of the `ItemConfig` class. In IsaacScript, we
-- reimplement this as an enum instead, since it is cleaner.
-- 
-- Note that this enum is not to be confused with the `CardType` enum; the latter denotes the
-- in-game sub-type of the card, which is completely different.
____exports.ItemConfigCardType = {}
____exports.ItemConfigCardType.NULL = -1
____exports.ItemConfigCardType[____exports.ItemConfigCardType.NULL] = "NULL"
____exports.ItemConfigCardType.TAROT = 0
____exports.ItemConfigCardType[____exports.ItemConfigCardType.TAROT] = "TAROT"
____exports.ItemConfigCardType.SUIT = 1
____exports.ItemConfigCardType[____exports.ItemConfigCardType.SUIT] = "SUIT"
____exports.ItemConfigCardType.RUNE = 2
____exports.ItemConfigCardType[____exports.ItemConfigCardType.RUNE] = "RUNE"
____exports.ItemConfigCardType.SPECIAL = 3
____exports.ItemConfigCardType[____exports.ItemConfigCardType.SPECIAL] = "SPECIAL"
____exports.ItemConfigCardType.SPECIAL_OBJECT = 4
____exports.ItemConfigCardType[____exports.ItemConfigCardType.SPECIAL_OBJECT] = "SPECIAL_OBJECT"
____exports.ItemConfigCardType.TAROT_REVERSE = 5
____exports.ItemConfigCardType[____exports.ItemConfigCardType.TAROT_REVERSE] = "TAROT_REVERSE"
____exports.ItemConfigCardType.MODDED = 7
____exports.ItemConfigCardType[____exports.ItemConfigCardType.MODDED] = "MODDED"
return ____exports
 end,
["lua_modules.isaac-typescript-definitions.dist.src.enums.ItemConfigChargeType"] = function(...) 
local ____exports = {}
--- Matches the `ItemConfig.CHARGE_` members of the `ItemConfig` class. In IsaacScript, we
-- reimplement this as an enum instead, since it is cleaner.
____exports.ItemConfigChargeType = {}
____exports.ItemConfigChargeType.NORMAL = 0
____exports.ItemConfigChargeType[____exports.ItemConfigChargeType.NORMAL] = "NORMAL"
____exports.ItemConfigChargeType.TIMED = 1
____exports.ItemConfigChargeType[____exports.ItemConfigChargeType.TIMED] = "TIMED"
____exports.ItemConfigChargeType.SPECIAL = 2
____exports.ItemConfigChargeType[____exports.ItemConfigChargeType.SPECIAL] = "SPECIAL"
return ____exports
 end,
["lua_modules.isaac-typescript-definitions.dist.src.enums.ItemConfigPillEffectClass"] = function(...) 
local ____exports = {}
--- This corresponds to the number in the "class" tag in the "pocketitems.xml" file. The "+" or "-"
-- part of the tag is contained within the `ItemConfigPillEffectType` enum.
____exports.ItemConfigPillEffectClass = {}
____exports.ItemConfigPillEffectClass.NULL = -1
____exports.ItemConfigPillEffectClass[____exports.ItemConfigPillEffectClass.NULL] = "NULL"
____exports.ItemConfigPillEffectClass.JOKE = 0
____exports.ItemConfigPillEffectClass[____exports.ItemConfigPillEffectClass.JOKE] = "JOKE"
____exports.ItemConfigPillEffectClass.MINOR = 1
____exports.ItemConfigPillEffectClass[____exports.ItemConfigPillEffectClass.MINOR] = "MINOR"
____exports.ItemConfigPillEffectClass.MEDIUM = 2
____exports.ItemConfigPillEffectClass[____exports.ItemConfigPillEffectClass.MEDIUM] = "MEDIUM"
____exports.ItemConfigPillEffectClass.MAJOR = 3
____exports.ItemConfigPillEffectClass[____exports.ItemConfigPillEffectClass.MAJOR] = "MAJOR"
____exports.ItemConfigPillEffectClass.MODDED = 4
____exports.ItemConfigPillEffectClass[____exports.ItemConfigPillEffectClass.MODDED] = "MODDED"
return ____exports
 end,
["lua_modules.isaac-typescript-definitions.dist.src.enums.ItemConfigPillEffectType"] = function(...) 
local ____exports = {}
--- This corresponds to the suffix of the "class" tag in the "pocketitems.xml" file. "+" is equal to
-- `POSITIVE`, "-" is equal to `NEGATIVE`, and no suffix is equal to `NEUTRAL`.
____exports.ItemConfigPillEffectType = {}
____exports.ItemConfigPillEffectType.NULL = -1
____exports.ItemConfigPillEffectType[____exports.ItemConfigPillEffectType.NULL] = "NULL"
____exports.ItemConfigPillEffectType.POSITIVE = 0
____exports.ItemConfigPillEffectType[____exports.ItemConfigPillEffectType.POSITIVE] = "POSITIVE"
____exports.ItemConfigPillEffectType.NEGATIVE = 1
____exports.ItemConfigPillEffectType[____exports.ItemConfigPillEffectType.NEGATIVE] = "NEGATIVE"
____exports.ItemConfigPillEffectType.NEUTRAL = 2
____exports.ItemConfigPillEffectType[____exports.ItemConfigPillEffectType.NEUTRAL] = "NEUTRAL"
____exports.ItemConfigPillEffectType.MODDED = 3
____exports.ItemConfigPillEffectType[____exports.ItemConfigPillEffectType.MODDED] = "MODDED"
return ____exports
 end,
["lua_modules.isaac-typescript-definitions.dist.src.enums.ItemPoolType"] = function(...) 
local ____exports = {}
____exports.ItemPoolType = {}
____exports.ItemPoolType.TREASURE = 0
____exports.ItemPoolType[____exports.ItemPoolType.TREASURE] = "TREASURE"
____exports.ItemPoolType.SHOP = 1
____exports.ItemPoolType[____exports.ItemPoolType.SHOP] = "SHOP"
____exports.ItemPoolType.BOSS = 2
____exports.ItemPoolType[____exports.ItemPoolType.BOSS] = "BOSS"
____exports.ItemPoolType.DEVIL = 3
____exports.ItemPoolType[____exports.ItemPoolType.DEVIL] = "DEVIL"
____exports.ItemPoolType.ANGEL = 4
____exports.ItemPoolType[____exports.ItemPoolType.ANGEL] = "ANGEL"
____exports.ItemPoolType.SECRET = 5
____exports.ItemPoolType[____exports.ItemPoolType.SECRET] = "SECRET"
____exports.ItemPoolType.LIBRARY = 6
____exports.ItemPoolType[____exports.ItemPoolType.LIBRARY] = "LIBRARY"
____exports.ItemPoolType.SHELL_GAME = 7
____exports.ItemPoolType[____exports.ItemPoolType.SHELL_GAME] = "SHELL_GAME"
____exports.ItemPoolType.GOLDEN_CHEST = 8
____exports.ItemPoolType[____exports.ItemPoolType.GOLDEN_CHEST] = "GOLDEN_CHEST"
____exports.ItemPoolType.RED_CHEST = 9
____exports.ItemPoolType[____exports.ItemPoolType.RED_CHEST] = "RED_CHEST"
____exports.ItemPoolType.BEGGAR = 10
____exports.ItemPoolType[____exports.ItemPoolType.BEGGAR] = "BEGGAR"
____exports.ItemPoolType.DEMON_BEGGAR = 11
____exports.ItemPoolType[____exports.ItemPoolType.DEMON_BEGGAR] = "DEMON_BEGGAR"
____exports.ItemPoolType.CURSE = 12
____exports.ItemPoolType[____exports.ItemPoolType.CURSE] = "CURSE"
____exports.ItemPoolType.KEY_MASTER = 13
____exports.ItemPoolType[____exports.ItemPoolType.KEY_MASTER] = "KEY_MASTER"
____exports.ItemPoolType.BATTERY_BUM = 14
____exports.ItemPoolType[____exports.ItemPoolType.BATTERY_BUM] = "BATTERY_BUM"
____exports.ItemPoolType.MOMS_CHEST = 15
____exports.ItemPoolType[____exports.ItemPoolType.MOMS_CHEST] = "MOMS_CHEST"
____exports.ItemPoolType.GREED_TREASURE = 16
____exports.ItemPoolType[____exports.ItemPoolType.GREED_TREASURE] = "GREED_TREASURE"
____exports.ItemPoolType.GREED_BOSS = 17
____exports.ItemPoolType[____exports.ItemPoolType.GREED_BOSS] = "GREED_BOSS"
____exports.ItemPoolType.GREED_SHOP = 18
____exports.ItemPoolType[____exports.ItemPoolType.GREED_SHOP] = "GREED_SHOP"
____exports.ItemPoolType.GREED_DEVIL = 19
____exports.ItemPoolType[____exports.ItemPoolType.GREED_DEVIL] = "GREED_DEVIL"
____exports.ItemPoolType.GREED_ANGEL = 20
____exports.ItemPoolType[____exports.ItemPoolType.GREED_ANGEL] = "GREED_ANGEL"
____exports.ItemPoolType.GREED_CURSE = 21
____exports.ItemPoolType[____exports.ItemPoolType.GREED_CURSE] = "GREED_CURSE"
____exports.ItemPoolType.GREED_SECRET = 22
____exports.ItemPoolType[____exports.ItemPoolType.GREED_SECRET] = "GREED_SECRET"
____exports.ItemPoolType.CRANE_GAME = 23
____exports.ItemPoolType[____exports.ItemPoolType.CRANE_GAME] = "CRANE_GAME"
____exports.ItemPoolType.ULTRA_SECRET = 24
____exports.ItemPoolType[____exports.ItemPoolType.ULTRA_SECRET] = "ULTRA_SECRET"
____exports.ItemPoolType.BOMB_BUM = 25
____exports.ItemPoolType[____exports.ItemPoolType.BOMB_BUM] = "BOMB_BUM"
____exports.ItemPoolType.PLANETARIUM = 26
____exports.ItemPoolType[____exports.ItemPoolType.PLANETARIUM] = "PLANETARIUM"
____exports.ItemPoolType.OLD_CHEST = 27
____exports.ItemPoolType[____exports.ItemPoolType.OLD_CHEST] = "OLD_CHEST"
____exports.ItemPoolType.BABY_SHOP = 28
____exports.ItemPoolType[____exports.ItemPoolType.BABY_SHOP] = "BABY_SHOP"
____exports.ItemPoolType.WOODEN_CHEST = 29
____exports.ItemPoolType[____exports.ItemPoolType.WOODEN_CHEST] = "WOODEN_CHEST"
____exports.ItemPoolType.ROTTEN_BEGGAR = 30
____exports.ItemPoolType[____exports.ItemPoolType.ROTTEN_BEGGAR] = "ROTTEN_BEGGAR"
return ____exports
 end,
["lua_modules.isaac-typescript-definitions.dist.src.enums.ItemType"] = function(...) 
local ____exports = {}
____exports.ItemType = {}
____exports.ItemType.NULL = 0
____exports.ItemType[____exports.ItemType.NULL] = "NULL"
____exports.ItemType.PASSIVE = 1
____exports.ItemType[____exports.ItemType.PASSIVE] = "PASSIVE"
____exports.ItemType.TRINKET = 2
____exports.ItemType[____exports.ItemType.TRINKET] = "TRINKET"
____exports.ItemType.ACTIVE = 3
____exports.ItemType[____exports.ItemType.ACTIVE] = "ACTIVE"
____exports.ItemType.FAMILIAR = 4
____exports.ItemType[____exports.ItemType.FAMILIAR] = "FAMILIAR"
return ____exports
 end,
["lua_modules.isaac-typescript-definitions.dist.src.enums.Keyboard"] = function(...) 
local ____exports = {}
____exports.Keyboard = {}
____exports.Keyboard.SPACE = 32
____exports.Keyboard[____exports.Keyboard.SPACE] = "SPACE"
____exports.Keyboard.APOSTROPHE = 39
____exports.Keyboard[____exports.Keyboard.APOSTROPHE] = "APOSTROPHE"
____exports.Keyboard.COMMA = 44
____exports.Keyboard[____exports.Keyboard.COMMA] = "COMMA"
____exports.Keyboard.MINUS = 45
____exports.Keyboard[____exports.Keyboard.MINUS] = "MINUS"
____exports.Keyboard.PERIOD = 46
____exports.Keyboard[____exports.Keyboard.PERIOD] = "PERIOD"
____exports.Keyboard.SLASH = 47
____exports.Keyboard[____exports.Keyboard.SLASH] = "SLASH"
____exports.Keyboard.ZERO = 48
____exports.Keyboard[____exports.Keyboard.ZERO] = "ZERO"
____exports.Keyboard.ONE = 49
____exports.Keyboard[____exports.Keyboard.ONE] = "ONE"
____exports.Keyboard.TWO = 50
____exports.Keyboard[____exports.Keyboard.TWO] = "TWO"
____exports.Keyboard.THREE = 51
____exports.Keyboard[____exports.Keyboard.THREE] = "THREE"
____exports.Keyboard.FOUR = 52
____exports.Keyboard[____exports.Keyboard.FOUR] = "FOUR"
____exports.Keyboard.FIVE = 53
____exports.Keyboard[____exports.Keyboard.FIVE] = "FIVE"
____exports.Keyboard.SIX = 54
____exports.Keyboard[____exports.Keyboard.SIX] = "SIX"
____exports.Keyboard.SEVEN = 55
____exports.Keyboard[____exports.Keyboard.SEVEN] = "SEVEN"
____exports.Keyboard.EIGHT = 56
____exports.Keyboard[____exports.Keyboard.EIGHT] = "EIGHT"
____exports.Keyboard.NINE = 57
____exports.Keyboard[____exports.Keyboard.NINE] = "NINE"
____exports.Keyboard.SEMICOLON = 59
____exports.Keyboard[____exports.Keyboard.SEMICOLON] = "SEMICOLON"
____exports.Keyboard.EQUAL = 61
____exports.Keyboard[____exports.Keyboard.EQUAL] = "EQUAL"
____exports.Keyboard.A = 65
____exports.Keyboard[____exports.Keyboard.A] = "A"
____exports.Keyboard.B = 66
____exports.Keyboard[____exports.Keyboard.B] = "B"
____exports.Keyboard.C = 67
____exports.Keyboard[____exports.Keyboard.C] = "C"
____exports.Keyboard.D = 68
____exports.Keyboard[____exports.Keyboard.D] = "D"
____exports.Keyboard.E = 69
____exports.Keyboard[____exports.Keyboard.E] = "E"
____exports.Keyboard.F = 70
____exports.Keyboard[____exports.Keyboard.F] = "F"
____exports.Keyboard.G = 71
____exports.Keyboard[____exports.Keyboard.G] = "G"
____exports.Keyboard.H = 72
____exports.Keyboard[____exports.Keyboard.H] = "H"
____exports.Keyboard.I = 73
____exports.Keyboard[____exports.Keyboard.I] = "I"
____exports.Keyboard.J = 74
____exports.Keyboard[____exports.Keyboard.J] = "J"
____exports.Keyboard.K = 75
____exports.Keyboard[____exports.Keyboard.K] = "K"
____exports.Keyboard.L = 76
____exports.Keyboard[____exports.Keyboard.L] = "L"
____exports.Keyboard.M = 77
____exports.Keyboard[____exports.Keyboard.M] = "M"
____exports.Keyboard.N = 78
____exports.Keyboard[____exports.Keyboard.N] = "N"
____exports.Keyboard.O = 79
____exports.Keyboard[____exports.Keyboard.O] = "O"
____exports.Keyboard.P = 80
____exports.Keyboard[____exports.Keyboard.P] = "P"
____exports.Keyboard.Q = 81
____exports.Keyboard[____exports.Keyboard.Q] = "Q"
____exports.Keyboard.R = 82
____exports.Keyboard[____exports.Keyboard.R] = "R"
____exports.Keyboard.S = 83
____exports.Keyboard[____exports.Keyboard.S] = "S"
____exports.Keyboard.T = 84
____exports.Keyboard[____exports.Keyboard.T] = "T"
____exports.Keyboard.U = 85
____exports.Keyboard[____exports.Keyboard.U] = "U"
____exports.Keyboard.V = 86
____exports.Keyboard[____exports.Keyboard.V] = "V"
____exports.Keyboard.W = 87
____exports.Keyboard[____exports.Keyboard.W] = "W"
____exports.Keyboard.X = 88
____exports.Keyboard[____exports.Keyboard.X] = "X"
____exports.Keyboard.Y = 89
____exports.Keyboard[____exports.Keyboard.Y] = "Y"
____exports.Keyboard.Z = 90
____exports.Keyboard[____exports.Keyboard.Z] = "Z"
____exports.Keyboard.LEFT_BRACKET = 91
____exports.Keyboard[____exports.Keyboard.LEFT_BRACKET] = "LEFT_BRACKET"
____exports.Keyboard.BACKSLASH = 92
____exports.Keyboard[____exports.Keyboard.BACKSLASH] = "BACKSLASH"
____exports.Keyboard.RIGHT_BRACKET = 93
____exports.Keyboard[____exports.Keyboard.RIGHT_BRACKET] = "RIGHT_BRACKET"
____exports.Keyboard.GRAVE_ACCENT = 96
____exports.Keyboard[____exports.Keyboard.GRAVE_ACCENT] = "GRAVE_ACCENT"
____exports.Keyboard.WORLD_1 = 161
____exports.Keyboard[____exports.Keyboard.WORLD_1] = "WORLD_1"
____exports.Keyboard.WORLD_2 = 162
____exports.Keyboard[____exports.Keyboard.WORLD_2] = "WORLD_2"
____exports.Keyboard.ESCAPE = 256
____exports.Keyboard[____exports.Keyboard.ESCAPE] = "ESCAPE"
____exports.Keyboard.ENTER = 257
____exports.Keyboard[____exports.Keyboard.ENTER] = "ENTER"
____exports.Keyboard.TAB = 258
____exports.Keyboard[____exports.Keyboard.TAB] = "TAB"
____exports.Keyboard.BACKSPACE = 259
____exports.Keyboard[____exports.Keyboard.BACKSPACE] = "BACKSPACE"
____exports.Keyboard.INSERT = 260
____exports.Keyboard[____exports.Keyboard.INSERT] = "INSERT"
____exports.Keyboard.DELETE = 261
____exports.Keyboard[____exports.Keyboard.DELETE] = "DELETE"
____exports.Keyboard.RIGHT = 262
____exports.Keyboard[____exports.Keyboard.RIGHT] = "RIGHT"
____exports.Keyboard.LEFT = 263
____exports.Keyboard[____exports.Keyboard.LEFT] = "LEFT"
____exports.Keyboard.DOWN = 264
____exports.Keyboard[____exports.Keyboard.DOWN] = "DOWN"
____exports.Keyboard.UP = 265
____exports.Keyboard[____exports.Keyboard.UP] = "UP"
____exports.Keyboard.PAGE_UP = 266
____exports.Keyboard[____exports.Keyboard.PAGE_UP] = "PAGE_UP"
____exports.Keyboard.PAGE_DOWN = 267
____exports.Keyboard[____exports.Keyboard.PAGE_DOWN] = "PAGE_DOWN"
____exports.Keyboard.HOME = 268
____exports.Keyboard[____exports.Keyboard.HOME] = "HOME"
____exports.Keyboard.END = 269
____exports.Keyboard[____exports.Keyboard.END] = "END"
____exports.Keyboard.CAPS_LOCK = 280
____exports.Keyboard[____exports.Keyboard.CAPS_LOCK] = "CAPS_LOCK"
____exports.Keyboard.SCROLL_LOCK = 281
____exports.Keyboard[____exports.Keyboard.SCROLL_LOCK] = "SCROLL_LOCK"
____exports.Keyboard.NUM_LOCK = 282
____exports.Keyboard[____exports.Keyboard.NUM_LOCK] = "NUM_LOCK"
____exports.Keyboard.PRINT_SCREEN = 283
____exports.Keyboard[____exports.Keyboard.PRINT_SCREEN] = "PRINT_SCREEN"
____exports.Keyboard.PAUSE = 284
____exports.Keyboard[____exports.Keyboard.PAUSE] = "PAUSE"
____exports.Keyboard.F1 = 290
____exports.Keyboard[____exports.Keyboard.F1] = "F1"
____exports.Keyboard.F2 = 291
____exports.Keyboard[____exports.Keyboard.F2] = "F2"
____exports.Keyboard.F3 = 292
____exports.Keyboard[____exports.Keyboard.F3] = "F3"
____exports.Keyboard.F4 = 293
____exports.Keyboard[____exports.Keyboard.F4] = "F4"
____exports.Keyboard.F5 = 294
____exports.Keyboard[____exports.Keyboard.F5] = "F5"
____exports.Keyboard.F6 = 295
____exports.Keyboard[____exports.Keyboard.F6] = "F6"
____exports.Keyboard.F7 = 296
____exports.Keyboard[____exports.Keyboard.F7] = "F7"
____exports.Keyboard.F8 = 297
____exports.Keyboard[____exports.Keyboard.F8] = "F8"
____exports.Keyboard.F9 = 298
____exports.Keyboard[____exports.Keyboard.F9] = "F9"
____exports.Keyboard.F10 = 299
____exports.Keyboard[____exports.Keyboard.F10] = "F10"
____exports.Keyboard.F11 = 300
____exports.Keyboard[____exports.Keyboard.F11] = "F11"
____exports.Keyboard.F12 = 301
____exports.Keyboard[____exports.Keyboard.F12] = "F12"
____exports.Keyboard.F13 = 302
____exports.Keyboard[____exports.Keyboard.F13] = "F13"
____exports.Keyboard.F14 = 303
____exports.Keyboard[____exports.Keyboard.F14] = "F14"
____exports.Keyboard.F15 = 304
____exports.Keyboard[____exports.Keyboard.F15] = "F15"
____exports.Keyboard.F16 = 305
____exports.Keyboard[____exports.Keyboard.F16] = "F16"
____exports.Keyboard.F17 = 306
____exports.Keyboard[____exports.Keyboard.F17] = "F17"
____exports.Keyboard.F18 = 307
____exports.Keyboard[____exports.Keyboard.F18] = "F18"
____exports.Keyboard.F19 = 308
____exports.Keyboard[____exports.Keyboard.F19] = "F19"
____exports.Keyboard.F20 = 309
____exports.Keyboard[____exports.Keyboard.F20] = "F20"
____exports.Keyboard.F21 = 310
____exports.Keyboard[____exports.Keyboard.F21] = "F21"
____exports.Keyboard.F22 = 311
____exports.Keyboard[____exports.Keyboard.F22] = "F22"
____exports.Keyboard.F23 = 312
____exports.Keyboard[____exports.Keyboard.F23] = "F23"
____exports.Keyboard.F24 = 313
____exports.Keyboard[____exports.Keyboard.F24] = "F24"
____exports.Keyboard.F25 = 314
____exports.Keyboard[____exports.Keyboard.F25] = "F25"
____exports.Keyboard.KP_0 = 320
____exports.Keyboard[____exports.Keyboard.KP_0] = "KP_0"
____exports.Keyboard.KP_1 = 321
____exports.Keyboard[____exports.Keyboard.KP_1] = "KP_1"
____exports.Keyboard.KP_2 = 322
____exports.Keyboard[____exports.Keyboard.KP_2] = "KP_2"
____exports.Keyboard.KP_3 = 323
____exports.Keyboard[____exports.Keyboard.KP_3] = "KP_3"
____exports.Keyboard.KP_4 = 324
____exports.Keyboard[____exports.Keyboard.KP_4] = "KP_4"
____exports.Keyboard.KP_5 = 325
____exports.Keyboard[____exports.Keyboard.KP_5] = "KP_5"
____exports.Keyboard.KP_6 = 326
____exports.Keyboard[____exports.Keyboard.KP_6] = "KP_6"
____exports.Keyboard.KP_7 = 327
____exports.Keyboard[____exports.Keyboard.KP_7] = "KP_7"
____exports.Keyboard.KP_8 = 328
____exports.Keyboard[____exports.Keyboard.KP_8] = "KP_8"
____exports.Keyboard.KP_9 = 329
____exports.Keyboard[____exports.Keyboard.KP_9] = "KP_9"
____exports.Keyboard.KP_DECIMAL = 330
____exports.Keyboard[____exports.Keyboard.KP_DECIMAL] = "KP_DECIMAL"
____exports.Keyboard.KP_DIVIDE = 331
____exports.Keyboard[____exports.Keyboard.KP_DIVIDE] = "KP_DIVIDE"
____exports.Keyboard.KP_MULTIPLY = 332
____exports.Keyboard[____exports.Keyboard.KP_MULTIPLY] = "KP_MULTIPLY"
____exports.Keyboard.KP_SUBTRACT = 333
____exports.Keyboard[____exports.Keyboard.KP_SUBTRACT] = "KP_SUBTRACT"
____exports.Keyboard.KP_ADD = 334
____exports.Keyboard[____exports.Keyboard.KP_ADD] = "KP_ADD"
____exports.Keyboard.KP_ENTER = 335
____exports.Keyboard[____exports.Keyboard.KP_ENTER] = "KP_ENTER"
____exports.Keyboard.KP_EQUAL = 336
____exports.Keyboard[____exports.Keyboard.KP_EQUAL] = "KP_EQUAL"
____exports.Keyboard.LEFT_SHIFT = 340
____exports.Keyboard[____exports.Keyboard.LEFT_SHIFT] = "LEFT_SHIFT"
____exports.Keyboard.LEFT_CONTROL = 341
____exports.Keyboard[____exports.Keyboard.LEFT_CONTROL] = "LEFT_CONTROL"
____exports.Keyboard.LEFT_ALT = 342
____exports.Keyboard[____exports.Keyboard.LEFT_ALT] = "LEFT_ALT"
____exports.Keyboard.LEFT_SUPER = 343
____exports.Keyboard[____exports.Keyboard.LEFT_SUPER] = "LEFT_SUPER"
____exports.Keyboard.RIGHT_SHIFT = 344
____exports.Keyboard[____exports.Keyboard.RIGHT_SHIFT] = "RIGHT_SHIFT"
____exports.Keyboard.RIGHT_CONTROL = 345
____exports.Keyboard[____exports.Keyboard.RIGHT_CONTROL] = "RIGHT_CONTROL"
____exports.Keyboard.RIGHT_ALT = 346
____exports.Keyboard[____exports.Keyboard.RIGHT_ALT] = "RIGHT_ALT"
____exports.Keyboard.RIGHT_SUPER = 347
____exports.Keyboard[____exports.Keyboard.RIGHT_SUPER] = "RIGHT_SUPER"
____exports.Keyboard.MENU = 348
____exports.Keyboard[____exports.Keyboard.MENU] = "MENU"
return ____exports
 end,
["lua_modules.isaac-typescript-definitions.dist.src.enums.LanguageAbbreviation"] = function(...) 
local ____exports = {}
--- Listed in order of how they cycle through the options menu.
____exports.LanguageAbbreviation = {}
____exports.LanguageAbbreviation.ENGLISH = "en"
____exports.LanguageAbbreviation.JAPANESE = "jp"
____exports.LanguageAbbreviation.SPANISH = "es"
____exports.LanguageAbbreviation.GERMAN = "de"
____exports.LanguageAbbreviation.RUSSIAN = "ru"
____exports.LanguageAbbreviation.KOREAN = "kr"
____exports.LanguageAbbreviation.CHINESE_SIMPLE = "zh"
return ____exports
 end,
["lua_modules.isaac-typescript-definitions.dist.src.enums.LaserOffset"] = function(...) 
local ____exports = {}
____exports.LaserOffset = {}
____exports.LaserOffset.TECH_1 = 0
____exports.LaserOffset[____exports.LaserOffset.TECH_1] = "TECH_1"
____exports.LaserOffset.TECH_2 = 1
____exports.LaserOffset[____exports.LaserOffset.TECH_2] = "TECH_2"
____exports.LaserOffset.TECH_5 = 2
____exports.LaserOffset[____exports.LaserOffset.TECH_5] = "TECH_5"
____exports.LaserOffset.SHOOP = 3
____exports.LaserOffset[____exports.LaserOffset.SHOOP] = "SHOOP"
____exports.LaserOffset.BRIMSTONE = 4
____exports.LaserOffset[____exports.LaserOffset.BRIMSTONE] = "BRIMSTONE"
____exports.LaserOffset.MOMS_EYE = 5
____exports.LaserOffset[____exports.LaserOffset.MOMS_EYE] = "MOMS_EYE"
____exports.LaserOffset.TRACTOR_BEAM = 6
____exports.LaserOffset[____exports.LaserOffset.TRACTOR_BEAM] = "TRACTOR_BEAM"
return ____exports
 end,
["lua_modules.isaac-typescript-definitions.dist.src.enums.LevelStage"] = function(...) 
local ____exports = {}
____exports.LevelStage = {}
____exports.LevelStage.BASEMENT_1 = 1
____exports.LevelStage[____exports.LevelStage.BASEMENT_1] = "BASEMENT_1"
____exports.LevelStage.BASEMENT_2 = 2
____exports.LevelStage[____exports.LevelStage.BASEMENT_2] = "BASEMENT_2"
____exports.LevelStage.CAVES_1 = 3
____exports.LevelStage[____exports.LevelStage.CAVES_1] = "CAVES_1"
____exports.LevelStage.CAVES_2 = 4
____exports.LevelStage[____exports.LevelStage.CAVES_2] = "CAVES_2"
____exports.LevelStage.DEPTHS_1 = 5
____exports.LevelStage[____exports.LevelStage.DEPTHS_1] = "DEPTHS_1"
____exports.LevelStage.DEPTHS_2 = 6
____exports.LevelStage[____exports.LevelStage.DEPTHS_2] = "DEPTHS_2"
____exports.LevelStage.WOMB_1 = 7
____exports.LevelStage[____exports.LevelStage.WOMB_1] = "WOMB_1"
____exports.LevelStage.WOMB_2 = 8
____exports.LevelStage[____exports.LevelStage.WOMB_2] = "WOMB_2"
____exports.LevelStage.BLUE_WOMB = 9
____exports.LevelStage[____exports.LevelStage.BLUE_WOMB] = "BLUE_WOMB"
____exports.LevelStage.SHEOL_CATHEDRAL = 10
____exports.LevelStage[____exports.LevelStage.SHEOL_CATHEDRAL] = "SHEOL_CATHEDRAL"
____exports.LevelStage.DARK_ROOM_CHEST = 11
____exports.LevelStage[____exports.LevelStage.DARK_ROOM_CHEST] = "DARK_ROOM_CHEST"
____exports.LevelStage.THE_VOID = 12
____exports.LevelStage[____exports.LevelStage.THE_VOID] = "THE_VOID"
____exports.LevelStage.HOME = 13
____exports.LevelStage[____exports.LevelStage.HOME] = "HOME"
return ____exports
 end,
["lua_modules.isaac-typescript-definitions.dist.src.enums.LevelStateFlag"] = function(...) 
local ____exports = {}
--- Used with the `Level.GetStateFlag` and `Level.SetStateFlag` methods.
____exports.LevelStateFlag = {}
____exports.LevelStateFlag.BUM_KILLED = 0
____exports.LevelStateFlag[____exports.LevelStateFlag.BUM_KILLED] = "BUM_KILLED"
____exports.LevelStateFlag.EVIL_BUM_KILLED = 1
____exports.LevelStateFlag[____exports.LevelStateFlag.EVIL_BUM_KILLED] = "EVIL_BUM_KILLED"
____exports.LevelStateFlag.RED_HEART_DAMAGED = 2
____exports.LevelStateFlag[____exports.LevelStateFlag.RED_HEART_DAMAGED] = "RED_HEART_DAMAGED"
____exports.LevelStateFlag.BUM_LEFT = 3
____exports.LevelStateFlag[____exports.LevelStateFlag.BUM_LEFT] = "BUM_LEFT"
____exports.LevelStateFlag.EVIL_BUM_LEFT = 4
____exports.LevelStateFlag[____exports.LevelStateFlag.EVIL_BUM_LEFT] = "EVIL_BUM_LEFT"
____exports.LevelStateFlag.DAMAGED = 5
____exports.LevelStateFlag[____exports.LevelStateFlag.DAMAGED] = "DAMAGED"
____exports.LevelStateFlag.SHOPKEEPER_KILLED_LVL = 6
____exports.LevelStateFlag[____exports.LevelStateFlag.SHOPKEEPER_KILLED_LVL] = "SHOPKEEPER_KILLED_LVL"
____exports.LevelStateFlag.COMPASS_EFFECT = 7
____exports.LevelStateFlag[____exports.LevelStateFlag.COMPASS_EFFECT] = "COMPASS_EFFECT"
____exports.LevelStateFlag.MAP_EFFECT = 8
____exports.LevelStateFlag[____exports.LevelStateFlag.MAP_EFFECT] = "MAP_EFFECT"
____exports.LevelStateFlag.BLUE_MAP_EFFECT = 9
____exports.LevelStateFlag[____exports.LevelStateFlag.BLUE_MAP_EFFECT] = "BLUE_MAP_EFFECT"
____exports.LevelStateFlag.FULL_MAP_EFFECT = 10
____exports.LevelStateFlag[____exports.LevelStateFlag.FULL_MAP_EFFECT] = "FULL_MAP_EFFECT"
____exports.LevelStateFlag.GREED_LOST_PENALTY = 11
____exports.LevelStateFlag[____exports.LevelStateFlag.GREED_LOST_PENALTY] = "GREED_LOST_PENALTY"
____exports.LevelStateFlag.GREED_MONSTRO_SPAWNED = 12
____exports.LevelStateFlag[____exports.LevelStateFlag.GREED_MONSTRO_SPAWNED] = "GREED_MONSTRO_SPAWNED"
____exports.LevelStateFlag.ITEM_DUNGEON_FOUND = 13
____exports.LevelStateFlag[____exports.LevelStateFlag.ITEM_DUNGEON_FOUND] = "ITEM_DUNGEON_FOUND"
____exports.LevelStateFlag.MAMA_MEGA_USED = 14
____exports.LevelStateFlag[____exports.LevelStateFlag.MAMA_MEGA_USED] = "MAMA_MEGA_USED"
____exports.LevelStateFlag.WOODEN_CROSS_REMOVED = 15
____exports.LevelStateFlag[____exports.LevelStateFlag.WOODEN_CROSS_REMOVED] = "WOODEN_CROSS_REMOVED"
____exports.LevelStateFlag.SHOVEL_QUEST_TRIGGERED = 16
____exports.LevelStateFlag[____exports.LevelStateFlag.SHOVEL_QUEST_TRIGGERED] = "SHOVEL_QUEST_TRIGGERED"
____exports.LevelStateFlag.SATANIC_BIBLE_USED = 17
____exports.LevelStateFlag[____exports.LevelStateFlag.SATANIC_BIBLE_USED] = "SATANIC_BIBLE_USED"
____exports.LevelStateFlag.SOL_EFFECT = 18
____exports.LevelStateFlag[____exports.LevelStateFlag.SOL_EFFECT] = "SOL_EFFECT"
____exports.LevelStateFlag.LEVEL_START_TRIGGERED = 19
____exports.LevelStateFlag[____exports.LevelStateFlag.LEVEL_START_TRIGGERED] = "LEVEL_START_TRIGGERED"
____exports.LevelStateFlag.LUNA_EFFECT = 20
____exports.LevelStateFlag[____exports.LevelStateFlag.LUNA_EFFECT] = "LUNA_EFFECT"
____exports.LevelStateFlag.VOID_DOOR_DISABLED = 21
____exports.LevelStateFlag[____exports.LevelStateFlag.VOID_DOOR_DISABLED] = "VOID_DOOR_DISABLED"
____exports.LevelStateFlag.MINESHAFT_ESCAPE = 22
____exports.LevelStateFlag[____exports.LevelStateFlag.MINESHAFT_ESCAPE] = "MINESHAFT_ESCAPE"
____exports.LevelStateFlag.MIRROR_BROKEN = 23
____exports.LevelStateFlag[____exports.LevelStateFlag.MIRROR_BROKEN] = "MIRROR_BROKEN"
return ____exports
 end,
["lua_modules.isaac-typescript-definitions.dist.src.enums.LineCheckMode"] = function(...) 
local ____exports = {}
____exports.LineCheckMode = {}
____exports.LineCheckMode.NORMAL = 0
____exports.LineCheckMode[____exports.LineCheckMode.NORMAL] = "NORMAL"
____exports.LineCheckMode.ECONOMIC = 1
____exports.LineCheckMode[____exports.LineCheckMode.ECONOMIC] = "ECONOMIC"
____exports.LineCheckMode.EXPLOSION = 2
____exports.LineCheckMode[____exports.LineCheckMode.EXPLOSION] = "EXPLOSION"
____exports.LineCheckMode.PROJECTILE = 3
____exports.LineCheckMode[____exports.LineCheckMode.PROJECTILE] = "PROJECTILE"
return ____exports
 end,
["lua_modules.isaac-typescript-definitions.dist.src.enums.ModCallback"] = function(...) 
local ____exports = {}
____exports.ModCallback = {}
____exports.ModCallback.POST_NPC_UPDATE = 0
____exports.ModCallback[____exports.ModCallback.POST_NPC_UPDATE] = "POST_NPC_UPDATE"
____exports.ModCallback.POST_UPDATE = 1
____exports.ModCallback[____exports.ModCallback.POST_UPDATE] = "POST_UPDATE"
____exports.ModCallback.POST_RENDER = 2
____exports.ModCallback[____exports.ModCallback.POST_RENDER] = "POST_RENDER"
____exports.ModCallback.POST_USE_ITEM = 3
____exports.ModCallback[____exports.ModCallback.POST_USE_ITEM] = "POST_USE_ITEM"
____exports.ModCallback.POST_PEFFECT_UPDATE = 4
____exports.ModCallback[____exports.ModCallback.POST_PEFFECT_UPDATE] = "POST_PEFFECT_UPDATE"
____exports.ModCallback.POST_USE_CARD = 5
____exports.ModCallback[____exports.ModCallback.POST_USE_CARD] = "POST_USE_CARD"
____exports.ModCallback.POST_FAMILIAR_UPDATE = 6
____exports.ModCallback[____exports.ModCallback.POST_FAMILIAR_UPDATE] = "POST_FAMILIAR_UPDATE"
____exports.ModCallback.POST_FAMILIAR_INIT = 7
____exports.ModCallback[____exports.ModCallback.POST_FAMILIAR_INIT] = "POST_FAMILIAR_INIT"
____exports.ModCallback.EVALUATE_CACHE = 8
____exports.ModCallback[____exports.ModCallback.EVALUATE_CACHE] = "EVALUATE_CACHE"
____exports.ModCallback.POST_PLAYER_INIT = 9
____exports.ModCallback[____exports.ModCallback.POST_PLAYER_INIT] = "POST_PLAYER_INIT"
____exports.ModCallback.POST_USE_PILL = 10
____exports.ModCallback[____exports.ModCallback.POST_USE_PILL] = "POST_USE_PILL"
____exports.ModCallback.ENTITY_TAKE_DMG = 11
____exports.ModCallback[____exports.ModCallback.ENTITY_TAKE_DMG] = "ENTITY_TAKE_DMG"
____exports.ModCallback.POST_CURSE_EVAL = 12
____exports.ModCallback[____exports.ModCallback.POST_CURSE_EVAL] = "POST_CURSE_EVAL"
____exports.ModCallback.INPUT_ACTION = 13
____exports.ModCallback[____exports.ModCallback.INPUT_ACTION] = "INPUT_ACTION"
____exports.ModCallback.POST_GAME_STARTED = 15
____exports.ModCallback[____exports.ModCallback.POST_GAME_STARTED] = "POST_GAME_STARTED"
____exports.ModCallback.POST_GAME_END = 16
____exports.ModCallback[____exports.ModCallback.POST_GAME_END] = "POST_GAME_END"
____exports.ModCallback.PRE_GAME_EXIT = 17
____exports.ModCallback[____exports.ModCallback.PRE_GAME_EXIT] = "PRE_GAME_EXIT"
____exports.ModCallback.POST_NEW_LEVEL = 18
____exports.ModCallback[____exports.ModCallback.POST_NEW_LEVEL] = "POST_NEW_LEVEL"
____exports.ModCallback.POST_NEW_ROOM = 19
____exports.ModCallback[____exports.ModCallback.POST_NEW_ROOM] = "POST_NEW_ROOM"
____exports.ModCallback.GET_CARD = 20
____exports.ModCallback[____exports.ModCallback.GET_CARD] = "GET_CARD"
____exports.ModCallback.GET_SHADER_PARAMS = 21
____exports.ModCallback[____exports.ModCallback.GET_SHADER_PARAMS] = "GET_SHADER_PARAMS"
____exports.ModCallback.EXECUTE_CMD = 22
____exports.ModCallback[____exports.ModCallback.EXECUTE_CMD] = "EXECUTE_CMD"
____exports.ModCallback.PRE_USE_ITEM = 23
____exports.ModCallback[____exports.ModCallback.PRE_USE_ITEM] = "PRE_USE_ITEM"
____exports.ModCallback.PRE_ENTITY_SPAWN = 24
____exports.ModCallback[____exports.ModCallback.PRE_ENTITY_SPAWN] = "PRE_ENTITY_SPAWN"
____exports.ModCallback.POST_FAMILIAR_RENDER = 25
____exports.ModCallback[____exports.ModCallback.POST_FAMILIAR_RENDER] = "POST_FAMILIAR_RENDER"
____exports.ModCallback.PRE_FAMILIAR_COLLISION = 26
____exports.ModCallback[____exports.ModCallback.PRE_FAMILIAR_COLLISION] = "PRE_FAMILIAR_COLLISION"
____exports.ModCallback.POST_NPC_INIT = 27
____exports.ModCallback[____exports.ModCallback.POST_NPC_INIT] = "POST_NPC_INIT"
____exports.ModCallback.POST_NPC_RENDER = 28
____exports.ModCallback[____exports.ModCallback.POST_NPC_RENDER] = "POST_NPC_RENDER"
____exports.ModCallback.POST_NPC_DEATH = 29
____exports.ModCallback[____exports.ModCallback.POST_NPC_DEATH] = "POST_NPC_DEATH"
____exports.ModCallback.PRE_NPC_COLLISION = 30
____exports.ModCallback[____exports.ModCallback.PRE_NPC_COLLISION] = "PRE_NPC_COLLISION"
____exports.ModCallback.POST_PLAYER_UPDATE = 31
____exports.ModCallback[____exports.ModCallback.POST_PLAYER_UPDATE] = "POST_PLAYER_UPDATE"
____exports.ModCallback.POST_PLAYER_RENDER = 32
____exports.ModCallback[____exports.ModCallback.POST_PLAYER_RENDER] = "POST_PLAYER_RENDER"
____exports.ModCallback.PRE_PLAYER_COLLISION = 33
____exports.ModCallback[____exports.ModCallback.PRE_PLAYER_COLLISION] = "PRE_PLAYER_COLLISION"
____exports.ModCallback.POST_PICKUP_INIT = 34
____exports.ModCallback[____exports.ModCallback.POST_PICKUP_INIT] = "POST_PICKUP_INIT"
____exports.ModCallback.POST_PICKUP_UPDATE = 35
____exports.ModCallback[____exports.ModCallback.POST_PICKUP_UPDATE] = "POST_PICKUP_UPDATE"
____exports.ModCallback.POST_PICKUP_RENDER = 36
____exports.ModCallback[____exports.ModCallback.POST_PICKUP_RENDER] = "POST_PICKUP_RENDER"
____exports.ModCallback.POST_PICKUP_SELECTION = 37
____exports.ModCallback[____exports.ModCallback.POST_PICKUP_SELECTION] = "POST_PICKUP_SELECTION"
____exports.ModCallback.PRE_PICKUP_COLLISION = 38
____exports.ModCallback[____exports.ModCallback.PRE_PICKUP_COLLISION] = "PRE_PICKUP_COLLISION"
____exports.ModCallback.POST_TEAR_INIT = 39
____exports.ModCallback[____exports.ModCallback.POST_TEAR_INIT] = "POST_TEAR_INIT"
____exports.ModCallback.POST_TEAR_UPDATE = 40
____exports.ModCallback[____exports.ModCallback.POST_TEAR_UPDATE] = "POST_TEAR_UPDATE"
____exports.ModCallback.POST_TEAR_RENDER = 41
____exports.ModCallback[____exports.ModCallback.POST_TEAR_RENDER] = "POST_TEAR_RENDER"
____exports.ModCallback.PRE_TEAR_COLLISION = 42
____exports.ModCallback[____exports.ModCallback.PRE_TEAR_COLLISION] = "PRE_TEAR_COLLISION"
____exports.ModCallback.POST_PROJECTILE_INIT = 43
____exports.ModCallback[____exports.ModCallback.POST_PROJECTILE_INIT] = "POST_PROJECTILE_INIT"
____exports.ModCallback.POST_PROJECTILE_UPDATE = 44
____exports.ModCallback[____exports.ModCallback.POST_PROJECTILE_UPDATE] = "POST_PROJECTILE_UPDATE"
____exports.ModCallback.POST_PROJECTILE_RENDER = 45
____exports.ModCallback[____exports.ModCallback.POST_PROJECTILE_RENDER] = "POST_PROJECTILE_RENDER"
____exports.ModCallback.PRE_PROJECTILE_COLLISION = 46
____exports.ModCallback[____exports.ModCallback.PRE_PROJECTILE_COLLISION] = "PRE_PROJECTILE_COLLISION"
____exports.ModCallback.POST_LASER_INIT = 47
____exports.ModCallback[____exports.ModCallback.POST_LASER_INIT] = "POST_LASER_INIT"
____exports.ModCallback.POST_LASER_UPDATE = 48
____exports.ModCallback[____exports.ModCallback.POST_LASER_UPDATE] = "POST_LASER_UPDATE"
____exports.ModCallback.POST_LASER_RENDER = 49
____exports.ModCallback[____exports.ModCallback.POST_LASER_RENDER] = "POST_LASER_RENDER"
____exports.ModCallback.POST_KNIFE_INIT = 50
____exports.ModCallback[____exports.ModCallback.POST_KNIFE_INIT] = "POST_KNIFE_INIT"
____exports.ModCallback.POST_KNIFE_UPDATE = 51
____exports.ModCallback[____exports.ModCallback.POST_KNIFE_UPDATE] = "POST_KNIFE_UPDATE"
____exports.ModCallback.POST_KNIFE_RENDER = 52
____exports.ModCallback[____exports.ModCallback.POST_KNIFE_RENDER] = "POST_KNIFE_RENDER"
____exports.ModCallback.PRE_KNIFE_COLLISION = 53
____exports.ModCallback[____exports.ModCallback.PRE_KNIFE_COLLISION] = "PRE_KNIFE_COLLISION"
____exports.ModCallback.POST_EFFECT_INIT = 54
____exports.ModCallback[____exports.ModCallback.POST_EFFECT_INIT] = "POST_EFFECT_INIT"
____exports.ModCallback.POST_EFFECT_UPDATE = 55
____exports.ModCallback[____exports.ModCallback.POST_EFFECT_UPDATE] = "POST_EFFECT_UPDATE"
____exports.ModCallback.POST_EFFECT_RENDER = 56
____exports.ModCallback[____exports.ModCallback.POST_EFFECT_RENDER] = "POST_EFFECT_RENDER"
____exports.ModCallback.POST_BOMB_INIT = 57
____exports.ModCallback[____exports.ModCallback.POST_BOMB_INIT] = "POST_BOMB_INIT"
____exports.ModCallback.POST_BOMB_UPDATE = 58
____exports.ModCallback[____exports.ModCallback.POST_BOMB_UPDATE] = "POST_BOMB_UPDATE"
____exports.ModCallback.POST_BOMB_RENDER = 59
____exports.ModCallback[____exports.ModCallback.POST_BOMB_RENDER] = "POST_BOMB_RENDER"
____exports.ModCallback.PRE_BOMB_COLLISION = 60
____exports.ModCallback[____exports.ModCallback.PRE_BOMB_COLLISION] = "PRE_BOMB_COLLISION"
____exports.ModCallback.POST_FIRE_TEAR = 61
____exports.ModCallback[____exports.ModCallback.POST_FIRE_TEAR] = "POST_FIRE_TEAR"
____exports.ModCallback.PRE_GET_COLLECTIBLE = 62
____exports.ModCallback[____exports.ModCallback.PRE_GET_COLLECTIBLE] = "PRE_GET_COLLECTIBLE"
____exports.ModCallback.POST_GET_COLLECTIBLE = 63
____exports.ModCallback[____exports.ModCallback.POST_GET_COLLECTIBLE] = "POST_GET_COLLECTIBLE"
____exports.ModCallback.GET_PILL_COLOR = 64
____exports.ModCallback[____exports.ModCallback.GET_PILL_COLOR] = "GET_PILL_COLOR"
____exports.ModCallback.GET_PILL_EFFECT = 65
____exports.ModCallback[____exports.ModCallback.GET_PILL_EFFECT] = "GET_PILL_EFFECT"
____exports.ModCallback.GET_TRINKET = 66
____exports.ModCallback[____exports.ModCallback.GET_TRINKET] = "GET_TRINKET"
____exports.ModCallback.POST_ENTITY_REMOVE = 67
____exports.ModCallback[____exports.ModCallback.POST_ENTITY_REMOVE] = "POST_ENTITY_REMOVE"
____exports.ModCallback.POST_ENTITY_KILL = 68
____exports.ModCallback[____exports.ModCallback.POST_ENTITY_KILL] = "POST_ENTITY_KILL"
____exports.ModCallback.PRE_NPC_UPDATE = 69
____exports.ModCallback[____exports.ModCallback.PRE_NPC_UPDATE] = "PRE_NPC_UPDATE"
____exports.ModCallback.PRE_SPAWN_CLEAN_AWARD = 70
____exports.ModCallback[____exports.ModCallback.PRE_SPAWN_CLEAN_AWARD] = "PRE_SPAWN_CLEAN_AWARD"
____exports.ModCallback.PRE_ROOM_ENTITY_SPAWN = 71
____exports.ModCallback[____exports.ModCallback.PRE_ROOM_ENTITY_SPAWN] = "PRE_ROOM_ENTITY_SPAWN"
____exports.ModCallback.PRE_ENTITY_DEVOLVE = 72
____exports.ModCallback[____exports.ModCallback.PRE_ENTITY_DEVOLVE] = "PRE_ENTITY_DEVOLVE"
return ____exports
 end,
["lua_modules.isaac-typescript-definitions.dist.src.enums.Mouse"] = function(...) 
local ____exports = {}
____exports.Mouse = {}
____exports.Mouse.BUTTON_LEFT = 0
____exports.Mouse[____exports.Mouse.BUTTON_LEFT] = "BUTTON_LEFT"
____exports.Mouse.BUTTON_RIGHT = 1
____exports.Mouse[____exports.Mouse.BUTTON_RIGHT] = "BUTTON_RIGHT"
____exports.Mouse.BUTTON_MIDDLE = 2
____exports.Mouse[____exports.Mouse.BUTTON_MIDDLE] = "BUTTON_MIDDLE"
____exports.Mouse.BUTTON_4 = 3
____exports.Mouse[____exports.Mouse.BUTTON_4] = "BUTTON_4"
____exports.Mouse.BUTTON_5 = 4
____exports.Mouse[____exports.Mouse.BUTTON_5] = "BUTTON_5"
____exports.Mouse.BUTTON_6 = 5
____exports.Mouse[____exports.Mouse.BUTTON_6] = "BUTTON_6"
____exports.Mouse.BUTTON_7 = 6
____exports.Mouse[____exports.Mouse.BUTTON_7] = "BUTTON_7"
____exports.Mouse.BUTTON_8 = 7
____exports.Mouse[____exports.Mouse.BUTTON_8] = "BUTTON_8"
return ____exports
 end,
["lua_modules.isaac-typescript-definitions.dist.src.enums.Music"] = function(...) 
local ____exports = {}
____exports.Music = {}
____exports.Music.NULL = 0
____exports.Music[____exports.Music.NULL] = "NULL"
____exports.Music.BASEMENT = 1
____exports.Music[____exports.Music.BASEMENT] = "BASEMENT"
____exports.Music.CAVES = 2
____exports.Music[____exports.Music.CAVES] = "CAVES"
____exports.Music.DEPTHS = 3
____exports.Music[____exports.Music.DEPTHS] = "DEPTHS"
____exports.Music.CELLAR = 4
____exports.Music[____exports.Music.CELLAR] = "CELLAR"
____exports.Music.CATACOMBS = 5
____exports.Music[____exports.Music.CATACOMBS] = "CATACOMBS"
____exports.Music.NECROPOLIS = 6
____exports.Music[____exports.Music.NECROPOLIS] = "NECROPOLIS"
____exports.Music.WOMB_UTERO = 7
____exports.Music[____exports.Music.WOMB_UTERO] = "WOMB_UTERO"
____exports.Music.GAME_OVER = 8
____exports.Music[____exports.Music.GAME_OVER] = "GAME_OVER"
____exports.Music.BOSS = 9
____exports.Music[____exports.Music.BOSS] = "BOSS"
____exports.Music.CATHEDRAL = 10
____exports.Music[____exports.Music.CATHEDRAL] = "CATHEDRAL"
____exports.Music.SHEOL = 11
____exports.Music[____exports.Music.SHEOL] = "SHEOL"
____exports.Music.DARK_ROOM = 12
____exports.Music[____exports.Music.DARK_ROOM] = "DARK_ROOM"
____exports.Music.CHEST = 13
____exports.Music[____exports.Music.CHEST] = "CHEST"
____exports.Music.BURNING_BASEMENT = 14
____exports.Music[____exports.Music.BURNING_BASEMENT] = "BURNING_BASEMENT"
____exports.Music.FLOODED_CAVES = 15
____exports.Music[____exports.Music.FLOODED_CAVES] = "FLOODED_CAVES"
____exports.Music.DANK_DEPTHS = 16
____exports.Music[____exports.Music.DANK_DEPTHS] = "DANK_DEPTHS"
____exports.Music.SCARRED_WOMB = 17
____exports.Music[____exports.Music.SCARRED_WOMB] = "SCARRED_WOMB"
____exports.Music.BLUE_WOMB = 18
____exports.Music[____exports.Music.BLUE_WOMB] = "BLUE_WOMB"
____exports.Music.UTERO = 19
____exports.Music[____exports.Music.UTERO] = "UTERO"
____exports.Music.MOM_BOSS = 20
____exports.Music[____exports.Music.MOM_BOSS] = "MOM_BOSS"
____exports.Music.MOMS_HEART_BOSS = 21
____exports.Music[____exports.Music.MOMS_HEART_BOSS] = "MOMS_HEART_BOSS"
____exports.Music.ISAAC_BOSS = 22
____exports.Music[____exports.Music.ISAAC_BOSS] = "ISAAC_BOSS"
____exports.Music.SATAN_BOSS = 23
____exports.Music[____exports.Music.SATAN_BOSS] = "SATAN_BOSS"
____exports.Music.DARK_ROOM_BOSS = 24
____exports.Music[____exports.Music.DARK_ROOM_BOSS] = "DARK_ROOM_BOSS"
____exports.Music.BLUE_BABY_BOSS = 25
____exports.Music[____exports.Music.BLUE_BABY_BOSS] = "BLUE_BABY_BOSS"
____exports.Music.BOSS_2 = 26
____exports.Music[____exports.Music.BOSS_2] = "BOSS_2"
____exports.Music.HUSH_BOSS = 27
____exports.Music[____exports.Music.HUSH_BOSS] = "HUSH_BOSS"
____exports.Music.ULTRA_GREED_BOSS = 28
____exports.Music[____exports.Music.ULTRA_GREED_BOSS] = "ULTRA_GREED_BOSS"
____exports.Music.LIBRARY_ROOM = 30
____exports.Music[____exports.Music.LIBRARY_ROOM] = "LIBRARY_ROOM"
____exports.Music.SECRET_ROOM = 31
____exports.Music[____exports.Music.SECRET_ROOM] = "SECRET_ROOM"
____exports.Music.SECRET_ROOM_2 = 32
____exports.Music[____exports.Music.SECRET_ROOM_2] = "SECRET_ROOM_2"
____exports.Music.DEVIL_ROOM = 33
____exports.Music[____exports.Music.DEVIL_ROOM] = "DEVIL_ROOM"
____exports.Music.ANGEL_ROOM = 34
____exports.Music[____exports.Music.ANGEL_ROOM] = "ANGEL_ROOM"
____exports.Music.SHOP_ROOM = 35
____exports.Music[____exports.Music.SHOP_ROOM] = "SHOP_ROOM"
____exports.Music.ARCADE_ROOM = 36
____exports.Music[____exports.Music.ARCADE_ROOM] = "ARCADE_ROOM"
____exports.Music.BOSS_OVER = 37
____exports.Music[____exports.Music.BOSS_OVER] = "BOSS_OVER"
____exports.Music.CHALLENGE_FIGHT = 38
____exports.Music[____exports.Music.CHALLENGE_FIGHT] = "CHALLENGE_FIGHT"
____exports.Music.BOSS_RUSH = 39
____exports.Music[____exports.Music.BOSS_RUSH] = "BOSS_RUSH"
____exports.Music.JINGLE_BOSS_RUSH_OUTRO = 40
____exports.Music[____exports.Music.JINGLE_BOSS_RUSH_OUTRO] = "JINGLE_BOSS_RUSH_OUTRO"
____exports.Music.BOSS_3 = 41
____exports.Music[____exports.Music.BOSS_3] = "BOSS_3"
____exports.Music.JINGLE_BOSS_OVER_3 = 42
____exports.Music[____exports.Music.JINGLE_BOSS_OVER_3] = "JINGLE_BOSS_OVER_3"
____exports.Music.MOTHER_BOSS = 43
____exports.Music[____exports.Music.MOTHER_BOSS] = "MOTHER_BOSS"
____exports.Music.DOGMA_BOSS = 44
____exports.Music[____exports.Music.DOGMA_BOSS] = "DOGMA_BOSS"
____exports.Music.BEAST_BOSS = 45
____exports.Music[____exports.Music.BEAST_BOSS] = "BEAST_BOSS"
____exports.Music.JINGLE_MOTHER_OVER = 47
____exports.Music[____exports.Music.JINGLE_MOTHER_OVER] = "JINGLE_MOTHER_OVER"
____exports.Music.JINGLE_DOGMA_OVER = 48
____exports.Music[____exports.Music.JINGLE_DOGMA_OVER] = "JINGLE_DOGMA_OVER"
____exports.Music.JINGLE_BEAST_OVER = 49
____exports.Music[____exports.Music.JINGLE_BEAST_OVER] = "JINGLE_BEAST_OVER"
____exports.Music.PLANETARIUM = 50
____exports.Music[____exports.Music.PLANETARIUM] = "PLANETARIUM"
____exports.Music.SECRET_ROOM_ALT_ALT = 51
____exports.Music[____exports.Music.SECRET_ROOM_ALT_ALT] = "SECRET_ROOM_ALT_ALT"
____exports.Music.BOSS_OVER_TWISTED = 52
____exports.Music[____exports.Music.BOSS_OVER_TWISTED] = "BOSS_OVER_TWISTED"
____exports.Music.CREDITS = 60
____exports.Music[____exports.Music.CREDITS] = "CREDITS"
____exports.Music.TITLE = 61
____exports.Music[____exports.Music.TITLE] = "TITLE"
____exports.Music.TITLE_AFTERBIRTH = 62
____exports.Music[____exports.Music.TITLE_AFTERBIRTH] = "TITLE_AFTERBIRTH"
____exports.Music.TITLE_REPENTANCE = 63
____exports.Music[____exports.Music.TITLE_REPENTANCE] = "TITLE_REPENTANCE"
____exports.Music.JINGLE_GAME_START_ALT = 64
____exports.Music[____exports.Music.JINGLE_GAME_START_ALT] = "JINGLE_GAME_START_ALT"
____exports.Music.JINGLE_NIGHTMARE_ALT = 65
____exports.Music[____exports.Music.JINGLE_NIGHTMARE_ALT] = "JINGLE_NIGHTMARE_ALT"
____exports.Music.MOTHERS_SHADOW_INTRO = 66
____exports.Music[____exports.Music.MOTHERS_SHADOW_INTRO] = "MOTHERS_SHADOW_INTRO"
____exports.Music.DOGMA_INTRO = 67
____exports.Music[____exports.Music.DOGMA_INTRO] = "DOGMA_INTRO"
____exports.Music.STRANGE_DOOR_JINGLE = 68
____exports.Music[____exports.Music.STRANGE_DOOR_JINGLE] = "STRANGE_DOOR_JINGLE"
____exports.Music.DARK_CLOSET = 69
____exports.Music[____exports.Music.DARK_CLOSET] = "DARK_CLOSET"
____exports.Music.CREDITS_ALT = 70
____exports.Music[____exports.Music.CREDITS_ALT] = "CREDITS_ALT"
____exports.Music.CREDITS_ALT_FINAL = 71
____exports.Music[____exports.Music.CREDITS_ALT_FINAL] = "CREDITS_ALT_FINAL"
____exports.Music.JINGLE_BOSS = 81
____exports.Music[____exports.Music.JINGLE_BOSS] = "JINGLE_BOSS"
____exports.Music.JINGLE_BOSS_OVER_1 = 83
____exports.Music[____exports.Music.JINGLE_BOSS_OVER_1] = "JINGLE_BOSS_OVER_1"
____exports.Music.JINGLE_HOLY_ROOM_FIND = 84
____exports.Music[____exports.Music.JINGLE_HOLY_ROOM_FIND] = "JINGLE_HOLY_ROOM_FIND"
____exports.Music.JINGLE_SECRET_ROOM_FIND = 85
____exports.Music[____exports.Music.JINGLE_SECRET_ROOM_FIND] = "JINGLE_SECRET_ROOM_FIND"
____exports.Music.JINGLE_TREASURE_ROOM_ENTRY_0 = 87
____exports.Music[____exports.Music.JINGLE_TREASURE_ROOM_ENTRY_0] = "JINGLE_TREASURE_ROOM_ENTRY_0"
____exports.Music.JINGLE_TREASURE_ROOM_ENTRY_1 = 88
____exports.Music[____exports.Music.JINGLE_TREASURE_ROOM_ENTRY_1] = "JINGLE_TREASURE_ROOM_ENTRY_1"
____exports.Music.JINGLE_TREASURE_ROOM_ENTRY_2 = 89
____exports.Music[____exports.Music.JINGLE_TREASURE_ROOM_ENTRY_2] = "JINGLE_TREASURE_ROOM_ENTRY_2"
____exports.Music.JINGLE_TREASURE_ROOM_ENTRY_3 = 90
____exports.Music[____exports.Music.JINGLE_TREASURE_ROOM_ENTRY_3] = "JINGLE_TREASURE_ROOM_ENTRY_3"
____exports.Music.JINGLE_CHALLENGE_ENTRY = 91
____exports.Music[____exports.Music.JINGLE_CHALLENGE_ENTRY] = "JINGLE_CHALLENGE_ENTRY"
____exports.Music.JINGLE_CHALLENGE_OUTRO = 92
____exports.Music[____exports.Music.JINGLE_CHALLENGE_OUTRO] = "JINGLE_CHALLENGE_OUTRO"
____exports.Music.JINGLE_GAME_OVER = 93
____exports.Music[____exports.Music.JINGLE_GAME_OVER] = "JINGLE_GAME_OVER"
____exports.Music.JINGLE_DEVIL_ROOM_FIND = 94
____exports.Music[____exports.Music.JINGLE_DEVIL_ROOM_FIND] = "JINGLE_DEVIL_ROOM_FIND"
____exports.Music.JINGLE_GAME_START = 95
____exports.Music[____exports.Music.JINGLE_GAME_START] = "JINGLE_GAME_START"
____exports.Music.JINGLE_NIGHTMARE = 96
____exports.Music[____exports.Music.JINGLE_NIGHTMARE] = "JINGLE_NIGHTMARE"
____exports.Music.JINGLE_BOSS_OVER_2 = 97
____exports.Music[____exports.Music.JINGLE_BOSS_OVER_2] = "JINGLE_BOSS_OVER_2"
____exports.Music.JINGLE_HUSH_OVER = 98
____exports.Music[____exports.Music.JINGLE_HUSH_OVER] = "JINGLE_HUSH_OVER"
____exports.Music.INTRO_VOICEOVER = 100
____exports.Music[____exports.Music.INTRO_VOICEOVER] = "INTRO_VOICEOVER"
____exports.Music.EPILOGUE_VOICEOVER = 101
____exports.Music[____exports.Music.EPILOGUE_VOICEOVER] = "EPILOGUE_VOICEOVER"
____exports.Music.VOID = 102
____exports.Music[____exports.Music.VOID] = "VOID"
____exports.Music.VOID_BOSS = 103
____exports.Music[____exports.Music.VOID_BOSS] = "VOID_BOSS"
____exports.Music.DOWNPOUR = 104
____exports.Music[____exports.Music.DOWNPOUR] = "DOWNPOUR"
____exports.Music.MINES = 105
____exports.Music[____exports.Music.MINES] = "MINES"
____exports.Music.MAUSOLEUM = 106
____exports.Music[____exports.Music.MAUSOLEUM] = "MAUSOLEUM"
____exports.Music.CORPSE = 107
____exports.Music[____exports.Music.CORPSE] = "CORPSE"
____exports.Music.DROSS = 108
____exports.Music[____exports.Music.DROSS] = "DROSS"
____exports.Music.ASHPIT = 109
____exports.Music[____exports.Music.ASHPIT] = "ASHPIT"
____exports.Music.GEHENNA = 110
____exports.Music[____exports.Music.GEHENNA] = "GEHENNA"
____exports.Music.MORTIS = 111
____exports.Music[____exports.Music.MORTIS] = "MORTIS"
____exports.Music.ISAACS_HOUSE = 112
____exports.Music[____exports.Music.ISAACS_HOUSE] = "ISAACS_HOUSE"
____exports.Music.FINAL_VOICEOVER = 113
____exports.Music[____exports.Music.FINAL_VOICEOVER] = "FINAL_VOICEOVER"
____exports.Music.DOWNPOUR_REVERSE = 114
____exports.Music[____exports.Music.DOWNPOUR_REVERSE] = "DOWNPOUR_REVERSE"
____exports.Music.DROSS_REVERSE = 115
____exports.Music[____exports.Music.DROSS_REVERSE] = "DROSS_REVERSE"
____exports.Music.MINESHAFT_AMBIENT = 116
____exports.Music[____exports.Music.MINESHAFT_AMBIENT] = "MINESHAFT_AMBIENT"
____exports.Music.MINESHAFT_ESCAPE = 117
____exports.Music[____exports.Music.MINESHAFT_ESCAPE] = "MINESHAFT_ESCAPE"
____exports.Music.REVERSE_GENESIS = 118
____exports.Music[____exports.Music.REVERSE_GENESIS] = "REVERSE_GENESIS"
return ____exports
 end,
["lua_modules.isaac-typescript-definitions.dist.src.enums.NpcState"] = function(...) 
local ____exports = {}
____exports.NpcState = {}
____exports.NpcState.INIT = 0
____exports.NpcState[____exports.NpcState.INIT] = "INIT"
____exports.NpcState.APPEAR = 1
____exports.NpcState[____exports.NpcState.APPEAR] = "APPEAR"
____exports.NpcState.APPEAR_CUSTOM = 2
____exports.NpcState[____exports.NpcState.APPEAR_CUSTOM] = "APPEAR_CUSTOM"
____exports.NpcState.IDLE = 3
____exports.NpcState[____exports.NpcState.IDLE] = "IDLE"
____exports.NpcState.MOVE = 4
____exports.NpcState[____exports.NpcState.MOVE] = "MOVE"
____exports.NpcState.SUICIDE = 5
____exports.NpcState[____exports.NpcState.SUICIDE] = "SUICIDE"
____exports.NpcState.JUMP = 6
____exports.NpcState[____exports.NpcState.JUMP] = "JUMP"
____exports.NpcState.STOMP = 7
____exports.NpcState[____exports.NpcState.STOMP] = "STOMP"
____exports.NpcState.ATTACK = 8
____exports.NpcState[____exports.NpcState.ATTACK] = "ATTACK"
____exports.NpcState.ATTACK_2 = 9
____exports.NpcState[____exports.NpcState.ATTACK_2] = "ATTACK_2"
____exports.NpcState.ATTACK_3 = 10
____exports.NpcState[____exports.NpcState.ATTACK_3] = "ATTACK_3"
____exports.NpcState.ATTACK_4 = 11
____exports.NpcState[____exports.NpcState.ATTACK_4] = "ATTACK_4"
____exports.NpcState.ATTACK_5 = 12
____exports.NpcState[____exports.NpcState.ATTACK_5] = "ATTACK_5"
____exports.NpcState.SUMMON = 13
____exports.NpcState[____exports.NpcState.SUMMON] = "SUMMON"
____exports.NpcState.SUMMON_2 = 14
____exports.NpcState[____exports.NpcState.SUMMON_2] = "SUMMON_2"
____exports.NpcState.SUMMON_3 = 15
____exports.NpcState[____exports.NpcState.SUMMON_3] = "SUMMON_3"
____exports.NpcState.SPECIAL = 16
____exports.NpcState[____exports.NpcState.SPECIAL] = "SPECIAL"
____exports.NpcState.UNIQUE_DEATH = 17
____exports.NpcState[____exports.NpcState.UNIQUE_DEATH] = "UNIQUE_DEATH"
____exports.NpcState.DEATH = 18
____exports.NpcState[____exports.NpcState.DEATH] = "DEATH"
return ____exports
 end,
["lua_modules.isaac-typescript-definitions.dist.src.enums.NullItemID"] = function(...) 
local ____exports = {}
____exports.NullItemID = {}
____exports.NullItemID.NULL = -1
____exports.NullItemID[____exports.NullItemID.NULL] = "NULL"
____exports.NullItemID.EXPLOSIVE_DIARRHEA = 0
____exports.NullItemID[____exports.NullItemID.EXPLOSIVE_DIARRHEA] = "EXPLOSIVE_DIARRHEA"
____exports.NullItemID.PUBERTY = 1
____exports.NullItemID[____exports.NullItemID.PUBERTY] = "PUBERTY"
____exports.NullItemID.I_FOUND_PILLS = 2
____exports.NullItemID[____exports.NullItemID.I_FOUND_PILLS] = "I_FOUND_PILLS"
____exports.NullItemID.LORD_OF_THE_FLIES = 3
____exports.NullItemID[____exports.NullItemID.LORD_OF_THE_FLIES] = "LORD_OF_THE_FLIES"
____exports.NullItemID.STATUE = 4
____exports.NullItemID[____exports.NullItemID.STATUE] = "STATUE"
____exports.NullItemID.GUPPY = 5
____exports.NullItemID[____exports.NullItemID.GUPPY] = "GUPPY"
____exports.NullItemID.WIZARD = 6
____exports.NullItemID[____exports.NullItemID.WIZARD] = "WIZARD"
____exports.NullItemID.MAGDALENE = 7
____exports.NullItemID[____exports.NullItemID.MAGDALENE] = "MAGDALENE"
____exports.NullItemID.CAIN = 8
____exports.NullItemID[____exports.NullItemID.CAIN] = "CAIN"
____exports.NullItemID.JUDAS = 9
____exports.NullItemID[____exports.NullItemID.JUDAS] = "JUDAS"
____exports.NullItemID.EVE = 10
____exports.NullItemID[____exports.NullItemID.EVE] = "EVE"
____exports.NullItemID.AZAZEL = 11
____exports.NullItemID[____exports.NullItemID.AZAZEL] = "AZAZEL"
____exports.NullItemID.EDEN = 12
____exports.NullItemID[____exports.NullItemID.EDEN] = "EDEN"
____exports.NullItemID.SAMSON = 13
____exports.NullItemID[____exports.NullItemID.SAMSON] = "SAMSON"
____exports.NullItemID.BLINDFOLD = 14
____exports.NullItemID[____exports.NullItemID.BLINDFOLD] = "BLINDFOLD"
____exports.NullItemID.BLANK_FACE = 15
____exports.NullItemID[____exports.NullItemID.BLANK_FACE] = "BLANK_FACE"
____exports.NullItemID.CHRISTMAS = 16
____exports.NullItemID[____exports.NullItemID.CHRISTMAS] = "CHRISTMAS"
____exports.NullItemID.PURITY_GLOW = 17
____exports.NullItemID[____exports.NullItemID.PURITY_GLOW] = "PURITY_GLOW"
____exports.NullItemID.EMPTY_VESSEL = 18
____exports.NullItemID[____exports.NullItemID.EMPTY_VESSEL] = "EMPTY_VESSEL"
____exports.NullItemID.MAW_MARK = 19
____exports.NullItemID[____exports.NullItemID.MAW_MARK] = "MAW_MARK"
____exports.NullItemID.MUSHROOM = 20
____exports.NullItemID[____exports.NullItemID.MUSHROOM] = "MUSHROOM"
____exports.NullItemID.ANGEL = 21
____exports.NullItemID[____exports.NullItemID.ANGEL] = "ANGEL"
____exports.NullItemID.BOB = 22
____exports.NullItemID[____exports.NullItemID.BOB] = "BOB"
____exports.NullItemID.DRUGS = 23
____exports.NullItemID[____exports.NullItemID.DRUGS] = "DRUGS"
____exports.NullItemID.MOM = 24
____exports.NullItemID[____exports.NullItemID.MOM] = "MOM"
____exports.NullItemID.BABY = 25
____exports.NullItemID[____exports.NullItemID.BABY] = "BABY"
____exports.NullItemID.EVIL_ANGEL = 26
____exports.NullItemID[____exports.NullItemID.EVIL_ANGEL] = "EVIL_ANGEL"
____exports.NullItemID.POOP = 27
____exports.NullItemID[____exports.NullItemID.POOP] = "POOP"
____exports.NullItemID.RELAX = 28
____exports.NullItemID[____exports.NullItemID.RELAX] = "RELAX"
____exports.NullItemID.OVERDOSE = 29
____exports.NullItemID[____exports.NullItemID.OVERDOSE] = "OVERDOSE"
____exports.NullItemID.BOOMERANG = 30
____exports.NullItemID[____exports.NullItemID.BOOMERANG] = "BOOMERANG"
____exports.NullItemID.MEGA_BLAST = 31
____exports.NullItemID[____exports.NullItemID.MEGA_BLAST] = "MEGA_BLAST"
____exports.NullItemID.LAZARUS = 32
____exports.NullItemID[____exports.NullItemID.LAZARUS] = "LAZARUS"
____exports.NullItemID.LAZARUS_2 = 33
____exports.NullItemID[____exports.NullItemID.LAZARUS_2] = "LAZARUS_2"
____exports.NullItemID.LILITH = 34
____exports.NullItemID[____exports.NullItemID.LILITH] = "LILITH"
____exports.NullItemID.IWATA = 35
____exports.NullItemID[____exports.NullItemID.IWATA] = "IWATA"
____exports.NullItemID.APOLLYON = 36
____exports.NullItemID[____exports.NullItemID.APOLLYON] = "APOLLYON"
____exports.NullItemID.BOOKWORM = 37
____exports.NullItemID[____exports.NullItemID.BOOKWORM] = "BOOKWORM"
____exports.NullItemID.ADULTHOOD = 38
____exports.NullItemID[____exports.NullItemID.ADULTHOOD] = "ADULTHOOD"
____exports.NullItemID.SPIDER_BABY = 39
____exports.NullItemID[____exports.NullItemID.SPIDER_BABY] = "SPIDER_BABY"
____exports.NullItemID.BATWING_WINGS = 40
____exports.NullItemID[____exports.NullItemID.BATWING_WINGS] = "BATWING_WINGS"
____exports.NullItemID.HUGE_GROWTH = 41
____exports.NullItemID[____exports.NullItemID.HUGE_GROWTH] = "HUGE_GROWTH"
____exports.NullItemID.ERA_WALK = 42
____exports.NullItemID[____exports.NullItemID.ERA_WALK] = "ERA_WALK"
____exports.NullItemID.SACRIFICIAL_ALTAR = 43
____exports.NullItemID[____exports.NullItemID.SACRIFICIAL_ALTAR] = "SACRIFICIAL_ALTAR"
____exports.NullItemID.FORGOTTEN = 44
____exports.NullItemID[____exports.NullItemID.FORGOTTEN] = "FORGOTTEN"
____exports.NullItemID.BRIMSTONE_2 = 45
____exports.NullItemID[____exports.NullItemID.BRIMSTONE_2] = "BRIMSTONE_2"
____exports.NullItemID.HOLY_CARD = 46
____exports.NullItemID[____exports.NullItemID.HOLY_CARD] = "HOLY_CARD"
____exports.NullItemID.KEEPER = 47
____exports.NullItemID[____exports.NullItemID.KEEPER] = "KEEPER"
____exports.NullItemID.CAMO_BOOST = 48
____exports.NullItemID[____exports.NullItemID.CAMO_BOOST] = "CAMO_BOOST"
____exports.NullItemID.LAZARUS_BOOST = 49
____exports.NullItemID[____exports.NullItemID.LAZARUS_BOOST] = "LAZARUS_BOOST"
____exports.NullItemID.SPIN_TO_WIN = 50
____exports.NullItemID[____exports.NullItemID.SPIN_TO_WIN] = "SPIN_TO_WIN"
____exports.NullItemID.BETHANY = 51
____exports.NullItemID[____exports.NullItemID.BETHANY] = "BETHANY"
____exports.NullItemID.JACOB = 52
____exports.NullItemID[____exports.NullItemID.JACOB] = "JACOB"
____exports.NullItemID.ESAU = 53
____exports.NullItemID[____exports.NullItemID.ESAU] = "ESAU"
____exports.NullItemID.BLOOD_OATH = 54
____exports.NullItemID[____exports.NullItemID.BLOOD_OATH] = "BLOOD_OATH"
____exports.NullItemID.INTRUDER = 55
____exports.NullItemID[____exports.NullItemID.INTRUDER] = "INTRUDER"
____exports.NullItemID.SOL = 56
____exports.NullItemID[____exports.NullItemID.SOL] = "SOL"
____exports.NullItemID.IT_HURTS = 57
____exports.NullItemID[____exports.NullItemID.IT_HURTS] = "IT_HURTS"
____exports.NullItemID.MARS = 58
____exports.NullItemID[____exports.NullItemID.MARS] = "MARS"
____exports.NullItemID.TOOTH_AND_NAIL = 59
____exports.NullItemID[____exports.NullItemID.TOOTH_AND_NAIL] = "TOOTH_AND_NAIL"
____exports.NullItemID.REVERSE_MAGICIAN = 60
____exports.NullItemID[____exports.NullItemID.REVERSE_MAGICIAN] = "REVERSE_MAGICIAN"
____exports.NullItemID.REVERSE_HIGH_PRIESTESS = 61
____exports.NullItemID[____exports.NullItemID.REVERSE_HIGH_PRIESTESS] = "REVERSE_HIGH_PRIESTESS"
____exports.NullItemID.REVERSE_EMPRESS = 62
____exports.NullItemID[____exports.NullItemID.REVERSE_EMPRESS] = "REVERSE_EMPRESS"
____exports.NullItemID.REVERSE_CHARIOT = 63
____exports.NullItemID[____exports.NullItemID.REVERSE_CHARIOT] = "REVERSE_CHARIOT"
____exports.NullItemID.REVERSE_STRENGTH = 64
____exports.NullItemID[____exports.NullItemID.REVERSE_STRENGTH] = "REVERSE_STRENGTH"
____exports.NullItemID.REVERSE_HANGED_MAN = 65
____exports.NullItemID[____exports.NullItemID.REVERSE_HANGED_MAN] = "REVERSE_HANGED_MAN"
____exports.NullItemID.REVERSE_SUN = 66
____exports.NullItemID[____exports.NullItemID.REVERSE_SUN] = "REVERSE_SUN"
____exports.NullItemID.REVERSE_DEVIL = 67
____exports.NullItemID[____exports.NullItemID.REVERSE_DEVIL] = "REVERSE_DEVIL"
____exports.NullItemID.REVERSE_CHARIOT_ALT = 68
____exports.NullItemID[____exports.NullItemID.REVERSE_CHARIOT_ALT] = "REVERSE_CHARIOT_ALT"
____exports.NullItemID.REVERSE_TEMPERANCE = 69
____exports.NullItemID[____exports.NullItemID.REVERSE_TEMPERANCE] = "REVERSE_TEMPERANCE"
____exports.NullItemID.REVERSE_STARS = 70
____exports.NullItemID[____exports.NullItemID.REVERSE_STARS] = "REVERSE_STARS"
____exports.NullItemID.WAVY_CAP_1 = 71
____exports.NullItemID[____exports.NullItemID.WAVY_CAP_1] = "WAVY_CAP_1"
____exports.NullItemID.WAVY_CAP_2 = 72
____exports.NullItemID[____exports.NullItemID.WAVY_CAP_2] = "WAVY_CAP_2"
____exports.NullItemID.WAVY_CAP_3 = 73
____exports.NullItemID[____exports.NullItemID.WAVY_CAP_3] = "WAVY_CAP_3"
____exports.NullItemID.LUNA = 74
____exports.NullItemID[____exports.NullItemID.LUNA] = "LUNA"
____exports.NullItemID.JUPITER_BODY = 75
____exports.NullItemID[____exports.NullItemID.JUPITER_BODY] = "JUPITER_BODY"
____exports.NullItemID.JUPITER_BODY_ANGEL = 76
____exports.NullItemID[____exports.NullItemID.JUPITER_BODY_ANGEL] = "JUPITER_BODY_ANGEL"
____exports.NullItemID.JUPITER_BODY_PONY = 77
____exports.NullItemID[____exports.NullItemID.JUPITER_BODY_PONY] = "JUPITER_BODY_PONY"
____exports.NullItemID.JUPITER_BODY_WHITE_PONY = 78
____exports.NullItemID[____exports.NullItemID.JUPITER_BODY_WHITE_PONY] = "JUPITER_BODY_WHITE_PONY"
____exports.NullItemID.ISAAC_B = 79
____exports.NullItemID[____exports.NullItemID.ISAAC_B] = "ISAAC_B"
____exports.NullItemID.MAGDALENE_B = 80
____exports.NullItemID[____exports.NullItemID.MAGDALENE_B] = "MAGDALENE_B"
____exports.NullItemID.CAIN_B = 81
____exports.NullItemID[____exports.NullItemID.CAIN_B] = "CAIN_B"
____exports.NullItemID.JUDAS_B = 82
____exports.NullItemID[____exports.NullItemID.JUDAS_B] = "JUDAS_B"
____exports.NullItemID.BLUE_BABY_B = 83
____exports.NullItemID[____exports.NullItemID.BLUE_BABY_B] = "BLUE_BABY_B"
____exports.NullItemID.EVE_B = 84
____exports.NullItemID[____exports.NullItemID.EVE_B] = "EVE_B"
____exports.NullItemID.SAMSON_B = 85
____exports.NullItemID[____exports.NullItemID.SAMSON_B] = "SAMSON_B"
____exports.NullItemID.AZAZEL_B = 86
____exports.NullItemID[____exports.NullItemID.AZAZEL_B] = "AZAZEL_B"
____exports.NullItemID.LAZARUS_B = 87
____exports.NullItemID[____exports.NullItemID.LAZARUS_B] = "LAZARUS_B"
____exports.NullItemID.EDEN_B = 88
____exports.NullItemID[____exports.NullItemID.EDEN_B] = "EDEN_B"
____exports.NullItemID.LOST_B = 89
____exports.NullItemID[____exports.NullItemID.LOST_B] = "LOST_B"
____exports.NullItemID.LILITH_B = 90
____exports.NullItemID[____exports.NullItemID.LILITH_B] = "LILITH_B"
____exports.NullItemID.KEEPER_B = 91
____exports.NullItemID[____exports.NullItemID.KEEPER_B] = "KEEPER_B"
____exports.NullItemID.APOLLYON_B = 92
____exports.NullItemID[____exports.NullItemID.APOLLYON_B] = "APOLLYON_B"
____exports.NullItemID.FORGOTTEN_B = 93
____exports.NullItemID[____exports.NullItemID.FORGOTTEN_B] = "FORGOTTEN_B"
____exports.NullItemID.BETHANY_B = 94
____exports.NullItemID[____exports.NullItemID.BETHANY_B] = "BETHANY_B"
____exports.NullItemID.JACOB_B = 95
____exports.NullItemID[____exports.NullItemID.JACOB_B] = "JACOB_B"
____exports.NullItemID.AZAZELS_RAGE_1 = 96
____exports.NullItemID[____exports.NullItemID.AZAZELS_RAGE_1] = "AZAZELS_RAGE_1"
____exports.NullItemID.AZAZELS_RAGE_2 = 97
____exports.NullItemID[____exports.NullItemID.AZAZELS_RAGE_2] = "AZAZELS_RAGE_2"
____exports.NullItemID.AZAZELS_RAGE_3 = 98
____exports.NullItemID[____exports.NullItemID.AZAZELS_RAGE_3] = "AZAZELS_RAGE_3"
____exports.NullItemID.AZAZELS_RAGE_4 = 99
____exports.NullItemID[____exports.NullItemID.AZAZELS_RAGE_4] = "AZAZELS_RAGE_4"
____exports.NullItemID.ESAU_JR = 100
____exports.NullItemID[____exports.NullItemID.ESAU_JR] = "ESAU_JR"
____exports.NullItemID.SPIRIT_SHACKLES_SOUL = 101
____exports.NullItemID[____exports.NullItemID.SPIRIT_SHACKLES_SOUL] = "SPIRIT_SHACKLES_SOUL"
____exports.NullItemID.SPIRIT_SHACKLES_DISABLED = 102
____exports.NullItemID[____exports.NullItemID.SPIRIT_SHACKLES_DISABLED] = "SPIRIT_SHACKLES_DISABLED"
____exports.NullItemID.BERSERK_SAMSON = 103
____exports.NullItemID[____exports.NullItemID.BERSERK_SAMSON] = "BERSERK_SAMSON"
____exports.NullItemID.LAZARUS_2_B = 104
____exports.NullItemID[____exports.NullItemID.LAZARUS_2_B] = "LAZARUS_2_B"
____exports.NullItemID.SOUL_B = 105
____exports.NullItemID[____exports.NullItemID.SOUL_B] = "SOUL_B"
____exports.NullItemID.FORGOTTEN_BOMB = 106
____exports.NullItemID[____exports.NullItemID.FORGOTTEN_BOMB] = "FORGOTTEN_BOMB"
____exports.NullItemID.EXTRA_BIG_FAN = 107
____exports.NullItemID[____exports.NullItemID.EXTRA_BIG_FAN] = "EXTRA_BIG_FAN"
____exports.NullItemID.JACOB_2_B = 108
____exports.NullItemID[____exports.NullItemID.JACOB_2_B] = "JACOB_2_B"
____exports.NullItemID.JACOBS_CURSE = 109
____exports.NullItemID[____exports.NullItemID.JACOBS_CURSE] = "JACOBS_CURSE"
____exports.NullItemID.BLOODY_BABYLON = 110
____exports.NullItemID[____exports.NullItemID.BLOODY_BABYLON] = "BLOODY_BABYLON"
____exports.NullItemID.DARK_ARTS = 111
____exports.NullItemID[____exports.NullItemID.DARK_ARTS] = "DARK_ARTS"
____exports.NullItemID.LOST_CURSE = 112
____exports.NullItemID[____exports.NullItemID.LOST_CURSE] = "LOST_CURSE"
____exports.NullItemID.LAZARUS_SOUL_REVIVE = 113
____exports.NullItemID[____exports.NullItemID.LAZARUS_SOUL_REVIVE] = "LAZARUS_SOUL_REVIVE"
____exports.NullItemID.SOUL_MAGDALENE = 114
____exports.NullItemID[____exports.NullItemID.SOUL_MAGDALENE] = "SOUL_MAGDALENE"
____exports.NullItemID.SOUL_BLUE_BABY = 115
____exports.NullItemID[____exports.NullItemID.SOUL_BLUE_BABY] = "SOUL_BLUE_BABY"
____exports.NullItemID.MIRROR_DEATH = 116
____exports.NullItemID[____exports.NullItemID.MIRROR_DEATH] = "MIRROR_DEATH"
____exports.NullItemID.HEMOPTYSIS = 117
____exports.NullItemID[____exports.NullItemID.HEMOPTYSIS] = "HEMOPTYSIS"
____exports.NullItemID.I_FOUND_HORSE_PILLS = 118
____exports.NullItemID[____exports.NullItemID.I_FOUND_HORSE_PILLS] = "I_FOUND_HORSE_PILLS"
____exports.NullItemID.HORSE_PUBERTY = 119
____exports.NullItemID[____exports.NullItemID.HORSE_PUBERTY] = "HORSE_PUBERTY"
____exports.NullItemID.SOUL_FORGOTTEN = 120
____exports.NullItemID[____exports.NullItemID.SOUL_FORGOTTEN] = "SOUL_FORGOTTEN"
____exports.NullItemID.SOUL_JACOB = 121
____exports.NullItemID[____exports.NullItemID.SOUL_JACOB] = "SOUL_JACOB"
____exports.NullItemID.BETHANY_B_BIRTHRIGHT = 122
____exports.NullItemID[____exports.NullItemID.BETHANY_B_BIRTHRIGHT] = "BETHANY_B_BIRTHRIGHT"
____exports.NullItemID.JUDAS_BIRTHRIGHT = 123
____exports.NullItemID[____exports.NullItemID.JUDAS_BIRTHRIGHT] = "JUDAS_BIRTHRIGHT"
____exports.NullItemID.JUDAS_BIRTHRIGHT_TIMED = 124
____exports.NullItemID[____exports.NullItemID.JUDAS_BIRTHRIGHT_TIMED] = "JUDAS_BIRTHRIGHT_TIMED"
____exports.NullItemID.DOUBLE_GUPPYS_EYE = 125
____exports.NullItemID[____exports.NullItemID.DOUBLE_GUPPYS_EYE] = "DOUBLE_GUPPYS_EYE"
____exports.NullItemID.DOUBLE_GLASS_EYE = 126
____exports.NullItemID[____exports.NullItemID.DOUBLE_GLASS_EYE] = "DOUBLE_GLASS_EYE"
____exports.NullItemID.HEMOPTYSIS_BOOST = 127
____exports.NullItemID[____exports.NullItemID.HEMOPTYSIS_BOOST] = "HEMOPTYSIS_BOOST"
____exports.NullItemID.SOUL_JUDAS = 128
____exports.NullItemID[____exports.NullItemID.SOUL_JUDAS] = "SOUL_JUDAS"
____exports.NullItemID.JUDAS_BIRTHRIGHT_STAGE = 129
____exports.NullItemID[____exports.NullItemID.JUDAS_BIRTHRIGHT_STAGE] = "JUDAS_BIRTHRIGHT_STAGE"
____exports.NullItemID.JUDAS_BIRTHRIGHT_PERMANENT = 130
____exports.NullItemID[____exports.NullItemID.JUDAS_BIRTHRIGHT_PERMANENT] = "JUDAS_BIRTHRIGHT_PERMANENT"
____exports.NullItemID.ESAU_JR_FAMILIAR = 131
____exports.NullItemID[____exports.NullItemID.ESAU_JR_FAMILIAR] = "ESAU_JR_FAMILIAR"
return ____exports
 end,
["lua_modules.isaac-typescript-definitions.dist.src.enums.PickupPrice"] = function(...) 
local ____exports = {}
____exports.PickupPrice = {}
____exports.PickupPrice.NULL = 0
____exports.PickupPrice[____exports.PickupPrice.NULL] = "NULL"
____exports.PickupPrice.ONE_HEART = -1
____exports.PickupPrice[____exports.PickupPrice.ONE_HEART] = "ONE_HEART"
____exports.PickupPrice.TWO_HEARTS = -2
____exports.PickupPrice[____exports.PickupPrice.TWO_HEARTS] = "TWO_HEARTS"
____exports.PickupPrice.THREE_SOUL_HEARTS = -3
____exports.PickupPrice[____exports.PickupPrice.THREE_SOUL_HEARTS] = "THREE_SOUL_HEARTS"
____exports.PickupPrice.ONE_HEART_AND_TWO_SOUL_HEARTS = -4
____exports.PickupPrice[____exports.PickupPrice.ONE_HEART_AND_TWO_SOUL_HEARTS] = "ONE_HEART_AND_TWO_SOUL_HEARTS"
____exports.PickupPrice.SPIKES = -5
____exports.PickupPrice[____exports.PickupPrice.SPIKES] = "SPIKES"
____exports.PickupPrice.YOUR_SOUL = -6
____exports.PickupPrice[____exports.PickupPrice.YOUR_SOUL] = "YOUR_SOUL"
____exports.PickupPrice.ONE_SOUL_HEART = -7
____exports.PickupPrice[____exports.PickupPrice.ONE_SOUL_HEART] = "ONE_SOUL_HEART"
____exports.PickupPrice.TWO_SOUL_HEARTS = -8
____exports.PickupPrice[____exports.PickupPrice.TWO_SOUL_HEARTS] = "TWO_SOUL_HEARTS"
____exports.PickupPrice.ONE_HEART_AND_ONE_SOUL_HEART = -9
____exports.PickupPrice[____exports.PickupPrice.ONE_HEART_AND_ONE_SOUL_HEART] = "ONE_HEART_AND_ONE_SOUL_HEART"
____exports.PickupPrice.FREE = -1000
____exports.PickupPrice[____exports.PickupPrice.FREE] = "FREE"
return ____exports
 end,
["lua_modules.isaac-typescript-definitions.dist.src.enums.PillEffect"] = function(...) 
local ____exports = {}
____exports.PillEffect = {}
____exports.PillEffect.BAD_GAS = 0
____exports.PillEffect[____exports.PillEffect.BAD_GAS] = "BAD_GAS"
____exports.PillEffect.BAD_TRIP = 1
____exports.PillEffect[____exports.PillEffect.BAD_TRIP] = "BAD_TRIP"
____exports.PillEffect.BALLS_OF_STEEL = 2
____exports.PillEffect[____exports.PillEffect.BALLS_OF_STEEL] = "BALLS_OF_STEEL"
____exports.PillEffect.BOMBS_ARE_KEYS = 3
____exports.PillEffect[____exports.PillEffect.BOMBS_ARE_KEYS] = "BOMBS_ARE_KEYS"
____exports.PillEffect.EXPLOSIVE_DIARRHEA = 4
____exports.PillEffect[____exports.PillEffect.EXPLOSIVE_DIARRHEA] = "EXPLOSIVE_DIARRHEA"
____exports.PillEffect.FULL_HEALTH = 5
____exports.PillEffect[____exports.PillEffect.FULL_HEALTH] = "FULL_HEALTH"
____exports.PillEffect.HEALTH_DOWN = 6
____exports.PillEffect[____exports.PillEffect.HEALTH_DOWN] = "HEALTH_DOWN"
____exports.PillEffect.HEALTH_UP = 7
____exports.PillEffect[____exports.PillEffect.HEALTH_UP] = "HEALTH_UP"
____exports.PillEffect.I_FOUND_PILLS = 8
____exports.PillEffect[____exports.PillEffect.I_FOUND_PILLS] = "I_FOUND_PILLS"
____exports.PillEffect.PUBERTY = 9
____exports.PillEffect[____exports.PillEffect.PUBERTY] = "PUBERTY"
____exports.PillEffect.PRETTY_FLY = 10
____exports.PillEffect[____exports.PillEffect.PRETTY_FLY] = "PRETTY_FLY"
____exports.PillEffect.RANGE_DOWN = 11
____exports.PillEffect[____exports.PillEffect.RANGE_DOWN] = "RANGE_DOWN"
____exports.PillEffect.RANGE_UP = 12
____exports.PillEffect[____exports.PillEffect.RANGE_UP] = "RANGE_UP"
____exports.PillEffect.SPEED_DOWN = 13
____exports.PillEffect[____exports.PillEffect.SPEED_DOWN] = "SPEED_DOWN"
____exports.PillEffect.SPEED_UP = 14
____exports.PillEffect[____exports.PillEffect.SPEED_UP] = "SPEED_UP"
____exports.PillEffect.TEARS_DOWN = 15
____exports.PillEffect[____exports.PillEffect.TEARS_DOWN] = "TEARS_DOWN"
____exports.PillEffect.TEARS_UP = 16
____exports.PillEffect[____exports.PillEffect.TEARS_UP] = "TEARS_UP"
____exports.PillEffect.LUCK_DOWN = 17
____exports.PillEffect[____exports.PillEffect.LUCK_DOWN] = "LUCK_DOWN"
____exports.PillEffect.LUCK_UP = 18
____exports.PillEffect[____exports.PillEffect.LUCK_UP] = "LUCK_UP"
____exports.PillEffect.TELEPILLS = 19
____exports.PillEffect[____exports.PillEffect.TELEPILLS] = "TELEPILLS"
____exports.PillEffect.FORTY_EIGHT_HOUR_ENERGY = 20
____exports.PillEffect[____exports.PillEffect.FORTY_EIGHT_HOUR_ENERGY] = "FORTY_EIGHT_HOUR_ENERGY"
____exports.PillEffect.HEMATEMESIS = 21
____exports.PillEffect[____exports.PillEffect.HEMATEMESIS] = "HEMATEMESIS"
____exports.PillEffect.PARALYSIS = 22
____exports.PillEffect[____exports.PillEffect.PARALYSIS] = "PARALYSIS"
____exports.PillEffect.I_CAN_SEE_FOREVER = 23
____exports.PillEffect[____exports.PillEffect.I_CAN_SEE_FOREVER] = "I_CAN_SEE_FOREVER"
____exports.PillEffect.PHEROMONES = 24
____exports.PillEffect[____exports.PillEffect.PHEROMONES] = "PHEROMONES"
____exports.PillEffect.AMNESIA = 25
____exports.PillEffect[____exports.PillEffect.AMNESIA] = "AMNESIA"
____exports.PillEffect.LEMON_PARTY = 26
____exports.PillEffect[____exports.PillEffect.LEMON_PARTY] = "LEMON_PARTY"
____exports.PillEffect.R_U_A_WIZARD = 27
____exports.PillEffect[____exports.PillEffect.R_U_A_WIZARD] = "R_U_A_WIZARD"
____exports.PillEffect.PERCS = 28
____exports.PillEffect[____exports.PillEffect.PERCS] = "PERCS"
____exports.PillEffect.ADDICTED = 29
____exports.PillEffect[____exports.PillEffect.ADDICTED] = "ADDICTED"
____exports.PillEffect.RELAX = 30
____exports.PillEffect[____exports.PillEffect.RELAX] = "RELAX"
____exports.PillEffect.QUESTION_MARKS = 31
____exports.PillEffect[____exports.PillEffect.QUESTION_MARKS] = "QUESTION_MARKS"
____exports.PillEffect.ONE_MAKES_YOU_LARGER = 32
____exports.PillEffect[____exports.PillEffect.ONE_MAKES_YOU_LARGER] = "ONE_MAKES_YOU_LARGER"
____exports.PillEffect.ONE_MAKES_YOU_SMALL = 33
____exports.PillEffect[____exports.PillEffect.ONE_MAKES_YOU_SMALL] = "ONE_MAKES_YOU_SMALL"
____exports.PillEffect.INFESTED_EXCLAMATION = 34
____exports.PillEffect[____exports.PillEffect.INFESTED_EXCLAMATION] = "INFESTED_EXCLAMATION"
____exports.PillEffect.INFESTED_QUESTION = 35
____exports.PillEffect[____exports.PillEffect.INFESTED_QUESTION] = "INFESTED_QUESTION"
____exports.PillEffect.POWER = 36
____exports.PillEffect[____exports.PillEffect.POWER] = "POWER"
____exports.PillEffect.RETRO_VISION = 37
____exports.PillEffect[____exports.PillEffect.RETRO_VISION] = "RETRO_VISION"
____exports.PillEffect.FRIENDS_TILL_THE_END = 38
____exports.PillEffect[____exports.PillEffect.FRIENDS_TILL_THE_END] = "FRIENDS_TILL_THE_END"
____exports.PillEffect.X_LAX = 39
____exports.PillEffect[____exports.PillEffect.X_LAX] = "X_LAX"
____exports.PillEffect.SOMETHINGS_WRONG = 40
____exports.PillEffect[____exports.PillEffect.SOMETHINGS_WRONG] = "SOMETHINGS_WRONG"
____exports.PillEffect.IM_DROWSY = 41
____exports.PillEffect[____exports.PillEffect.IM_DROWSY] = "IM_DROWSY"
____exports.PillEffect.IM_EXCITED = 42
____exports.PillEffect[____exports.PillEffect.IM_EXCITED] = "IM_EXCITED"
____exports.PillEffect.GULP = 43
____exports.PillEffect[____exports.PillEffect.GULP] = "GULP"
____exports.PillEffect.HORF = 44
____exports.PillEffect[____exports.PillEffect.HORF] = "HORF"
____exports.PillEffect.FEELS_LIKE_IM_WALKING_ON_SUNSHINE = 45
____exports.PillEffect[____exports.PillEffect.FEELS_LIKE_IM_WALKING_ON_SUNSHINE] = "FEELS_LIKE_IM_WALKING_ON_SUNSHINE"
____exports.PillEffect.VURP = 46
____exports.PillEffect[____exports.PillEffect.VURP] = "VURP"
____exports.PillEffect.SHOT_SPEED_DOWN = 47
____exports.PillEffect[____exports.PillEffect.SHOT_SPEED_DOWN] = "SHOT_SPEED_DOWN"
____exports.PillEffect.SHOT_SPEED_UP = 48
____exports.PillEffect[____exports.PillEffect.SHOT_SPEED_UP] = "SHOT_SPEED_UP"
____exports.PillEffect.EXPERIMENTAL = 49
____exports.PillEffect[____exports.PillEffect.EXPERIMENTAL] = "EXPERIMENTAL"
return ____exports
 end,
["lua_modules.isaac-typescript-definitions.dist.src.enums.PlayerForm"] = function(...) 
local ____exports = {}
--- The possible transformations that the player can have.
____exports.PlayerForm = {}
____exports.PlayerForm.GUPPY = 0
____exports.PlayerForm[____exports.PlayerForm.GUPPY] = "GUPPY"
____exports.PlayerForm.BEELZEBUB = 1
____exports.PlayerForm[____exports.PlayerForm.BEELZEBUB] = "BEELZEBUB"
____exports.PlayerForm.FUN_GUY = 2
____exports.PlayerForm[____exports.PlayerForm.FUN_GUY] = "FUN_GUY"
____exports.PlayerForm.SERAPHIM = 3
____exports.PlayerForm[____exports.PlayerForm.SERAPHIM] = "SERAPHIM"
____exports.PlayerForm.BOB = 4
____exports.PlayerForm[____exports.PlayerForm.BOB] = "BOB"
____exports.PlayerForm.SPUN = 5
____exports.PlayerForm[____exports.PlayerForm.SPUN] = "SPUN"
____exports.PlayerForm.YES_MOTHER = 6
____exports.PlayerForm[____exports.PlayerForm.YES_MOTHER] = "YES_MOTHER"
____exports.PlayerForm.CONJOINED = 7
____exports.PlayerForm[____exports.PlayerForm.CONJOINED] = "CONJOINED"
____exports.PlayerForm.LEVIATHAN = 8
____exports.PlayerForm[____exports.PlayerForm.LEVIATHAN] = "LEVIATHAN"
____exports.PlayerForm.OH_CRAP = 9
____exports.PlayerForm[____exports.PlayerForm.OH_CRAP] = "OH_CRAP"
____exports.PlayerForm.BOOKWORM = 10
____exports.PlayerForm[____exports.PlayerForm.BOOKWORM] = "BOOKWORM"
____exports.PlayerForm.ADULT = 11
____exports.PlayerForm[____exports.PlayerForm.ADULT] = "ADULT"
____exports.PlayerForm.SPIDER_BABY = 12
____exports.PlayerForm[____exports.PlayerForm.SPIDER_BABY] = "SPIDER_BABY"
____exports.PlayerForm.STOMPY = 13
____exports.PlayerForm[____exports.PlayerForm.STOMPY] = "STOMPY"
return ____exports
 end,
["lua_modules.isaac-typescript-definitions.dist.src.enums.PlayerItemAnimation"] = function(...) 
local ____exports = {}
____exports.PlayerItemAnimation = {}
____exports.PlayerItemAnimation.PICKUP = "Pickup"
____exports.PlayerItemAnimation.LIFT_ITEM = "LiftItem"
____exports.PlayerItemAnimation.HIDE_ITEM = "HideItem"
____exports.PlayerItemAnimation.USE_ITEM = "UseItem"
return ____exports
 end,
["lua_modules.isaac-typescript-definitions.dist.src.enums.PlayerSpriteLayer"] = function(...) 
local ____exports = {}
--- Corresponds to "resources/gfx/001.000_player.anm2".
____exports.PlayerSpriteLayer = {}
____exports.PlayerSpriteLayer.GLOW = 0
____exports.PlayerSpriteLayer[____exports.PlayerSpriteLayer.GLOW] = "GLOW"
____exports.PlayerSpriteLayer.BODY = 1
____exports.PlayerSpriteLayer[____exports.PlayerSpriteLayer.BODY] = "BODY"
____exports.PlayerSpriteLayer.BODY_0 = 2
____exports.PlayerSpriteLayer[____exports.PlayerSpriteLayer.BODY_0] = "BODY_0"
____exports.PlayerSpriteLayer.BODY_1 = 3
____exports.PlayerSpriteLayer[____exports.PlayerSpriteLayer.BODY_1] = "BODY_1"
____exports.PlayerSpriteLayer.HEAD = 4
____exports.PlayerSpriteLayer[____exports.PlayerSpriteLayer.HEAD] = "HEAD"
____exports.PlayerSpriteLayer.HEAD_0 = 5
____exports.PlayerSpriteLayer[____exports.PlayerSpriteLayer.HEAD_0] = "HEAD_0"
____exports.PlayerSpriteLayer.HEAD_1 = 6
____exports.PlayerSpriteLayer[____exports.PlayerSpriteLayer.HEAD_1] = "HEAD_1"
____exports.PlayerSpriteLayer.HEAD_2 = 7
____exports.PlayerSpriteLayer[____exports.PlayerSpriteLayer.HEAD_2] = "HEAD_2"
____exports.PlayerSpriteLayer.HEAD_3 = 8
____exports.PlayerSpriteLayer[____exports.PlayerSpriteLayer.HEAD_3] = "HEAD_3"
____exports.PlayerSpriteLayer.HEAD_4 = 9
____exports.PlayerSpriteLayer[____exports.PlayerSpriteLayer.HEAD_4] = "HEAD_4"
____exports.PlayerSpriteLayer.HEAD_5 = 10
____exports.PlayerSpriteLayer[____exports.PlayerSpriteLayer.HEAD_5] = "HEAD_5"
____exports.PlayerSpriteLayer.TOP_0 = 11
____exports.PlayerSpriteLayer[____exports.PlayerSpriteLayer.TOP_0] = "TOP_0"
____exports.PlayerSpriteLayer.EXTRA = 12
____exports.PlayerSpriteLayer[____exports.PlayerSpriteLayer.EXTRA] = "EXTRA"
____exports.PlayerSpriteLayer.GHOST = 13
____exports.PlayerSpriteLayer[____exports.PlayerSpriteLayer.GHOST] = "GHOST"
____exports.PlayerSpriteLayer.BACK = 14
____exports.PlayerSpriteLayer[____exports.PlayerSpriteLayer.BACK] = "BACK"
return ____exports
 end,
["lua_modules.isaac-typescript-definitions.dist.src.enums.PocketItemSlot"] = function(...) 
local ____exports = {}
____exports.PocketItemSlot = {}
____exports.PocketItemSlot.SLOT_1 = 0
____exports.PocketItemSlot[____exports.PocketItemSlot.SLOT_1] = "SLOT_1"
____exports.PocketItemSlot.SLOT_2 = 1
____exports.PocketItemSlot[____exports.PocketItemSlot.SLOT_2] = "SLOT_2"
____exports.PocketItemSlot.SLOT_3 = 2
____exports.PocketItemSlot[____exports.PocketItemSlot.SLOT_3] = "SLOT_3"
____exports.PocketItemSlot.SLOT_4 = 3
____exports.PocketItemSlot[____exports.PocketItemSlot.SLOT_4] = "SLOT_4"
return ____exports
 end,
["lua_modules.isaac-typescript-definitions.dist.src.enums.PoopSpellType"] = function(...) 
local ____exports = {}
____exports.PoopSpellType = {}
____exports.PoopSpellType.NONE = 0
____exports.PoopSpellType[____exports.PoopSpellType.NONE] = "NONE"
____exports.PoopSpellType.POOP = 1
____exports.PoopSpellType[____exports.PoopSpellType.POOP] = "POOP"
____exports.PoopSpellType.CORNY = 2
____exports.PoopSpellType[____exports.PoopSpellType.CORNY] = "CORNY"
____exports.PoopSpellType.BURNING = 3
____exports.PoopSpellType[____exports.PoopSpellType.BURNING] = "BURNING"
____exports.PoopSpellType.STONE = 4
____exports.PoopSpellType[____exports.PoopSpellType.STONE] = "STONE"
____exports.PoopSpellType.STINKY = 5
____exports.PoopSpellType[____exports.PoopSpellType.STINKY] = "STINKY"
____exports.PoopSpellType.BLACK = 6
____exports.PoopSpellType[____exports.PoopSpellType.BLACK] = "BLACK"
____exports.PoopSpellType.HOLY = 7
____exports.PoopSpellType[____exports.PoopSpellType.HOLY] = "HOLY"
____exports.PoopSpellType.LIQUID = 8
____exports.PoopSpellType[____exports.PoopSpellType.LIQUID] = "LIQUID"
____exports.PoopSpellType.FART = 9
____exports.PoopSpellType[____exports.PoopSpellType.FART] = "FART"
____exports.PoopSpellType.BOMB = 10
____exports.PoopSpellType[____exports.PoopSpellType.BOMB] = "BOMB"
____exports.PoopSpellType.DIARRHEA = 11
____exports.PoopSpellType[____exports.PoopSpellType.DIARRHEA] = "DIARRHEA"
return ____exports
 end,
["lua_modules.isaac-typescript-definitions.dist.src.enums.ProjectilesMode"] = function(...) 
local ____exports = {}
____exports.ProjectilesMode = {}
____exports.ProjectilesMode.ONE_PROJECTILE = 0
____exports.ProjectilesMode[____exports.ProjectilesMode.ONE_PROJECTILE] = "ONE_PROJECTILE"
____exports.ProjectilesMode.TWO_PROJECTILES = 1
____exports.ProjectilesMode[____exports.ProjectilesMode.TWO_PROJECTILES] = "TWO_PROJECTILES"
____exports.ProjectilesMode.THREE_PROJECTILES = 2
____exports.ProjectilesMode[____exports.ProjectilesMode.THREE_PROJECTILES] = "THREE_PROJECTILES"
____exports.ProjectilesMode.THREE_PROJECTILES_SPREAD = 3
____exports.ProjectilesMode[____exports.ProjectilesMode.THREE_PROJECTILES_SPREAD] = "THREE_PROJECTILES_SPREAD"
____exports.ProjectilesMode.FOUR_PROJECTILES = 4
____exports.ProjectilesMode[____exports.ProjectilesMode.FOUR_PROJECTILES] = "FOUR_PROJECTILES"
____exports.ProjectilesMode.FIVE_PROJECTILES = 5
____exports.ProjectilesMode[____exports.ProjectilesMode.FIVE_PROJECTILES] = "FIVE_PROJECTILES"
____exports.ProjectilesMode.FOUR_PROJECTILES_PLUS_PATTERN = 6
____exports.ProjectilesMode[____exports.ProjectilesMode.FOUR_PROJECTILES_PLUS_PATTERN] = "FOUR_PROJECTILES_PLUS_PATTERN"
____exports.ProjectilesMode.FOUR_PROJECTILES_X_PATTERN = 7
____exports.ProjectilesMode[____exports.ProjectilesMode.FOUR_PROJECTILES_X_PATTERN] = "FOUR_PROJECTILES_X_PATTERN"
____exports.ProjectilesMode.EIGHT_PROJECTILES_STAR_PATTERN = 8
____exports.ProjectilesMode[____exports.ProjectilesMode.EIGHT_PROJECTILES_STAR_PATTERN] = "EIGHT_PROJECTILES_STAR_PATTERN"
____exports.ProjectilesMode.N_PROJECTILES_IN_CIRCLE = 9
____exports.ProjectilesMode[____exports.ProjectilesMode.N_PROJECTILES_IN_CIRCLE] = "N_PROJECTILES_IN_CIRCLE"
return ____exports
 end,
["lua_modules.isaac-typescript-definitions.dist.src.enums.RenderMode"] = function(...) 
local ____exports = {}
____exports.RenderMode = {}
____exports.RenderMode.NULL = 0
____exports.RenderMode[____exports.RenderMode.NULL] = "NULL"
____exports.RenderMode.NORMAL = 1
____exports.RenderMode[____exports.RenderMode.NORMAL] = "NORMAL"
____exports.RenderMode.SKIP = 2
____exports.RenderMode[____exports.RenderMode.SKIP] = "SKIP"
____exports.RenderMode.WATER_ABOVE = 3
____exports.RenderMode[____exports.RenderMode.WATER_ABOVE] = "WATER_ABOVE"
____exports.RenderMode.WATER_REFRACT = 4
____exports.RenderMode[____exports.RenderMode.WATER_REFRACT] = "WATER_REFRACT"
____exports.RenderMode.WATER_REFLECT = 5
____exports.RenderMode[____exports.RenderMode.WATER_REFLECT] = "WATER_REFLECT"
return ____exports
 end,
["lua_modules.isaac-typescript-definitions.dist.src.enums.RoomDescriptorDisplayType"] = function(...) 
local ____exports = {}
--- Matches the `RoomDescriptor.DISPLAY_*` members of the `RoomDescriptor` class. In IsaacScript, we
-- reimplement this as an enum instead, since it is cleaner.
____exports.RoomDescriptorDisplayType = {}
____exports.RoomDescriptorDisplayType.NONE = 0
____exports.RoomDescriptorDisplayType[____exports.RoomDescriptorDisplayType.NONE] = "NONE"
____exports.RoomDescriptorDisplayType.BOX = 1
____exports.RoomDescriptorDisplayType[____exports.RoomDescriptorDisplayType.BOX] = "BOX"
____exports.RoomDescriptorDisplayType.LOCK = 2
____exports.RoomDescriptorDisplayType[____exports.RoomDescriptorDisplayType.LOCK] = "LOCK"
____exports.RoomDescriptorDisplayType.ICON = 4
____exports.RoomDescriptorDisplayType[____exports.RoomDescriptorDisplayType.ICON] = "ICON"
____exports.RoomDescriptorDisplayType.ALL = 5
____exports.RoomDescriptorDisplayType[____exports.RoomDescriptorDisplayType.ALL] = "ALL"
return ____exports
 end,
["lua_modules.isaac-typescript-definitions.dist.src.enums.RoomDifficulty"] = function(...) 
local ____exports = {}
--- Each room has an arbitrarily set difficulty of 0, 1, 2, 5, or 10. The floor generation algorithm
-- attempts to generates floors with a combined difficulty of a certain value.
____exports.RoomDifficulty = {}
____exports.RoomDifficulty.ALWAYS_EXCLUDED = 0
____exports.RoomDifficulty[____exports.RoomDifficulty.ALWAYS_EXCLUDED] = "ALWAYS_EXCLUDED"
____exports.RoomDifficulty.VERY_EASY = 1
____exports.RoomDifficulty[____exports.RoomDifficulty.VERY_EASY] = "VERY_EASY"
____exports.RoomDifficulty.EASY = 2
____exports.RoomDifficulty[____exports.RoomDifficulty.EASY] = "EASY"
____exports.RoomDifficulty.MEDIUM = 5
____exports.RoomDifficulty[____exports.RoomDifficulty.MEDIUM] = "MEDIUM"
____exports.RoomDifficulty.HARD = 10
____exports.RoomDifficulty[____exports.RoomDifficulty.HARD] = "HARD"
return ____exports
 end,
["lua_modules.isaac-typescript-definitions.dist.src.enums.RoomShape"] = function(...) 
local ____exports = {}
____exports.RoomShape = {}
____exports.RoomShape.SHAPE_1x1 = 1
____exports.RoomShape[____exports.RoomShape.SHAPE_1x1] = "SHAPE_1x1"
____exports.RoomShape.IH = 2
____exports.RoomShape[____exports.RoomShape.IH] = "IH"
____exports.RoomShape.IV = 3
____exports.RoomShape[____exports.RoomShape.IV] = "IV"
____exports.RoomShape.SHAPE_1x2 = 4
____exports.RoomShape[____exports.RoomShape.SHAPE_1x2] = "SHAPE_1x2"
____exports.RoomShape.IIV = 5
____exports.RoomShape[____exports.RoomShape.IIV] = "IIV"
____exports.RoomShape.SHAPE_2x1 = 6
____exports.RoomShape[____exports.RoomShape.SHAPE_2x1] = "SHAPE_2x1"
____exports.RoomShape.IIH = 7
____exports.RoomShape[____exports.RoomShape.IIH] = "IIH"
____exports.RoomShape.SHAPE_2x2 = 8
____exports.RoomShape[____exports.RoomShape.SHAPE_2x2] = "SHAPE_2x2"
____exports.RoomShape.LTL = 9
____exports.RoomShape[____exports.RoomShape.LTL] = "LTL"
____exports.RoomShape.LTR = 10
____exports.RoomShape[____exports.RoomShape.LTR] = "LTR"
____exports.RoomShape.LBL = 11
____exports.RoomShape[____exports.RoomShape.LBL] = "LBL"
____exports.RoomShape.LBR = 12
____exports.RoomShape[____exports.RoomShape.LBR] = "LBR"
return ____exports
 end,
["lua_modules.isaac-typescript-definitions.dist.src.enums.RoomTransitionAnim"] = function(...) 
local ____exports = {}
____exports.RoomTransitionAnim = {}
____exports.RoomTransitionAnim.WALK = 0
____exports.RoomTransitionAnim[____exports.RoomTransitionAnim.WALK] = "WALK"
____exports.RoomTransitionAnim.FADE = 1
____exports.RoomTransitionAnim[____exports.RoomTransitionAnim.FADE] = "FADE"
____exports.RoomTransitionAnim.PIXELATION = 2
____exports.RoomTransitionAnim[____exports.RoomTransitionAnim.PIXELATION] = "PIXELATION"
____exports.RoomTransitionAnim.TELEPORT = 3
____exports.RoomTransitionAnim[____exports.RoomTransitionAnim.TELEPORT] = "TELEPORT"
____exports.RoomTransitionAnim.MAZE = 4
____exports.RoomTransitionAnim[____exports.RoomTransitionAnim.MAZE] = "MAZE"
____exports.RoomTransitionAnim.ANKH = 5
____exports.RoomTransitionAnim[____exports.RoomTransitionAnim.ANKH] = "ANKH"
____exports.RoomTransitionAnim.DEAD_CAT = 6
____exports.RoomTransitionAnim[____exports.RoomTransitionAnim.DEAD_CAT] = "DEAD_CAT"
____exports.RoomTransitionAnim.ONE_UP = 7
____exports.RoomTransitionAnim[____exports.RoomTransitionAnim.ONE_UP] = "ONE_UP"
____exports.RoomTransitionAnim.COLLAR = 8
____exports.RoomTransitionAnim[____exports.RoomTransitionAnim.COLLAR] = "COLLAR"
____exports.RoomTransitionAnim.JUDAS_SHADOW = 9
____exports.RoomTransitionAnim[____exports.RoomTransitionAnim.JUDAS_SHADOW] = "JUDAS_SHADOW"
____exports.RoomTransitionAnim.LAZARUS = 10
____exports.RoomTransitionAnim[____exports.RoomTransitionAnim.LAZARUS] = "LAZARUS"
____exports.RoomTransitionAnim.WOMB_TELEPORT = 11
____exports.RoomTransitionAnim[____exports.RoomTransitionAnim.WOMB_TELEPORT] = "WOMB_TELEPORT"
____exports.RoomTransitionAnim.GLOWING_HOURGLASS = 12
____exports.RoomTransitionAnim[____exports.RoomTransitionAnim.GLOWING_HOURGLASS] = "GLOWING_HOURGLASS"
____exports.RoomTransitionAnim.D7 = 13
____exports.RoomTransitionAnim[____exports.RoomTransitionAnim.D7] = "D7"
____exports.RoomTransitionAnim.MISSING_POSTER = 14
____exports.RoomTransitionAnim[____exports.RoomTransitionAnim.MISSING_POSTER] = "MISSING_POSTER"
____exports.RoomTransitionAnim.BOSS_FORCED = 15
____exports.RoomTransitionAnim[____exports.RoomTransitionAnim.BOSS_FORCED] = "BOSS_FORCED"
____exports.RoomTransitionAnim.PORTAL_TELEPORT = 16
____exports.RoomTransitionAnim[____exports.RoomTransitionAnim.PORTAL_TELEPORT] = "PORTAL_TELEPORT"
____exports.RoomTransitionAnim.FORGOTTEN_TELEPORT = 17
____exports.RoomTransitionAnim[____exports.RoomTransitionAnim.FORGOTTEN_TELEPORT] = "FORGOTTEN_TELEPORT"
____exports.RoomTransitionAnim.FADE_MIRROR = 18
____exports.RoomTransitionAnim[____exports.RoomTransitionAnim.FADE_MIRROR] = "FADE_MIRROR"
____exports.RoomTransitionAnim.MINECART = 19
____exports.RoomTransitionAnim[____exports.RoomTransitionAnim.MINECART] = "MINECART"
____exports.RoomTransitionAnim.DEATH_CERTIFICATE = 20
____exports.RoomTransitionAnim[____exports.RoomTransitionAnim.DEATH_CERTIFICATE] = "DEATH_CERTIFICATE"
return ____exports
 end,
["lua_modules.isaac-typescript-definitions.dist.src.enums.RoomType"] = function(...) 
local ____exports = {}
____exports.RoomType = {}
____exports.RoomType.DEFAULT = 1
____exports.RoomType[____exports.RoomType.DEFAULT] = "DEFAULT"
____exports.RoomType.SHOP = 2
____exports.RoomType[____exports.RoomType.SHOP] = "SHOP"
____exports.RoomType.ERROR = 3
____exports.RoomType[____exports.RoomType.ERROR] = "ERROR"
____exports.RoomType.TREASURE = 4
____exports.RoomType[____exports.RoomType.TREASURE] = "TREASURE"
____exports.RoomType.BOSS = 5
____exports.RoomType[____exports.RoomType.BOSS] = "BOSS"
____exports.RoomType.MINI_BOSS = 6
____exports.RoomType[____exports.RoomType.MINI_BOSS] = "MINI_BOSS"
____exports.RoomType.SECRET = 7
____exports.RoomType[____exports.RoomType.SECRET] = "SECRET"
____exports.RoomType.SUPER_SECRET = 8
____exports.RoomType[____exports.RoomType.SUPER_SECRET] = "SUPER_SECRET"
____exports.RoomType.ARCADE = 9
____exports.RoomType[____exports.RoomType.ARCADE] = "ARCADE"
____exports.RoomType.CURSE = 10
____exports.RoomType[____exports.RoomType.CURSE] = "CURSE"
____exports.RoomType.CHALLENGE = 11
____exports.RoomType[____exports.RoomType.CHALLENGE] = "CHALLENGE"
____exports.RoomType.LIBRARY = 12
____exports.RoomType[____exports.RoomType.LIBRARY] = "LIBRARY"
____exports.RoomType.SACRIFICE = 13
____exports.RoomType[____exports.RoomType.SACRIFICE] = "SACRIFICE"
____exports.RoomType.DEVIL = 14
____exports.RoomType[____exports.RoomType.DEVIL] = "DEVIL"
____exports.RoomType.ANGEL = 15
____exports.RoomType[____exports.RoomType.ANGEL] = "ANGEL"
____exports.RoomType.DUNGEON = 16
____exports.RoomType[____exports.RoomType.DUNGEON] = "DUNGEON"
____exports.RoomType.BOSS_RUSH = 17
____exports.RoomType[____exports.RoomType.BOSS_RUSH] = "BOSS_RUSH"
____exports.RoomType.CLEAN_BEDROOM = 18
____exports.RoomType[____exports.RoomType.CLEAN_BEDROOM] = "CLEAN_BEDROOM"
____exports.RoomType.DIRTY_BEDROOM = 19
____exports.RoomType[____exports.RoomType.DIRTY_BEDROOM] = "DIRTY_BEDROOM"
____exports.RoomType.CHEST = 20
____exports.RoomType[____exports.RoomType.CHEST] = "CHEST"
____exports.RoomType.DICE = 21
____exports.RoomType[____exports.RoomType.DICE] = "DICE"
____exports.RoomType.BLACK_MARKET = 22
____exports.RoomType[____exports.RoomType.BLACK_MARKET] = "BLACK_MARKET"
____exports.RoomType.GREED_EXIT = 23
____exports.RoomType[____exports.RoomType.GREED_EXIT] = "GREED_EXIT"
____exports.RoomType.PLANETARIUM = 24
____exports.RoomType[____exports.RoomType.PLANETARIUM] = "PLANETARIUM"
____exports.RoomType.TELEPORTER = 25
____exports.RoomType[____exports.RoomType.TELEPORTER] = "TELEPORTER"
____exports.RoomType.TELEPORTER_EXIT = 26
____exports.RoomType[____exports.RoomType.TELEPORTER_EXIT] = "TELEPORTER_EXIT"
____exports.RoomType.SECRET_EXIT = 27
____exports.RoomType[____exports.RoomType.SECRET_EXIT] = "SECRET_EXIT"
____exports.RoomType.BLUE = 28
____exports.RoomType[____exports.RoomType.BLUE] = "BLUE"
____exports.RoomType.ULTRA_SECRET = 29
____exports.RoomType[____exports.RoomType.ULTRA_SECRET] = "ULTRA_SECRET"
return ____exports
 end,
["lua_modules.isaac-typescript-definitions.dist.src.enums.SeedEffect"] = function(...) 
local ____exports = {}
____exports.SeedEffect = {}
____exports.SeedEffect.NORMAL = 0
____exports.SeedEffect[____exports.SeedEffect.NORMAL] = "NORMAL"
____exports.SeedEffect.MOVEMENT_PITCH = 1
____exports.SeedEffect[____exports.SeedEffect.MOVEMENT_PITCH] = "MOVEMENT_PITCH"
____exports.SeedEffect.HEALTH_PITCH = 2
____exports.SeedEffect[____exports.SeedEffect.HEALTH_PITCH] = "HEALTH_PITCH"
____exports.SeedEffect.CAMO_ISAAC = 3
____exports.SeedEffect[____exports.SeedEffect.CAMO_ISAAC] = "CAMO_ISAAC"
____exports.SeedEffect.CAMO_ENEMIES = 4
____exports.SeedEffect[____exports.SeedEffect.CAMO_ENEMIES] = "CAMO_ENEMIES"
____exports.SeedEffect.CAMO_PICKUPS = 5
____exports.SeedEffect[____exports.SeedEffect.CAMO_PICKUPS] = "CAMO_PICKUPS"
____exports.SeedEffect.CAMO_EVERYTHING = 6
____exports.SeedEffect[____exports.SeedEffect.CAMO_EVERYTHING] = "CAMO_EVERYTHING"
____exports.SeedEffect.FART_SOUNDS = 7
____exports.SeedEffect[____exports.SeedEffect.FART_SOUNDS] = "FART_SOUNDS"
____exports.SeedEffect.OLD_TV = 8
____exports.SeedEffect[____exports.SeedEffect.OLD_TV] = "OLD_TV"
____exports.SeedEffect.DYSLEXIA = 9
____exports.SeedEffect[____exports.SeedEffect.DYSLEXIA] = "DYSLEXIA"
____exports.SeedEffect.NO_HUD = 10
____exports.SeedEffect[____exports.SeedEffect.NO_HUD] = "NO_HUD"
____exports.SeedEffect.PICKUPS_SLIDE = 11
____exports.SeedEffect[____exports.SeedEffect.PICKUPS_SLIDE] = "PICKUPS_SLIDE"
____exports.SeedEffect.CONTROLS_REVERSED = 12
____exports.SeedEffect[____exports.SeedEffect.CONTROLS_REVERSED] = "CONTROLS_REVERSED"
____exports.SeedEffect.ALL_CHAMPIONS = 13
____exports.SeedEffect[____exports.SeedEffect.ALL_CHAMPIONS] = "ALL_CHAMPIONS"
____exports.SeedEffect.INVISIBLE_ISAAC = 14
____exports.SeedEffect[____exports.SeedEffect.INVISIBLE_ISAAC] = "INVISIBLE_ISAAC"
____exports.SeedEffect.INVISIBLE_ENEMIES = 15
____exports.SeedEffect[____exports.SeedEffect.INVISIBLE_ENEMIES] = "INVISIBLE_ENEMIES"
____exports.SeedEffect.INFINITE_BASEMENT = 16
____exports.SeedEffect[____exports.SeedEffect.INFINITE_BASEMENT] = "INFINITE_BASEMENT"
____exports.SeedEffect.ALWAYS_CHARMED = 17
____exports.SeedEffect[____exports.SeedEffect.ALWAYS_CHARMED] = "ALWAYS_CHARMED"
____exports.SeedEffect.ALWAYS_CONFUSED = 18
____exports.SeedEffect[____exports.SeedEffect.ALWAYS_CONFUSED] = "ALWAYS_CONFUSED"
____exports.SeedEffect.ALWAYS_AFRAID = 19
____exports.SeedEffect[____exports.SeedEffect.ALWAYS_AFRAID] = "ALWAYS_AFRAID"
____exports.SeedEffect.ALWAYS_ALTERNATING_FEAR = 20
____exports.SeedEffect[____exports.SeedEffect.ALWAYS_ALTERNATING_FEAR] = "ALWAYS_ALTERNATING_FEAR"
____exports.SeedEffect.ALWAYS_CHARMED_AND_AFRAID = 21
____exports.SeedEffect[____exports.SeedEffect.ALWAYS_CHARMED_AND_AFRAID] = "ALWAYS_CHARMED_AND_AFRAID"
____exports.SeedEffect.EXTRA_BLOOD = 23
____exports.SeedEffect[____exports.SeedEffect.EXTRA_BLOOD] = "EXTRA_BLOOD"
____exports.SeedEffect.POOP_TRAIL = 24
____exports.SeedEffect[____exports.SeedEffect.POOP_TRAIL] = "POOP_TRAIL"
____exports.SeedEffect.PACIFIST = 25
____exports.SeedEffect[____exports.SeedEffect.PACIFIST] = "PACIFIST"
____exports.SeedEffect.DAMAGE_WHEN_STOPPED = 26
____exports.SeedEffect[____exports.SeedEffect.DAMAGE_WHEN_STOPPED] = "DAMAGE_WHEN_STOPPED"
____exports.SeedEffect.DAMAGE_ON_INTERVAL = 27
____exports.SeedEffect[____exports.SeedEffect.DAMAGE_ON_INTERVAL] = "DAMAGE_ON_INTERVAL"
____exports.SeedEffect.DAMAGE_ON_TIME_LIMIT = 28
____exports.SeedEffect[____exports.SeedEffect.DAMAGE_ON_TIME_LIMIT] = "DAMAGE_ON_TIME_LIMIT"
____exports.SeedEffect.PILLS_NEVER_IDENTIFY = 29
____exports.SeedEffect[____exports.SeedEffect.PILLS_NEVER_IDENTIFY] = "PILLS_NEVER_IDENTIFY"
____exports.SeedEffect.MYSTERY_TAROT_CARDS = 30
____exports.SeedEffect[____exports.SeedEffect.MYSTERY_TAROT_CARDS] = "MYSTERY_TAROT_CARDS"
____exports.SeedEffect.ENEMIES_RESPAWN = 32
____exports.SeedEffect[____exports.SeedEffect.ENEMIES_RESPAWN] = "ENEMIES_RESPAWN"
____exports.SeedEffect.ITEMS_COST_MONEY = 33
____exports.SeedEffect[____exports.SeedEffect.ITEMS_COST_MONEY] = "ITEMS_COST_MONEY"
____exports.SeedEffect.BIG_HEAD = 35
____exports.SeedEffect[____exports.SeedEffect.BIG_HEAD] = "BIG_HEAD"
____exports.SeedEffect.SMALL_HEAD = 36
____exports.SeedEffect[____exports.SeedEffect.SMALL_HEAD] = "SMALL_HEAD"
____exports.SeedEffect.BLACK_ISAAC = 37
____exports.SeedEffect[____exports.SeedEffect.BLACK_ISAAC] = "BLACK_ISAAC"
____exports.SeedEffect.GLOWING_TEARS = 38
____exports.SeedEffect[____exports.SeedEffect.GLOWING_TEARS] = "GLOWING_TEARS"
____exports.SeedEffect.SLOW_MUSIC = 41
____exports.SeedEffect[____exports.SeedEffect.SLOW_MUSIC] = "SLOW_MUSIC"
____exports.SeedEffect.ULTRA_SLOW_MUSIC = 42
____exports.SeedEffect[____exports.SeedEffect.ULTRA_SLOW_MUSIC] = "ULTRA_SLOW_MUSIC"
____exports.SeedEffect.FAST_MUSIC = 43
____exports.SeedEffect[____exports.SeedEffect.FAST_MUSIC] = "FAST_MUSIC"
____exports.SeedEffect.ULTRA_FAST_MUSIC = 44
____exports.SeedEffect[____exports.SeedEffect.ULTRA_FAST_MUSIC] = "ULTRA_FAST_MUSIC"
____exports.SeedEffect.NO_FACE = 46
____exports.SeedEffect[____exports.SeedEffect.NO_FACE] = "NO_FACE"
____exports.SeedEffect.ISAAC_TAKES_HIGH_DAMAGE = 47
____exports.SeedEffect[____exports.SeedEffect.ISAAC_TAKES_HIGH_DAMAGE] = "ISAAC_TAKES_HIGH_DAMAGE"
____exports.SeedEffect.ISAAC_TAKES_MASSIVE_DAMAGE = 48
____exports.SeedEffect[____exports.SeedEffect.ISAAC_TAKES_MASSIVE_DAMAGE] = "ISAAC_TAKES_MASSIVE_DAMAGE"
____exports.SeedEffect.ICE_PHYSICS = 52
____exports.SeedEffect[____exports.SeedEffect.ICE_PHYSICS] = "ICE_PHYSICS"
____exports.SeedEffect.KAPPA = 53
____exports.SeedEffect[____exports.SeedEffect.KAPPA] = "KAPPA"
____exports.SeedEffect.CHRISTMAS = 54
____exports.SeedEffect[____exports.SeedEffect.CHRISTMAS] = "CHRISTMAS"
____exports.SeedEffect.KIDS_MODE = 55
____exports.SeedEffect[____exports.SeedEffect.KIDS_MODE] = "KIDS_MODE"
____exports.SeedEffect.PERMANENT_CURSE_DARKNESS = 56
____exports.SeedEffect[____exports.SeedEffect.PERMANENT_CURSE_DARKNESS] = "PERMANENT_CURSE_DARKNESS"
____exports.SeedEffect.PERMANENT_CURSE_LABYRINTH = 57
____exports.SeedEffect[____exports.SeedEffect.PERMANENT_CURSE_LABYRINTH] = "PERMANENT_CURSE_LABYRINTH"
____exports.SeedEffect.PERMANENT_CURSE_LOST = 58
____exports.SeedEffect[____exports.SeedEffect.PERMANENT_CURSE_LOST] = "PERMANENT_CURSE_LOST"
____exports.SeedEffect.PERMANENT_CURSE_UNKNOWN = 59
____exports.SeedEffect[____exports.SeedEffect.PERMANENT_CURSE_UNKNOWN] = "PERMANENT_CURSE_UNKNOWN"
____exports.SeedEffect.PERMANENT_CURSE_MAZE = 60
____exports.SeedEffect[____exports.SeedEffect.PERMANENT_CURSE_MAZE] = "PERMANENT_CURSE_MAZE"
____exports.SeedEffect.PERMANENT_CURSE_BLIND = 61
____exports.SeedEffect[____exports.SeedEffect.PERMANENT_CURSE_BLIND] = "PERMANENT_CURSE_BLIND"
____exports.SeedEffect.PERMANENT_CURSE_CURSED = 62
____exports.SeedEffect[____exports.SeedEffect.PERMANENT_CURSE_CURSED] = "PERMANENT_CURSE_CURSED"
____exports.SeedEffect.PREVENT_CURSE_DARKNESS = 63
____exports.SeedEffect[____exports.SeedEffect.PREVENT_CURSE_DARKNESS] = "PREVENT_CURSE_DARKNESS"
____exports.SeedEffect.PREVENT_CURSE_LABYRINTH = 64
____exports.SeedEffect[____exports.SeedEffect.PREVENT_CURSE_LABYRINTH] = "PREVENT_CURSE_LABYRINTH"
____exports.SeedEffect.PREVENT_CURSE_LOST = 65
____exports.SeedEffect[____exports.SeedEffect.PREVENT_CURSE_LOST] = "PREVENT_CURSE_LOST"
____exports.SeedEffect.PREVENT_CURSE_UNKNOWN = 66
____exports.SeedEffect[____exports.SeedEffect.PREVENT_CURSE_UNKNOWN] = "PREVENT_CURSE_UNKNOWN"
____exports.SeedEffect.PREVENT_CURSE_MAZE = 67
____exports.SeedEffect[____exports.SeedEffect.PREVENT_CURSE_MAZE] = "PREVENT_CURSE_MAZE"
____exports.SeedEffect.PREVENT_CURSE_BLIND = 68
____exports.SeedEffect[____exports.SeedEffect.PREVENT_CURSE_BLIND] = "PREVENT_CURSE_BLIND"
____exports.SeedEffect.PREVENT_ALL_CURSES = 70
____exports.SeedEffect[____exports.SeedEffect.PREVENT_ALL_CURSES] = "PREVENT_ALL_CURSES"
____exports.SeedEffect.NO_BOSS_ROOM_EXITS = 71
____exports.SeedEffect[____exports.SeedEffect.NO_BOSS_ROOM_EXITS] = "NO_BOSS_ROOM_EXITS"
____exports.SeedEffect.PICKUPS_TIMEOUT = 72
____exports.SeedEffect[____exports.SeedEffect.PICKUPS_TIMEOUT] = "PICKUPS_TIMEOUT"
____exports.SeedEffect.INVINCIBLE = 73
____exports.SeedEffect[____exports.SeedEffect.INVINCIBLE] = "INVINCIBLE"
____exports.SeedEffect.SHOOT_IN_MOVEMENT_DIRECTION = 74
____exports.SeedEffect[____exports.SeedEffect.SHOOT_IN_MOVEMENT_DIRECTION] = "SHOOT_IN_MOVEMENT_DIRECTION"
____exports.SeedEffect.SHOOT_OPPOSITE_MOVEMENT_DIRECTION = 75
____exports.SeedEffect[____exports.SeedEffect.SHOOT_OPPOSITE_MOVEMENT_DIRECTION] = "SHOOT_OPPOSITE_MOVEMENT_DIRECTION"
____exports.SeedEffect.AXIS_ALIGNED_CONTROLS = 76
____exports.SeedEffect[____exports.SeedEffect.AXIS_ALIGNED_CONTROLS] = "AXIS_ALIGNED_CONTROLS"
____exports.SeedEffect.SUPER_HOT = 77
____exports.SeedEffect[____exports.SeedEffect.SUPER_HOT] = "SUPER_HOT"
____exports.SeedEffect.RETRO_VISION = 78
____exports.SeedEffect[____exports.SeedEffect.RETRO_VISION] = "RETRO_VISION"
____exports.SeedEffect.G_FUEL = 79
____exports.SeedEffect[____exports.SeedEffect.G_FUEL] = "G_FUEL"
return ____exports
 end,
["lua_modules.isaac-typescript-definitions.dist.src.enums.SkinColor"] = function(...) 
local ____exports = {}
____exports.SkinColor = {}
____exports.SkinColor.PINK = -1
____exports.SkinColor[____exports.SkinColor.PINK] = "PINK"
____exports.SkinColor.WHITE = 0
____exports.SkinColor[____exports.SkinColor.WHITE] = "WHITE"
____exports.SkinColor.BLACK = 1
____exports.SkinColor[____exports.SkinColor.BLACK] = "BLACK"
____exports.SkinColor.BLUE = 2
____exports.SkinColor[____exports.SkinColor.BLUE] = "BLUE"
____exports.SkinColor.RED = 3
____exports.SkinColor[____exports.SkinColor.RED] = "RED"
____exports.SkinColor.GREEN = 4
____exports.SkinColor[____exports.SkinColor.GREEN] = "GREEN"
____exports.SkinColor.GREY = 5
____exports.SkinColor[____exports.SkinColor.GREY] = "GREY"
____exports.SkinColor.SHADOW = 6
____exports.SkinColor[____exports.SkinColor.SHADOW] = "SHADOW"
return ____exports
 end,
["lua_modules.isaac-typescript-definitions.dist.src.enums.SortingLayer"] = function(...) 
local ____exports = {}
____exports.SortingLayer = {}
____exports.SortingLayer.BACKGROUND = 0
____exports.SortingLayer[____exports.SortingLayer.BACKGROUND] = "BACKGROUND"
____exports.SortingLayer.DOOR = 1
____exports.SortingLayer[____exports.SortingLayer.DOOR] = "DOOR"
____exports.SortingLayer.NORMAL = 2
____exports.SortingLayer[____exports.SortingLayer.NORMAL] = "NORMAL"
return ____exports
 end,
["lua_modules.isaac-typescript-definitions.dist.src.enums.SoundEffect"] = function(...) 
local ____exports = {}
____exports.SoundEffect = {}
____exports.SoundEffect.NULL = 0
____exports.SoundEffect[____exports.SoundEffect.NULL] = "NULL"
____exports.SoundEffect.ONE_UP = 1
____exports.SoundEffect[____exports.SoundEffect.ONE_UP] = "ONE_UP"
____exports.SoundEffect.BIRD_FLAP = 2
____exports.SoundEffect[____exports.SoundEffect.BIRD_FLAP] = "BIRD_FLAP"
____exports.SoundEffect.BLOBBY_WIGGLE = 3
____exports.SoundEffect[____exports.SoundEffect.BLOBBY_WIGGLE] = "BLOBBY_WIGGLE"
____exports.SoundEffect.INSECT_SWARM_LOOP = 4
____exports.SoundEffect[____exports.SoundEffect.INSECT_SWARM_LOOP] = "INSECT_SWARM_LOOP"
____exports.SoundEffect.BLOOD_LASER = 5
____exports.SoundEffect[____exports.SoundEffect.BLOOD_LASER] = "BLOOD_LASER"
____exports.SoundEffect.BLOOD_LASER_SMALL = 6
____exports.SoundEffect[____exports.SoundEffect.BLOOD_LASER_SMALL] = "BLOOD_LASER_SMALL"
____exports.SoundEffect.BLOOD_LASER_LARGE = 7
____exports.SoundEffect[____exports.SoundEffect.BLOOD_LASER_LARGE] = "BLOOD_LASER_LARGE"
____exports.SoundEffect.BOOK_PAGE_TURN_12 = 8
____exports.SoundEffect[____exports.SoundEffect.BOOK_PAGE_TURN_12] = "BOOK_PAGE_TURN_12"
____exports.SoundEffect.BOSS_BUG_HISS = 9
____exports.SoundEffect[____exports.SoundEffect.BOSS_BUG_HISS] = "BOSS_BUG_HISS"
____exports.SoundEffect.BLOOD_LASER_LARGER = 10
____exports.SoundEffect[____exports.SoundEffect.BLOOD_LASER_LARGER] = "BLOOD_LASER_LARGER"
____exports.SoundEffect.BOSS_GURGLE_ROAR = 11
____exports.SoundEffect[____exports.SoundEffect.BOSS_GURGLE_ROAR] = "BOSS_GURGLE_ROAR"
____exports.SoundEffect.BOSS_LITE_GURGLE = 12
____exports.SoundEffect[____exports.SoundEffect.BOSS_LITE_GURGLE] = "BOSS_LITE_GURGLE"
____exports.SoundEffect.BOSS_LITE_HISS = 13
____exports.SoundEffect[____exports.SoundEffect.BOSS_LITE_HISS] = "BOSS_LITE_HISS"
____exports.SoundEffect.BOSS_LITE_ROAR = 14
____exports.SoundEffect[____exports.SoundEffect.BOSS_LITE_ROAR] = "BOSS_LITE_ROAR"
____exports.SoundEffect.BOSS_LITE_SLOPPY_ROAR = 15
____exports.SoundEffect[____exports.SoundEffect.BOSS_LITE_SLOPPY_ROAR] = "BOSS_LITE_SLOPPY_ROAR"
____exports.SoundEffect.BOSS_SPIT_BLOB_BARF = 16
____exports.SoundEffect[____exports.SoundEffect.BOSS_SPIT_BLOB_BARF] = "BOSS_SPIT_BLOB_BARF"
____exports.SoundEffect.PAPER_IN = 17
____exports.SoundEffect[____exports.SoundEffect.PAPER_IN] = "PAPER_IN"
____exports.SoundEffect.PAPER_OUT = 18
____exports.SoundEffect[____exports.SoundEffect.PAPER_OUT] = "PAPER_OUT"
____exports.SoundEffect.CHEST_DROP = 21
____exports.SoundEffect[____exports.SoundEffect.CHEST_DROP] = "CHEST_DROP"
____exports.SoundEffect.CHEST_OPEN = 22
____exports.SoundEffect[____exports.SoundEffect.CHEST_OPEN] = "CHEST_OPEN"
____exports.SoundEffect.CHOIR_UNLOCK = 23
____exports.SoundEffect[____exports.SoundEffect.CHOIR_UNLOCK] = "CHOIR_UNLOCK"
____exports.SoundEffect.COIN_SLOT = 24
____exports.SoundEffect[____exports.SoundEffect.COIN_SLOT] = "COIN_SLOT"
____exports.SoundEffect.CUTE_GRUNT = 25
____exports.SoundEffect[____exports.SoundEffect.CUTE_GRUNT] = "CUTE_GRUNT"
____exports.SoundEffect.DEATH_BURST_BONE = 27
____exports.SoundEffect[____exports.SoundEffect.DEATH_BURST_BONE] = "DEATH_BURST_BONE"
____exports.SoundEffect.DEATH_BURST_LARGE = 28
____exports.SoundEffect[____exports.SoundEffect.DEATH_BURST_LARGE] = "DEATH_BURST_LARGE"
____exports.SoundEffect.DEATH_REVERSE = 29
____exports.SoundEffect[____exports.SoundEffect.DEATH_REVERSE] = "DEATH_REVERSE"
____exports.SoundEffect.DEATH_BURST_SMALL = 30
____exports.SoundEffect[____exports.SoundEffect.DEATH_BURST_SMALL] = "DEATH_BURST_SMALL"
____exports.SoundEffect.DEATH_CARD = 33
____exports.SoundEffect[____exports.SoundEffect.DEATH_CARD] = "DEATH_CARD"
____exports.SoundEffect.DEVIL_CARD = 34
____exports.SoundEffect[____exports.SoundEffect.DEVIL_CARD] = "DEVIL_CARD"
____exports.SoundEffect.DOOR_HEAVY_CLOSE = 35
____exports.SoundEffect[____exports.SoundEffect.DOOR_HEAVY_CLOSE] = "DOOR_HEAVY_CLOSE"
____exports.SoundEffect.DOOR_HEAVY_OPEN = 36
____exports.SoundEffect[____exports.SoundEffect.DOOR_HEAVY_OPEN] = "DOOR_HEAVY_OPEN"
____exports.SoundEffect.FART = 37
____exports.SoundEffect[____exports.SoundEffect.FART] = "FART"
____exports.SoundEffect.FETUS_JUMP = 38
____exports.SoundEffect[____exports.SoundEffect.FETUS_JUMP] = "FETUS_JUMP"
____exports.SoundEffect.FETUS_LAND = 40
____exports.SoundEffect[____exports.SoundEffect.FETUS_LAND] = "FETUS_LAND"
____exports.SoundEffect.FIRE_DEATH_HISS = 43
____exports.SoundEffect[____exports.SoundEffect.FIRE_DEATH_HISS] = "FIRE_DEATH_HISS"
____exports.SoundEffect.FLOATY_BABY_ROAR = 44
____exports.SoundEffect[____exports.SoundEffect.FLOATY_BABY_ROAR] = "FLOATY_BABY_ROAR"
____exports.SoundEffect.COIN_INSERT = 45
____exports.SoundEffect[____exports.SoundEffect.COIN_INSERT] = "COIN_INSERT"
____exports.SoundEffect.METAL_DOOR_CLOSE = 46
____exports.SoundEffect[____exports.SoundEffect.METAL_DOOR_CLOSE] = "METAL_DOOR_CLOSE"
____exports.SoundEffect.METAL_DOOR_OPEN = 47
____exports.SoundEffect[____exports.SoundEffect.METAL_DOOR_OPEN] = "METAL_DOOR_OPEN"
____exports.SoundEffect.FOREST_BOSS_STOMPS = 48
____exports.SoundEffect[____exports.SoundEffect.FOREST_BOSS_STOMPS] = "FOREST_BOSS_STOMPS"
____exports.SoundEffect.SCYTHE_BREAK = 49
____exports.SoundEffect[____exports.SoundEffect.SCYTHE_BREAK] = "SCYTHE_BREAK"
____exports.SoundEffect.STONE_WALKER = 50
____exports.SoundEffect[____exports.SoundEffect.STONE_WALKER] = "STONE_WALKER"
____exports.SoundEffect.GAS_CAN_POUR = 51
____exports.SoundEffect[____exports.SoundEffect.GAS_CAN_POUR] = "GAS_CAN_POUR"
____exports.SoundEffect.HELL_BOSS_GROUND_POUND = 52
____exports.SoundEffect[____exports.SoundEffect.HELL_BOSS_GROUND_POUND] = "HELL_BOSS_GROUND_POUND"
____exports.SoundEffect.GLASS_BREAK = 53
____exports.SoundEffect[____exports.SoundEffect.GLASS_BREAK] = "GLASS_BREAK"
____exports.SoundEffect.HOLY = 54
____exports.SoundEffect[____exports.SoundEffect.HOLY] = "HOLY"
____exports.SoundEffect.ISAAC_HURT_GRUNT = 55
____exports.SoundEffect[____exports.SoundEffect.ISAAC_HURT_GRUNT] = "ISAAC_HURT_GRUNT"
____exports.SoundEffect.CHILD_HAPPY_ROAR_SHORT = 56
____exports.SoundEffect[____exports.SoundEffect.CHILD_HAPPY_ROAR_SHORT] = "CHILD_HAPPY_ROAR_SHORT"
____exports.SoundEffect.CHILD_ANGRY_ROAR = 57
____exports.SoundEffect[____exports.SoundEffect.CHILD_ANGRY_ROAR] = "CHILD_ANGRY_ROAR"
____exports.SoundEffect.KEY_PICKUP_GAUNTLET = 58
____exports.SoundEffect[____exports.SoundEffect.KEY_PICKUP_GAUNTLET] = "KEY_PICKUP_GAUNTLET"
____exports.SoundEffect.KEY_DROP = 59
____exports.SoundEffect[____exports.SoundEffect.KEY_DROP] = "KEY_DROP"
____exports.SoundEffect.BABY_HURT = 60
____exports.SoundEffect[____exports.SoundEffect.BABY_HURT] = "BABY_HURT"
____exports.SoundEffect.MAGGOT_BURST_OUT = 64
____exports.SoundEffect[____exports.SoundEffect.MAGGOT_BURST_OUT] = "MAGGOT_BURST_OUT"
____exports.SoundEffect.MAGGOT_ENTER_GROUND = 66
____exports.SoundEffect[____exports.SoundEffect.MAGGOT_ENTER_GROUND] = "MAGGOT_ENTER_GROUND"
____exports.SoundEffect.MEAT_FEET_SLOW = 68
____exports.SoundEffect[____exports.SoundEffect.MEAT_FEET_SLOW] = "MEAT_FEET_SLOW"
____exports.SoundEffect.MEAT_IMPACTS = 69
____exports.SoundEffect[____exports.SoundEffect.MEAT_IMPACTS] = "MEAT_IMPACTS"
____exports.SoundEffect.MEAT_IMPACTS_OLD = 70
____exports.SoundEffect[____exports.SoundEffect.MEAT_IMPACTS_OLD] = "MEAT_IMPACTS_OLD"
____exports.SoundEffect.MEAT_JUMPS = 72
____exports.SoundEffect[____exports.SoundEffect.MEAT_JUMPS] = "MEAT_JUMPS"
____exports.SoundEffect.MEATY_DEATHS = 77
____exports.SoundEffect[____exports.SoundEffect.MEATY_DEATHS] = "MEATY_DEATHS"
____exports.SoundEffect.POT_BREAK_2 = 78
____exports.SoundEffect[____exports.SoundEffect.POT_BREAK_2] = "POT_BREAK_2"
____exports.SoundEffect.MUSHROOM_POOF_2 = 79
____exports.SoundEffect[____exports.SoundEffect.MUSHROOM_POOF_2] = "MUSHROOM_POOF_2"
____exports.SoundEffect.BLACK_POOF = 80
____exports.SoundEffect[____exports.SoundEffect.BLACK_POOF] = "BLACK_POOF"
____exports.SoundEffect.STATIC = 81
____exports.SoundEffect[____exports.SoundEffect.STATIC] = "STATIC"
____exports.SoundEffect.MOM_VOX_DEATH = 82
____exports.SoundEffect[____exports.SoundEffect.MOM_VOX_DEATH] = "MOM_VOX_DEATH"
____exports.SoundEffect.MOM_VOX_EVIL_LAUGH = 84
____exports.SoundEffect[____exports.SoundEffect.MOM_VOX_EVIL_LAUGH] = "MOM_VOX_EVIL_LAUGH"
____exports.SoundEffect.MOM_VOX_FILTERED_DEATH_1 = 85
____exports.SoundEffect[____exports.SoundEffect.MOM_VOX_FILTERED_DEATH_1] = "MOM_VOX_FILTERED_DEATH_1"
____exports.SoundEffect.MOM_VOX_FILTERED_EVIL_LAUGH = 86
____exports.SoundEffect[____exports.SoundEffect.MOM_VOX_FILTERED_EVIL_LAUGH] = "MOM_VOX_FILTERED_EVIL_LAUGH"
____exports.SoundEffect.MOM_VOX_FILTERED_HURT = 87
____exports.SoundEffect[____exports.SoundEffect.MOM_VOX_FILTERED_HURT] = "MOM_VOX_FILTERED_HURT"
____exports.SoundEffect.MOM_VOX_FILTERED_ISAAC = 90
____exports.SoundEffect[____exports.SoundEffect.MOM_VOX_FILTERED_ISAAC] = "MOM_VOX_FILTERED_ISAAC"
____exports.SoundEffect.MOM_VOX_GRUNT = 93
____exports.SoundEffect[____exports.SoundEffect.MOM_VOX_GRUNT] = "MOM_VOX_GRUNT"
____exports.SoundEffect.MOM_VOX_HURT = 97
____exports.SoundEffect[____exports.SoundEffect.MOM_VOX_HURT] = "MOM_VOX_HURT"
____exports.SoundEffect.MOM_VOX_ISAAC = 101
____exports.SoundEffect[____exports.SoundEffect.MOM_VOX_ISAAC] = "MOM_VOX_ISAAC"
____exports.SoundEffect.MONSTER_GRUNT_0 = 104
____exports.SoundEffect[____exports.SoundEffect.MONSTER_GRUNT_0] = "MONSTER_GRUNT_0"
____exports.SoundEffect.MONSTER_GRUNT_1 = 106
____exports.SoundEffect[____exports.SoundEffect.MONSTER_GRUNT_1] = "MONSTER_GRUNT_1"
____exports.SoundEffect.MONSTER_GRUNT_2 = 108
____exports.SoundEffect[____exports.SoundEffect.MONSTER_GRUNT_2] = "MONSTER_GRUNT_2"
____exports.SoundEffect.MONSTER_GRUNT_4 = 112
____exports.SoundEffect[____exports.SoundEffect.MONSTER_GRUNT_4] = "MONSTER_GRUNT_4"
____exports.SoundEffect.MONSTER_GRUNT_5 = 114
____exports.SoundEffect[____exports.SoundEffect.MONSTER_GRUNT_5] = "MONSTER_GRUNT_5"
____exports.SoundEffect.MONSTER_ROAR_0 = 115
____exports.SoundEffect[____exports.SoundEffect.MONSTER_ROAR_0] = "MONSTER_ROAR_0"
____exports.SoundEffect.MONSTER_ROAR_1 = 116
____exports.SoundEffect[____exports.SoundEffect.MONSTER_ROAR_1] = "MONSTER_ROAR_1"
____exports.SoundEffect.MONSTER_ROAR_2 = 117
____exports.SoundEffect[____exports.SoundEffect.MONSTER_ROAR_2] = "MONSTER_ROAR_2"
____exports.SoundEffect.MONSTER_ROAR_3 = 118
____exports.SoundEffect[____exports.SoundEffect.MONSTER_ROAR_3] = "MONSTER_ROAR_3"
____exports.SoundEffect.MONSTER_YELL_A = 119
____exports.SoundEffect[____exports.SoundEffect.MONSTER_YELL_A] = "MONSTER_YELL_A"
____exports.SoundEffect.MONSTER_YELL_B = 122
____exports.SoundEffect[____exports.SoundEffect.MONSTER_YELL_B] = "MONSTER_YELL_B"
____exports.SoundEffect.POWER_UP_1 = 128
____exports.SoundEffect[____exports.SoundEffect.POWER_UP_1] = "POWER_UP_1"
____exports.SoundEffect.POWER_UP_2 = 129
____exports.SoundEffect[____exports.SoundEffect.POWER_UP_2] = "POWER_UP_2"
____exports.SoundEffect.POWER_UP_3 = 130
____exports.SoundEffect[____exports.SoundEffect.POWER_UP_3] = "POWER_UP_3"
____exports.SoundEffect.POWER_UP_SPEWER = 132
____exports.SoundEffect[____exports.SoundEffect.POWER_UP_SPEWER] = "POWER_UP_SPEWER"
____exports.SoundEffect.RED_LIGHTNING_ZAP = 133
____exports.SoundEffect[____exports.SoundEffect.RED_LIGHTNING_ZAP] = "RED_LIGHTNING_ZAP"
____exports.SoundEffect.RED_LIGHTNING_ZAP_WEAK = 134
____exports.SoundEffect[____exports.SoundEffect.RED_LIGHTNING_ZAP_WEAK] = "RED_LIGHTNING_ZAP_WEAK"
____exports.SoundEffect.RED_LIGHTNING_ZAP_STRONG = 135
____exports.SoundEffect[____exports.SoundEffect.RED_LIGHTNING_ZAP_STRONG] = "RED_LIGHTNING_ZAP_STRONG"
____exports.SoundEffect.RED_LIGHTNING_ZAP_BURST = 136
____exports.SoundEffect[____exports.SoundEffect.RED_LIGHTNING_ZAP_BURST] = "RED_LIGHTNING_ZAP_BURST"
____exports.SoundEffect.ROCK_CRUMBLE = 137
____exports.SoundEffect[____exports.SoundEffect.ROCK_CRUMBLE] = "ROCK_CRUMBLE"
____exports.SoundEffect.POT_BREAK = 138
____exports.SoundEffect[____exports.SoundEffect.POT_BREAK] = "POT_BREAK"
____exports.SoundEffect.MUSHROOM_POOF = 139
____exports.SoundEffect[____exports.SoundEffect.MUSHROOM_POOF] = "MUSHROOM_POOF"
____exports.SoundEffect.ROCKET_BLAST_DEATH = 141
____exports.SoundEffect[____exports.SoundEffect.ROCKET_BLAST_DEATH] = "ROCKET_BLAST_DEATH"
____exports.SoundEffect.SMB_LARGE_CHEWS_4 = 142
____exports.SoundEffect[____exports.SoundEffect.SMB_LARGE_CHEWS_4] = "SMB_LARGE_CHEWS_4"
____exports.SoundEffect.SCARED_WHIMPER = 143
____exports.SoundEffect[____exports.SoundEffect.SCARED_WHIMPER] = "SCARED_WHIMPER"
____exports.SoundEffect.SHAKEY_KID_ROAR = 146
____exports.SoundEffect[____exports.SoundEffect.SHAKEY_KID_ROAR] = "SHAKEY_KID_ROAR"
____exports.SoundEffect.SINK_DRAIN_GURGLE = 149
____exports.SoundEffect[____exports.SoundEffect.SINK_DRAIN_GURGLE] = "SINK_DRAIN_GURGLE"
____exports.SoundEffect.TEAR_IMPACTS = 150
____exports.SoundEffect[____exports.SoundEffect.TEAR_IMPACTS] = "TEAR_IMPACTS"
____exports.SoundEffect.TEARS_FIRE = 153
____exports.SoundEffect[____exports.SoundEffect.TEARS_FIRE] = "TEARS_FIRE"
____exports.SoundEffect.UNLOCK = 156
____exports.SoundEffect[____exports.SoundEffect.UNLOCK] = "UNLOCK"
____exports.SoundEffect.VAMP_GULP = 157
____exports.SoundEffect[____exports.SoundEffect.VAMP_GULP] = "VAMP_GULP"
____exports.SoundEffect.WHEEZY_COUGH = 158
____exports.SoundEffect[____exports.SoundEffect.WHEEZY_COUGH] = "WHEEZY_COUGH"
____exports.SoundEffect.SPIDER_COUGH = 159
____exports.SoundEffect[____exports.SoundEffect.SPIDER_COUGH] = "SPIDER_COUGH"
____exports.SoundEffect.PORTAL_OPEN = 160
____exports.SoundEffect[____exports.SoundEffect.PORTAL_OPEN] = "PORTAL_OPEN"
____exports.SoundEffect.PORTAL_LOOP = 161
____exports.SoundEffect[____exports.SoundEffect.PORTAL_LOOP] = "PORTAL_LOOP"
____exports.SoundEffect.PORTAL_SPAWN = 162
____exports.SoundEffect[____exports.SoundEffect.PORTAL_SPAWN] = "PORTAL_SPAWN"
____exports.SoundEffect.TAR_LOOP = 163
____exports.SoundEffect[____exports.SoundEffect.TAR_LOOP] = "TAR_LOOP"
____exports.SoundEffect.ZOMBIE_WALKER_KID = 165
____exports.SoundEffect[____exports.SoundEffect.ZOMBIE_WALKER_KID] = "ZOMBIE_WALKER_KID"
____exports.SoundEffect.ANIMAL_SQUISH = 166
____exports.SoundEffect[____exports.SoundEffect.ANIMAL_SQUISH] = "ANIMAL_SQUISH"
____exports.SoundEffect.ANGRY_GURGLE = 167
____exports.SoundEffect[____exports.SoundEffect.ANGRY_GURGLE] = "ANGRY_GURGLE"
____exports.SoundEffect.BAND_AID_PICK_UP = 169
____exports.SoundEffect[____exports.SoundEffect.BAND_AID_PICK_UP] = "BAND_AID_PICK_UP"
____exports.SoundEffect.BATTERY_CHARGE = 170
____exports.SoundEffect[____exports.SoundEffect.BATTERY_CHARGE] = "BATTERY_CHARGE"
____exports.SoundEffect.BEEP = 171
____exports.SoundEffect[____exports.SoundEffect.BEEP] = "BEEP"
____exports.SoundEffect.LIGHT_BOLT = 172
____exports.SoundEffect[____exports.SoundEffect.LIGHT_BOLT] = "LIGHT_BOLT"
____exports.SoundEffect.LIGHT_BOLT_CHARGE = 173
____exports.SoundEffect[____exports.SoundEffect.LIGHT_BOLT_CHARGE] = "LIGHT_BOLT_CHARGE"
____exports.SoundEffect.BLOOD_BANK_TOUCHED = 174
____exports.SoundEffect[____exports.SoundEffect.BLOOD_BANK_TOUCHED] = "BLOOD_BANK_TOUCHED"
____exports.SoundEffect.BLOOD_BANK_SPAWN = 175
____exports.SoundEffect[____exports.SoundEffect.BLOOD_BANK_SPAWN] = "BLOOD_BANK_SPAWN"
____exports.SoundEffect.BLOOD_SHOOT = 178
____exports.SoundEffect[____exports.SoundEffect.BLOOD_SHOOT] = "BLOOD_SHOOT"
____exports.SoundEffect.BOIL_HATCH = 181
____exports.SoundEffect[____exports.SoundEffect.BOIL_HATCH] = "BOIL_HATCH"
____exports.SoundEffect.BOSS_1_EXPLOSIONS = 182
____exports.SoundEffect[____exports.SoundEffect.BOSS_1_EXPLOSIONS] = "BOSS_1_EXPLOSIONS"
____exports.SoundEffect.EXPLOSION_WEAK = 183
____exports.SoundEffect[____exports.SoundEffect.EXPLOSION_WEAK] = "EXPLOSION_WEAK"
____exports.SoundEffect.EXPLOSION_STRONG = 184
____exports.SoundEffect[____exports.SoundEffect.EXPLOSION_STRONG] = "EXPLOSION_STRONG"
____exports.SoundEffect.BOSS_2_BUBBLES = 185
____exports.SoundEffect[____exports.SoundEffect.BOSS_2_BUBBLES] = "BOSS_2_BUBBLES"
____exports.SoundEffect.EXPLOSION_DEBRIS = 186
____exports.SoundEffect[____exports.SoundEffect.EXPLOSION_DEBRIS] = "EXPLOSION_DEBRIS"
____exports.SoundEffect.BOSS_2_INTRO_ERROR_BUZZ = 187
____exports.SoundEffect[____exports.SoundEffect.BOSS_2_INTRO_ERROR_BUZZ] = "BOSS_2_INTRO_ERROR_BUZZ"
____exports.SoundEffect.CASTLE_PORTCULLIS = 190
____exports.SoundEffect[____exports.SoundEffect.CASTLE_PORTCULLIS] = "CASTLE_PORTCULLIS"
____exports.SoundEffect.CHARACTER_SELECT_LEFT = 194
____exports.SoundEffect[____exports.SoundEffect.CHARACTER_SELECT_LEFT] = "CHARACTER_SELECT_LEFT"
____exports.SoundEffect.CHARACTER_SELECT_RIGHT = 195
____exports.SoundEffect[____exports.SoundEffect.CHARACTER_SELECT_RIGHT] = "CHARACTER_SELECT_RIGHT"
____exports.SoundEffect.DERP = 197
____exports.SoundEffect[____exports.SoundEffect.DERP] = "DERP"
____exports.SoundEffect.DIME_DROP = 198
____exports.SoundEffect[____exports.SoundEffect.DIME_DROP] = "DIME_DROP"
____exports.SoundEffect.DIME_PICKUP = 199
____exports.SoundEffect[____exports.SoundEffect.DIME_PICKUP] = "DIME_PICKUP"
____exports.SoundEffect.LUCKY_PICKUP = 200
____exports.SoundEffect[____exports.SoundEffect.LUCKY_PICKUP] = "LUCKY_PICKUP"
____exports.SoundEffect.FETUS_FEET = 201
____exports.SoundEffect[____exports.SoundEffect.FETUS_FEET] = "FETUS_FEET"
____exports.SoundEffect.GOLDEN_KEY = 204
____exports.SoundEffect[____exports.SoundEffect.GOLDEN_KEY] = "GOLDEN_KEY"
____exports.SoundEffect.GOO_ATTACH = 205
____exports.SoundEffect[____exports.SoundEffect.GOO_ATTACH] = "GOO_ATTACH"
____exports.SoundEffect.GOO_DEATH = 207
____exports.SoundEffect[____exports.SoundEffect.GOO_DEATH] = "GOO_DEATH"
____exports.SoundEffect.HAND_LASERS = 211
____exports.SoundEffect[____exports.SoundEffect.HAND_LASERS] = "HAND_LASERS"
____exports.SoundEffect.HEART_IN = 212
____exports.SoundEffect[____exports.SoundEffect.HEART_IN] = "HEART_IN"
____exports.SoundEffect.HEART_OUT = 213
____exports.SoundEffect[____exports.SoundEffect.HEART_OUT] = "HEART_OUT"
____exports.SoundEffect.HELL_PORTAL_1 = 214
____exports.SoundEffect[____exports.SoundEffect.HELL_PORTAL_1] = "HELL_PORTAL_1"
____exports.SoundEffect.HELL_PORTAL_2 = 215
____exports.SoundEffect[____exports.SoundEffect.HELL_PORTAL_2] = "HELL_PORTAL_2"
____exports.SoundEffect.ISAAC_DIES = 217
____exports.SoundEffect[____exports.SoundEffect.ISAAC_DIES] = "ISAAC_DIES"
____exports.SoundEffect.ITEM_RECHARGE = 218
____exports.SoundEffect[____exports.SoundEffect.ITEM_RECHARGE] = "ITEM_RECHARGE"
____exports.SoundEffect.KISS_LIPS = 219
____exports.SoundEffect[____exports.SoundEffect.KISS_LIPS] = "KISS_LIPS"
____exports.SoundEffect.LEECH = 221
____exports.SoundEffect[____exports.SoundEffect.LEECH] = "LEECH"
____exports.SoundEffect.MAGGOT_CHARGE = 224
____exports.SoundEffect[____exports.SoundEffect.MAGGOT_CHARGE] = "MAGGOT_CHARGE"
____exports.SoundEffect.MEAT_HEAD_SHOOT = 226
____exports.SoundEffect[____exports.SoundEffect.MEAT_HEAD_SHOOT] = "MEAT_HEAD_SHOOT"
____exports.SoundEffect.METAL_BLOCK_BREAK = 229
____exports.SoundEffect[____exports.SoundEffect.METAL_BLOCK_BREAK] = "METAL_BLOCK_BREAK"
____exports.SoundEffect.NICKEL_DROP = 231
____exports.SoundEffect[____exports.SoundEffect.NICKEL_DROP] = "NICKEL_DROP"
____exports.SoundEffect.NICKEL_PICKUP = 232
____exports.SoundEffect[____exports.SoundEffect.NICKEL_PICKUP] = "NICKEL_PICKUP"
____exports.SoundEffect.PENNY_DROP = 233
____exports.SoundEffect[____exports.SoundEffect.PENNY_DROP] = "PENNY_DROP"
____exports.SoundEffect.PENNY_PICKUP = 234
____exports.SoundEffect[____exports.SoundEffect.PENNY_PICKUP] = "PENNY_PICKUP"
____exports.SoundEffect.PLOP = 237
____exports.SoundEffect[____exports.SoundEffect.PLOP] = "PLOP"
____exports.SoundEffect.SATAN_APPEAR = 238
____exports.SoundEffect[____exports.SoundEffect.SATAN_APPEAR] = "SATAN_APPEAR"
____exports.SoundEffect.SATAN_BLAST = 239
____exports.SoundEffect[____exports.SoundEffect.SATAN_BLAST] = "SATAN_BLAST"
____exports.SoundEffect.SATAN_CHARGE_UP = 240
____exports.SoundEffect[____exports.SoundEffect.SATAN_CHARGE_UP] = "SATAN_CHARGE_UP"
____exports.SoundEffect.SATAN_GROW = 241
____exports.SoundEffect[____exports.SoundEffect.SATAN_GROW] = "SATAN_GROW"
____exports.SoundEffect.SATAN_HURT = 242
____exports.SoundEffect[____exports.SoundEffect.SATAN_HURT] = "SATAN_HURT"
____exports.SoundEffect.SATAN_RISE_UP = 243
____exports.SoundEffect[____exports.SoundEffect.SATAN_RISE_UP] = "SATAN_RISE_UP"
____exports.SoundEffect.SATAN_SPIT = 245
____exports.SoundEffect[____exports.SoundEffect.SATAN_SPIT] = "SATAN_SPIT"
____exports.SoundEffect.SATAN_STOMP = 246
____exports.SoundEffect[____exports.SoundEffect.SATAN_STOMP] = "SATAN_STOMP"
____exports.SoundEffect.SCAMPER = 249
____exports.SoundEffect[____exports.SoundEffect.SCAMPER] = "SCAMPER"
____exports.SoundEffect.SHELL_GAME = 252
____exports.SoundEffect[____exports.SoundEffect.SHELL_GAME] = "SHELL_GAME"
____exports.SoundEffect.SLOT_SPAWN = 255
____exports.SoundEffect[____exports.SoundEffect.SLOT_SPAWN] = "SLOT_SPAWN"
____exports.SoundEffect.SPLATTER = 258
____exports.SoundEffect[____exports.SoundEffect.SPLATTER] = "SPLATTER"
____exports.SoundEffect.STEAM_HALF_SEC = 261
____exports.SoundEffect[____exports.SoundEffect.STEAM_HALF_SEC] = "STEAM_HALF_SEC"
____exports.SoundEffect.STONE_SHOOT = 262
____exports.SoundEffect[____exports.SoundEffect.STONE_SHOOT] = "STONE_SHOOT"
____exports.SoundEffect.WEIRD_WORM_SPIT = 263
____exports.SoundEffect[____exports.SoundEffect.WEIRD_WORM_SPIT] = "WEIRD_WORM_SPIT"
____exports.SoundEffect.SUMMON_SOUND = 265
____exports.SoundEffect[____exports.SoundEffect.SUMMON_SOUND] = "SUMMON_SOUND"
____exports.SoundEffect.SUPER_HOLY = 266
____exports.SoundEffect[____exports.SoundEffect.SUPER_HOLY] = "SUPER_HOLY"
____exports.SoundEffect.THUMBS_DOWN = 267
____exports.SoundEffect[____exports.SoundEffect.THUMBS_DOWN] = "THUMBS_DOWN"
____exports.SoundEffect.THUMBS_UP = 268
____exports.SoundEffect[____exports.SoundEffect.THUMBS_UP] = "THUMBS_UP"
____exports.SoundEffect.FIRE_BURN = 269
____exports.SoundEffect[____exports.SoundEffect.FIRE_BURN] = "FIRE_BURN"
____exports.SoundEffect.HAPPY_RAINBOW = 270
____exports.SoundEffect[____exports.SoundEffect.HAPPY_RAINBOW] = "HAPPY_RAINBOW"
____exports.SoundEffect.LASER_RING = 271
____exports.SoundEffect[____exports.SoundEffect.LASER_RING] = "LASER_RING"
____exports.SoundEffect.LASER_RING_WEAK = 272
____exports.SoundEffect[____exports.SoundEffect.LASER_RING_WEAK] = "LASER_RING_WEAK"
____exports.SoundEffect.LASER_RING_STRONG = 273
____exports.SoundEffect[____exports.SoundEffect.LASER_RING_STRONG] = "LASER_RING_STRONG"
____exports.SoundEffect.CASH_REGISTER = 274
____exports.SoundEffect[____exports.SoundEffect.CASH_REGISTER] = "CASH_REGISTER"
____exports.SoundEffect.ANGEL_WING = 275
____exports.SoundEffect[____exports.SoundEffect.ANGEL_WING] = "ANGEL_WING"
____exports.SoundEffect.ANGEL_BEAM = 276
____exports.SoundEffect[____exports.SoundEffect.ANGEL_BEAM] = "ANGEL_BEAM"
____exports.SoundEffect.HOLY_MANTLE = 277
____exports.SoundEffect[____exports.SoundEffect.HOLY_MANTLE] = "HOLY_MANTLE"
____exports.SoundEffect.MEGA_BLAST_START = 278
____exports.SoundEffect[____exports.SoundEffect.MEGA_BLAST_START] = "MEGA_BLAST_START"
____exports.SoundEffect.MEGA_BLAST_LOOP = 279
____exports.SoundEffect[____exports.SoundEffect.MEGA_BLAST_LOOP] = "MEGA_BLAST_LOOP"
____exports.SoundEffect.MEGA_BLAST_END = 280
____exports.SoundEffect[____exports.SoundEffect.MEGA_BLAST_END] = "MEGA_BLAST_END"
____exports.SoundEffect.BLOOD_LASER_LOOP = 281
____exports.SoundEffect[____exports.SoundEffect.BLOOD_LASER_LOOP] = "BLOOD_LASER_LOOP"
____exports.SoundEffect.MENU_SCROLL = 282
____exports.SoundEffect[____exports.SoundEffect.MENU_SCROLL] = "MENU_SCROLL"
____exports.SoundEffect.MENU_NOTE_APPEAR = 283
____exports.SoundEffect[____exports.SoundEffect.MENU_NOTE_APPEAR] = "MENU_NOTE_APPEAR"
____exports.SoundEffect.MENU_NOTE_HIDE = 284
____exports.SoundEffect[____exports.SoundEffect.MENU_NOTE_HIDE] = "MENU_NOTE_HIDE"
____exports.SoundEffect.MENU_CHARACTER_SELECT = 285
____exports.SoundEffect[____exports.SoundEffect.MENU_CHARACTER_SELECT] = "MENU_CHARACTER_SELECT"
____exports.SoundEffect.SUMMON_POOF = 286
____exports.SoundEffect[____exports.SoundEffect.SUMMON_POOF] = "SUMMON_POOF"
____exports.SoundEffect.BOO_MAD = 300
____exports.SoundEffect[____exports.SoundEffect.BOO_MAD] = "BOO_MAD"
____exports.SoundEffect.FART_GURG = 301
____exports.SoundEffect[____exports.SoundEffect.FART_GURG] = "FART_GURG"
____exports.SoundEffect.FAT_GRUNT = 302
____exports.SoundEffect[____exports.SoundEffect.FAT_GRUNT] = "FAT_GRUNT"
____exports.SoundEffect.FAT_WIGGLE = 303
____exports.SoundEffect[____exports.SoundEffect.FAT_WIGGLE] = "FAT_WIGGLE"
____exports.SoundEffect.FIRE_RUSH = 304
____exports.SoundEffect[____exports.SoundEffect.FIRE_RUSH] = "FIRE_RUSH"
____exports.SoundEffect.GHOST_ROAR = 305
____exports.SoundEffect[____exports.SoundEffect.GHOST_ROAR] = "GHOST_ROAR"
____exports.SoundEffect.GHOST_SHOOT = 306
____exports.SoundEffect[____exports.SoundEffect.GHOST_SHOOT] = "GHOST_SHOOT"
____exports.SoundEffect.GROWL = 307
____exports.SoundEffect[____exports.SoundEffect.GROWL] = "GROWL"
____exports.SoundEffect.GURG_BARF = 308
____exports.SoundEffect[____exports.SoundEffect.GURG_BARF] = "GURG_BARF"
____exports.SoundEffect.INHALE = 309
____exports.SoundEffect[____exports.SoundEffect.INHALE] = "INHALE"
____exports.SoundEffect.LOW_INHALE = 310
____exports.SoundEffect[____exports.SoundEffect.LOW_INHALE] = "LOW_INHALE"
____exports.SoundEffect.MEGA_PUKE = 311
____exports.SoundEffect[____exports.SoundEffect.MEGA_PUKE] = "MEGA_PUKE"
____exports.SoundEffect.MOUTH_FULL = 312
____exports.SoundEffect[____exports.SoundEffect.MOUTH_FULL] = "MOUTH_FULL"
____exports.SoundEffect.MULTI_SCREAM = 313
____exports.SoundEffect[____exports.SoundEffect.MULTI_SCREAM] = "MULTI_SCREAM"
____exports.SoundEffect.SKIN_PULL = 314
____exports.SoundEffect[____exports.SoundEffect.SKIN_PULL] = "SKIN_PULL"
____exports.SoundEffect.WHISTLE = 315
____exports.SoundEffect[____exports.SoundEffect.WHISTLE] = "WHISTLE"
____exports.SoundEffect.DEVIL_ROOM_DEAL = 316
____exports.SoundEffect[____exports.SoundEffect.DEVIL_ROOM_DEAL] = "DEVIL_ROOM_DEAL"
____exports.SoundEffect.SPIDER_SPIT_ROAR = 317
____exports.SoundEffect[____exports.SoundEffect.SPIDER_SPIT_ROAR] = "SPIDER_SPIT_ROAR"
____exports.SoundEffect.WORM_SPIT = 318
____exports.SoundEffect[____exports.SoundEffect.WORM_SPIT] = "WORM_SPIT"
____exports.SoundEffect.LITTLE_SPIT = 319
____exports.SoundEffect[____exports.SoundEffect.LITTLE_SPIT] = "LITTLE_SPIT"
____exports.SoundEffect.SATAN_ROOM_APPEAR = 320
____exports.SoundEffect[____exports.SoundEffect.SATAN_ROOM_APPEAR] = "SATAN_ROOM_APPEAR"
____exports.SoundEffect.HEARTBEAT = 321
____exports.SoundEffect[____exports.SoundEffect.HEARTBEAT] = "HEARTBEAT"
____exports.SoundEffect.HEARTBEAT_FASTER = 322
____exports.SoundEffect[____exports.SoundEffect.HEARTBEAT_FASTER] = "HEARTBEAT_FASTER"
____exports.SoundEffect.HEARTBEAT_FASTEST = 323
____exports.SoundEffect[____exports.SoundEffect.HEARTBEAT_FASTEST] = "HEARTBEAT_FASTEST"
____exports.SoundEffect.FORTY_EIGHT_HOUR_ENERGY = 324
____exports.SoundEffect[____exports.SoundEffect.FORTY_EIGHT_HOUR_ENERGY] = "FORTY_EIGHT_HOUR_ENERGY"
____exports.SoundEffect.ALGIZ = 325
____exports.SoundEffect[____exports.SoundEffect.ALGIZ] = "ALGIZ"
____exports.SoundEffect.AMNESIA = 326
____exports.SoundEffect[____exports.SoundEffect.AMNESIA] = "AMNESIA"
____exports.SoundEffect.ANZUS = 327
____exports.SoundEffect[____exports.SoundEffect.ANZUS] = "ANZUS"
____exports.SoundEffect.BAD_GAS = 328
____exports.SoundEffect[____exports.SoundEffect.BAD_GAS] = "BAD_GAS"
____exports.SoundEffect.BAD_TRIP = 329
____exports.SoundEffect[____exports.SoundEffect.BAD_TRIP] = "BAD_TRIP"
____exports.SoundEffect.BALLS_OF_STEEL = 330
____exports.SoundEffect[____exports.SoundEffect.BALLS_OF_STEEL] = "BALLS_OF_STEEL"
____exports.SoundEffect.BERKANO = 331
____exports.SoundEffect[____exports.SoundEffect.BERKANO] = "BERKANO"
____exports.SoundEffect.BOMBS_ARE_KEY = 332
____exports.SoundEffect[____exports.SoundEffect.BOMBS_ARE_KEY] = "BOMBS_ARE_KEY"
____exports.SoundEffect.CARD_VS_HUMAN = 333
____exports.SoundEffect[____exports.SoundEffect.CARD_VS_HUMAN] = "CARD_VS_HUMAN"
____exports.SoundEffect.CHAOS_CARD = 334
____exports.SoundEffect[____exports.SoundEffect.CHAOS_CARD] = "CHAOS_CARD"
____exports.SoundEffect.CREDIT_CARD = 335
____exports.SoundEffect[____exports.SoundEffect.CREDIT_CARD] = "CREDIT_CARD"
____exports.SoundEffect.DAGAZ = 336
____exports.SoundEffect[____exports.SoundEffect.DAGAZ] = "DAGAZ"
____exports.SoundEffect.DEATH = 337
____exports.SoundEffect[____exports.SoundEffect.DEATH] = "DEATH"
____exports.SoundEffect.EHWAZ = 338
____exports.SoundEffect[____exports.SoundEffect.EHWAZ] = "EHWAZ"
____exports.SoundEffect.EXPLOSIVE_DIARRHEA = 339
____exports.SoundEffect[____exports.SoundEffect.EXPLOSIVE_DIARRHEA] = "EXPLOSIVE_DIARRHEA"
____exports.SoundEffect.FULL_HP = 340
____exports.SoundEffect[____exports.SoundEffect.FULL_HP] = "FULL_HP"
____exports.SoundEffect.HAGALAZ = 341
____exports.SoundEffect[____exports.SoundEffect.HAGALAZ] = "HAGALAZ"
____exports.SoundEffect.HP_DOWN = 342
____exports.SoundEffect[____exports.SoundEffect.HP_DOWN] = "HP_DOWN"
____exports.SoundEffect.HP_UP = 343
____exports.SoundEffect[____exports.SoundEffect.HP_UP] = "HP_UP"
____exports.SoundEffect.HEMATEMESIS = 344
____exports.SoundEffect[____exports.SoundEffect.HEMATEMESIS] = "HEMATEMESIS"
____exports.SoundEffect.I_FOUND_PILLS = 345
____exports.SoundEffect[____exports.SoundEffect.I_FOUND_PILLS] = "I_FOUND_PILLS"
____exports.SoundEffect.JERA = 346
____exports.SoundEffect[____exports.SoundEffect.JERA] = "JERA"
____exports.SoundEffect.JOKER = 347
____exports.SoundEffect[____exports.SoundEffect.JOKER] = "JOKER"
____exports.SoundEffect.JUDGEMENT = 348
____exports.SoundEffect[____exports.SoundEffect.JUDGEMENT] = "JUDGEMENT"
____exports.SoundEffect.JUSTICE = 349
____exports.SoundEffect[____exports.SoundEffect.JUSTICE] = "JUSTICE"
____exports.SoundEffect.LEMON_PARTY = 350
____exports.SoundEffect[____exports.SoundEffect.LEMON_PARTY] = "LEMON_PARTY"
____exports.SoundEffect.LUCK_DOWN = 351
____exports.SoundEffect[____exports.SoundEffect.LUCK_DOWN] = "LUCK_DOWN"
____exports.SoundEffect.LUCK_UP = 352
____exports.SoundEffect[____exports.SoundEffect.LUCK_UP] = "LUCK_UP"
____exports.SoundEffect.PARALYSIS = 353
____exports.SoundEffect[____exports.SoundEffect.PARALYSIS] = "PARALYSIS"
____exports.SoundEffect.PERTHRO = 354
____exports.SoundEffect[____exports.SoundEffect.PERTHRO] = "PERTHRO"
____exports.SoundEffect.PHEROMONES = 355
____exports.SoundEffect[____exports.SoundEffect.PHEROMONES] = "PHEROMONES"
____exports.SoundEffect.PRETTY_FLY = 356
____exports.SoundEffect[____exports.SoundEffect.PRETTY_FLY] = "PRETTY_FLY"
____exports.SoundEffect.PUBERTY = 357
____exports.SoundEffect[____exports.SoundEffect.PUBERTY] = "PUBERTY"
____exports.SoundEffect.R_U_A_WIZARD = 358
____exports.SoundEffect[____exports.SoundEffect.R_U_A_WIZARD] = "R_U_A_WIZARD"
____exports.SoundEffect.RANGE_DOWN = 359
____exports.SoundEffect[____exports.SoundEffect.RANGE_DOWN] = "RANGE_DOWN"
____exports.SoundEffect.RANGE_UP = 360
____exports.SoundEffect[____exports.SoundEffect.RANGE_UP] = "RANGE_UP"
____exports.SoundEffect.RULES_CARD = 361
____exports.SoundEffect[____exports.SoundEffect.RULES_CARD] = "RULES_CARD"
____exports.SoundEffect.I_CAN_SEE_FOREVER = 362
____exports.SoundEffect[____exports.SoundEffect.I_CAN_SEE_FOREVER] = "I_CAN_SEE_FOREVER"
____exports.SoundEffect.SPEED_DOWN = 363
____exports.SoundEffect[____exports.SoundEffect.SPEED_DOWN] = "SPEED_DOWN"
____exports.SoundEffect.SPEED_UP = 364
____exports.SoundEffect[____exports.SoundEffect.SPEED_UP] = "SPEED_UP"
____exports.SoundEffect.STRENGTH = 365
____exports.SoundEffect[____exports.SoundEffect.STRENGTH] = "STRENGTH"
____exports.SoundEffect.SUICIDE_KING = 366
____exports.SoundEffect[____exports.SoundEffect.SUICIDE_KING] = "SUICIDE_KING"
____exports.SoundEffect.TEARS_DOWN = 367
____exports.SoundEffect[____exports.SoundEffect.TEARS_DOWN] = "TEARS_DOWN"
____exports.SoundEffect.TEARS_UP = 368
____exports.SoundEffect[____exports.SoundEffect.TEARS_UP] = "TEARS_UP"
____exports.SoundEffect.TELEPILLS = 369
____exports.SoundEffect[____exports.SoundEffect.TELEPILLS] = "TELEPILLS"
____exports.SoundEffect.TEMPERANCE = 370
____exports.SoundEffect[____exports.SoundEffect.TEMPERANCE] = "TEMPERANCE"
____exports.SoundEffect.THE_CHARIOT = 371
____exports.SoundEffect[____exports.SoundEffect.THE_CHARIOT] = "THE_CHARIOT"
____exports.SoundEffect.THE_DEVIL = 372
____exports.SoundEffect[____exports.SoundEffect.THE_DEVIL] = "THE_DEVIL"
____exports.SoundEffect.THE_EMPEROR = 373
____exports.SoundEffect[____exports.SoundEffect.THE_EMPEROR] = "THE_EMPEROR"
____exports.SoundEffect.EMPRESS = 374
____exports.SoundEffect[____exports.SoundEffect.EMPRESS] = "EMPRESS"
____exports.SoundEffect.FOOL = 375
____exports.SoundEffect[____exports.SoundEffect.FOOL] = "FOOL"
____exports.SoundEffect.HANGED_MAN = 376
____exports.SoundEffect[____exports.SoundEffect.HANGED_MAN] = "HANGED_MAN"
____exports.SoundEffect.HERMIT = 377
____exports.SoundEffect[____exports.SoundEffect.HERMIT] = "HERMIT"
____exports.SoundEffect.HIEROPHANT = 378
____exports.SoundEffect[____exports.SoundEffect.HIEROPHANT] = "HIEROPHANT"
____exports.SoundEffect.HIGHT_PRIESTESS = 379
____exports.SoundEffect[____exports.SoundEffect.HIGHT_PRIESTESS] = "HIGHT_PRIESTESS"
____exports.SoundEffect.THE_LOVERS = 380
____exports.SoundEffect[____exports.SoundEffect.THE_LOVERS] = "THE_LOVERS"
____exports.SoundEffect.MAGICIAN = 381
____exports.SoundEffect[____exports.SoundEffect.MAGICIAN] = "MAGICIAN"
____exports.SoundEffect.MOON = 382
____exports.SoundEffect[____exports.SoundEffect.MOON] = "MOON"
____exports.SoundEffect.STARS = 383
____exports.SoundEffect[____exports.SoundEffect.STARS] = "STARS"
____exports.SoundEffect.SUN = 384
____exports.SoundEffect[____exports.SoundEffect.SUN] = "SUN"
____exports.SoundEffect.TOWER = 385
____exports.SoundEffect[____exports.SoundEffect.TOWER] = "TOWER"
____exports.SoundEffect.WORLD = 386
____exports.SoundEffect[____exports.SoundEffect.WORLD] = "WORLD"
____exports.SoundEffect.TWO_CLUBS = 387
____exports.SoundEffect[____exports.SoundEffect.TWO_CLUBS] = "TWO_CLUBS"
____exports.SoundEffect.TWO_DIAMONDS = 388
____exports.SoundEffect[____exports.SoundEffect.TWO_DIAMONDS] = "TWO_DIAMONDS"
____exports.SoundEffect.TWO_HEARTS = 389
____exports.SoundEffect[____exports.SoundEffect.TWO_HEARTS] = "TWO_HEARTS"
____exports.SoundEffect.TWO_SPADES = 390
____exports.SoundEffect[____exports.SoundEffect.TWO_SPADES] = "TWO_SPADES"
____exports.SoundEffect.WHEEL_OF_FORTUNE = 391
____exports.SoundEffect[____exports.SoundEffect.WHEEL_OF_FORTUNE] = "WHEEL_OF_FORTUNE"
____exports.SoundEffect.RAGMAN_1 = 392
____exports.SoundEffect[____exports.SoundEffect.RAGMAN_1] = "RAGMAN_1"
____exports.SoundEffect.RAGMAN_2 = 393
____exports.SoundEffect[____exports.SoundEffect.RAGMAN_2] = "RAGMAN_2"
____exports.SoundEffect.RAGMAN_3 = 394
____exports.SoundEffect[____exports.SoundEffect.RAGMAN_3] = "RAGMAN_3"
____exports.SoundEffect.RAGMAN_4 = 395
____exports.SoundEffect[____exports.SoundEffect.RAGMAN_4] = "RAGMAN_4"
____exports.SoundEffect.FLUSH = 396
____exports.SoundEffect[____exports.SoundEffect.FLUSH] = "FLUSH"
____exports.SoundEffect.WATER_DROP = 397
____exports.SoundEffect[____exports.SoundEffect.WATER_DROP] = "WATER_DROP"
____exports.SoundEffect.WET_FEET = 398
____exports.SoundEffect[____exports.SoundEffect.WET_FEET] = "WET_FEET"
____exports.SoundEffect.ADDICTED = 399
____exports.SoundEffect[____exports.SoundEffect.ADDICTED] = "ADDICTED"
____exports.SoundEffect.DICE_SHARD = 400
____exports.SoundEffect[____exports.SoundEffect.DICE_SHARD] = "DICE_SHARD"
____exports.SoundEffect.EMERGENCY = 401
____exports.SoundEffect[____exports.SoundEffect.EMERGENCY] = "EMERGENCY"
____exports.SoundEffect.INFESTED_EXCL = 402
____exports.SoundEffect[____exports.SoundEffect.INFESTED_EXCL] = "INFESTED_EXCL"
____exports.SoundEffect.INFESTED_QUEST = 403
____exports.SoundEffect[____exports.SoundEffect.INFESTED_QUEST] = "INFESTED_QUEST"
____exports.SoundEffect.JAIL_CARD = 404
____exports.SoundEffect[____exports.SoundEffect.JAIL_CARD] = "JAIL_CARD"
____exports.SoundEffect.LARGER = 405
____exports.SoundEffect[____exports.SoundEffect.LARGER] = "LARGER"
____exports.SoundEffect.PERCS = 406
____exports.SoundEffect[____exports.SoundEffect.PERCS] = "PERCS"
____exports.SoundEffect.POWER_PILL = 407
____exports.SoundEffect[____exports.SoundEffect.POWER_PILL] = "POWER_PILL"
____exports.SoundEffect.QUESTION_MARK = 408
____exports.SoundEffect[____exports.SoundEffect.QUESTION_MARK] = "QUESTION_MARK"
____exports.SoundEffect.RELAX = 409
____exports.SoundEffect[____exports.SoundEffect.RELAX] = "RELAX"
____exports.SoundEffect.RETRO = 410
____exports.SoundEffect[____exports.SoundEffect.RETRO] = "RETRO"
____exports.SoundEffect.SMALL = 411
____exports.SoundEffect[____exports.SoundEffect.SMALL] = "SMALL"
____exports.SoundEffect.QQQ = 412
____exports.SoundEffect[____exports.SoundEffect.QQQ] = "QQQ"
____exports.SoundEffect.DANGLE_WHISTLE = 413
____exports.SoundEffect[____exports.SoundEffect.DANGLE_WHISTLE] = "DANGLE_WHISTLE"
____exports.SoundEffect.LITTLE_HORN_COUGH = 414
____exports.SoundEffect[____exports.SoundEffect.LITTLE_HORN_COUGH] = "LITTLE_HORN_COUGH"
____exports.SoundEffect.LITTLE_HORN_GRUNT_1 = 415
____exports.SoundEffect[____exports.SoundEffect.LITTLE_HORN_GRUNT_1] = "LITTLE_HORN_GRUNT_1"
____exports.SoundEffect.LITTLE_HORN_GRUNT_2 = 416
____exports.SoundEffect[____exports.SoundEffect.LITTLE_HORN_GRUNT_2] = "LITTLE_HORN_GRUNT_2"
____exports.SoundEffect.THE_FORSAKEN_LAUGH = 417
____exports.SoundEffect[____exports.SoundEffect.THE_FORSAKEN_LAUGH] = "THE_FORSAKEN_LAUGH"
____exports.SoundEffect.THE_FORSAKEN_SCREAM = 418
____exports.SoundEffect[____exports.SoundEffect.THE_FORSAKEN_SCREAM] = "THE_FORSAKEN_SCREAM"
____exports.SoundEffect.THE_STAIN_BURST = 419
____exports.SoundEffect[____exports.SoundEffect.THE_STAIN_BURST] = "THE_STAIN_BURST"
____exports.SoundEffect.BROWNIE_LAUGH = 420
____exports.SoundEffect[____exports.SoundEffect.BROWNIE_LAUGH] = "BROWNIE_LAUGH"
____exports.SoundEffect.HUSH_ROAR = 421
____exports.SoundEffect[____exports.SoundEffect.HUSH_ROAR] = "HUSH_ROAR"
____exports.SoundEffect.HUSH_GROWL = 422
____exports.SoundEffect[____exports.SoundEffect.HUSH_GROWL] = "HUSH_GROWL"
____exports.SoundEffect.HUSH_LOW_ROAR = 423
____exports.SoundEffect[____exports.SoundEffect.HUSH_LOW_ROAR] = "HUSH_LOW_ROAR"
____exports.SoundEffect.FRAIL_CHARGE = 424
____exports.SoundEffect[____exports.SoundEffect.FRAIL_CHARGE] = "FRAIL_CHARGE"
____exports.SoundEffect.HUSH_CHARGE = 425
____exports.SoundEffect[____exports.SoundEffect.HUSH_CHARGE] = "HUSH_CHARGE"
____exports.SoundEffect.MAW_OF_VOID = 426
____exports.SoundEffect[____exports.SoundEffect.MAW_OF_VOID] = "MAW_OF_VOID"
____exports.SoundEffect.ULTRA_GREED_COIN_DESTROY = 427
____exports.SoundEffect[____exports.SoundEffect.ULTRA_GREED_COIN_DESTROY] = "ULTRA_GREED_COIN_DESTROY"
____exports.SoundEffect.ULTRA_GREED_COINS_FALLING = 428
____exports.SoundEffect[____exports.SoundEffect.ULTRA_GREED_COINS_FALLING] = "ULTRA_GREED_COINS_FALLING"
____exports.SoundEffect.ULTRA_GREED_DEATH_SCREAM = 429
____exports.SoundEffect[____exports.SoundEffect.ULTRA_GREED_DEATH_SCREAM] = "ULTRA_GREED_DEATH_SCREAM"
____exports.SoundEffect.ULTRA_GREED_TURN_GOLD_1 = 430
____exports.SoundEffect[____exports.SoundEffect.ULTRA_GREED_TURN_GOLD_1] = "ULTRA_GREED_TURN_GOLD_1"
____exports.SoundEffect.ULTRA_GREED_TURN_GOLD_2 = 431
____exports.SoundEffect[____exports.SoundEffect.ULTRA_GREED_TURN_GOLD_2] = "ULTRA_GREED_TURN_GOLD_2"
____exports.SoundEffect.ULTRA_GREED_ROAR_1 = 432
____exports.SoundEffect[____exports.SoundEffect.ULTRA_GREED_ROAR_1] = "ULTRA_GREED_ROAR_1"
____exports.SoundEffect.ULTRA_GREED_ROAR_2 = 433
____exports.SoundEffect[____exports.SoundEffect.ULTRA_GREED_ROAR_2] = "ULTRA_GREED_ROAR_2"
____exports.SoundEffect.ULTRA_GREED_SPIT = 434
____exports.SoundEffect[____exports.SoundEffect.ULTRA_GREED_SPIT] = "ULTRA_GREED_SPIT"
____exports.SoundEffect.ULTRA_GREED_PULL_SLOT = 435
____exports.SoundEffect[____exports.SoundEffect.ULTRA_GREED_PULL_SLOT] = "ULTRA_GREED_PULL_SLOT"
____exports.SoundEffect.ULTRA_GREED_SLOT_SPIN_LOOP = 436
____exports.SoundEffect[____exports.SoundEffect.ULTRA_GREED_SLOT_SPIN_LOOP] = "ULTRA_GREED_SLOT_SPIN_LOOP"
____exports.SoundEffect.ULTRA_GREED_SLOT_STOP = 437
____exports.SoundEffect[____exports.SoundEffect.ULTRA_GREED_SLOT_STOP] = "ULTRA_GREED_SLOT_STOP"
____exports.SoundEffect.ULTRA_GREED_SLOT_WIN_LOOP_END = 438
____exports.SoundEffect[____exports.SoundEffect.ULTRA_GREED_SLOT_WIN_LOOP_END] = "ULTRA_GREED_SLOT_WIN_LOOP_END"
____exports.SoundEffect.ULTRA_GREED_SLOT_WIN_LOOP = 439
____exports.SoundEffect[____exports.SoundEffect.ULTRA_GREED_SLOT_WIN_LOOP] = "ULTRA_GREED_SLOT_WIN_LOOP"
____exports.SoundEffect.ULTRA_GREED_SPINNING = 440
____exports.SoundEffect[____exports.SoundEffect.ULTRA_GREED_SPINNING] = "ULTRA_GREED_SPINNING"
____exports.SoundEffect.DOG_BARK = 441
____exports.SoundEffect[____exports.SoundEffect.DOG_BARK] = "DOG_BARK"
____exports.SoundEffect.DOG_HOWELL = 442
____exports.SoundEffect[____exports.SoundEffect.DOG_HOWELL] = "DOG_HOWELL"
____exports.SoundEffect.X_LAX = 443
____exports.SoundEffect[____exports.SoundEffect.X_LAX] = "X_LAX"
____exports.SoundEffect.WRONG = 444
____exports.SoundEffect[____exports.SoundEffect.WRONG] = "WRONG"
____exports.SoundEffect.VURP = 445
____exports.SoundEffect[____exports.SoundEffect.VURP] = "VURP"
____exports.SoundEffect.SUNSHINE = 446
____exports.SoundEffect[____exports.SoundEffect.SUNSHINE] = "SUNSHINE"
____exports.SoundEffect.SPADES = 447
____exports.SoundEffect[____exports.SoundEffect.SPADES] = "SPADES"
____exports.SoundEffect.HORF = 448
____exports.SoundEffect[____exports.SoundEffect.HORF] = "HORF"
____exports.SoundEffect.HOLY_CARD = 449
____exports.SoundEffect[____exports.SoundEffect.HOLY_CARD] = "HOLY_CARD"
____exports.SoundEffect.HEARTS = 450
____exports.SoundEffect[____exports.SoundEffect.HEARTS] = "HEARTS"
____exports.SoundEffect.GULP = 451
____exports.SoundEffect[____exports.SoundEffect.GULP] = "GULP"
____exports.SoundEffect.FRIENDS = 452
____exports.SoundEffect[____exports.SoundEffect.FRIENDS] = "FRIENDS"
____exports.SoundEffect.EXCITED = 453
____exports.SoundEffect[____exports.SoundEffect.EXCITED] = "EXCITED"
____exports.SoundEffect.DROWSY = 454
____exports.SoundEffect[____exports.SoundEffect.DROWSY] = "DROWSY"
____exports.SoundEffect.DIAMONDS = 455
____exports.SoundEffect[____exports.SoundEffect.DIAMONDS] = "DIAMONDS"
____exports.SoundEffect.CLUBS = 456
____exports.SoundEffect[____exports.SoundEffect.CLUBS] = "CLUBS"
____exports.SoundEffect.BLACK_RUNE = 457
____exports.SoundEffect[____exports.SoundEffect.BLACK_RUNE] = "BLACK_RUNE"
____exports.SoundEffect.PING_PONG = 458
____exports.SoundEffect[____exports.SoundEffect.PING_PONG] = "PING_PONG"
____exports.SoundEffect.SPEWER = 459
____exports.SoundEffect[____exports.SoundEffect.SPEWER] = "SPEWER"
____exports.SoundEffect.MOM_FOOTSTEPS = 460
____exports.SoundEffect[____exports.SoundEffect.MOM_FOOTSTEPS] = "MOM_FOOTSTEPS"
____exports.SoundEffect.BONE_HEART = 461
____exports.SoundEffect[____exports.SoundEffect.BONE_HEART] = "BONE_HEART"
____exports.SoundEffect.BONE_SNAP = 462
____exports.SoundEffect[____exports.SoundEffect.BONE_SNAP] = "BONE_SNAP"
____exports.SoundEffect.SHOVEL_DROP = 463
____exports.SoundEffect[____exports.SoundEffect.SHOVEL_DROP] = "SHOVEL_DROP"
____exports.SoundEffect.SHOVEL_DIG = 464
____exports.SoundEffect[____exports.SoundEffect.SHOVEL_DIG] = "SHOVEL_DIG"
____exports.SoundEffect.GOLD_HEART = 465
____exports.SoundEffect[____exports.SoundEffect.GOLD_HEART] = "GOLD_HEART"
____exports.SoundEffect.GOLD_HEART_DROP = 466
____exports.SoundEffect[____exports.SoundEffect.GOLD_HEART_DROP] = "GOLD_HEART_DROP"
____exports.SoundEffect.BONE_DROP = 467
____exports.SoundEffect[____exports.SoundEffect.BONE_DROP] = "BONE_DROP"
____exports.SoundEffect.UNHOLY = 468
____exports.SoundEffect[____exports.SoundEffect.UNHOLY] = "UNHOLY"
____exports.SoundEffect.BUTTON_PRESS = 469
____exports.SoundEffect[____exports.SoundEffect.BUTTON_PRESS] = "BUTTON_PRESS"
____exports.SoundEffect.GOLDEN_BOMB = 470
____exports.SoundEffect[____exports.SoundEffect.GOLDEN_BOMB] = "GOLDEN_BOMB"
____exports.SoundEffect.CANDLE_LIGHT = 471
____exports.SoundEffect[____exports.SoundEffect.CANDLE_LIGHT] = "CANDLE_LIGHT"
____exports.SoundEffect.THUNDER = 472
____exports.SoundEffect[____exports.SoundEffect.THUNDER] = "THUNDER"
____exports.SoundEffect.WATER_FLOW_LOOP = 473
____exports.SoundEffect[____exports.SoundEffect.WATER_FLOW_LOOP] = "WATER_FLOW_LOOP"
____exports.SoundEffect.BOSS_2_DIVE = 474
____exports.SoundEffect[____exports.SoundEffect.BOSS_2_DIVE] = "BOSS_2_DIVE"
____exports.SoundEffect.BOSS_2_INTRO_PIPES_TURNON = 475
____exports.SoundEffect[____exports.SoundEffect.BOSS_2_INTRO_PIPES_TURNON] = "BOSS_2_INTRO_PIPES_TURNON"
____exports.SoundEffect.WATER_FLOW_LARGE = 476
____exports.SoundEffect[____exports.SoundEffect.WATER_FLOW_LARGE] = "WATER_FLOW_LARGE"
____exports.SoundEffect.DEMON_HIT = 477
____exports.SoundEffect[____exports.SoundEffect.DEMON_HIT] = "DEMON_HIT"
____exports.SoundEffect.PUNCH = 478
____exports.SoundEffect[____exports.SoundEffect.PUNCH] = "PUNCH"
____exports.SoundEffect.FLUTE = 479
____exports.SoundEffect[____exports.SoundEffect.FLUTE] = "FLUTE"
____exports.SoundEffect.LAVA_LOOP = 480
____exports.SoundEffect[____exports.SoundEffect.LAVA_LOOP] = "LAVA_LOOP"
____exports.SoundEffect.WOOD_PLANK_BREAK = 481
____exports.SoundEffect[____exports.SoundEffect.WOOD_PLANK_BREAK] = "WOOD_PLANK_BREAK"
____exports.SoundEffect.BULLET_SHOT = 482
____exports.SoundEffect[____exports.SoundEffect.BULLET_SHOT] = "BULLET_SHOT"
____exports.SoundEffect.FLAME_BURST = 483
____exports.SoundEffect[____exports.SoundEffect.FLAME_BURST] = "FLAME_BURST"
____exports.SoundEffect.INFLATE = 484
____exports.SoundEffect[____exports.SoundEffect.INFLATE] = "INFLATE"
____exports.SoundEffect.CLAP = 485
____exports.SoundEffect[____exports.SoundEffect.CLAP] = "CLAP"
____exports.SoundEffect.BOSS_2_INTRO_WATER_EXPLOSION = 486
____exports.SoundEffect[____exports.SoundEffect.BOSS_2_INTRO_WATER_EXPLOSION] = "BOSS_2_INTRO_WATER_EXPLOSION"
____exports.SoundEffect.STONE_IMPACT = 487
____exports.SoundEffect[____exports.SoundEffect.STONE_IMPACT] = "STONE_IMPACT"
____exports.SoundEffect.BOSS_2_WATER_THRASHING = 488
____exports.SoundEffect[____exports.SoundEffect.BOSS_2_WATER_THRASHING] = "BOSS_2_WATER_THRASHING"
____exports.SoundEffect.FART_MEGA = 489
____exports.SoundEffect[____exports.SoundEffect.FART_MEGA] = "FART_MEGA"
____exports.SoundEffect.MATCHSTICK = 490
____exports.SoundEffect[____exports.SoundEffect.MATCHSTICK] = "MATCHSTICK"
____exports.SoundEffect.FORTUNE_COOKIE = 491
____exports.SoundEffect[____exports.SoundEffect.FORTUNE_COOKIE] = "FORTUNE_COOKIE"
____exports.SoundEffect.BULB_FLASH = 492
____exports.SoundEffect[____exports.SoundEffect.BULB_FLASH] = "BULB_FLASH"
____exports.SoundEffect.BATTERY_DISCHARGE = 493
____exports.SoundEffect[____exports.SoundEffect.BATTERY_DISCHARGE] = "BATTERY_DISCHARGE"
____exports.SoundEffect.WHIP = 494
____exports.SoundEffect[____exports.SoundEffect.WHIP] = "WHIP"
____exports.SoundEffect.WHIP_HIT = 495
____exports.SoundEffect[____exports.SoundEffect.WHIP_HIT] = "WHIP_HIT"
____exports.SoundEffect.FREEZE = 496
____exports.SoundEffect[____exports.SoundEffect.FREEZE] = "FREEZE"
____exports.SoundEffect.ROTTEN_HEART = 497
____exports.SoundEffect[____exports.SoundEffect.ROTTEN_HEART] = "ROTTEN_HEART"
____exports.SoundEffect.FREEZE_SHATTER = 498
____exports.SoundEffect[____exports.SoundEffect.FREEZE_SHATTER] = "FREEZE_SHATTER"
____exports.SoundEffect.BONE_BOUNCE = 499
____exports.SoundEffect[____exports.SoundEffect.BONE_BOUNCE] = "BONE_BOUNCE"
____exports.SoundEffect.BONE_BREAK = 500
____exports.SoundEffect[____exports.SoundEffect.BONE_BREAK] = "BONE_BREAK"
____exports.SoundEffect.BISHOP_HIT = 501
____exports.SoundEffect[____exports.SoundEffect.BISHOP_HIT] = "BISHOP_HIT"
____exports.SoundEffect.CHAIN_LOOP = 503
____exports.SoundEffect[____exports.SoundEffect.CHAIN_LOOP] = "CHAIN_LOOP"
____exports.SoundEffect.CHAIN_BREAK = 504
____exports.SoundEffect[____exports.SoundEffect.CHAIN_BREAK] = "CHAIN_BREAK"
____exports.SoundEffect.MINECART_LOOP = 505
____exports.SoundEffect[____exports.SoundEffect.MINECART_LOOP] = "MINECART_LOOP"
____exports.SoundEffect.TOOTH_AND_NAIL = 506
____exports.SoundEffect[____exports.SoundEffect.TOOTH_AND_NAIL] = "TOOTH_AND_NAIL"
____exports.SoundEffect.TOOTH_AND_NAIL_TICK = 507
____exports.SoundEffect[____exports.SoundEffect.TOOTH_AND_NAIL_TICK] = "TOOTH_AND_NAIL_TICK"
____exports.SoundEffect.STATIC_BUILDUP = 508
____exports.SoundEffect[____exports.SoundEffect.STATIC_BUILDUP] = "STATIC_BUILDUP"
____exports.SoundEffect.BIG_LEECH = 510
____exports.SoundEffect[____exports.SoundEffect.BIG_LEECH] = "BIG_LEECH"
____exports.SoundEffect.REVERSE_EXPLOSION = 511
____exports.SoundEffect[____exports.SoundEffect.REVERSE_EXPLOSION] = "REVERSE_EXPLOSION"
____exports.SoundEffect.REVERSE_FOOL = 512
____exports.SoundEffect[____exports.SoundEffect.REVERSE_FOOL] = "REVERSE_FOOL"
____exports.SoundEffect.REVERSE_MAGICIAN = 513
____exports.SoundEffect[____exports.SoundEffect.REVERSE_MAGICIAN] = "REVERSE_MAGICIAN"
____exports.SoundEffect.REVERSE_HIGH_PRIESTESS = 514
____exports.SoundEffect[____exports.SoundEffect.REVERSE_HIGH_PRIESTESS] = "REVERSE_HIGH_PRIESTESS"
____exports.SoundEffect.REVERSE_EMPRESS = 515
____exports.SoundEffect[____exports.SoundEffect.REVERSE_EMPRESS] = "REVERSE_EMPRESS"
____exports.SoundEffect.REVERSE_EMPEROR = 516
____exports.SoundEffect[____exports.SoundEffect.REVERSE_EMPEROR] = "REVERSE_EMPEROR"
____exports.SoundEffect.REVERSE_HIEROPHANT = 517
____exports.SoundEffect[____exports.SoundEffect.REVERSE_HIEROPHANT] = "REVERSE_HIEROPHANT"
____exports.SoundEffect.REVERSE_LOVERS = 518
____exports.SoundEffect[____exports.SoundEffect.REVERSE_LOVERS] = "REVERSE_LOVERS"
____exports.SoundEffect.REVERSE_CHARIOT = 519
____exports.SoundEffect[____exports.SoundEffect.REVERSE_CHARIOT] = "REVERSE_CHARIOT"
____exports.SoundEffect.REVERSE_JUSTICE = 520
____exports.SoundEffect[____exports.SoundEffect.REVERSE_JUSTICE] = "REVERSE_JUSTICE"
____exports.SoundEffect.REVERSE_HERMIT = 521
____exports.SoundEffect[____exports.SoundEffect.REVERSE_HERMIT] = "REVERSE_HERMIT"
____exports.SoundEffect.REVERSE_WHEEL_OF_FORTUNE = 522
____exports.SoundEffect[____exports.SoundEffect.REVERSE_WHEEL_OF_FORTUNE] = "REVERSE_WHEEL_OF_FORTUNE"
____exports.SoundEffect.REVERSE_STRENGTH = 523
____exports.SoundEffect[____exports.SoundEffect.REVERSE_STRENGTH] = "REVERSE_STRENGTH"
____exports.SoundEffect.REVERSE_HANGED_MAN = 524
____exports.SoundEffect[____exports.SoundEffect.REVERSE_HANGED_MAN] = "REVERSE_HANGED_MAN"
____exports.SoundEffect.REVERSE_DEATH = 525
____exports.SoundEffect[____exports.SoundEffect.REVERSE_DEATH] = "REVERSE_DEATH"
____exports.SoundEffect.REVERSE_TEMPERANCE = 526
____exports.SoundEffect[____exports.SoundEffect.REVERSE_TEMPERANCE] = "REVERSE_TEMPERANCE"
____exports.SoundEffect.REVERSE_DEVIL = 527
____exports.SoundEffect[____exports.SoundEffect.REVERSE_DEVIL] = "REVERSE_DEVIL"
____exports.SoundEffect.REVERSE_TOWER = 528
____exports.SoundEffect[____exports.SoundEffect.REVERSE_TOWER] = "REVERSE_TOWER"
____exports.SoundEffect.REVERSE_STARS = 529
____exports.SoundEffect[____exports.SoundEffect.REVERSE_STARS] = "REVERSE_STARS"
____exports.SoundEffect.REVERSE_MOON = 530
____exports.SoundEffect[____exports.SoundEffect.REVERSE_MOON] = "REVERSE_MOON"
____exports.SoundEffect.REVERSE_SUN = 531
____exports.SoundEffect[____exports.SoundEffect.REVERSE_SUN] = "REVERSE_SUN"
____exports.SoundEffect.REVERSE_JUDGEMENT = 532
____exports.SoundEffect[____exports.SoundEffect.REVERSE_JUDGEMENT] = "REVERSE_JUDGEMENT"
____exports.SoundEffect.REVERSE_WORLD = 533
____exports.SoundEffect[____exports.SoundEffect.REVERSE_WORLD] = "REVERSE_WORLD"
____exports.SoundEffect.FLAMETHROWER_START = 534
____exports.SoundEffect[____exports.SoundEffect.FLAMETHROWER_START] = "FLAMETHROWER_START"
____exports.SoundEffect.FLAMETHROWER_LOOP = 535
____exports.SoundEffect[____exports.SoundEffect.FLAMETHROWER_LOOP] = "FLAMETHROWER_LOOP"
____exports.SoundEffect.FLAMETHROWER_END = 536
____exports.SoundEffect[____exports.SoundEffect.FLAMETHROWER_END] = "FLAMETHROWER_END"
____exports.SoundEffect.ROCKET_LAUNCH = 537
____exports.SoundEffect[____exports.SoundEffect.ROCKET_LAUNCH] = "ROCKET_LAUNCH"
____exports.SoundEffect.SWORD_SPIN = 538
____exports.SoundEffect[____exports.SoundEffect.SWORD_SPIN] = "SWORD_SPIN"
____exports.SoundEffect.BABY_BRIM = 539
____exports.SoundEffect[____exports.SoundEffect.BABY_BRIM] = "BABY_BRIM"
____exports.SoundEffect.KNIFE_PULL = 540
____exports.SoundEffect[____exports.SoundEffect.KNIFE_PULL] = "KNIFE_PULL"
____exports.SoundEffect.DOGMA_APPEAR_SCREAM = 541
____exports.SoundEffect[____exports.SoundEffect.DOGMA_APPEAR_SCREAM] = "DOGMA_APPEAR_SCREAM"
____exports.SoundEffect.DOGMA_DEATH = 542
____exports.SoundEffect[____exports.SoundEffect.DOGMA_DEATH] = "DOGMA_DEATH"
____exports.SoundEffect.DOGMA_BLACK_HOLE_CHARGE = 543
____exports.SoundEffect[____exports.SoundEffect.DOGMA_BLACK_HOLE_CHARGE] = "DOGMA_BLACK_HOLE_CHARGE"
____exports.SoundEffect.DOGMA_BLACK_HOLE_SHOOT = 544
____exports.SoundEffect[____exports.SoundEffect.DOGMA_BLACK_HOLE_SHOOT] = "DOGMA_BLACK_HOLE_SHOOT"
____exports.SoundEffect.DOGMA_BLACK_HOLE_OPEN = 545
____exports.SoundEffect[____exports.SoundEffect.DOGMA_BLACK_HOLE_OPEN] = "DOGMA_BLACK_HOLE_OPEN"
____exports.SoundEffect.DOGMA_BLACK_HOLE_CLOSE = 546
____exports.SoundEffect[____exports.SoundEffect.DOGMA_BLACK_HOLE_CLOSE] = "DOGMA_BLACK_HOLE_CLOSE"
____exports.SoundEffect.DOGMA_BRIMSTONE_CHARGE = 547
____exports.SoundEffect[____exports.SoundEffect.DOGMA_BRIMSTONE_CHARGE] = "DOGMA_BRIMSTONE_CHARGE"
____exports.SoundEffect.DOGMA_BRIMSTONE_SHOOT = 548
____exports.SoundEffect[____exports.SoundEffect.DOGMA_BRIMSTONE_SHOOT] = "DOGMA_BRIMSTONE_SHOOT"
____exports.SoundEffect.DOGMA_GODHEAD = 549
____exports.SoundEffect[____exports.SoundEffect.DOGMA_GODHEAD] = "DOGMA_GODHEAD"
____exports.SoundEffect.DOGMA_JACOBS = 550
____exports.SoundEffect[____exports.SoundEffect.DOGMA_JACOBS] = "DOGMA_JACOBS"
____exports.SoundEffect.DOGMA_JACOBS_ZAP = 551
____exports.SoundEffect[____exports.SoundEffect.DOGMA_JACOBS_ZAP] = "DOGMA_JACOBS_ZAP"
____exports.SoundEffect.DOGMA_SCREAM = 552
____exports.SoundEffect[____exports.SoundEffect.DOGMA_SCREAM] = "DOGMA_SCREAM"
____exports.SoundEffect.DOGMA_PREACHER = 553
____exports.SoundEffect[____exports.SoundEffect.DOGMA_PREACHER] = "DOGMA_PREACHER"
____exports.SoundEffect.DOGMA_RING_START = 554
____exports.SoundEffect[____exports.SoundEffect.DOGMA_RING_START] = "DOGMA_RING_START"
____exports.SoundEffect.DOGMA_RING_LOOP = 555
____exports.SoundEffect[____exports.SoundEffect.DOGMA_RING_LOOP] = "DOGMA_RING_LOOP"
____exports.SoundEffect.DOGMA_FEATHER_SPRAY = 556
____exports.SoundEffect[____exports.SoundEffect.DOGMA_FEATHER_SPRAY] = "DOGMA_FEATHER_SPRAY"
____exports.SoundEffect.DOGMA_JACOBS_DOT = 557
____exports.SoundEffect[____exports.SoundEffect.DOGMA_JACOBS_DOT] = "DOGMA_JACOBS_DOT"
____exports.SoundEffect.DOGMA_BLACK_HOLE_LOOP = 558
____exports.SoundEffect[____exports.SoundEffect.DOGMA_BLACK_HOLE_LOOP] = "DOGMA_BLACK_HOLE_LOOP"
____exports.SoundEffect.DOGMA_ANGEL_TRANSFORM = 559
____exports.SoundEffect[____exports.SoundEffect.DOGMA_ANGEL_TRANSFORM] = "DOGMA_ANGEL_TRANSFORM"
____exports.SoundEffect.DOGMA_ANGEL_TRANSFORM_END = 560
____exports.SoundEffect[____exports.SoundEffect.DOGMA_ANGEL_TRANSFORM_END] = "DOGMA_ANGEL_TRANSFORM_END"
____exports.SoundEffect.DOGMA_LIGHT_APPEAR = 561
____exports.SoundEffect[____exports.SoundEffect.DOGMA_LIGHT_APPEAR] = "DOGMA_LIGHT_APPEAR"
____exports.SoundEffect.DOGMA_LIGHT_BALL_THROW = 562
____exports.SoundEffect[____exports.SoundEffect.DOGMA_LIGHT_BALL_THROW] = "DOGMA_LIGHT_BALL_THROW"
____exports.SoundEffect.DOGMA_LIGHT_RAY_CHARGE = 563
____exports.SoundEffect[____exports.SoundEffect.DOGMA_LIGHT_RAY_CHARGE] = "DOGMA_LIGHT_RAY_CHARGE"
____exports.SoundEffect.DOGMA_LIGHT_RAY_FIRE = 564
____exports.SoundEffect[____exports.SoundEffect.DOGMA_LIGHT_RAY_FIRE] = "DOGMA_LIGHT_RAY_FIRE"
____exports.SoundEffect.DOGMA_SPIN_ATTACK = 565
____exports.SoundEffect[____exports.SoundEffect.DOGMA_SPIN_ATTACK] = "DOGMA_SPIN_ATTACK"
____exports.SoundEffect.DOGMA_WING_FLAP = 566
____exports.SoundEffect[____exports.SoundEffect.DOGMA_WING_FLAP] = "DOGMA_WING_FLAP"
____exports.SoundEffect.DOGMA_TV_BREAK = 567
____exports.SoundEffect[____exports.SoundEffect.DOGMA_TV_BREAK] = "DOGMA_TV_BREAK"
____exports.SoundEffect.DIVINE_INTERVENTION = 568
____exports.SoundEffect[____exports.SoundEffect.DIVINE_INTERVENTION] = "DIVINE_INTERVENTION"
____exports.SoundEffect.MENU_FLIP_LIGHT = 569
____exports.SoundEffect[____exports.SoundEffect.MENU_FLIP_LIGHT] = "MENU_FLIP_LIGHT"
____exports.SoundEffect.MENU_FLIP_DARK = 570
____exports.SoundEffect[____exports.SoundEffect.MENU_FLIP_DARK] = "MENU_FLIP_DARK"
____exports.SoundEffect.MENU_RIP = 571
____exports.SoundEffect[____exports.SoundEffect.MENU_RIP] = "MENU_RIP"
____exports.SoundEffect.URN_OPEN = 572
____exports.SoundEffect[____exports.SoundEffect.URN_OPEN] = "URN_OPEN"
____exports.SoundEffect.URN_CLOSE = 573
____exports.SoundEffect[____exports.SoundEffect.URN_CLOSE] = "URN_CLOSE"
____exports.SoundEffect.RECALL = 574
____exports.SoundEffect[____exports.SoundEffect.RECALL] = "RECALL"
____exports.SoundEffect.LARYNX_SCREAM_LO = 575
____exports.SoundEffect[____exports.SoundEffect.LARYNX_SCREAM_LO] = "LARYNX_SCREAM_LO"
____exports.SoundEffect.LARYNX_SCREAM_MED = 576
____exports.SoundEffect[____exports.SoundEffect.LARYNX_SCREAM_MED] = "LARYNX_SCREAM_MED"
____exports.SoundEffect.LARYNX_SCREAM_HI = 577
____exports.SoundEffect[____exports.SoundEffect.LARYNX_SCREAM_HI] = "LARYNX_SCREAM_HI"
____exports.SoundEffect.GROUND_TREMOR = 578
____exports.SoundEffect[____exports.SoundEffect.GROUND_TREMOR] = "GROUND_TREMOR"
____exports.SoundEffect.SOUL_PICKUP = 579
____exports.SoundEffect[____exports.SoundEffect.SOUL_PICKUP] = "SOUL_PICKUP"
____exports.SoundEffect.BALL_AND_CHAIN_LOOP = 580
____exports.SoundEffect[____exports.SoundEffect.BALL_AND_CHAIN_LOOP] = "BALL_AND_CHAIN_LOOP"
____exports.SoundEffect.BALL_AND_CHAIN_HIT = 581
____exports.SoundEffect[____exports.SoundEffect.BALL_AND_CHAIN_HIT] = "BALL_AND_CHAIN_HIT"
____exports.SoundEffect.LAZARUS_FLIP_DEAD = 582
____exports.SoundEffect[____exports.SoundEffect.LAZARUS_FLIP_DEAD] = "LAZARUS_FLIP_DEAD"
____exports.SoundEffect.LAZARUS_FLIP_ALIVE = 583
____exports.SoundEffect[____exports.SoundEffect.LAZARUS_FLIP_ALIVE] = "LAZARUS_FLIP_ALIVE"
____exports.SoundEffect.RECALL_FINISH = 584
____exports.SoundEffect[____exports.SoundEffect.RECALL_FINISH] = "RECALL_FINISH"
____exports.SoundEffect.ROCKET_LAUNCH_SHORT = 585
____exports.SoundEffect[____exports.SoundEffect.ROCKET_LAUNCH_SHORT] = "ROCKET_LAUNCH_SHORT"
____exports.SoundEffect.ROCKET_LAUNCH_TINY = 586
____exports.SoundEffect[____exports.SoundEffect.ROCKET_LAUNCH_TINY] = "ROCKET_LAUNCH_TINY"
____exports.SoundEffect.ROCKET_EXPLOSION = 587
____exports.SoundEffect[____exports.SoundEffect.ROCKET_EXPLOSION] = "ROCKET_EXPLOSION"
____exports.SoundEffect.JELLY_BOUNCE = 588
____exports.SoundEffect[____exports.SoundEffect.JELLY_BOUNCE] = "JELLY_BOUNCE"
____exports.SoundEffect.POOP_LASER = 589
____exports.SoundEffect[____exports.SoundEffect.POOP_LASER] = "POOP_LASER"
____exports.SoundEffect.POISON_WARN = 590
____exports.SoundEffect[____exports.SoundEffect.POISON_WARN] = "POISON_WARN"
____exports.SoundEffect.POISON_HURT = 591
____exports.SoundEffect[____exports.SoundEffect.POISON_HURT] = "POISON_HURT"
____exports.SoundEffect.BERSERK_START = 592
____exports.SoundEffect[____exports.SoundEffect.BERSERK_START] = "BERSERK_START"
____exports.SoundEffect.BERSERK_TICK = 593
____exports.SoundEffect[____exports.SoundEffect.BERSERK_TICK] = "BERSERK_TICK"
____exports.SoundEffect.BERSERK_END = 594
____exports.SoundEffect[____exports.SoundEffect.BERSERK_END] = "BERSERK_END"
____exports.SoundEffect.EDEN_GLITCH = 595
____exports.SoundEffect[____exports.SoundEffect.EDEN_GLITCH] = "EDEN_GLITCH"
____exports.SoundEffect.RAILROAD_TRACK_RAISE = 596
____exports.SoundEffect[____exports.SoundEffect.RAILROAD_TRACK_RAISE] = "RAILROAD_TRACK_RAISE"
____exports.SoundEffect.RAILROAD_TRACK_RAISE_FAR = 597
____exports.SoundEffect[____exports.SoundEffect.RAILROAD_TRACK_RAISE_FAR] = "RAILROAD_TRACK_RAISE_FAR"
____exports.SoundEffect.MOM_AND_DAD_1 = 598
____exports.SoundEffect[____exports.SoundEffect.MOM_AND_DAD_1] = "MOM_AND_DAD_1"
____exports.SoundEffect.MOM_AND_DAD_2 = 599
____exports.SoundEffect[____exports.SoundEffect.MOM_AND_DAD_2] = "MOM_AND_DAD_2"
____exports.SoundEffect.MOM_AND_DAD_3 = 600
____exports.SoundEffect[____exports.SoundEffect.MOM_AND_DAD_3] = "MOM_AND_DAD_3"
____exports.SoundEffect.MOM_AND_DAD_4 = 601
____exports.SoundEffect[____exports.SoundEffect.MOM_AND_DAD_4] = "MOM_AND_DAD_4"
____exports.SoundEffect.THUMBS_UP_AMPLIFIED = 602
____exports.SoundEffect[____exports.SoundEffect.THUMBS_UP_AMPLIFIED] = "THUMBS_UP_AMPLIFIED"
____exports.SoundEffect.THUMBS_DOWN_AMPLIFIED = 603
____exports.SoundEffect[____exports.SoundEffect.THUMBS_DOWN_AMPLIFIED] = "THUMBS_DOWN_AMPLIFIED"
____exports.SoundEffect.POWER_UP_SPEWER_AMPLIFIED = 604
____exports.SoundEffect[____exports.SoundEffect.POWER_UP_SPEWER_AMPLIFIED] = "POWER_UP_SPEWER_AMPLIFIED"
____exports.SoundEffect.POOP_ITEM_THROW = 605
____exports.SoundEffect[____exports.SoundEffect.POOP_ITEM_THROW] = "POOP_ITEM_THROW"
____exports.SoundEffect.POOP_ITEM_STORE = 606
____exports.SoundEffect[____exports.SoundEffect.POOP_ITEM_STORE] = "POOP_ITEM_STORE"
____exports.SoundEffect.POOP_ITEM_HOLD = 607
____exports.SoundEffect[____exports.SoundEffect.POOP_ITEM_HOLD] = "POOP_ITEM_HOLD"
____exports.SoundEffect.MIRROR_ENTER = 608
____exports.SoundEffect[____exports.SoundEffect.MIRROR_ENTER] = "MIRROR_ENTER"
____exports.SoundEffect.MIRROR_EXIT = 609
____exports.SoundEffect[____exports.SoundEffect.MIRROR_EXIT] = "MIRROR_EXIT"
____exports.SoundEffect.MIRROR_BREAK = 610
____exports.SoundEffect[____exports.SoundEffect.MIRROR_BREAK] = "MIRROR_BREAK"
____exports.SoundEffect.ANIMA_TRAP = 611
____exports.SoundEffect[____exports.SoundEffect.ANIMA_TRAP] = "ANIMA_TRAP"
____exports.SoundEffect.ANIMA_RATTLE = 612
____exports.SoundEffect[____exports.SoundEffect.ANIMA_RATTLE] = "ANIMA_RATTLE"
____exports.SoundEffect.ANIMA_BREAK = 613
____exports.SoundEffect[____exports.SoundEffect.ANIMA_BREAK] = "ANIMA_BREAK"
____exports.SoundEffect.VAMP_DOUBLE = 614
____exports.SoundEffect[____exports.SoundEffect.VAMP_DOUBLE] = "VAMP_DOUBLE"
____exports.SoundEffect.FLASHBACK = 615
____exports.SoundEffect[____exports.SoundEffect.FLASHBACK] = "FLASHBACK"
____exports.SoundEffect.DARK_ESAU_OPEN = 616
____exports.SoundEffect[____exports.SoundEffect.DARK_ESAU_OPEN] = "DARK_ESAU_OPEN"
____exports.SoundEffect.DARK_ESAU_DEATH_OPEN = 617
____exports.SoundEffect[____exports.SoundEffect.DARK_ESAU_DEATH_OPEN] = "DARK_ESAU_DEATH_OPEN"
____exports.SoundEffect.MOTHER_DEATH_1 = 618
____exports.SoundEffect[____exports.SoundEffect.MOTHER_DEATH_1] = "MOTHER_DEATH_1"
____exports.SoundEffect.MOTHER_DEATH_2 = 619
____exports.SoundEffect[____exports.SoundEffect.MOTHER_DEATH_2] = "MOTHER_DEATH_2"
____exports.SoundEffect.MOTHER_FIST_POUND_1 = 620
____exports.SoundEffect[____exports.SoundEffect.MOTHER_FIST_POUND_1] = "MOTHER_FIST_POUND_1"
____exports.SoundEffect.MOTHER_FIST_POUND_2 = 621
____exports.SoundEffect[____exports.SoundEffect.MOTHER_FIST_POUND_2] = "MOTHER_FIST_POUND_2"
____exports.SoundEffect.MOTHER_FIST_POUND_3 = 622
____exports.SoundEffect[____exports.SoundEffect.MOTHER_FIST_POUND_3] = "MOTHER_FIST_POUND_3"
____exports.SoundEffect.MOTHER_FISTULA = 623
____exports.SoundEffect[____exports.SoundEffect.MOTHER_FISTULA] = "MOTHER_FISTULA"
____exports.SoundEffect.MOTHER_APPEAR_1 = 624
____exports.SoundEffect[____exports.SoundEffect.MOTHER_APPEAR_1] = "MOTHER_APPEAR_1"
____exports.SoundEffect.MOTHER_APPEAR_2 = 625
____exports.SoundEffect[____exports.SoundEffect.MOTHER_APPEAR_2] = "MOTHER_APPEAR_2"
____exports.SoundEffect.MOTHER_KNIFE_START = 626
____exports.SoundEffect[____exports.SoundEffect.MOTHER_KNIFE_START] = "MOTHER_KNIFE_START"
____exports.SoundEffect.MOTHER_KNIFE_THROW = 627
____exports.SoundEffect[____exports.SoundEffect.MOTHER_KNIFE_THROW] = "MOTHER_KNIFE_THROW"
____exports.SoundEffect.MOTHER_SUMMON_ISAACS_START = 628
____exports.SoundEffect[____exports.SoundEffect.MOTHER_SUMMON_ISAACS_START] = "MOTHER_SUMMON_ISAACS_START"
____exports.SoundEffect.MOTHER_SUMMON_ISAACS_END = 629
____exports.SoundEffect[____exports.SoundEffect.MOTHER_SUMMON_ISAACS_END] = "MOTHER_SUMMON_ISAACS_END"
____exports.SoundEffect.MOTHER_HAND_BOIL_START = 630
____exports.SoundEffect[____exports.SoundEffect.MOTHER_HAND_BOIL_START] = "MOTHER_HAND_BOIL_START"
____exports.SoundEffect.MOTHER_GRUNT_1 = 631
____exports.SoundEffect[____exports.SoundEffect.MOTHER_GRUNT_1] = "MOTHER_GRUNT_1"
____exports.SoundEffect.MOTHER_GRUNT_5 = 632
____exports.SoundEffect[____exports.SoundEffect.MOTHER_GRUNT_5] = "MOTHER_GRUNT_5"
____exports.SoundEffect.MOTHER_GRUNT_6 = 633
____exports.SoundEffect[____exports.SoundEffect.MOTHER_GRUNT_6] = "MOTHER_GRUNT_6"
____exports.SoundEffect.MOTHER_GRUNT_7 = 634
____exports.SoundEffect[____exports.SoundEffect.MOTHER_GRUNT_7] = "MOTHER_GRUNT_7"
____exports.SoundEffect.MOTHER_LAUGH = 635
____exports.SoundEffect[____exports.SoundEffect.MOTHER_LAUGH] = "MOTHER_LAUGH"
____exports.SoundEffect.MOTHER_SPIN_START = 636
____exports.SoundEffect[____exports.SoundEffect.MOTHER_SPIN_START] = "MOTHER_SPIN_START"
____exports.SoundEffect.MOTHER_WALL_SHOT_START = 637
____exports.SoundEffect[____exports.SoundEffect.MOTHER_WALL_SHOT_START] = "MOTHER_WALL_SHOT_START"
____exports.SoundEffect.MOTHER_MISC = 638
____exports.SoundEffect[____exports.SoundEffect.MOTHER_MISC] = "MOTHER_MISC"
____exports.SoundEffect.MOTHER_SHOOT = 639
____exports.SoundEffect[____exports.SoundEffect.MOTHER_SHOOT] = "MOTHER_SHOOT"
____exports.SoundEffect.MOTHER_SUCTION = 640
____exports.SoundEffect[____exports.SoundEffect.MOTHER_SUCTION] = "MOTHER_SUCTION"
____exports.SoundEffect.MOTHER_ISAAC_RISE = 641
____exports.SoundEffect[____exports.SoundEffect.MOTHER_ISAAC_RISE] = "MOTHER_ISAAC_RISE"
____exports.SoundEffect.MOTHER_ISAAC_HIT = 642
____exports.SoundEffect[____exports.SoundEffect.MOTHER_ISAAC_HIT] = "MOTHER_ISAAC_HIT"
____exports.SoundEffect.MOTHER_WRIST_SWELL = 643
____exports.SoundEffect[____exports.SoundEffect.MOTHER_WRIST_SWELL] = "MOTHER_WRIST_SWELL"
____exports.SoundEffect.MOTHER_WRIST_EXPLODE = 644
____exports.SoundEffect[____exports.SoundEffect.MOTHER_WRIST_EXPLODE] = "MOTHER_WRIST_EXPLODE"
____exports.SoundEffect.MOTHER_DEATH_MELT = 645
____exports.SoundEffect[____exports.SoundEffect.MOTHER_DEATH_MELT] = "MOTHER_DEATH_MELT"
____exports.SoundEffect.MOTHER_ANGER_SHAKE = 646
____exports.SoundEffect[____exports.SoundEffect.MOTHER_ANGER_SHAKE] = "MOTHER_ANGER_SHAKE"
____exports.SoundEffect.MOTHER_CHARGE_1 = 647
____exports.SoundEffect[____exports.SoundEffect.MOTHER_CHARGE_1] = "MOTHER_CHARGE_1"
____exports.SoundEffect.MOTHER_CHARGE_2 = 648
____exports.SoundEffect[____exports.SoundEffect.MOTHER_CHARGE_2] = "MOTHER_CHARGE_2"
____exports.SoundEffect.MOTHER_LAND_SMASH = 649
____exports.SoundEffect[____exports.SoundEffect.MOTHER_LAND_SMASH] = "MOTHER_LAND_SMASH"
____exports.SoundEffect.ISAAC_ROAR = 650
____exports.SoundEffect[____exports.SoundEffect.ISAAC_ROAR] = "ISAAC_ROAR"
____exports.SoundEffect.FAMINE_APPEAR = 651
____exports.SoundEffect[____exports.SoundEffect.FAMINE_APPEAR] = "FAMINE_APPEAR"
____exports.SoundEffect.FAMINE_DEATH_1 = 652
____exports.SoundEffect[____exports.SoundEffect.FAMINE_DEATH_1] = "FAMINE_DEATH_1"
____exports.SoundEffect.FAMINE_DEATH_2 = 653
____exports.SoundEffect[____exports.SoundEffect.FAMINE_DEATH_2] = "FAMINE_DEATH_2"
____exports.SoundEffect.FAMINE_DASH_START = 654
____exports.SoundEffect[____exports.SoundEffect.FAMINE_DASH_START] = "FAMINE_DASH_START"
____exports.SoundEffect.FAMINE_DASH = 655
____exports.SoundEffect[____exports.SoundEffect.FAMINE_DASH] = "FAMINE_DASH"
____exports.SoundEffect.FAMINE_SHOOT = 656
____exports.SoundEffect[____exports.SoundEffect.FAMINE_SHOOT] = "FAMINE_SHOOT"
____exports.SoundEffect.FAMINE_BURST = 657
____exports.SoundEffect[____exports.SoundEffect.FAMINE_BURST] = "FAMINE_BURST"
____exports.SoundEffect.FAMINE_GURGLE = 658
____exports.SoundEffect[____exports.SoundEffect.FAMINE_GURGLE] = "FAMINE_GURGLE"
____exports.SoundEffect.PESTILENCE_MAGGOT_START = 659
____exports.SoundEffect[____exports.SoundEffect.PESTILENCE_MAGGOT_START] = "PESTILENCE_MAGGOT_START"
____exports.SoundEffect.PESTILENCE_MAGGOT_SHOOT_1 = 660
____exports.SoundEffect[____exports.SoundEffect.PESTILENCE_MAGGOT_SHOOT_1] = "PESTILENCE_MAGGOT_SHOOT_1"
____exports.SoundEffect.PESTILENCE_MAGGOT_RETURN = 661
____exports.SoundEffect[____exports.SoundEffect.PESTILENCE_MAGGOT_RETURN] = "PESTILENCE_MAGGOT_RETURN"
____exports.SoundEffect.PESTILENCE_BODY_SHOOT = 662
____exports.SoundEffect[____exports.SoundEffect.PESTILENCE_BODY_SHOOT] = "PESTILENCE_BODY_SHOOT"
____exports.SoundEffect.PESTILENCE_HEAD_DEATH = 663
____exports.SoundEffect[____exports.SoundEffect.PESTILENCE_HEAD_DEATH] = "PESTILENCE_HEAD_DEATH"
____exports.SoundEffect.PESTILENCE_DEATH = 664
____exports.SoundEffect[____exports.SoundEffect.PESTILENCE_DEATH] = "PESTILENCE_DEATH"
____exports.SoundEffect.PESTILENCE_COUGH = 665
____exports.SoundEffect[____exports.SoundEffect.PESTILENCE_COUGH] = "PESTILENCE_COUGH"
____exports.SoundEffect.PESTILENCE_BARF = 666
____exports.SoundEffect[____exports.SoundEffect.PESTILENCE_BARF] = "PESTILENCE_BARF"
____exports.SoundEffect.PESTILENCE_APPEAR = 667
____exports.SoundEffect[____exports.SoundEffect.PESTILENCE_APPEAR] = "PESTILENCE_APPEAR"
____exports.SoundEffect.PESTILENCE_HEAD_EXPLODE = 668
____exports.SoundEffect[____exports.SoundEffect.PESTILENCE_HEAD_EXPLODE] = "PESTILENCE_HEAD_EXPLODE"
____exports.SoundEffect.PESTILENCE_MAGGOT_ENTER = 669
____exports.SoundEffect[____exports.SoundEffect.PESTILENCE_MAGGOT_ENTER] = "PESTILENCE_MAGGOT_ENTER"
____exports.SoundEffect.PESTILENCE_MAGGOT_POP_OUT = 670
____exports.SoundEffect[____exports.SoundEffect.PESTILENCE_MAGGOT_POP_OUT] = "PESTILENCE_MAGGOT_POP_OUT"
____exports.SoundEffect.PESTILENCE_MAGGOT_SHOOT_2 = 671
____exports.SoundEffect[____exports.SoundEffect.PESTILENCE_MAGGOT_SHOOT_2] = "PESTILENCE_MAGGOT_SHOOT_2"
____exports.SoundEffect.PESTILENCE_NECK_PUKE = 672
____exports.SoundEffect[____exports.SoundEffect.PESTILENCE_NECK_PUKE] = "PESTILENCE_NECK_PUKE"
____exports.SoundEffect.PESTILENCE_PUKE_START = 673
____exports.SoundEffect[____exports.SoundEffect.PESTILENCE_PUKE_START] = "PESTILENCE_PUKE_START"
____exports.SoundEffect.WAR_APPEAR = 674
____exports.SoundEffect[____exports.SoundEffect.WAR_APPEAR] = "WAR_APPEAR"
____exports.SoundEffect.WAR_APPEAR_LAVA = 675
____exports.SoundEffect[____exports.SoundEffect.WAR_APPEAR_LAVA] = "WAR_APPEAR_LAVA"
____exports.SoundEffect.WAR_BOMB_TOSS = 676
____exports.SoundEffect[____exports.SoundEffect.WAR_BOMB_TOSS] = "WAR_BOMB_TOSS"
____exports.SoundEffect.WAR_DASH_START = 677
____exports.SoundEffect[____exports.SoundEffect.WAR_DASH_START] = "WAR_DASH_START"
____exports.SoundEffect.WAR_DASH = 678
____exports.SoundEffect[____exports.SoundEffect.WAR_DASH] = "WAR_DASH"
____exports.SoundEffect.WAR_HORSE_DEATH = 679
____exports.SoundEffect[____exports.SoundEffect.WAR_HORSE_DEATH] = "WAR_HORSE_DEATH"
____exports.SoundEffect.WAR_DEATH = 680
____exports.SoundEffect[____exports.SoundEffect.WAR_DEATH] = "WAR_DEATH"
____exports.SoundEffect.WAR_FIRE_SCREAM = 681
____exports.SoundEffect[____exports.SoundEffect.WAR_FIRE_SCREAM] = "WAR_FIRE_SCREAM"
____exports.SoundEffect.WAR_GRAB_PLAYER = 682
____exports.SoundEffect[____exports.SoundEffect.WAR_GRAB_PLAYER] = "WAR_GRAB_PLAYER"
____exports.SoundEffect.WAR_BOMB_HOLD = 683
____exports.SoundEffect[____exports.SoundEffect.WAR_BOMB_HOLD] = "WAR_BOMB_HOLD"
____exports.SoundEffect.WAR_BOMB_PULL_OUT = 684
____exports.SoundEffect[____exports.SoundEffect.WAR_BOMB_PULL_OUT] = "WAR_BOMB_PULL_OUT"
____exports.SoundEffect.WAR_CHASE = 685
____exports.SoundEffect[____exports.SoundEffect.WAR_CHASE] = "WAR_CHASE"
____exports.SoundEffect.WAR_BOMB_TICK = 686
____exports.SoundEffect[____exports.SoundEffect.WAR_BOMB_TICK] = "WAR_BOMB_TICK"
____exports.SoundEffect.WAR_FLAME = 687
____exports.SoundEffect[____exports.SoundEffect.WAR_FLAME] = "WAR_FLAME"
____exports.SoundEffect.WAR_LAVA_SPLASH = 688
____exports.SoundEffect[____exports.SoundEffect.WAR_LAVA_SPLASH] = "WAR_LAVA_SPLASH"
____exports.SoundEffect.WAR_LAVA_DASH = 689
____exports.SoundEffect[____exports.SoundEffect.WAR_LAVA_DASH] = "WAR_LAVA_DASH"
____exports.SoundEffect.DEATH_DIES = 690
____exports.SoundEffect[____exports.SoundEffect.DEATH_DIES] = "DEATH_DIES"
____exports.SoundEffect.DEATH_DESTROY_SKULLS = 691
____exports.SoundEffect[____exports.SoundEffect.DEATH_DESTROY_SKULLS] = "DEATH_DESTROY_SKULLS"
____exports.SoundEffect.DEATH_GROWL = 692
____exports.SoundEffect[____exports.SoundEffect.DEATH_GROWL] = "DEATH_GROWL"
____exports.SoundEffect.DEATH_SWIPE_START = 693
____exports.SoundEffect[____exports.SoundEffect.DEATH_SWIPE_START] = "DEATH_SWIPE_START"
____exports.SoundEffect.DEATH_SWIPE = 694
____exports.SoundEffect[____exports.SoundEffect.DEATH_SWIPE] = "DEATH_SWIPE"
____exports.SoundEffect.DEATH_SUMMON_SCYTHES = 695
____exports.SoundEffect[____exports.SoundEffect.DEATH_SUMMON_SCYTHES] = "DEATH_SUMMON_SCYTHES"
____exports.SoundEffect.DEATH_SUMMON_SKULLS = 696
____exports.SoundEffect[____exports.SoundEffect.DEATH_SUMMON_SKULLS] = "DEATH_SUMMON_SKULLS"
____exports.SoundEffect.BEAST_DEATH = 697
____exports.SoundEffect[____exports.SoundEffect.BEAST_DEATH] = "BEAST_DEATH"
____exports.SoundEffect.BEAST_LASER = 698
____exports.SoundEffect[____exports.SoundEffect.BEAST_LASER] = "BEAST_LASER"
____exports.SoundEffect.BEAST_BACKGROUND_DIVE = 699
____exports.SoundEffect[____exports.SoundEffect.BEAST_BACKGROUND_DIVE] = "BEAST_BACKGROUND_DIVE"
____exports.SoundEffect.BEAST_FIRE_RING = 700
____exports.SoundEffect[____exports.SoundEffect.BEAST_FIRE_RING] = "BEAST_FIRE_RING"
____exports.SoundEffect.BEAST_GHOST_DASH = 701
____exports.SoundEffect[____exports.SoundEffect.BEAST_GHOST_DASH] = "BEAST_GHOST_DASH"
____exports.SoundEffect.BEAST_GHOST_RISE = 702
____exports.SoundEffect[____exports.SoundEffect.BEAST_GHOST_RISE] = "BEAST_GHOST_RISE"
____exports.SoundEffect.BEAST_LAVA_BALL_SPLASH = 703
____exports.SoundEffect[____exports.SoundEffect.BEAST_LAVA_BALL_SPLASH] = "BEAST_LAVA_BALL_SPLASH"
____exports.SoundEffect.BEAST_LAVA_RISE = 704
____exports.SoundEffect[____exports.SoundEffect.BEAST_LAVA_RISE] = "BEAST_LAVA_RISE"
____exports.SoundEffect.BEAST_SUCTION_LOOP = 705
____exports.SoundEffect[____exports.SoundEffect.BEAST_SUCTION_LOOP] = "BEAST_SUCTION_LOOP"
____exports.SoundEffect.BEAST_FIRE_BARF = 706
____exports.SoundEffect[____exports.SoundEffect.BEAST_FIRE_BARF] = "BEAST_FIRE_BARF"
____exports.SoundEffect.BEAST_GHOST_ROAR = 707
____exports.SoundEffect[____exports.SoundEffect.BEAST_GHOST_ROAR] = "BEAST_GHOST_ROAR"
____exports.SoundEffect.BEAST_INTRO_SCREAM = 708
____exports.SoundEffect[____exports.SoundEffect.BEAST_INTRO_SCREAM] = "BEAST_INTRO_SCREAM"
____exports.SoundEffect.BEAST_SUCTION_END = 709
____exports.SoundEffect[____exports.SoundEffect.BEAST_SUCTION_END] = "BEAST_SUCTION_END"
____exports.SoundEffect.BEAST_SUCTION_START = 710
____exports.SoundEffect[____exports.SoundEffect.BEAST_SUCTION_START] = "BEAST_SUCTION_START"
____exports.SoundEffect.BEAST_SPIT = 711
____exports.SoundEffect[____exports.SoundEffect.BEAST_SPIT] = "BEAST_SPIT"
____exports.SoundEffect.BEAST_SURFACE_GROWL = 712
____exports.SoundEffect[____exports.SoundEffect.BEAST_SURFACE_GROWL] = "BEAST_SURFACE_GROWL"
____exports.SoundEffect.BEAST_SWITCH_SIDES = 713
____exports.SoundEffect[____exports.SoundEffect.BEAST_SWITCH_SIDES] = "BEAST_SWITCH_SIDES"
____exports.SoundEffect.MOTHER_SHADOW_APPEAR = 714
____exports.SoundEffect[____exports.SoundEffect.MOTHER_SHADOW_APPEAR] = "MOTHER_SHADOW_APPEAR"
____exports.SoundEffect.MOTHER_SHADOW_CHARGE_UP = 715
____exports.SoundEffect[____exports.SoundEffect.MOTHER_SHADOW_CHARGE_UP] = "MOTHER_SHADOW_CHARGE_UP"
____exports.SoundEffect.MOTHER_SHADOW_DASH = 716
____exports.SoundEffect[____exports.SoundEffect.MOTHER_SHADOW_DASH] = "MOTHER_SHADOW_DASH"
____exports.SoundEffect.MOTHER_SHADOW_END = 717
____exports.SoundEffect[____exports.SoundEffect.MOTHER_SHADOW_END] = "MOTHER_SHADOW_END"
____exports.SoundEffect.MOTHER_SHADOW_INTRO = 718
____exports.SoundEffect[____exports.SoundEffect.MOTHER_SHADOW_INTRO] = "MOTHER_SHADOW_INTRO"
____exports.SoundEffect.BUMBINO_DEATH = 719
____exports.SoundEffect[____exports.SoundEffect.BUMBINO_DEATH] = "BUMBINO_DEATH"
____exports.SoundEffect.BUMBINO_DIZZY = 720
____exports.SoundEffect[____exports.SoundEffect.BUMBINO_DIZZY] = "BUMBINO_DIZZY"
____exports.SoundEffect.BUMBINO_HIT_WALL = 721
____exports.SoundEffect[____exports.SoundEffect.BUMBINO_HIT_WALL] = "BUMBINO_HIT_WALL"
____exports.SoundEffect.BUMBINO_MISC = 722
____exports.SoundEffect[____exports.SoundEffect.BUMBINO_MISC] = "BUMBINO_MISC"
____exports.SoundEffect.BUMBINO_PUNCH = 723
____exports.SoundEffect[____exports.SoundEffect.BUMBINO_PUNCH] = "BUMBINO_PUNCH"
____exports.SoundEffect.BUMBINO_RAM = 724
____exports.SoundEffect[____exports.SoundEffect.BUMBINO_RAM] = "BUMBINO_RAM"
____exports.SoundEffect.BUMBINO_SLAM = 725
____exports.SoundEffect[____exports.SoundEffect.BUMBINO_SLAM] = "BUMBINO_SLAM"
____exports.SoundEffect.BUMBINO_SNAP_OUT = 726
____exports.SoundEffect[____exports.SoundEffect.BUMBINO_SNAP_OUT] = "BUMBINO_SNAP_OUT"
____exports.SoundEffect.SIREN_SCREAM = 727
____exports.SoundEffect[____exports.SoundEffect.SIREN_SCREAM] = "SIREN_SCREAM"
____exports.SoundEffect.SIREN_SING = 728
____exports.SoundEffect[____exports.SoundEffect.SIREN_SING] = "SIREN_SING"
____exports.SoundEffect.DEATH_SKULL_SUMMON_LOOP = 729
____exports.SoundEffect[____exports.SoundEffect.DEATH_SKULL_SUMMON_LOOP] = "DEATH_SKULL_SUMMON_LOOP"
____exports.SoundEffect.DEATH_SKULL_SUMMON_END = 730
____exports.SoundEffect[____exports.SoundEffect.DEATH_SKULL_SUMMON_END] = "DEATH_SKULL_SUMMON_END"
____exports.SoundEffect.BEAST_DEATH_2 = 731
____exports.SoundEffect[____exports.SoundEffect.BEAST_DEATH_2] = "BEAST_DEATH_2"
____exports.SoundEffect.BEAST_ANGELIC_BLAST = 732
____exports.SoundEffect[____exports.SoundEffect.BEAST_ANGELIC_BLAST] = "BEAST_ANGELIC_BLAST"
____exports.SoundEffect.ANCIENT_RECALL = 733
____exports.SoundEffect[____exports.SoundEffect.ANCIENT_RECALL] = "ANCIENT_RECALL"
____exports.SoundEffect.ERA_WALK = 734
____exports.SoundEffect[____exports.SoundEffect.ERA_WALK] = "ERA_WALK"
____exports.SoundEffect.HUGE_GROWTH = 735
____exports.SoundEffect[____exports.SoundEffect.HUGE_GROWTH] = "HUGE_GROWTH"
____exports.SoundEffect.RUNE_SHARD = 736
____exports.SoundEffect[____exports.SoundEffect.RUNE_SHARD] = "RUNE_SHARD"
____exports.SoundEffect.SHOT_SPEED_DOWN = 737
____exports.SoundEffect[____exports.SoundEffect.SHOT_SPEED_DOWN] = "SHOT_SPEED_DOWN"
____exports.SoundEffect.SHOT_SPEED_UP = 738
____exports.SoundEffect[____exports.SoundEffect.SHOT_SPEED_UP] = "SHOT_SPEED_UP"
____exports.SoundEffect.EXPERIMENTAL_PILL = 739
____exports.SoundEffect[____exports.SoundEffect.EXPERIMENTAL_PILL] = "EXPERIMENTAL_PILL"
____exports.SoundEffect.CRACKED_KEY = 740
____exports.SoundEffect[____exports.SoundEffect.CRACKED_KEY] = "CRACKED_KEY"
____exports.SoundEffect.QUEEN_OF_HEARTS = 741
____exports.SoundEffect[____exports.SoundEffect.QUEEN_OF_HEARTS] = "QUEEN_OF_HEARTS"
____exports.SoundEffect.WILD_CARD = 742
____exports.SoundEffect[____exports.SoundEffect.WILD_CARD] = "WILD_CARD"
____exports.SoundEffect.SOUL_OF_ISAAC = 743
____exports.SoundEffect[____exports.SoundEffect.SOUL_OF_ISAAC] = "SOUL_OF_ISAAC"
____exports.SoundEffect.SOUL_OF_MAGDALENE = 744
____exports.SoundEffect[____exports.SoundEffect.SOUL_OF_MAGDALENE] = "SOUL_OF_MAGDALENE"
____exports.SoundEffect.SOUL_OF_CAIN = 745
____exports.SoundEffect[____exports.SoundEffect.SOUL_OF_CAIN] = "SOUL_OF_CAIN"
____exports.SoundEffect.SOUL_OF_JUDAS = 746
____exports.SoundEffect[____exports.SoundEffect.SOUL_OF_JUDAS] = "SOUL_OF_JUDAS"
____exports.SoundEffect.SOUL_OF_XXX = 747
____exports.SoundEffect[____exports.SoundEffect.SOUL_OF_XXX] = "SOUL_OF_XXX"
____exports.SoundEffect.SOUL_OF_EVE = 748
____exports.SoundEffect[____exports.SoundEffect.SOUL_OF_EVE] = "SOUL_OF_EVE"
____exports.SoundEffect.SOUL_OF_SAMSON = 749
____exports.SoundEffect[____exports.SoundEffect.SOUL_OF_SAMSON] = "SOUL_OF_SAMSON"
____exports.SoundEffect.SOUL_OF_AZAZEL = 750
____exports.SoundEffect[____exports.SoundEffect.SOUL_OF_AZAZEL] = "SOUL_OF_AZAZEL"
____exports.SoundEffect.SOUL_OF_LAZARUS = 751
____exports.SoundEffect[____exports.SoundEffect.SOUL_OF_LAZARUS] = "SOUL_OF_LAZARUS"
____exports.SoundEffect.SOUL_OF_EDEN = 752
____exports.SoundEffect[____exports.SoundEffect.SOUL_OF_EDEN] = "SOUL_OF_EDEN"
____exports.SoundEffect.SOUL_OF_THE_LOST = 753
____exports.SoundEffect[____exports.SoundEffect.SOUL_OF_THE_LOST] = "SOUL_OF_THE_LOST"
____exports.SoundEffect.SOUL_OF_LILITH = 754
____exports.SoundEffect[____exports.SoundEffect.SOUL_OF_LILITH] = "SOUL_OF_LILITH"
____exports.SoundEffect.SOUL_OF_THE_KEEPER = 755
____exports.SoundEffect[____exports.SoundEffect.SOUL_OF_THE_KEEPER] = "SOUL_OF_THE_KEEPER"
____exports.SoundEffect.SOUL_OF_APOLLYON = 756
____exports.SoundEffect[____exports.SoundEffect.SOUL_OF_APOLLYON] = "SOUL_OF_APOLLYON"
____exports.SoundEffect.SOUL_OF_THE_FORGOTTEN = 757
____exports.SoundEffect[____exports.SoundEffect.SOUL_OF_THE_FORGOTTEN] = "SOUL_OF_THE_FORGOTTEN"
____exports.SoundEffect.SOUL_OF_BETHANY = 758
____exports.SoundEffect[____exports.SoundEffect.SOUL_OF_BETHANY] = "SOUL_OF_BETHANY"
____exports.SoundEffect.SOUL_OF_JACOB_AND_ESAU = 759
____exports.SoundEffect[____exports.SoundEffect.SOUL_OF_JACOB_AND_ESAU] = "SOUL_OF_JACOB_AND_ESAU"
____exports.SoundEffect.MEGA_BAD_GAS = 760
____exports.SoundEffect[____exports.SoundEffect.MEGA_BAD_GAS] = "MEGA_BAD_GAS"
____exports.SoundEffect.MEGA_BAD_TRIP = 761
____exports.SoundEffect[____exports.SoundEffect.MEGA_BAD_TRIP] = "MEGA_BAD_TRIP"
____exports.SoundEffect.MEGA_BALLS_OF_STEEL = 762
____exports.SoundEffect[____exports.SoundEffect.MEGA_BALLS_OF_STEEL] = "MEGA_BALLS_OF_STEEL"
____exports.SoundEffect.MEGA_BOMBS_ARE_KEY = 763
____exports.SoundEffect[____exports.SoundEffect.MEGA_BOMBS_ARE_KEY] = "MEGA_BOMBS_ARE_KEY"
____exports.SoundEffect.MEGA_EXPLOSIVE_DIARRHEA = 764
____exports.SoundEffect[____exports.SoundEffect.MEGA_EXPLOSIVE_DIARRHEA] = "MEGA_EXPLOSIVE_DIARRHEA"
____exports.SoundEffect.MEGA_FULL_HEALTH = 765
____exports.SoundEffect[____exports.SoundEffect.MEGA_FULL_HEALTH] = "MEGA_FULL_HEALTH"
____exports.SoundEffect.MEGA_HEALTH_UP = 766
____exports.SoundEffect[____exports.SoundEffect.MEGA_HEALTH_UP] = "MEGA_HEALTH_UP"
____exports.SoundEffect.MEGA_HEALTH_DOWN = 767
____exports.SoundEffect[____exports.SoundEffect.MEGA_HEALTH_DOWN] = "MEGA_HEALTH_DOWN"
____exports.SoundEffect.MEGA_I_FOUND_PILLS = 768
____exports.SoundEffect[____exports.SoundEffect.MEGA_I_FOUND_PILLS] = "MEGA_I_FOUND_PILLS"
____exports.SoundEffect.MEGA_PUBERTY = 769
____exports.SoundEffect[____exports.SoundEffect.MEGA_PUBERTY] = "MEGA_PUBERTY"
____exports.SoundEffect.MEGA_PRETTY_FLY = 770
____exports.SoundEffect[____exports.SoundEffect.MEGA_PRETTY_FLY] = "MEGA_PRETTY_FLY"
____exports.SoundEffect.MEGA_RANGE_DOWN = 771
____exports.SoundEffect[____exports.SoundEffect.MEGA_RANGE_DOWN] = "MEGA_RANGE_DOWN"
____exports.SoundEffect.MEGA_RANGE_UP = 772
____exports.SoundEffect[____exports.SoundEffect.MEGA_RANGE_UP] = "MEGA_RANGE_UP"
____exports.SoundEffect.MEGA_SPEED_DOWN = 773
____exports.SoundEffect[____exports.SoundEffect.MEGA_SPEED_DOWN] = "MEGA_SPEED_DOWN"
____exports.SoundEffect.MEGA_SPEED_UP = 774
____exports.SoundEffect[____exports.SoundEffect.MEGA_SPEED_UP] = "MEGA_SPEED_UP"
____exports.SoundEffect.MEGA_TEARS_DOWN = 775
____exports.SoundEffect[____exports.SoundEffect.MEGA_TEARS_DOWN] = "MEGA_TEARS_DOWN"
____exports.SoundEffect.MEGA_TEARS_UP = 776
____exports.SoundEffect[____exports.SoundEffect.MEGA_TEARS_UP] = "MEGA_TEARS_UP"
____exports.SoundEffect.MEGA_LUCK_DOWN = 777
____exports.SoundEffect[____exports.SoundEffect.MEGA_LUCK_DOWN] = "MEGA_LUCK_DOWN"
____exports.SoundEffect.MEGA_LUCK_UP = 778
____exports.SoundEffect[____exports.SoundEffect.MEGA_LUCK_UP] = "MEGA_LUCK_UP"
____exports.SoundEffect.MEGA_TELEPILLS = 779
____exports.SoundEffect[____exports.SoundEffect.MEGA_TELEPILLS] = "MEGA_TELEPILLS"
____exports.SoundEffect.MEGA_FORTY_EIGHT_HOUR_ENERGY = 780
____exports.SoundEffect[____exports.SoundEffect.MEGA_FORTY_EIGHT_HOUR_ENERGY] = "MEGA_FORTY_EIGHT_HOUR_ENERGY"
____exports.SoundEffect.MEGA_HEMATEMESIS = 781
____exports.SoundEffect[____exports.SoundEffect.MEGA_HEMATEMESIS] = "MEGA_HEMATEMESIS"
____exports.SoundEffect.MEGA_PARALYSIS = 782
____exports.SoundEffect[____exports.SoundEffect.MEGA_PARALYSIS] = "MEGA_PARALYSIS"
____exports.SoundEffect.MEGA_I_CAN_SEE_FOREVER = 783
____exports.SoundEffect[____exports.SoundEffect.MEGA_I_CAN_SEE_FOREVER] = "MEGA_I_CAN_SEE_FOREVER"
____exports.SoundEffect.MEGA_PHEROMONES = 784
____exports.SoundEffect[____exports.SoundEffect.MEGA_PHEROMONES] = "MEGA_PHEROMONES"
____exports.SoundEffect.MEGA_AMNESIA = 785
____exports.SoundEffect[____exports.SoundEffect.MEGA_AMNESIA] = "MEGA_AMNESIA"
____exports.SoundEffect.MEGA_LEMON_PARTY = 786
____exports.SoundEffect[____exports.SoundEffect.MEGA_LEMON_PARTY] = "MEGA_LEMON_PARTY"
____exports.SoundEffect.MEGA_R_U_A_WIZARD = 787
____exports.SoundEffect[____exports.SoundEffect.MEGA_R_U_A_WIZARD] = "MEGA_R_U_A_WIZARD"
____exports.SoundEffect.MEGA_PERCS = 788
____exports.SoundEffect[____exports.SoundEffect.MEGA_PERCS] = "MEGA_PERCS"
____exports.SoundEffect.MEGA_ADDICTED = 789
____exports.SoundEffect[____exports.SoundEffect.MEGA_ADDICTED] = "MEGA_ADDICTED"
____exports.SoundEffect.MEGA_RELAX = 790
____exports.SoundEffect[____exports.SoundEffect.MEGA_RELAX] = "MEGA_RELAX"
____exports.SoundEffect.MEGA_QUESTION_MARKS = 791
____exports.SoundEffect[____exports.SoundEffect.MEGA_QUESTION_MARKS] = "MEGA_QUESTION_MARKS"
____exports.SoundEffect.MEGA_ONE_MAKES_YOU_LARGER = 792
____exports.SoundEffect[____exports.SoundEffect.MEGA_ONE_MAKES_YOU_LARGER] = "MEGA_ONE_MAKES_YOU_LARGER"
____exports.SoundEffect.MEGA_ONE_MAKES_YOU_SMALL = 793
____exports.SoundEffect[____exports.SoundEffect.MEGA_ONE_MAKES_YOU_SMALL] = "MEGA_ONE_MAKES_YOU_SMALL"
____exports.SoundEffect.MEGA_INFESTED = 794
____exports.SoundEffect[____exports.SoundEffect.MEGA_INFESTED] = "MEGA_INFESTED"
____exports.SoundEffect.MEGA_INFESTED_1 = 795
____exports.SoundEffect[____exports.SoundEffect.MEGA_INFESTED_1] = "MEGA_INFESTED_1"
____exports.SoundEffect.MEGA_POWER_PILL = 796
____exports.SoundEffect[____exports.SoundEffect.MEGA_POWER_PILL] = "MEGA_POWER_PILL"
____exports.SoundEffect.MEGA_RETRO_VISION = 797
____exports.SoundEffect[____exports.SoundEffect.MEGA_RETRO_VISION] = "MEGA_RETRO_VISION"
____exports.SoundEffect.MEGA_FRIENDS_TIL_THE_END = 798
____exports.SoundEffect[____exports.SoundEffect.MEGA_FRIENDS_TIL_THE_END] = "MEGA_FRIENDS_TIL_THE_END"
____exports.SoundEffect.MEGA_X_LAX = 799
____exports.SoundEffect[____exports.SoundEffect.MEGA_X_LAX] = "MEGA_X_LAX"
____exports.SoundEffect.MEGA_SOMETHINGS_WRONG = 800
____exports.SoundEffect[____exports.SoundEffect.MEGA_SOMETHINGS_WRONG] = "MEGA_SOMETHINGS_WRONG"
____exports.SoundEffect.MEGA_IM_DROWSY = 801
____exports.SoundEffect[____exports.SoundEffect.MEGA_IM_DROWSY] = "MEGA_IM_DROWSY"
____exports.SoundEffect.MEGA_IM_EXCITED = 802
____exports.SoundEffect[____exports.SoundEffect.MEGA_IM_EXCITED] = "MEGA_IM_EXCITED"
____exports.SoundEffect.MEGA_GULP = 803
____exports.SoundEffect[____exports.SoundEffect.MEGA_GULP] = "MEGA_GULP"
____exports.SoundEffect.MEGA_HORF = 804
____exports.SoundEffect[____exports.SoundEffect.MEGA_HORF] = "MEGA_HORF"
____exports.SoundEffect.MEGA_SUNSHINE = 805
____exports.SoundEffect[____exports.SoundEffect.MEGA_SUNSHINE] = "MEGA_SUNSHINE"
____exports.SoundEffect.MEGA_VURP = 806
____exports.SoundEffect[____exports.SoundEffect.MEGA_VURP] = "MEGA_VURP"
____exports.SoundEffect.MEGA_SHOT_SPEED_DOWN = 807
____exports.SoundEffect[____exports.SoundEffect.MEGA_SHOT_SPEED_DOWN] = "MEGA_SHOT_SPEED_DOWN"
____exports.SoundEffect.MEGA_SHOT_SPEED_UP = 808
____exports.SoundEffect[____exports.SoundEffect.MEGA_SHOT_SPEED_UP] = "MEGA_SHOT_SPEED_UP"
____exports.SoundEffect.MEGA_EXPERIMENTAL_PILL = 809
____exports.SoundEffect[____exports.SoundEffect.MEGA_EXPERIMENTAL_PILL] = "MEGA_EXPERIMENTAL_PILL"
____exports.SoundEffect.SIREN_LUNGE = 810
____exports.SoundEffect[____exports.SoundEffect.SIREN_LUNGE] = "SIREN_LUNGE"
____exports.SoundEffect.SIREN_MINION_SMOKE = 811
____exports.SoundEffect[____exports.SoundEffect.SIREN_MINION_SMOKE] = "SIREN_MINION_SMOKE"
____exports.SoundEffect.SIREN_SCREAM_ATTACK = 812
____exports.SoundEffect[____exports.SoundEffect.SIREN_SCREAM_ATTACK] = "SIREN_SCREAM_ATTACK"
____exports.SoundEffect.SIREN_SING_STAB = 813
____exports.SoundEffect[____exports.SoundEffect.SIREN_SING_STAB] = "SIREN_SING_STAB"
____exports.SoundEffect.BEAST_LAVA_BALL_RISE = 814
____exports.SoundEffect[____exports.SoundEffect.BEAST_LAVA_BALL_RISE] = "BEAST_LAVA_BALL_RISE"
____exports.SoundEffect.BEAST_GROWL = 815
____exports.SoundEffect[____exports.SoundEffect.BEAST_GROWL] = "BEAST_GROWL"
____exports.SoundEffect.BEAST_GRUMBLE = 816
____exports.SoundEffect[____exports.SoundEffect.BEAST_GRUMBLE] = "BEAST_GRUMBLE"
____exports.SoundEffect.FAMINE_GRUNT = 817
____exports.SoundEffect[____exports.SoundEffect.FAMINE_GRUNT] = "FAMINE_GRUNT"
____exports.SoundEffect.G_FUEL_1 = 818
____exports.SoundEffect[____exports.SoundEffect.G_FUEL_1] = "G_FUEL_1"
____exports.SoundEffect.G_FUEL_2 = 819
____exports.SoundEffect[____exports.SoundEffect.G_FUEL_2] = "G_FUEL_2"
____exports.SoundEffect.G_FUEL_3 = 820
____exports.SoundEffect[____exports.SoundEffect.G_FUEL_3] = "G_FUEL_3"
____exports.SoundEffect.G_FUEL_4 = 821
____exports.SoundEffect[____exports.SoundEffect.G_FUEL_4] = "G_FUEL_4"
____exports.SoundEffect.G_FUEL_EXPLOSION_SMALL = 822
____exports.SoundEffect[____exports.SoundEffect.G_FUEL_EXPLOSION_SMALL] = "G_FUEL_EXPLOSION_SMALL"
____exports.SoundEffect.G_FUEL_EXPLOSION_BIG = 823
____exports.SoundEffect[____exports.SoundEffect.G_FUEL_EXPLOSION_BIG] = "G_FUEL_EXPLOSION_BIG"
____exports.SoundEffect.G_FUEL_GUNSHOT_MEDIUM = 824
____exports.SoundEffect[____exports.SoundEffect.G_FUEL_GUNSHOT_MEDIUM] = "G_FUEL_GUNSHOT_MEDIUM"
____exports.SoundEffect.G_FUEL_GUNSHOT_SMALL = 825
____exports.SoundEffect[____exports.SoundEffect.G_FUEL_GUNSHOT_SMALL] = "G_FUEL_GUNSHOT_SMALL"
____exports.SoundEffect.G_FUEL_GUNSHOT_LARGE = 826
____exports.SoundEffect[____exports.SoundEffect.G_FUEL_GUNSHOT_LARGE] = "G_FUEL_GUNSHOT_LARGE"
____exports.SoundEffect.G_FUEL_GUNSHOT_SPREAD = 827
____exports.SoundEffect[____exports.SoundEffect.G_FUEL_GUNSHOT_SPREAD] = "G_FUEL_GUNSHOT_SPREAD"
____exports.SoundEffect.G_FUEL_AIR_HORN = 828
____exports.SoundEffect[____exports.SoundEffect.G_FUEL_AIR_HORN] = "G_FUEL_AIR_HORN"
____exports.SoundEffect.G_FUEL_ITEM_APPEAR = 829
____exports.SoundEffect[____exports.SoundEffect.G_FUEL_ITEM_APPEAR] = "G_FUEL_ITEM_APPEAR"
____exports.SoundEffect.G_FUEL_GUNSHOT_MINI = 830
____exports.SoundEffect[____exports.SoundEffect.G_FUEL_GUNSHOT_MINI] = "G_FUEL_GUNSHOT_MINI"
____exports.SoundEffect.G_FUEL_BULLET_RICOCHET = 831
____exports.SoundEffect[____exports.SoundEffect.G_FUEL_BULLET_RICOCHET] = "G_FUEL_BULLET_RICOCHET"
____exports.SoundEffect.G_FUEL_ROCKET_LAUNCHER = 832
____exports.SoundEffect[____exports.SoundEffect.G_FUEL_ROCKET_LAUNCHER] = "G_FUEL_ROCKET_LAUNCHER"
return ____exports
 end,
["lua_modules.isaac-typescript-definitions.dist.src.enums.StageID"] = function(...) 
local ____exports = {}
--- This matches the filename used in the XML/STB file for the room.
____exports.StageID = {}
____exports.StageID.SPECIAL_ROOMS = 0
____exports.StageID[____exports.StageID.SPECIAL_ROOMS] = "SPECIAL_ROOMS"
____exports.StageID.BASEMENT = 1
____exports.StageID[____exports.StageID.BASEMENT] = "BASEMENT"
____exports.StageID.CELLAR = 2
____exports.StageID[____exports.StageID.CELLAR] = "CELLAR"
____exports.StageID.BURNING_BASEMENT = 3
____exports.StageID[____exports.StageID.BURNING_BASEMENT] = "BURNING_BASEMENT"
____exports.StageID.CAVES = 4
____exports.StageID[____exports.StageID.CAVES] = "CAVES"
____exports.StageID.CATACOMBS = 5
____exports.StageID[____exports.StageID.CATACOMBS] = "CATACOMBS"
____exports.StageID.FLOODED_CAVES = 6
____exports.StageID[____exports.StageID.FLOODED_CAVES] = "FLOODED_CAVES"
____exports.StageID.DEPTHS = 7
____exports.StageID[____exports.StageID.DEPTHS] = "DEPTHS"
____exports.StageID.NECROPOLIS = 8
____exports.StageID[____exports.StageID.NECROPOLIS] = "NECROPOLIS"
____exports.StageID.DANK_DEPTHS = 9
____exports.StageID[____exports.StageID.DANK_DEPTHS] = "DANK_DEPTHS"
____exports.StageID.WOMB = 10
____exports.StageID[____exports.StageID.WOMB] = "WOMB"
____exports.StageID.UTERO = 11
____exports.StageID[____exports.StageID.UTERO] = "UTERO"
____exports.StageID.SCARRED_WOMB = 12
____exports.StageID[____exports.StageID.SCARRED_WOMB] = "SCARRED_WOMB"
____exports.StageID.BLUE_WOMB = 13
____exports.StageID[____exports.StageID.BLUE_WOMB] = "BLUE_WOMB"
____exports.StageID.SHEOL = 14
____exports.StageID[____exports.StageID.SHEOL] = "SHEOL"
____exports.StageID.CATHEDRAL = 15
____exports.StageID[____exports.StageID.CATHEDRAL] = "CATHEDRAL"
____exports.StageID.DARK_ROOM = 16
____exports.StageID[____exports.StageID.DARK_ROOM] = "DARK_ROOM"
____exports.StageID.CHEST = 17
____exports.StageID[____exports.StageID.CHEST] = "CHEST"
____exports.StageID.VOID = 26
____exports.StageID[____exports.StageID.VOID] = "VOID"
____exports.StageID.DOWNPOUR = 27
____exports.StageID[____exports.StageID.DOWNPOUR] = "DOWNPOUR"
____exports.StageID.DROSS = 28
____exports.StageID[____exports.StageID.DROSS] = "DROSS"
____exports.StageID.MINES = 29
____exports.StageID[____exports.StageID.MINES] = "MINES"
____exports.StageID.ASHPIT = 30
____exports.StageID[____exports.StageID.ASHPIT] = "ASHPIT"
____exports.StageID.MAUSOLEUM = 31
____exports.StageID[____exports.StageID.MAUSOLEUM] = "MAUSOLEUM"
____exports.StageID.GEHENNA = 32
____exports.StageID[____exports.StageID.GEHENNA] = "GEHENNA"
____exports.StageID.CORPSE = 33
____exports.StageID[____exports.StageID.CORPSE] = "CORPSE"
____exports.StageID.MORTIS = 34
____exports.StageID[____exports.StageID.MORTIS] = "MORTIS"
____exports.StageID.HOME = 35
____exports.StageID[____exports.StageID.HOME] = "HOME"
____exports.StageID.BACKWARDS = 36
____exports.StageID[____exports.StageID.BACKWARDS] = "BACKWARDS"
return ____exports
 end,
["lua_modules.isaac-typescript-definitions.dist.src.enums.StageTransition"] = function(...) 
local ____exports = {}
____exports.StageTransition = {}
____exports.StageTransition.DISAPPEAR = 0
____exports.StageTransition[____exports.StageTransition.DISAPPEAR] = "DISAPPEAR"
____exports.StageTransition.NONE = 1
____exports.StageTransition[____exports.StageTransition.NONE] = "NONE"
return ____exports
 end,
["lua_modules.isaac-typescript-definitions.dist.src.enums.StageType"] = function(...) 
local ____exports = {}
____exports.StageType = {}
____exports.StageType.ORIGINAL = 0
____exports.StageType[____exports.StageType.ORIGINAL] = "ORIGINAL"
____exports.StageType.WRATH_OF_THE_LAMB = 1
____exports.StageType[____exports.StageType.WRATH_OF_THE_LAMB] = "WRATH_OF_THE_LAMB"
____exports.StageType.AFTERBIRTH = 2
____exports.StageType[____exports.StageType.AFTERBIRTH] = "AFTERBIRTH"
____exports.StageType.GREED_MODE = 3
____exports.StageType[____exports.StageType.GREED_MODE] = "GREED_MODE"
____exports.StageType.REPENTANCE = 4
____exports.StageType[____exports.StageType.REPENTANCE] = "REPENTANCE"
____exports.StageType.REPENTANCE_B = 5
____exports.StageType[____exports.StageType.REPENTANCE_B] = "REPENTANCE_B"
return ____exports
 end,
["lua_modules.isaac-typescript-definitions.dist.src.enums.TrinketSlot"] = function(...) 
local ____exports = {}
____exports.TrinketSlot = {}
____exports.TrinketSlot.SLOT_1 = 0
____exports.TrinketSlot[____exports.TrinketSlot.SLOT_1] = "SLOT_1"
____exports.TrinketSlot.SLOT_2 = 1
____exports.TrinketSlot[____exports.TrinketSlot.SLOT_2] = "SLOT_2"
return ____exports
 end,
["lua_modules.isaac-typescript-definitions.dist.src.enums.WeaponType"] = function(...) 
local ____exports = {}
____exports.WeaponType = {}
____exports.WeaponType.TEARS = 1
____exports.WeaponType[____exports.WeaponType.TEARS] = "TEARS"
____exports.WeaponType.BRIMSTONE = 2
____exports.WeaponType[____exports.WeaponType.BRIMSTONE] = "BRIMSTONE"
____exports.WeaponType.LASER = 3
____exports.WeaponType[____exports.WeaponType.LASER] = "LASER"
____exports.WeaponType.KNIFE = 4
____exports.WeaponType[____exports.WeaponType.KNIFE] = "KNIFE"
____exports.WeaponType.BOMBS = 5
____exports.WeaponType[____exports.WeaponType.BOMBS] = "BOMBS"
____exports.WeaponType.ROCKETS = 6
____exports.WeaponType[____exports.WeaponType.ROCKETS] = "ROCKETS"
____exports.WeaponType.MONSTROS_LUNG = 7
____exports.WeaponType[____exports.WeaponType.MONSTROS_LUNG] = "MONSTROS_LUNG"
____exports.WeaponType.LUDOVICO_TECHNIQUE = 8
____exports.WeaponType[____exports.WeaponType.LUDOVICO_TECHNIQUE] = "LUDOVICO_TECHNIQUE"
____exports.WeaponType.TECH_X = 9
____exports.WeaponType[____exports.WeaponType.TECH_X] = "TECH_X"
____exports.WeaponType.BONE = 10
____exports.WeaponType[____exports.WeaponType.BONE] = "BONE"
____exports.WeaponType.NOTCHED_AXE = 11
____exports.WeaponType[____exports.WeaponType.NOTCHED_AXE] = "NOTCHED_AXE"
____exports.WeaponType.URN_OF_SOULS = 12
____exports.WeaponType[____exports.WeaponType.URN_OF_SOULS] = "URN_OF_SOULS"
____exports.WeaponType.SPIRIT_SWORD = 13
____exports.WeaponType[____exports.WeaponType.SPIRIT_SWORD] = "SPIRIT_SWORD"
____exports.WeaponType.FETUS = 14
____exports.WeaponType[____exports.WeaponType.FETUS] = "FETUS"
____exports.WeaponType.UMBILICAL_WHIP = 15
____exports.WeaponType[____exports.WeaponType.UMBILICAL_WHIP] = "UMBILICAL_WHIP"
return ____exports
 end,
}
return require("main", ...)
