-- https://github.com/HavenWoW/BFA-HavenCore/issues/352
DELETE FROM creature WHERE guid=308273 and id=3843;

-- https://github.com/HavenWoW/BFA-HavenCore/issues/353
-- https://github.com/HavenWoW/BFA-HavenCore/issues/363

SET @OLD_PHASE := 2000;
SET @NEW_PHASE := 2001;

DELETE FROM phase_area WHERE PhaseId IN(@OLD_PHASE,@NEW_PHASE);
INSERT INTO phase_area (AreaId, PhaseId, Comment) VALUES
(4659, @OLD_PHASE, 'Darkshore - before quest 13520 is completed'),
(4659, @NEW_PHASE, 'Darkshore - quest 13520 completed or rewarded'),
(452, @OLD_PHASE, 'Darkshore - before quest 13520 is completed'),
(452, @NEW_PHASE, 'Darkshore - quest 13520 completed or rewarded');

DELETE FROM conditions WHERE SourceTypeOrReferenceId=26 AND SourceGroup=@OLD_PHASE AND SourceEntry=4659;
DELETE FROM conditions WHERE SourceTypeOrReferenceId=26 AND SourceGroup=@NEW_PHASE AND SourceEntry=4659;
DELETE FROM conditions WHERE SourceTypeOrReferenceId=26 AND SourceGroup=@OLD_PHASE AND SourceEntry=452;
DELETE FROM conditions WHERE SourceTypeOrReferenceId=26 AND SourceGroup=@NEW_PHASE AND SourceEntry=452;
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, ErrorType, ErrorTextId, ScriptName, Comment) VALUES
(26, @OLD_PHASE, 4659, 0, 0, 47, 0, 13520, 41, 0, 0, 0, 0, '', 'Darkshore - old phase before quest 13520 is complete'),
(26, @NEW_PHASE, 4659, 0, 0, 47, 0, 13520, 66, 0, 0, 0, 0, '', 'Darkshore - new phase after quest 13520 is complete'),
(26, @OLD_PHASE, 452, 0, 0, 47, 0, 13520, 41, 0, 0, 0, 0, '', 'Darkshore - old phase before quest 13520 is complete'),
(26, @NEW_PHASE, 452, 0, 0, 47, 0, 13520, 66, 0, 0, 0, 0, '', 'Darkshore - new phase after quest 13520 is complete');

-- Laird - fix position
-- Position: 7445.742188 -334.425568 7.986881.
UPDATE creature SET PhaseId=@OLD_PHASE,phaseUseFlags=0,MovementType=0,position_x=7445.74,position_y=-334.42,position_z=7.98 WHERE guid=302509 AND id=32974;

-- Remove invisibility aura
UPDATE creature_template_addon SET auras='29266' WHERE entry=32974;

-- Dentaria Silverglade - Add missing NPC
DELETE FROM creature WHERE guid=3530203330003171 and id=32973;
INSERT INTO creature (guid, id, `map`, zoneId, areaId, spawnDifficulties, phaseUseFlags, PhaseId, PhaseGroup, terrainSwapMap, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, MovementType, npcflag, unit_flags, unit_flags2, unit_flags3, dynamicflags, ScriptName, VerifiedBuild) VALUES
(3530203330003171, 32973, 1, 148, 4659, '0', 0, @OLD_PHASE, 0, -1, 0, 0, 7446.27, -329.951, 7.98956, 4.60547, 300, 0.0, 0, 2383, 0, 0, 0, 0, 0, 0, 0, '', 0);

-- Serendia Oakwhisper - Add missing NPC
DELETE FROM creature WHERE guid=3530203330003172 and id=32972;
INSERT INTO creature (guid, id, `map`, zoneId, areaId, spawnDifficulties, phaseUseFlags, PhaseId, PhaseGroup, terrainSwapMap, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, MovementType, npcflag, unit_flags, unit_flags2, unit_flags3, dynamicflags, ScriptName, VerifiedBuild) VALUES
(3530203330003172, 32972, 1, 148, 4659, '0', 0, @OLD_PHASE, 0, -1, 0, 0, 7443.66, -331.418, 8.0692, 5.20237, 300, 0.0, 0, 2383, 0, 0, 0, 0, 0, 0, 0, '', 0);

-- Remove sitting position from the new npc
DELETE FROM creature_addon WHERE guid=3530203330003171;
INSERT INTO creature_addon (guid, path_id, mount, bytes1, bytes2, emote, aiAnimKit, movementAnimKit, meleeAnimKit, visibilityDistanceType, auras) VALUES
(3530203330003171, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL);

-- Set quest 13520 completed phase for inn NPCs
UPDATE creature SET PhaseId=@NEW_PHASE WHERE guid=245551 AND id=32973;
UPDATE creature SET PhaseId=@NEW_PHASE WHERE guid=245705 AND id=32972;
UPDATE creature SET PhaseId=@NEW_PHASE WHERE guid=308265 AND id=32961;
UPDATE creature SET PhaseId=@NEW_PHASE WHERE guid=308259 AND id=32960;
UPDATE creature SET MovementType=0, PhaseId=@NEW_PHASE WHERE guid=308253 AND id=32962;

-- Update quest objective description
UPDATE quest_objectives SET Description='Cerellean Whiteclaw rescued' WHERE ID=267127 AND QuestID=13518;
UPDATE quest_objectives SET Description='Gershala Nightwhisper rescued' WHERE ID=267128 AND QuestID=13518;
UPDATE quest_objectives SET Description='Shaldyn rescued' WHERE ID=267129 AND QuestID=13518;
UPDATE quest_objectives SET Description='Volcor rescued' WHERE ID=267130 AND QuestID=13518;

-- Set feign death flag
UPDATE creature_template SET unit_flags2=1, unit_flags3=16785408 WHERE entry BETWEEN 33096 AND 33103;

-- Shore NPCs - Set old phase for phase 13520
UPDATE creature SET PhaseId=@OLD_PHASE,phaseUseFlags=0 WHERE id=32911;
UPDATE creature SET PhaseId=@OLD_PHASE,phaseUseFlags=0 WHERE id BETWEEN 33093 AND 33103;

-- Feign death aura disable names
DELETE FROM creature_template_addon WHERE entry BETWEEN 33096 AND 33103;
