-- https://github.com/HavenWoW/BFA-HavenCore/issues/132
DELETE FROM creature_template_addon WHERE entry=42515;
INSERT INTO creature_template_addon (entry, path_id, mount, bytes1, bytes2, emote, aiAnimKit, movementAnimKit, meleeAnimKit, visibilityDistanceType, auras) VALUES
(42515, 0, 0, 0, 1, 0, 0, 0, 0, 0, '79192');

-- https://github.com/HavenWoW/BFA-HavenCore/issues/175
UPDATE quest_objectives SET Description='Speak to Torben Zapblast' WHERE ID=276692 AND QuestID=27674;

-- https://github.com/HavenWoW/BFA-HavenCore/issues/535
DELETE FROM conditions WHERE SourceTypeOrReferenceId = 15 AND SourceGroup = 10509;
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, ErrorType, ErrorTextId, ScriptName, Comment) VALUES
(15, 10509, 0, 0, 0, 47, 0, 13885, 10, 0, 0, 0, 0, '', 'Gossip menu 10509 option 1 - Quest 13885 in progress or complete');

/*
	DARKSHORE
*/


-- https://github.com/HavenWoW/BFA-HavenCore/issues/490
DELETE FROM waypoint_data WHERE id = 247450;
INSERT INTO waypoint_data (id, point, position_x, position_y, position_z, orientation, delay, move_type, action, action_chance, wpguid) VALUES
(247450, 1, 5955.52, 85.10, 25.96, 0, 0, 0, 0, 100, 0),
(247450, 2, 5973.94, 65.91, 21.40, 0, 0, 0, 0, 100, 0),
(247450, 3, 5999.31, 39.81, 15.45, 0, 0, 0, 0, 100, 0),
(247450, 4, 6001.86, 28.90, 15.18, 0, 0, 0, 0, 100, 0),
(247450, 5, 6002.62, 18.93, 15.02, 0, 0, 0, 0, 100, 0),
(247450, 6, 6020.25, -0.85, 17.19, 0, 0, 0, 0, 100, 0),
(247450, 7, 6037.99, -4.91, 16.07, 0, 0, 0, 0, 100, 0),
(247450, 8, 6058.68, -12.93, 15.79, 0, 0, 0, 0, 100, 0),
(247450, 9, 6086.02, -18.95, 16.94, 0, 0, 0, 0, 100, 0),
(247450, 10, 6058.68, -12.93, 15.79, 0, 0, 0, 0, 100, 0),
(247450, 11, 6037.99,  -4.91, 16.07, 0, 0, 0, 0, 100, 0),
(247450, 12, 6020.25,  -0.85, 17.19, 0, 0, 0, 0, 100, 0),
(247450, 13, 6002.62,  18.93, 15.02, 0, 0, 0, 0, 100, 0),
(247450, 14, 6001.86,  28.90, 15.18, 0, 0, 0, 0, 100, 0),
(247450, 15, 5999.31,  39.81, 15.45, 0, 0, 0, 0, 100, 0),
(247450, 16, 5973.94,  65.91, 21.40, 0, 0, 0, 0, 100, 0),
(247450, 17, 5955.52,  85.10, 25.96, 0, 0, 0, 0, 100, 0);

-- Set waypoint_data movement and adjust position
UPDATE creature SET position_x=5955.52,position_y=85.1,position_z=25.96,MovementType = 2 WHERE guid = 247450;

DELETE FROM creature_addon WHERE guid=247450;
INSERT INTO creature_addon (guid, path_id, mount, bytes1, bytes2, emote, aiAnimKit, movementAnimKit, meleeAnimKit, visibilityDistanceType, auras) VALUES
(247450, 247450, 0, 0, 0, 0, 0, 0, 0, 0, NULL);


-- https://github.com/HavenWoW/BFA-HavenCore/issues/491
-- Idle movement
UPDATE creature SET MovementType=0 WHERE id=34299;
UPDATE creature SET unit_flags2=1,unit_flags3=16785408 WHERE id=34299;


-- https://github.com/HavenWoW/BFA-HavenCore/issues/493
-- Twilight Rider (Humanoid) - remove then because they should be in the mount
DELETE FROM creature WHERE id=34293;
