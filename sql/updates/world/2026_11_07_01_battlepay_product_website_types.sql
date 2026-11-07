-- Products 1-10 are ordinary item rewards; normalize rows left NULL by prior data.
UPDATE `battlepay_products`
SET `WebsiteType` = 3
WHERE `ProductID` BETWEEN 1 AND 10;
