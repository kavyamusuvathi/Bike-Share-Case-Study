# **Google Data Analytics : Bike share Case Study**
## Skils used : SQL, Tableau

### Scenario :
You are a junior data analyst working on the marketing analyst team at Cyclistic, a bike-share
company in Chicago. The director of marketing believes the company’s future success
depends on maximizing the number of annual memberships. Therefore, your team wants to
understand how casual riders and annual members use Cyclistic bikes differently. From these
insights, your team will design a new marketing strategy to convert casual riders into annual
members. But first, Cyclistic executives must approve your recommendations, so they must be
backed up with compelling data insights and professional data visualizations.


### Goal :
To convert casual bike riders into annual members.


## Data Analysis Phase
### Ask
#### Business task
The company wants to learn from the insights on how casual members and annual members differ from using the bikes and how and when to create a campaign to influence casual members to enrol into membership programs and create awareness on cost saving.

#### Stakeholders
* Moreno - Head of the company
* Financial Analyst Team
* Marketing Team

#### Deliverables
1. A clear statement of the business task
2. A description of all data sources used
3. Documentation of any cleaning or manipulation of data
4. A summary of your analysis
5. Supporting visualizations and key findings
6. Your top three recommendations based on your analysis


### Prepare
#### Dataset
The data is publicly availabe on https://divvy-tripdata.s3.amazonaws.com/index.html by a bike share company (third party company).
**Jan-01-2023 to June-30-2023** data has been considered for this analysis. Organized the data with the best practice naming convention.
Checked for credibility and bias using sort and filter functions in SQL. Checked if the data is ROCCC. 


### Process
In the process phase, I used Google BigQuery to process and the analyze the data as the dataset was too large.

I merged all my 6 months data table into one table by creating a table for that.

<img width="430" alt="SQL 1" src="https://github.com/kavyamusuvathi/Bike-Share-Case-Study/assets/167023446/58f5582c-861f-495e-b07b-26b66487653a">

After merging the data, i cleaned the data by removing NULL values.

<img width="497" alt="SQL 2" src="https://github.com/kavyamusuvathi/Bike-Share-Case-Study/assets/167023446/fb51c53c-ffde-4867-bb3d-3f3308dacd9b">


### Analyze
In the analyze phase, I calculated all the metrics needed for analyzing the data.

Calculated the average, maximum and minimum trip duration in minutes to check the insights of trip lengths.

<img width="364" alt="SQL 3" src="https://github.com/kavyamusuvathi/Bike-Share-Case-Study/assets/167023446/4cb00050-659c-4e87-b7ce-d8b76a06fa1c">


Checking the rides with negative durations.

<img width="355" alt="SQL 4" src="https://github.com/kavyamusuvathi/Bike-Share-Case-Study/assets/167023446/18a25bf3-24dc-4eb7-85d0-0948339d5564">


Counting the number of rides that lasted more than 0 mins and less than 24 hours by creating a new table.

<img width="446" alt="SQL 5" src="https://github.com/kavyamusuvathi/Bike-Share-Case-Study/assets/167023446/95b2e8e6-37e0-47ee-9ca1-9f8b8e220b79">


Calculating the number of rides taken by annual members and casual members on each day of the week.

<img width="393" alt="SQL 6" src="https://github.com/kavyamusuvathi/Bike-Share-Case-Study/assets/167023446/8528811a-5660-4bd2-acf6-e91c83b27350">


Adding days of the week to the day and hour to check the number of trips made by users on different days and hours.

<img width="398" alt="SQL 7" src="https://github.com/kavyamusuvathi/Bike-Share-Case-Study/assets/167023446/cb183af7-c254-4b43-93fe-2211479b28d1">


Merging the departure and arrival location to create a route and counting the number of rides by member types.

<img width="409" alt="SQL 8" src="https://github.com/kavyamusuvathi/Bike-Share-Case-Study/assets/167023446/139988f6-da3b-49a5-a288-4f72f5e7113b">


This query calculates the number of trips made by bike types and separates them by the types of member inorder to find out which type of bike is popular among different types of members.

<img width="407" alt="SQL 9" src="https://github.com/kavyamusuvathi/Bike-Share-Case-Study/assets/167023446/99e7f7ee-305f-49be-acd0-6ced2b3897a8">


Calculating the average ride length in minutes by member type and hours of the day.

<img width="436" alt="SQL 10" src="https://github.com/kavyamusuvathi/Bike-Share-Case-Study/assets/167023446/48855824-8a20-4a05-8d11-8b16e94bcd8b">


Calculating the average ride length by day of the week, route, hour, bike_type and member type.

<img width="441" alt="SQL 11" src="https://github.com/kavyamusuvathi/Bike-Share-Case-Study/assets/167023446/211a75c0-e3e6-4b93-9c32-4f348dbbee1c">


### Share
By Visualizing the data insights, it is known that members took more rides than casual riders. From the graph we can observe that **66.13% of 1,820,483** the rides were taken by members.
Both member and casual riders preferred classic bikes when compared to electric bikes.

We also observed that **members** took more rides on **Tuesday, Wednesday and Thursday** whereas **causal riders** took more rides on weekends especially on **Saturday**.

![Dashboard 1](https://github.com/kavyamusuvathi/Bike-Share-Case-Study/assets/167023446/61936570-6038-47e7-a74c-e7cfb8813ba1)


Also both casual riders and members used rides during peak commute times. Upon looking at the latitude and longitude, most of the Casual riders were around the **Univesity of Illinois at Chicago**
and **Chicago State University** around Chicago Downtown and in and around most of the metro stations near the college and Downtown. 


<img width="707" alt="Tableau 5" src="https://github.com/kavyamusuvathi/Bike-Share-Case-Study/assets/167023446/86400ea1-198a-441d-8f77-67546ea002b2">  <img width="710" alt="Tableau 6" src="https://github.com/kavyamusuvathi/Bike-Share-Case-Study/assets/167023446/fc87859b-e1d8-471e-a740-c63362caf932">
<img width="712" alt="Tableau 7" src="https://github.com/kavyamusuvathi/Bike-Share-Case-Study/assets/167023446/34bf18a0-be4c-4055-9c6c-bd9336f07aa8"> <img width="147" alt="Tableau 8" src="https://github.com/kavyamusuvathi/Bike-Share-Case-Study/assets/167023446/c4c9466c-0f07-4edd-9188-1f306cc43e6f">

### Act

#### Recommendations
I would recommend the marketing team to create a campaign near the college before the college start date to create more awareness among students about the benefits of Annual membership.
Create a campaign in Chicago Downtown to create awareness about the annual membership and also to install a billboard.

As there were riders near metro stations, my suggestion for marketing team would be to collaborate with Metro Stations to offer some kind of discounts to riders either in annual membership
or metro station tickets to attract more people to ride the bike.






















