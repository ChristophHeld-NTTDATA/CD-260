---
name: add-order-note
description: >
  Add a note to a sales order via the `OrderService` MCP.
metadata:
  tags: [orders, notes, mcp]
  examples:
    - Add a note that order #12345 needs faster shipping
    - Flag order #98765 as a payment risk
---

# Skill: Add Order Note

## When to Use

- User wants to record an observation, comment, or flag about a sales order
- User mentions risks, upsell opportunities, or general remarks tied to an order

## Instructions

1. Confirm the sales order exists by calling `query` against the `SalesOrders`
   entity, filtered by order ID.

2. Call `createNote` action with:
   - `salesOrder`: the order ID
   - `note`: a concise summary of the observation
   - `category`: one of `general`, `risk`, or `upsell` (default to `general`
     if unclear)

3. Confirm to the user that the note was added, including the category used.

## Notes

- Don't invent order IDs, `query` the `SalesOrders` entity first to verify.
- If a query or create fails with a schema error, use the output of
  `describe` and retry with the correct field names.
