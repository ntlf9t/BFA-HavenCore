-- https://github.com/HavenWoW/BFA-HavenCore/issues/369
-- Set idle movement to Guard Roberts
UPDATE creature SET MovementType=0 WHERE guid=178007 AND ID=12423;
