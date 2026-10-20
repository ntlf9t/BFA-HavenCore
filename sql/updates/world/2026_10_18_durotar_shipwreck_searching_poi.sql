-- https://github.com/HavenWoW/BFA-HavenCore/issues/410
DELETE FROM quest_poi WHERE QuestID=25178;
INSERT INTO quest_poi (QuestID, BlobIndex, Idx1, ObjectiveIndex, QuestObjectiveID, QuestObjectID, MapID, UiMapID, Priority, Flags, WorldEffectID, PlayerConditionID, SpawnTrackingID, AlwaysAllowMergingBlobs, VerifiedBuild) VALUES
(25178, 0, 0, -1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 35662),
(25178, 0, 1, 0, 265301, 4863, 1, 1, 0, 0, 0, 0, 0, 0, 35662);

DELETE FROM quest_poi_points WHERE QuestID=25178;
INSERT INTO quest_poi_points (QuestID, Idx1, Idx2, X, Y, VerifiedBuild) VALUES
(25178, 0, 0, 288, -4771,35662),
(25178, 1, 0, 428, -5167, 35662),
(25178, 1, 1, 351, -5048, 35662),
(25178, 1, 2, 326, -5014, 35662),
(25178, 1, 3, 233, -4991, 35662),
(25178, 1, 4, 89, -4970, 35662),
(25178, 1, 5, -27, -4960, 35662),
(25178, 1, 6, 45, -5056, 35662),
(25178, 1, 7, 161, -5159, 35662),
(25178, 2, 0, 288, -4771, 35662);
