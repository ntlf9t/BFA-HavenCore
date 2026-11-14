-- https://github.com/HavenWoW/BFA-HavenCore/issues/392
-- Grimclaw - add missing npc - using a small unused guid due smart_scripts requirements
DELETE FROM creature WHERE guid=83200 AND id=33053;
INSERT INTO creature (guid, id, `map`, zoneId, areaId, spawnDifficulties, phaseUseFlags, PhaseId, PhaseGroup, terrainSwapMap, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, MovementType, npcflag, unit_flags, unit_flags2, unit_flags3, dynamicflags, ScriptName, VerifiedBuild) VALUES
(83200, 33053, 1, 148, 4675, '0', 0, 0, 0, -1, 0, 0, 6539.73, 243.12, 7.49803, 5.65265, 300, 0.0, 0, 196, 0, 0, 0, 294912, 0, 0, 0, '', 0);

-- Grimclaw - set feign death
DELETE FROM creature_addon WHERE guid=83200;
INSERT INTO creature_addon (guid, path_id, mount, bytes1, bytes2, emote, aiAnimKit, movementAnimKit, meleeAnimKit, visibilityDistanceType, auras) VALUES
(83200, 0, 0, 7, 0, 0, 0, 0, 0, 0, NULL);

DELETE FROM smart_scripts WHERE entryorguid = -83200 AND source_type = 0;
INSERT INTO smart_scripts (entryorguid, source_type, id, link, event_type, event_phase_mask, event_chance, event_flags, event_param1, event_param2, event_param3, event_param4, event_param5, event_param_string, action_type, action_param1, action_param2, action_param3, action_param4, action_param5, action_param6, target_type, target_param1, target_param2, target_param3, target_x, target_y, target_z, target_o, comment) VALUES
(-83200, 0, 0, 0, 1, 0, 100, 0, 1000, 1000, 1000, 1000, 0, '', 15, 13564, 0, 0, 0, 0, 0, 17, 0, 30, 10, 0.0, 0.0, 0.0, 0.0, 'OOC every 1s - Area explored for quest 13564 - Players Range 30 yards');

UPDATE quest_template_addon SET SpecialFlags=2 WHERE ID=13564;
