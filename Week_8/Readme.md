Skip to content
Search or jump to…
Pull requests
Issues
Marketplace
Explore
 
@adunoluwa1 
adunoluwa1
/
SQL-8-Weeks-Challenge
Public
Code
Issues
Pull requests
Actions
Projects
Wiki
Security
Insights
Settings
SQL-8-Weeks-Challenge
/
Week_4
/
ReadMe.md
in
main
 

Spaces

2

Soft wrap
30
​
31
<details><summary>View Datasets</summary>
32
  <p>
33
​
34
- Regions
35
    
36
  Just like popular cryptocurrency platforms - Data Bank is also run off a network of nodes where both money and data is stored across the globe. In a traditional banking sense - you can think of these nodes as bank branches or stores that exist around the world.
37
  This regions table contains the region_id and their respective region_name values  
38
  
39
  <details><summary>View table</summary>
40
    <p>
41
  
42
    |region_id| region_name|
43
    |---------|------------|
44
    |1        |Africa      |
45
    |2        |America     |
46
    |3        |Asia        |
47
    |4        |Europe      |
48
    |5        |Oceania     |
49
      
50
    </p>
51
  </details>
52
​
53
- Customer Nodes
54
    
55
  Customers are randomly distributed across the nodes according to their region - this also specifies exactly which node contains both their cash and data.
56
​
57
  This random distribution changes frequently to reduce the risk of hackers getting into Data Bank’s system and stealing customer’s money and data!
58
​
59
  Below is a sample of the top 10 rows of the data_bank.customer_nodes
60
  
61
  <details><summary>View table</summary>
62
    <p>
63
  
64
    |customer_id| region_id  |node_id     | start_date | end_date   |
65
    |---------  |------------|------------|------------|------------|
66
    |1          |3           |4           | 2020-01-02 | 2020-01-03 |
67
    |2          |3           |5           | 2020-01-03 | 2020-01-17 |
68
    |3          |5           |4           | 2020-01-27 | 2020-01-18 |
69
    |4          |5           |4           | 2020-01-07 | 2020-01-19 |
70
    |5          |3           |3           | 2020-01-15 | 2020-01-23 |
71
    |6          |1           |1           | 2020-01-11 | 2020-01-06 |
72
    |7          |2           |5           | 2020-01-20 | 2020-01-04 |
73
    |8          |1           |2           | 2020-01-15 | 2020-01-28 |
74
    |9          |4           |5           | 2020-01-21 | 2020-01-25 |
75
    |10         |3           |4           | 2020-01-13 | 2020-01-14 |
76
     
77
    </p>
78
  </details>
79
​
80
- Customer Transactions
81
    
82
  This table stores all customer deposits, withdrawals and purchases made using their Data Bank debit card. 
83
  
84
  <details><summary>View table</summary>
85
    <p>
86
  
87
    |customer_id| txn_date    | txn_type |  txn_amount  |
88
    |-----------|-------------|----------|--------------|  
89
    |429        | 2020-01-21  | deposit  |  82          |
90
    |155        | 2020-01-10  | deposit  |  712         |
91
    |398        | 2020-01-01  | deposit  |  196         |
92
    |255        | 2020-01-14  | deposit  |  563         |
93
    |185        | 2020-01-29  | deposit  |  626         |
94
    |309        | 2020-01-13  | deposit  |  995         |
95
    |312        | 2020-01-20  | deposit  |  485         |
96
    |376        | 2020-01-03  | deposit  |  706         |
97
    |188        | 2020-01-13  | deposit  |  601         |
98
    |138        | 2020-01-11  | deposit  |  520         |
99
      
No file chosen
Attach files by dragging & dropping, selecting or pasting them.
Styling with Markdown is supported
@adunoluwa1
Commit changes
Commit summary
Create ReadMe.md
Optional extended description
Add an optional extended description…
 Commit directly to the main branch.
 Create a new branch for this commit and start a pull request. Learn more about pull requests.
 
Footer
© 2022 GitHub, Inc.
Footer navigation
Terms
Privacy
Security
Status
Docs
Contact GitHub
Pricing
API
Training
Blog
About
Editing SQL-8-Weeks-Challenge/ReadMe.md at main · adunoluwa1/SQL-8-Weeks-Challenge
