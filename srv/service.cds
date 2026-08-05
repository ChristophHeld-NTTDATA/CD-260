using {sap_s4_OP_SALESORDER_0001_v1 as so} from './external/sap-s4-OP_SALESORDER_0001-v1';
using {API_PRODUCT_SRV as pr} from './external/API_PRODUCT_SRV';
using {API_BUSINESS_PARTNER as bp} from './external/API_BUSINESS_PARTNER';

service OrderService {
    entity SalesOrder      as projection on so.SalesOrder;
    entity BusinessPartner as projection on bp.A_BusinessPartner;
    entity Product         as projection on pr.A_Product;
}
