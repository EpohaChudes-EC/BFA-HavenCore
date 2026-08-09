-- =========================================================================
-- ИСПРАВЛЕНИЕ ДРОПА КВЕСТОВОГО ПРЕДМЕТА ДЛЯ КВЕСТА 11129 (Пропал Кайл!)
-- =========================================================================

-- 1. Очищаем неработающие и ошибочные привязки лута для мяса (ID 33009)
DELETE FROM `item_loot_template` WHERE `Entry` = 33009;
DELETE FROM `creature_loot_template` WHERE `Item` = 33009;
DELETE FROM `creature_questitem` WHERE `ItemId` = 33009;

-- 2. Открываем официальное разрешение на квестовый лут для реальных птиц Мулгора
-- Используем конструкцию обновления, чтобы избежать конфликтов PRIMARY KEY (Duplicate entry)
INSERT INTO `creature_questitem` (`CreatureEntry`, `Idx`, `ItemId`, `VerifiedBuild`) VALUES
(2955, 0, 33009, 35662), -- Plainstrider (Молодец-долгоног)
(2956, 0, 33009, 35662), -- Adult Plainstrider (Взрослый равнинный долгоног)
(2957, 0, 33009, 35662)  -- Elder Plainstrider (Матерый долгоног)
ON DUPLICATE KEY UPDATE `ItemId` = 33009;

-- 3. Прописываем гарантированный дроп мяса напрямую в таблицы добычи существ
-- Поле QuestRequired = 1 скрывает предмет от игроков без квеста
INSERT INTO `creature_loot_template` 
(`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) 
VALUES 
(2955, 33009, 0, 100, 1, 1, 0, 1, 1, 'Plainstrider - Tender Strider Meat (Quest 11129)'),
(2956, 33009, 0, 100, 1, 1, 0, 1, 1, 'Adult Plainstrider - Tender Strider Meat (Quest 11129)'),
(2957, 33009, 0, 100, 1, 1, 0, 1, 1, 'Elder Plainstrider - Tender Strider Meat (Quest 11129)');
