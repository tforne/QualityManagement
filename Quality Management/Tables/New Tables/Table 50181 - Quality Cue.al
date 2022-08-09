table 50181 "Quality Cue"
{
    // version OneData016.01.00

    Caption = 'Quality Cue';
    DrillDownPageID = 50181;
    LookupPageID = 50181;

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Comp. Qlty - Open"; Integer)
        {
            CalcFormula = Count("Composition Quality Header" WHERE(Status = const("Open")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(3; "Comp. Qlty - Pending Approval"; Integer)
        {
            CalcFormula = Count("Composition Quality Header" WHERE(Status = const("Pending Approval")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(4; "Sales Shipment - Pending Qlty."; Integer)
        {
            //CalcFormula = Count("Composition Quality Header" WHERE(Status = const("Pending Approval")));
            Editable = false;
            //FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "Primary Key")
        {
        }
    }

    fieldgroups
    {
    }
    var
        salesCue: Record "Sales Cue";
}

