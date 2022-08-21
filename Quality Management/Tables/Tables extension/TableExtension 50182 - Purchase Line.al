tableextension 50182 NewFieldPurchaseLine extends "Purchase Line"
{
    fields
    {
        // Add changes to table fields here field(99300; "Comissions Zone"; Code[20])

        field(50180; "Composition Quality Code"; Code[20])
        {
            TableRelation = "Composition Quality Header";
            trigger OnValidate();
            var
                salesLine: Record "Sales Line";
            begin

            end;
        }
        field(50181; "Cast No. Vendor"; Text[50])
        {
            trigger OnValidate();
            var
                salesLine: Record "Sales Line";
            begin

            end;
        }
    }

}