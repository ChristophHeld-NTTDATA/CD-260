namespace db;

using { managed } from '@sap/cds/common';

// The ice cream flavours our shop sells.
entity Flavours : managed {
    key ID        : Integer;
    name          : String(50) not null;
    category      : String(20); // fruity, chocolate, creamy, sorbet
    colour        : String(20);
    pricePerScoop : Decimal(4, 2) not null;
    vegan         : Boolean default false;
    stock         : Integer default 0; // scoops left in the freezer
    rating        : Integer;           // 1 (meh) to 5 (amazing)
    orders        : Association to many Orders on orders.flavour = $self;
}

// One order = one customer buying some scoops of one flavour.
entity Orders : managed {
    key ID       : Integer;
    customerName : String(50) not null;
    flavour      : Association to Flavours not null;
    scoops       : Integer default 1;
    cone         : String(10) default 'waffle'; // waffle, cup, sugar
    topping      : String(20);                  // sprinkles, sauce, none ...
    orderDate    : Date;
}
