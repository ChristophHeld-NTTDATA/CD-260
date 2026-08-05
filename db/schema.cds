namespace db;

using { cuid, managed } from '@sap/cds/common';

entity Agents : cuid, managed {
    name     : String(255) not null;
    host     : String(1024) not null;
    provider : String(255) default 'SAP';
}
