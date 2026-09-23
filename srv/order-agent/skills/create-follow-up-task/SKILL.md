---
name: create-follow-up-task
description: >
  Create a follow-up task for a sales order via the `OrderService` MCP.
metadata:
  tags: [orders, tasks, mcp]
  examples:
    - Create a follow-up task to confirm expedited shipping for order #12345
    - Remind the sales rep to secure a payment guarantee for order #98765
---

# Skill: Create Follow-Up Task

## When to Use

- User wants to schedule a follow-up action related to a sales order
- User asks for a reminder, escalation, or next step tied to an order

## Instructions

1. Confirm the sales order exists by calling `query` against the
   `SalesOrders` entity, filtered by order ID.

2. Call `createFollowupTask` action with:
   - `salesOrder`: the order ID
   - `title`: a short, actionable title
   - `description`: optional additional context
   - `dueDate`: optional due date, if mentioned or implied
   - `priority`: one of `low`, `medium`, or `high` (default `medium`)

3. Confirm to the user that the task was created, including its priority
   and due date if set.

## Notes

- Don't invent order IDs, `query` the `SalesOrders` entity first to verify.
- If a query or create fails with a schema error, use the output of
  `describe` and retry with the correct field names.
