using { SALESORDER0001 as so } from './external/SALESORDER0001.cds';
using {db} from '../db/schema';

service OrderService {
    entity Agents          as projection on db.Agents;

    //External Service integrated into CAP CDS model
    entity SalesOrders     as projection on so.SalesOrder;
}
