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


### Primary Analysis


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

#### Inventory status of products in each Warehouse:

In order to understand the inventory status of different products in each warehouse, I have created a temporary table that stores the product code, warehouse code, quantity in stock and total sale of each product and categorizes the products to be either "Overstocked", "Understocked" or "well Stocked", depending upon its total sales and stocked quantity.
The categories were defined as follows:

* If the remaining stock of a product is greater than 80% of its initial total stock : Overstocked
* If the remaining stock of a product is less than 20% of its initial total stock : Understocked
* In all other cases: Well Stocked

The temporary table had been exported in CSV format and uploaded, for subsequent use by the company.

Next I had analyzed the total number of overstocked and understocked products in each warehouse.
It was seen that the **East Warehosue(b) has the highest number of overstocked products(22)**.

![image](https://github.com/user-attachments/assets/a4239406-e44e-444e-8b77-6992533eaf0f)


### Sales Data Analysis


#### Finding Sales Record of Overstocked Products:

I have started the sales analysis by using the temporary table of the stock status discussed above. From this table I have found out the sales percentage of each of the overstocked product in each warehosue. The output has again been exported as a CSV file and uploaded for future use of the company.

This record gives us the list of the overstocked products of each warehosue,in ascending order of their sales percentage, thus giving us an ordered list of items whose inventory can be reduced.


#### Finding out the combined Sales Performance of each Warehouse:

I have calculated the sales performance of each warehouse combining all the products stored in that warehouse.
It was seen that the **East Warehosue(b) has the lowest sales performance followed by the West Warehouse(c).**

![image](https://github.com/user-attachments/assets/0da39b9c-a5c5-4756-9497-2981433d8e00)


#### Revenue produced by each Warehosue:

In order to get a better understanding of the importance of each warehouse to the company, I performed an analysis to check the revenue generated from each product of the company and then finally grouped them according to the warehosues in which they are stored. The output gives us the total ampunt of revenue generated by each warehouse.

It was seen that the **West Warehouse(c) generates the least revenue for the company.**

![image](https://github.com/user-attachments/assets/a6113da8-2741-4a4b-982b-7658ebaf0a27)


### Conclusion

My analysis reveals the following:
* West Warehouse(c) and East Warehosue(b) have showed the lowest sales performance.
* West Warehouse(c) is working at the lowest capacity of only 50%.
* West Warehouse(c) generates least revenue for the company.
* East Warehosue(b) works at 67% capacity but has the highest number and type of products.
* East Warehouse(b) has the largest number of overstocked products.  

Considering the above points I have come to the conclusion that the **West Warehosue(c) is the appropriate warehosue that can be closed by the company**, keeping the impact on the customers and sales to a minimum. **The products at the West Warehouse(c) can be shofted to the East Warehouse(b) after reducing the inventory of some of the overstocked and least popular products in this warehouse.**  


### Recommendations

* Reduce the stock of all the overstocked products in East Warehouse to 60%, which will bring down the total inventory of this warehouse from 219183 to 151735.
* Reduce the stock of all the overstocked products in Wast Warehouse to 60%, which will bring down the total inventory of this warehouse from 124880 to 84150.
* Shift the total stock from the West Warehouse to the East Warehouse bringing the total inventory of West Warehouse at 235885 items which is 72.10% of its total capacity. 



## Thank you






