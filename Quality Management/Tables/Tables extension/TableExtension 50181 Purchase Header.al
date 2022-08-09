tableextension 50181 NewFieldPurchaseHeader extends "Purchase Header"
{
    fields
    {
        // Add changes to table fields here field(99300; "Comissions Zone"; Code[20])

        field(50180; "Composition Quality Code"; Code[20])
        {
            TableRelation = "Composition Quality Header";
            trigger OnValidate();
            var
            begin

            end;
        }
        field(50181; "No. colada proveedor"; Text[50])
        {
            trigger OnValidate();
            var

            begin

            end;
        }
    }
    var
        ReserveEntry: Record "Reservation Entry";
}