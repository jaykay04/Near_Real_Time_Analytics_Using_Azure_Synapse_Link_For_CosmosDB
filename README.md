# Near_Real_Time_Analytics_Using_Azure_Synapse_Link_For_CosmosDB
This Project demonstrate how Synapse Link can help us simplify Near Real Time Insights from transactional data using *Azure Synapse Analytics*

The major problem faced with moving large amount of data from OLTP databases to OLAP databases is the complex ETL pipeline that needs to be built and the delays that are encountered before being able to run queries on the OLAP databases to make busniess decision.

Azure Synapse Link is a microsoft solution to this problem.

Azure Synapse Link is a cloud native Hybrid Transactional and Analytical Processing (HTAP)  that allows business to run near real time analytics over operational data without impacting the operations of the transactional system.

When we have real time transactional data from IOT devices being generated and written to CosmosDB transactional store, the data is being replicated asynchronously to the analytical store once the Synapse Link is being activated.

The data in the Analytical is in columnar format which makes it very fast to run queries against them by analytical query engines. The replication is carried out by auto sink process fully managed by Azure.

This data can then be accessed by the Serverless SQL or Spark Pool in Synapse Analytics by creating a Link Service.

#### Benefits of Azure Synapse Link for CosmosDB
* Less complex solution.
* Fully managed service.
* Near real time analytics.
* No impact to transactional systems.
* Automatic schema inference.
* native integration between serverless sql pool, spark pool and cosmosdb.

#### Limitations of Azure Synapse Link for CosmosDB
* Only has support for SQL API and MongoDB API.
* It does not have support for Dedicated SQL pool at the moment.
* Limited support for existing CosmosDB containers.
* Backup and Restore for Analytical store not currrently available.

### Situation
We have taxis fitted with a device which the taxi drivers uses to manage hires and communicate with the central IT system and support teams. 

This device sends heartbeat data every minute to the cosmosdb and central IT system in form of json and it contains information like locations, availabilty of the taxi etc.

### Task
* We want to be able to use the information sent from the device to assign new hires to these taxis and also create a near real time dashboard with all the taxis and their precise location on a map while monitoring them closely.
* We should be able to query and perform big data analytics on these data using Azure Synapse Spark Pool.
* We should also have the ability to query the data using Azure serverless SQL Pool while also making the data available for BI reporting.

### Solution Approach
#### Solution Architecture of the Project
<img src="https://github.com/jaykay04/Near_Real_Time_Analytics_Using_Azure_Synapse_Link_For_CosmosDB/blob/main/Synapse%20Link%20Image/solution%20architecture.png">

The first step was to create the CosmosDB database with a container to receive the data from the devices and activate *Synapse Link* so that the analytical store can also be created which takes in replicated data from the transactional store.

We then create a Link Service in Azure Synapse to enable serverless SQL pool and spark pool have access to the data cosmosdb.
