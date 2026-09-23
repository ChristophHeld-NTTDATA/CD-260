namespace db;

using { cuid, managed } from '@sap/cds/common';

// Notes an AI agent (or a user) adds while reviewing a Sales Order.
// Linked to the external S/4HANA Sales Order via its key.
entity SalesOrderNotes : cuid, managed {
    salesOrder : String(10) not null;
    category   : String(20) default 'general'; // e.g. general, risk, upsell
    note       : String(1000) not null;
}

// Follow-up tasks created for a Sales Order, e.g. by an AI agent that
// detected an anomaly or a follow-up opportunity while analyzing orders.
entity FollowUpTasks : cuid, managed {
    salesOrder  : String(10) not null;
    title       : String(255) not null;
    description : String(1000);
    dueDate     : Date;
    priority    : String(10) default 'medium'; // low, medium, high
    status      : String(10) default 'open';   // open, inProgress, done
}
