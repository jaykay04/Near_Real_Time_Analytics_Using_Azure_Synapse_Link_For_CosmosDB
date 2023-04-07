IF (NOT EXISTS(SELECT * FROM sys.credentials WHERE name = 'synapse-project-cosmosdb'))
    CREATE CREDENTIAL [synapse-project-cosmosdb]
    WITH IDENTITY = 'SHARED ACCESS SIGNATURE', SECRET = 'wH22k74tfQxh6GPLaz6KB07SzvEb5CdygAiYRNFx96PQ6QMPJmOIyTLqJ7FWS7LOH8CFmUWY6AvTACDbkaG8nw=='
GO

SELECT TOP 100 *
FROM OPENROWSET(​PROVIDER = 'CosmosDB',
                CONNECTION = 'Account=synapse-project-cosmosdb;Database=cosmosprojectdb',
                OBJECT = 'heartbeat',
                SERVER_CREDENTIAL = 'synapse-project-cosmosdb'
) AS [heartbeat]
