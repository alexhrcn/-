local component = require("component")
local sides = require("sides")
local config = require("config")

local inventory = {}

local transposerInput = component.proxy(config.transposerInput)
local transposerOutput = component.proxy(config.transposerOutput)

-- Получить количество денег в сундуке для ввода
function inventory.getInsertedBet()
    local total = 0
    local stackList = transposerInput.getAllStacks(sides[config.inputSide])
    
    for i = 1, #stackList do
        local stack = stackList[i]
        if stack and stack.name == config.currencyName then
            total = total + stack.size
        end
    end

    return total
end

-- Проверить, корректная ли ставка
function inventory.isValidBet(amount)
    return config.bets[amount] ~= nil
end

-- Переместить ставку в хранилище
function inventory.acceptBet(amount)
    local remaining = amount
    local sideFrom = sides[config.inputSide]
    local sideTo = sides[config.inputStorage]

    for slot = 1, transposerInput.getInventorySize(sideFrom) do
        local stack = transposerInput.getStackInSlot(sideFrom, slot)
        if stack and stack.name == config.currencyName then
            local moveAmount = math.min(remaining, stack.size)
            transposerInput.transferItem(sideFrom, sideTo, moveAmount, slot)
            remaining = remaining - moveAmount
            if remaining <= 0 then break end
        end
    end

    return remaining == 0
end

-- Выдать выигрыш
function inventory.payout(amount)
    local sideFrom = sides[config.outputStorage]
    local sideTo = sides[config.outputSide]

    local remaining = amount

    for slot = 1, transposerOutput.getInventorySize(sideFrom) do
        local stack = transposerOutput.getStackInSlot(sideFrom, slot)
        if stack and stack.name == config.currencyName then
            local moveAmount = math.min(remaining, stack.size)
            transposerOutput.transferItem(sideFrom, sideTo, moveAmount, slot)
            remaining = remaining - moveAmount
            if remaining <= 0 then break end
        end
    end

    return remaining == 0
end

return inventory
