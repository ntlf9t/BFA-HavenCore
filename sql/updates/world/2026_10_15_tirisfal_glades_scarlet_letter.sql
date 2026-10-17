-- https://github.com/HavenWoW/BFA-HavenCore/issues/653

-- Remove quest giver hack
DELETE FROM creature_queststarter WHERE id=38999 AND quest=24979;

-- Change objective from gameobject to item
DELETE FROM quest_objectives WHERE ID=258622 AND QuestID=24979;
INSERT INTO quest_objectives (ID, QuestID, `Type`, `Order`, StorageIndex, ObjectID, Amount, Flags, Flags2, ProgressBarWeight, Description, VerifiedBuild) VALUES
(258622, 24979, 1, 1, 1, 52079, 1, 0, 0, 0.0, 'A Scarlet Letter (Provided)', 35662);

-- Set banner flag for questlog.
UPDATE quest_template SET QuestType=2, Flags=655360 WHERE ID=24979;

-- Scarlet Lieutenant Gebler - fix smart script for proper behavior
DELETE FROM smart_scripts WHERE entryorguid IN(39002,3900200);
INSERT INTO smart_scripts (entryorguid, source_type, id, link, event_type, event_phase_mask, event_chance, event_flags, event_param1, event_param2, event_param3, event_param4, event_param5, event_param_string, action_type, action_param1, action_param2, action_param3, action_param4, action_param5, action_param6, target_type, target_param1, target_param2, target_param3, target_x, target_y, target_z, target_o, comment) VALUES
(39002, 0, 0, 0, 54, 0, 100, 0, 0, 0, 0, 0, 0, '', 80, 3900200, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0.0, 0.0, 0.0, 0.0, 'Scarlet Lieutenant Gebler - On spawn - Action list'),
(3900200, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, '', 8, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0.0, 0.0, 0.0, 0.0, 'Scarlet Lieutenant Gebler - On Script - Set React Passive'),
(3900200, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, '', 18, 256, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0.0, 0.0, 0.0, 0.0, 'Scarlet Lieutenant Gebler - On Script - Set Immune To PC'),
(3900200, 9, 2, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, '', 53, 0, 39002, 0, 0, 0, 0, 1, 0, 0, 0, 0.0, 0.0, 0.0, 0.0, 'Scarlet Lieutenant Gebler - Action list - waypoint');
