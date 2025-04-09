local config = require("config")
local math = require("math")

local logic = {}

-- Генерирует результат на основе ставки
function logic.calculatePayout(betAmount)
    local rand = math.random()
    
    -- Джекпот
    if rand < config.jackpotChance then
        return betAmount * 10, "ДЖЕКПОТ! 💰 Поздравляем!"
    end

    -- Прочие вероятности
    -- Составим массив возможных выигрышей с вероятностями
    local possibleWins = {
        {mult = 0,    weight = 40},  -- 40% проигрыш
        {mult = 1,    weight = 20},  -- 20%
        {mult = 1.5,  weight = 15},  -- 15%
        {mult = 2,    weight = 10},  -- 10%
        {mult = 3,    weight = 8},   -- 8%
        {mult = 5,    weight = 5},   -- 5%
        {mult = 7,    weight = 1.5}, -- 1.5%
        {mult = 9,    weight = 0.5}, -- 0.5%
    }

    -- Нормализуем веса
    local totalWeight = 0
    for _, w in ipairs(possibleWins) do
        totalWeight = totalWeight + w.weight
    end

    -- Выбор по весу
    local pick = math.random() * totalWeight
    local cumulative = 0
    for _, w in ipairs(possibleWins) do
        cumulative = cumulative + w.weight
        if pick <= cumulative then
            local payout = math.floor(betAmount * w.mult)
            return payout, (payout > 0 and "Вы выиграли " .. payout .. " эмов!" or "Не повезло в этот раз! Испытай свою удачу в следующем раунде!")
        end
    end

    return 0, "Не повезло в этот раз! Испытай свою удачу в следующем раунде!"
end

return logic
