# Ice Cream Shop: OData Exercises

Welcome to our ice cream shop. Our shop has a small database and a web service (OData) that lets you ask questions about it. Your job is to build the right URLs to find the answers.

## Setup

1. Start the server in the terminal: `npm run watch`
2. Open <http://localhost:4004> in your browser. You will see the service and its entities.
3. Our service lives at `http://localhost:4004/odata/v4/icecream/`

You can try the queries in the browser address bar, or in [test/http/local.http](test/http/local.http) (VS Code REST Client).

## The data

**Flavours** (what we sell)

| Field | Meaning |
|---|---|
| `ID` | Flavour number |
| `name` | e.g. Vanilla |
| `category` | `fruity`, `chocolate`, `creamy`, `sorbet` |
| `colour` | Colour of the ice cream |
| `pricePerScoop` | Price in euros |
| `vegan` | `true` / `false` |
| `stock` | Scoops left in the freezer |
| `rating` | 1 to 5 stars |
| `orders` | All orders for this flavour |

**Orders** (what customers bought)

| Field | Meaning |
|---|---|
| `ID` | Order number |
| `customerName` | Who ordered |
| `flavour_ID` | Which flavour (links to Flavours) |
| `scoops` | How many scoops |
| `cone` | `waffle`, `cup` or `sugar` |
| `topping` | `sprinkles`, `sauce` or `none` |
| `orderDate` | Day of the order |

## OData cheat sheet

| What you want | Add to the URL | Example |
|---|---|---|
| Choose columns | `$select=` | `?$select=name,rating` |
| Filter rows | `$filter=` | `?$filter=rating eq 5` |
| Sort | `$orderby=` | `?$orderby=name desc` |
| Only the first n | `$top=` | `?$top=3` |
| Skip n rows | `$skip=` | `?$skip=3` |
| Count rows | `$count=true` | `?$count=true` |
| Include linked data | `$expand=` | `?$expand=orders` |
| Get one entry | `(key)` | `/Flavours(2)` |
| Group and sum up | `$apply=` | `?$apply=groupby((cone),aggregate(scoops with sum as total))` |

Filter operators: `eq` (equals), `ne`, `gt` (greater than), `ge`, `lt`, `le`, `and`, `or`, `contains(name,'choc')`, `startswith(name,'M')`.

Combine several options with `&`: `?$filter=vegan eq true&$orderby=rating desc`

Text values need single quotes: `category eq 'fruity'`.

---

## Level 1: Warm-up

1. Get all flavours.
2. Get only the flavour with ID 7.
3. Get all flavours but show only `name` and `colour`.
4. Get the first 5 orders.
5. How many orders are there in total? (Hint: `$count=true`)

## Level 2: Filter and sort

6. Which flavours have a rating of 5?
7. Which flavours are vegan?
8. Which flavours cost more than 2.50 per scoop?
9. List all flavours sorted by price, cheapest first.
10. Find all flavours with `choc` in the name.
11. Which flavours are `fruity` **and** have a rating of at least 4?
12. Which flavours have fewer than 15 scoops left in stock? (The shop needs to restock them.)
13. Show all orders from a customer named `Emma`.
14. Show all orders on `2026-07-04`.
15. Show all orders with a `waffle` cone and `sprinkles` topping.

## Level 3: Linked data

16. Get all flavours and include their orders. (Hint: `$expand=orders`)
17. Get flavour 2 with its orders, but only show the `customerName` and `scoops` of each order.
18. Get all orders and include the flavour of each order.
19. Get all orders with the flavour included, and show the flavour name only.
20. How many orders does each flavour have, and which flavour is ordered the least? (Hint: `groupby((flavour_ID),aggregate($count as numberOfOrders))`)

## Level 4: Counting and summing

21. Count the flavours in each category.
    (Hint: `$apply=groupby((category),aggregate($count as flavours))`)
22. How many scoops were sold in total?
    (Hint: `$apply=aggregate(scoops with sum as total)`)
