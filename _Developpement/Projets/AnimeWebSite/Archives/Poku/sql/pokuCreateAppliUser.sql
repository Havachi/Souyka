CREATE USER 'poku_db_connector'@'localhost' IDENTIFIED BY '1ms0dgh5mwe76agdmtr9e784n546fsksmypvjrneg69empac40';
GRANT SELECT, INSERT, UPDATE, DELETE ON poku.* TO 'poku_db_connector'@'localhost';