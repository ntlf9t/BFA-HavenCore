-- Store entries 1-10 deliver ordinary item rewards.
UPDATE `battlepay_products`
SET `WebsiteType` = 3
WHERE `ProductID` BETWEEN 1 AND 10
  AND `WebsiteType` IS NULL;
