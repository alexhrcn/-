local term = require("term")
local event = require("event")
local math = require("math")
local os = require("os")

local ui = require("ui")
local config = require("config")
local inventory = require("inventory")
local logic = require("logic")

math.randomseed(os.time())

-- Показываем приветственный экран
ui.showWelcome()

-- Основной игровой цикл
while true do
    local betAmount = inventory.getInsertedBet()

    if betAmount > 0 then
        term.clear()
        ui.showWelcome()
        ui.centerText(9, "Обнаружена ставка: " .. betAmount .. " эмов", config.colors.highlight)

        if inventory.isValidBet(betAmount) then
            os.sleep(0.5)
            ui.centerText(11, "Ставка принимается...", config.colors.info)
            local success = inventory.acceptBet(betAmount)

            if success then
                -- Анимация загрузки
                for i = 1, 3 do
                    ui.centerText(13, "Определяем результат" .. string.rep(".", i), config.colors.faded)
                    os.sleep(0.4)
                end

                -- Вычисляем выигрыш
                local payout, message = logic.calculatePayout(betAmount)

                if payout > 0 then
                    ui.centerText(15, message, config.colors.win)
                    inventory.payout(payout)
                else
                    ui.centerText(15, message, config.colors.lose)
                end
            else
                ui.centerText(13, "Ошибка: не удалось принять ставку", config.colors.error)
            end
        else
            ui.centerText(11, "Недопустимая ставка. Используй 10, 25 или 50 эмов", config.colors.error)
        end

        os.sleep(4)
        ui.showWelcome()
    else
        os.sleep(1)
    end
end
