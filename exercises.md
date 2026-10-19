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
| Count rows | `$count=true` | `?$count=true` |
| Include linked data | `$expand=` | `?$expand=orders` |
| Get one entry | `(key)` | `/Flavours(2)` |
| Group and sum up | `$apply=` | `?$apply=groupby((cone),aggregate(scoops with sum as total))` |

Filter operators: `eq` (equals), `ne`, `gt` (greater than), `ge`, `lt`, `le`, `and`, `or`, `contains(name,'choc')`.

Combine several options with `&`: `?$filter=vegan eq true&$orderby=rating desc`

Text values need single quotes: `category eq 'fruity'`.

---

## Level 1: Warm-up

1. Get all flavours.
2. Get only the flavour with ID 7.
3. Get all flavours but show only `name` and `colour`.
4. How many orders are there in total? (Hint: `$count=true`)

## Level 2: Filter and sort

5. Which flavours have a rating of 5?
6. Which flavours are vegan?
7. List all flavours sorted by price, cheapest first.
8. Which flavours are `fruity` **and** have a rating of at least 4?
9. Show all orders with a `waffle` cone and `sprinkles` topping.

## Level 3: Linked data

10. Get all flavours and include their orders. (Hint: `$expand=orders`)
11. Get flavour 2 with its orders, but only show the `customerName` and `scoops` of each order.
12. Get all orders and include the name of the flavour of each order.

## Level 4: Counting and summing

13. Count the flavours in each category.
    (Hint: `$apply=groupby((category),aggregate($count as flavours))`)
14. How many scoops were sold in total?
    (Hint: `$apply=aggregate(scoops with sum as total)`)
15. **Build an OData query to get the top 3 most popular ice cream flavours.** (Hint: group by `flavour_ID`, sum up `scoops`, sort descending, take the top 3.)
16. Which customer bought the most scoops?

## Level 5: Change the data

Use the `.http` file for these (browsers can only read data).

17. Create a new flavour with ID 11, e.g. "Blueberry Cheesecake". Then read it back.
18. Change the `stock` of your new flavour to 5 with a `PATCH` request.
19. Delete your new flavour.

## Bonus: Invent your own

- Create a flavour that you would love to eat and give it a rating of 5.
- Write a question about the shop that nobody else has thought of, and build the query to answer it.

---

## Solutions (for the instructor)

Base: `/odata/v4/icecream`

| # | Query |
|---|---|
| 1 | `/Flavours` |
| 2 | `/Flavours(7)` |
| 3 | `/Flavours?$select=name,colour` |
| 4 | `/Orders?$count=true&$top=0` |
| 5 | `/Flavours?$filter=rating eq 5` |
| 6 | `/Flavours?$filter=vegan eq true` |
| 7 | `/Flavours?$orderby=pricePerScoop` |
| 8 | `/Flavours?$filter=category eq 'fruity' and rating ge 4` |
| 9 | `/Orders?$filter=cone eq 'waffle' and topping eq 'sprinkles'` |
| 10 | `/Flavours?$expand=orders` |
| 11 | `/Flavours(2)?$expand=orders($select=customerName,scoops)` |
| 12 | `/Orders?$expand=flavour($select=name)` |
| 13 | `/Flavours?$apply=groupby((category),aggregate($count as flavours))` |
| 14 | `/Orders?$apply=aggregate(scoops with sum as total)` |
| 15 | `/Orders?$apply=groupby((flavour_ID),aggregate(scoops with sum as totalScoops))&$orderby=totalScoops desc&$top=3` (Chocolate 11, Bubblegum 8, Cookie Dough 8) |
| 16 | `/Orders?$apply=groupby((customerName),aggregate(scoops with sum as total))&$orderby=total desc&$top=1` (Paul, 5 scoops) |
| 17-19 | See [test/http/local.http](test/http/local.http). The data lives in memory and is reset on every server restart. |

Spaces in URLs: browsers add `%20` automatically, so you can type them normally.
