-- https://github.com/HavenWoW/BFA-HavenCore/issues/429
-- Swiftclaw - remove duplicated with wrong position
DELETE FROM creature WHERE guid=53051 AND id=2175;

-- Set waypoint_data movement and adjust position
UPDATE creature SET position_x=6723.84,position_y=373.12,position_z=5.73,MovementType = 2 WHERE guid = 247200 AND id=2175;

-- Set waypoint_data path
UPDATE creature_template_addon SET path_id=247200 WHERE entry=2175;

DELETE FROM waypoint_data WHERE id = 247200;
INSERT INTO waypoint_data (id, point, position_x, position_y, position_z, orientation, delay, move_type, action, action_chance, wpguid) VALUES
(247200, 1, 6723.84, 373.12,  5.73, 0, 0, 0, 0, 100, 0),
(247200, 2, 6698.46, 368.29,  7.06, 0, 0, 0, 0, 100, 0),
(247200, 3, 6656.98, 354.79,  9.50, 0, 0, 0, 0, 100, 0),
(247200, 4, 6625.24, 335.90, 13.04, 0, 0, 0, 0, 100, 0),
(247200, 5, 6577.52, 306.50, 13.29, 0, 0, 0, 0, 100, 0),
(247200, 6, 6625.24, 335.90, 13.04, 0, 0, 0, 0, 100, 0),
(247200, 7, 6656.98, 354.79,  9.50, 0, 0, 0, 0, 100, 0),
(247200, 8, 6698.46, 368.29,  7.06, 0, 0, 0, 0, 100, 0),
(247200, 9, 6723.84, 373.12,  5.73, 0, 0, 0, 0, 100, 0);
