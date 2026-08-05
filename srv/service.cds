using {API_PRODUCT_SRV as pr} from './external/API_PRODUCT_SRV';
using {API_BUSINESS_PARTNER as bp} from './external/API_BUSINESS_PARTNER';
using {API_SALES_ORDER_SRV as so} from './external/API_SALES_ORDER_SRV';
using {db} from '../db/schema';

service OrderService {
    entity Agents          as projection on db.Agents;
    entity BusinessPartner as projection on bp.A_BusinessPartner;
    entity Product         as projection on pr.A_Product;
    entity SalesOrders     as projection on so.A_SalesOrder;
}
