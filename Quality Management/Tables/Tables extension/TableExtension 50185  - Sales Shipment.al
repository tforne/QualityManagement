tableextension 50185 NewFieldSalesShipment extends "Sales Shipment Header"
{
    fields
    {
        // Add changes to table fields here field(99300; "Comissions Zone"; Code[20])

        field(50180; "Composition Quality Code"; Code[20])
        {
            TableRelation = "Composition Quality Header";
            trigger OnValidate();

            begin

            end;
        }
    }
}