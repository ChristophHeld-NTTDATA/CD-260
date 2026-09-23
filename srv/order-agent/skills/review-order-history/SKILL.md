---
name: review-order-history
description: >
  Review all notes and follow-up tasks recorded for a sales order via the
  `OrderService` MCP.
metadata:
  tags: [orders, notes, tasks, mcp]
  examples:
    - Give me a summary of everything recorded for order #12345
    - What open follow-ups exist for order #98765?
---

# Skill: Review Order History

## When to Use

- User wants an overview of what has been recorded for a sales order
- User asks about open follow-ups, risks, or past notes for an order

## Instructions

1. Call `query` against the `SalesOrders` entity, filtered by order ID, to
   confirm the order exists and to fetch its key details.

2. Call `query` against the `SalesOrderNotes` entity, filtered by
   `salesOrder`, to retrieve all notes for the order.

3. Call `query` against the `FollowUpTasks` entity, filtered by
   `salesOrder`, to retrieve all follow-up tasks for the order.

4. Summarize the findings for the user, grouping notes by category and
   tasks by status, and highlight any open high-priority tasks or risk
   notes.

## Notes

- Don't invent order IDs, `query` the `SalesOrders` entity instead.
- If a query fails with a schema error, use the output of `describe`
  and retry with the correct field names.
