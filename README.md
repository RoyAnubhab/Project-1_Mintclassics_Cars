# Mintclassics Model Car Databse
## Analyzing Data in a Model Car Database with MySQL Workbench

This project is a part of the **Coursera Project Network**

### Overview

This Project deals with an inventory-related issue faced by a fictional **Mint Classics Company** ( a retailer of classic model cars and other vehicles).In this project I have helped to analyze data in a relational database with the goal of supporting inventory-related business decisions that lead to the closure of a storage facility of the Mint Classics Company.

### Project Scenario:

**Mint Classics Company** , a retailer of classic model cars and other vehicles is looking at closing one of their storage facilities. To support a data-based business decision, they are looking for suggestions and recommendations for reorganizing or reducing inventory, while still maintaining timely service to their customers.

As a data analyst, I have been provided with a data model and sample data tables to review, isolate and identify those parts of the data that could be useful in deciding how to reduce inventory.I should then formulate suggestions and recommendations for reducing inventory with the goal of closing one of the storage facilities. 

**Business Questions to be answered:**
* Where are items stored and if they were rearranged, could a warehouse be eliminated?
* How are inventory numbers related to sales figures? Do the inventory counts seem appropriate for each item?
* Are we storing items that are not moving? Are any items candidates for being dropped from the product line?


### Aim of the Project:

To conduct an exploratory data analysis to investigate if there are any patterns or themes that may influence the reduction or reorganization of inventory in the Mint Classics storage facilities and to provide recommendations for reducing inventory with the goal of closing one of the storage facilities.

### Resources & Platforms Used : 

The entire analysis of the project was done using **MySQL workbench.**
The fictional Mint Classics relational database and  relational data model used in this project were both provided by Coursera.

### Extended Entity- Relationship Diagram:

An EER (Extended Entity-Relationship) diagram that models the structure of the Mint Classics database is provided here.
![image](https://github.com/user-attachments/assets/c44dc5b5-bb71-4b45-a083-3928280fae5a)

### Understanding the Data

The mintclassics database contains 9 data tables as seen in the EER diagram. I have started the analysis by collecting the basic information regarding the warehouses and the products of the company.

* Number of Warehouses: 4
* Number of Products Sold: 110
* Number of Product Lines: 7

* It was also seen that each product was stored in only one warehouse.

#### Total stock and capacity of each warehosue:

The **warehouses** table of the database contains a **warehousePctCap** column which was assumed to be denoting the Current Percantage Capacity of each Warehouse.   
We see that **West warehouse (c)** currently operates at only **50% capacity** which is the lowest among all others. 

![image](https://github.com/user-attachments/assets/34f5632a-c066-4417-913a-bc8919ef82ed)

On checking the stock of each warehouse we see that the **South Warehouse (d)**  houses the least number of products. However, an important point to keep in mind is that the South Warehouse is operating at 75% capacity (Highest among all).
West Warehouse (c) is second last in the list housing only 124880 products of 24 types.
Highest number and variety of products is stored in the East Warehouse (b).

![image](https://github.com/user-attachments/assets/191a51e9-9e7d-425f-995b-821aff87300b)


We see that each warehouse stores different Product Lines:
![image](https://github.com/user-attachments/assets/eca53eef-ba4d-45b3-bfb1-0e4480f5a067)

South warehouse(d) houses larger vehicles (Ships, Trains, Trucks & Buses) which might be a possible reason for the lower number of products stocked there.
West warehouse(c) and East Warehouse(b) houses store similar products (Vintage Cars and Classic Cars respectively).

#### 





