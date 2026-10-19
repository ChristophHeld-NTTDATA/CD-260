using {db} from '../db/schema';

@path: 'icecream'
service IceCreamService {
    entity Flavours as projection on db.Flavours;
    entity Orders   as projection on db.Orders;
}
