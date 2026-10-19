using {db} from '../db/schema';

@path: 'icecream'
service IceCreamService {
    entity Flavours as projection on db.Flavours;
    entity Orders   as projection on db.Orders;

    // Creates an order and takes the scoops out of the stock.
    function orderIceCream(flavour : Integer not null, customerName : String(50), scoops : Integer) returns Orders;
}