23. How many scoops were sold per cone type?
24. How many scoops were sold per flavour? Sort the result so that the best seller is first.
25. **Build an OData query to get the top 3 most popular ice cream flavours.** (Hint: group by `flavour_ID`, sum up `scoops`, sort descending, take the top 3.)
26. Which customer bought the most scoops?
27. Which topping is the most popular?
28. What is the average rating per category?
    (Hint: `aggregate(rating with average as avgRating)`)

## Level 5: Change the data

Use the `.http` file for these (browsers can only read data).

29. Create a new flavour with ID 11, e.g. "Blueberry Cheesecake". Then read it back.
30. Change the `stock` of your new flavour to 5 with a `PATCH` request.
31. Create a new order for your new flavour.
32. Delete your new order and then your new flavour. Read all flavours again to check that it is gone.

## Bonus: Invent your own

- Create a flavour that you would love to eat and give it a rating of 5.
- Write a question about the shop that nobody else has thought of, and build the query to answer it.
- Find the day with the most sold scoops.

---

## Solutions (for the instructor)

Base: `/odata/v4/icecream`

| # | Query |
|---|---|
| 1 | `/Flavours` |
| 2 | `/Flavours(7)` |
| 3 | `/Flavours?$select=name,colour` |
| 4 | `/Orders?$top=5` |
| 5 | `/Orders?$count=true&$top=0` |
| 6 | `/Flavours?$filter=rating eq 5` |
| 7 | `/Flavours?$filter=vegan eq true` |
| 8 | `/Flavours?$filter=pricePerScoop gt 2.50` |
| 9 | `/Flavours?$orderby=pricePerScoop` |
| 10 | `/Flavours?$filter=contains(name,'Choc')` |
| 11 | `/Flavours?$filter=category eq 'fruity' and rating ge 4` |
| 12 | `/Flavours?$filter=stock lt 15` |
| 13 | `/Orders?$filter=customerName eq 'Emma'` |
| 14 | `/Orders?$filter=orderDate eq 2026-07-04` |
| 15 | `/Orders?$filter=cone eq 'waffle' and topping eq 'sprinkles'` |
| 16 | `/Flavours?$expand=orders` |
| 17 | `/Flavours(2)?$expand=orders($select=customerName,scoops)` |
| 18 | `/Orders?$expand=flavour` |
| 19 | `/Orders?$expand=flavour($select=name)` |
| 20 | `/Orders?$apply=groupby((flavour_ID),aggregate($count as numberOfOrders))&$orderby=numberOfOrders` |
| 21 | `/Flavours?$apply=groupby((category),aggregate($count as flavours))` |
| 22 | `/Orders?$apply=aggregate(scoops with sum as total)` |
| 23 | `/Orders?$apply=groupby((cone),aggregate(scoops with sum as total))` |
| 24 | `/Orders?$apply=groupby((flavour_ID),aggregate(scoops with sum as total))&$orderby=total desc` |
| 25 | `/Orders?$apply=groupby((flavour_ID),aggregate(scoops with sum as totalScoops))&$orderby=totalScoops desc&$top=3` (Chocolate 11, Bubblegum 8, Cookie Dough 8) |
| 26 | `/Orders?$apply=groupby((customerName),aggregate(scoops with sum as total))&$orderby=total desc&$top=1` |
| 27 | `/Orders?$apply=groupby((topping),aggregate(scoops with sum as total))&$orderby=total desc` |
| 28 | `/Flavours?$apply=groupby((category),aggregate(rating with average as avgRating))` |
| 29-32 | See [test/http/local.http](test/http/local.http). The data lives in memory and is reset on every server restart. |
| Bonus (busiest day) | `/Orders?$apply=groupby((orderDate),aggregate(scoops with sum as total))&$orderby=total desc&$top=1` |

Spaces in URLs: browsers add `%20` automatically, so you can type them normally.
