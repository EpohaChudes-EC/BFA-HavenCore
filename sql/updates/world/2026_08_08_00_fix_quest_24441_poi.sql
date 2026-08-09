-- =========================================================================
-- БЭКПОРТ / ИСПРАВЛЕНИЕ POI ЗОН ДЛЯ КВЕСТА 24441 (Тотем Громового Рога)
-- =========================================================================

-- 1. Очистка старых экспериментальных или поврежденных данных POI
DELETE FROM `quest_poi` WHERE `QuestID` = 24441;
DELETE FROM `quest_poi_points` WHERE `QuestID` = 24441;

-- 2. Привязка POI к первой цели задания (ID 255536 - Когти охотника прерий)
-- Задаем внутренний UiMapID Мулгора = 7, уникальный индекс Idx1 = 1 и флаг слияния Flags = 1
INSERT INTO `quest_poi` 
(`QuestID`, `BlobIndex`, `Idx1`, `ObjectiveIndex`, `QuestObjectiveID`, `QuestObjectID`, `MapID`, `UiMapID`, `Priority`, `Flags`, `WorldEffectID`, `PlayerConditionID`, `SpawnTrackingID`, `AlwaysAllowMergingBlobs`, `VerifiedBuild`) 
VALUES 
(24441, 0, 1, 0, 255536, 0, 1, 7, 0, 1, 0, 0, 0, 0, 35662);

-- 3. Привязка POI ко второй цели задания (ID 255537 - Когти пумы плоскогорья)
-- Задаем внутренний UiMapID Мулгора = 7, уникальный индекс Idx1 = 2 и флаг слияния Flags = 1
INSERT INTO `quest_poi` 
(`QuestID`, `BlobIndex`, `Idx1`, `ObjectiveIndex`, `QuestObjectiveID`, `QuestObjectID`, `MapID`, `UiMapID`, `Priority`, `Flags`, `WorldEffectID`, `PlayerConditionID`, `SpawnTrackingID`, `AlwaysAllowMergingBlobs`, `VerifiedBuild`) 
VALUES 
(24441, 1, 2, 1, 255537, 0, 1, 7, 0, 1, 0, 0, 0, 0, 35662);

-- 4. Отрисовка вершин полигонов в реальных мировых координатах спавна существ
INSERT INTO `quest_poi_points` (`QuestID`, `Idx1`, `Idx2`, `X`, `Y`, `VerifiedBuild`) VALUES
-- ПОЛИГОН 1: Охотники прерий (Зона на севере локации, привязка к Idx1 = 1)
(24441, 1, 0, -1800, -100, 35662),
(24441, 1, 1, -1500, -100, 35662),
(24441, 1, 2, -1450, 150, 35662),
(24441, 1, 3, -1750, 150, 35662),

-- ПОЛИГОН 2: Пумы плоскогорья (Зона на юго-востоке локации, привязка к Idx1 = 2)
(24441, 2, 0, -2200, -850, 35662),
(24441, 2, 1, -1800, -800, 35662),
(24441, 2, 2, -1400, -300, 35662),
(24441, 2, 3, -1900, -200, 35662);
