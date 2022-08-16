tableextension 50183 NewFieldSalesLines extends "Sales Line"
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
        field(50181; "Vendor No."; Code[20])
        {
            TableRelation = "Vendor";
            trigger OnValidate();
            var
                salesLine: Record "Sales Line";
            begin

            end;
        }

    }
    var

}