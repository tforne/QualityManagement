tableextension 50180 NewFieldSalesHeader extends "Sales Header"
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
    }
}