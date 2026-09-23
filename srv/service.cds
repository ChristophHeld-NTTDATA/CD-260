using { SALESORDER0001 as so } from './external/SALESORDER0001.cds';
using {db} from '../db/schema';

service OrderService {
    entity SalesOrderNotes as projection on db.SalesOrderNotes;
    entity FollowUpTasks   as projection on db.FollowUpTasks;

    //External Service integrated into CAP CDS model
    entity SalesOrders     as projection on so.SalesOrder;

    // Minimal actions for agents that struggle with plain OData CREATE requests.
    action createNote (
        salesOrder : String(10) not null,
        note       : String(1000) not null,
        category   : String(20),
    ) returns SalesOrderNotes;

    action createFollowupTask (
        salesOrder  : String(10) not null,
        title       : String(255) not null,
        description : String(1000),
        dueDate     : Date,
        priority    : String(10),
    ) returns FollowUpTasks;
}