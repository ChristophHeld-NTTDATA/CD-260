using { SALESORDER0001 as so } from './external/SALESORDER0001.cds';
using {db} from '../db/schema';

service OrderService {
    entity SalesOrderNotes as projection on db.SalesOrderNotes;
    entity FollowUpTasks   as projection on db.FollowUpTasks;

    //External Service integrated into CAP CDS model
    entity SalesOrders     as projection on so.SalesOrder;
}