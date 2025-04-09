local config = {}

-- Адреса транспозеров
config.transposerInput = "a5f5eb4a-267f-4212-89ff-21dfbb365722"
config.transposerOutput = "e733dcde-2dfe-4dbc-8cb1-1e6b1140ae79"

-- Стороны подключения
config.inputSide = "top"     -- Ввод денег
config.inputStorage = "south" -- Хранилище для ставок

config.outputSide = "top"     -- Выдача выигрыша
config.outputStorage = "north" -- Хранилище для выигрыша

-- Идентификатор валюты
config.currencyName = "contenttweaker:money"

-- Поддерживаемые ставки
config.bets = {
    [10] = true,
    [25] = true,
    [50] = true
}

-- Шанс джекпота
config.jackpotChance = 0.005  -- 0.5%

-- Возврат игроку (RTP)
config.rtp = 0.80             -- 80% RTP (20% профит для владельца)

-- Цвета
config.colors = {
    background = 0x000000,
    border = 0xAAAAAA,
    title = 0x00FFCC,
    text = 0xFFFFFF,
    info = 0x9999FF,
    win = 0x00FF00,
    lose = 0xFF4444,
    highlight = 0xFFD700
}

-- Экран
config.screen = {
    width = 60,
    height = 20
}

return config
