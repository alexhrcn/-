local component = require("component")
local term = require("term")
local gpu = component.gpu
local config = require("config")

local ui = {}

-- Центрирование текста
function ui.centerText(y, text, color)
    local w = config.screen.width
    local x = math.floor((w - #text) / 2) + 1
    gpu.setForeground(color or config.colors.text)
    gpu.set(x, y, text)
end

-- Очистить экран
function ui.clear()
    gpu.setBackground(config.colors.background)
    gpu.fill(1, 1, config.screen.width, config.screen.height, " ")
end

-- Нарисовать рамку
function ui.drawBorder()
    local w, h = config.screen.width, config.screen.height
    gpu.setForeground(config.colors.border)
    for x = 1, w do
        gpu.set(x, 1, "-")
        gpu.set(x, h, "-")
    end
    for y = 2, h - 1 do
        gpu.set(1, y, "|")
        gpu.set(w, y, "|")
    end
    gpu.set(1, 1, "+")
    gpu.set(w, 1, "+")
    gpu.set(1, h, "+")
    gpu.set(w, h, "+")
end

-- Заголовок
function ui.drawTitle()
    ui.centerText(2, "🎰 КАЗИНО ЛАКИ БЛОК 🎰", config.colors.title)
end

-- Инструкция
function ui.drawInstruction()
    ui.centerText(5, "Для начала игры сделайте ставку в", config.colors.info)
    ui.centerText(6, "10, 25 или 50 эмов", config.colors.highlight)
end

-- Таблица выигрышей сбоку
function ui.drawPayoutTable()
    local x = config.screen.width - 18
    local y = 3
    gpu.setForeground(config.colors.info)
    gpu.set(x, y, "Возможные выигрыши:")
    for _, bet in ipairs({10, 25, 50}) do
        y = y + 2
        gpu.setForeground(config.colors.text)
        gpu.set(x, y, string.format("%2d эмов:", bet))
        gpu.setForeground(config.colors.win)
        gpu.set(x, y + 1, string.format("до %d эмов!", bet * 10))
        y = y + 1
    end
end

-- Главный экран
function ui.showWelcome()
    ui.clear()
    ui.drawBorder()
    ui.drawTitle()
    ui.drawInstruction()
    ui.drawPayoutTable()
end

return ui
