tableextension 50188 NewFieldInteractionLogEntry extends "Interaction Log Entry"
{
    fields
    {
        field(50180; "Proposed solution"; Text[100])
        {
            Caption = 'Proposed solution';
            DataClassification = ToBeClassified;
        }
        field(50181; "Incident No."; Code[20])
        {
            Caption = 'Incident No.';
            DataClassification = ToBeClassified;
        }
        field(50182; "Description Incident"; text[250])
        {
            Caption = 'Description Incident';
            DataClassification = ToBeClassified;
        }
        field(50183; "Departament Code"; Code[20])
        {
            Caption = 'Departament Code';
            DataClassification = ToBeClassified;
            TableRelation = Dimension.Code;
        }

        field(50184; "Responsible Code"; Code[20])
        {
            Caption = 'Responsible Code';
            DataClassification = ToBeClassified;
            TableRelation = Employee."No.";
        }
        field(50185; "Responsible Name"; Text[50])
        {
            Caption = 'Responsible Name';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = lookup(Employee.Name where("No." = field("Responsible Code")));
        }
        field(50186; "Status"; Option)
        {
            Caption = 'Status';
            OptionMembers = Open,Resolved,"Unresolved",Cancelled;
        }
        field(50187; "Quality Incident"; Boolean)
        {
            Caption = 'Quality incident';
            Editable = false;
        }

    }
}
