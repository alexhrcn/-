-- config.lua

local config = {
  -- Адреса транспозеров
  inputTransposer = "a5f5eb4a-267f-4212-89ff-21dfbb365722",
  outputTransposer = "e733dcde-2dfe-4dbc-8cb1-1e6b1140ae79",

  -- Конфигурация сторон
  inputSlotSide = 0,   -- верх
  inputStorageSide = 3, -- юг
  outputSlotSide = 0,  -- верх
  outputStorageSide = 2, -- север

  -- ID валюты
  currencyId = "contenttweaker:money",

  -- Поддерживаемые ставки и максимальные множители
  bets = {
    [10] = {maxWin = 100},
    [25] = {maxWin = 250},
    [50] = {maxWin = 500},
  },

  -- Шанс джекпота
  jackpotChance = 0.005,  -- 0.5%

  -- Процент возврата RTP (игроку)
  rtp = 0.8, -- 80% возвращается игроку в среднем (то есть 20% профит)

  -- Интерфейс
  title = "§eКазино ЭмФортуна§f",

  colors = {
    background = 0x000000,
    text = 0xFFFFFF,
    highlight = 0xFFFF00,
    error = 0xFF0000,
    success = 0x00FF00,
    faded = 0xAAAAAA,
  },

  screen = {
    width = 50,
    height = 20
  }
}

return config
