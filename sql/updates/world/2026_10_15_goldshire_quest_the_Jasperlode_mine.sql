-- https://github.com/HavenWoW/BFA-HavenCore/issues/120
DELETE FROM quest_poi WHERE QuestID=76;
INSERT INTO quest_poi (QuestID, BlobIndex, Idx1, ObjectiveIndex, QuestObjectiveID, QuestObjectID, MapID, UiMapID, Priority, Flags, WorldEffectID, PlayerConditionID, SpawnTrackingID, AlwaysAllowMergingBlobs, VerifiedBuild) VALUES
(76, 0, 0, -1, 0, 0, 0, 37, 0, 1, 0, 0, 0, 0, 35662),
(76, 0, 1, 0, 252154, -1, 0, 37, 0, 1, 0, 0, 0, 0, 35662),
(76, 0, 3, 32, 0, 0, 0, 37, 0, 0, 0, 0, 11776, 0, 35662),
(76, 1, 2, 0, 252154, -1, 0, 37, 0, 3, 0, 0, 0, 0, 35662);

DELETE FROM quest_poi_points WHERE QuestID=76;
INSERT INTO quest_poi_points (QuestID, Idx1, Idx2, X, Y, VerifiedBuild) VALUES
(76, 0, 0, -9466, 74, 35662),
(76, 1, 0, -9029, -644, 35662),
(76, 1, 1, -8993, -608, 35662),
(76, 1, 2, -9041, -553, 35662),
(76, 1, 4, -9113, -553, 35662),
(76, 1, 5, -9065, -608, 35662),
(76, 1, 3, -9077, -517, 35662),
(76, 2, 0, -9170, -614, 35662),
(76, 3, 0, -9466, 74, 35662);
