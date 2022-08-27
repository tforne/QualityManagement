tableextension 50187 NewFieldSegmentLine extends "Segment Line"
{
    fields
    {
        field(50200; "Proposed solution"; Text[250])
        {
            Caption = 'Proposed solution';
            DataClassification = ToBeClassified;
        }
        field(50201; "Incident No."; Code[20])
        {
            Caption = 'Nº Interaccion';
            DataClassification = ToBeClassified;
        }
        field(50202; "Description Incident"; text[250])
        {
            Caption = 'Description Incident';
            DataClassification = ToBeClassified;
        }
        field(50203; "Departament Code"; Code[20])
        {
            Caption = 'Departament Code';
            DataClassification = ToBeClassified;
            TableRelation = Dimension.Code;
        }

        field(50204; "Responsible Code"; Code[20])
        {
            Caption = 'Responsible Code';
            DataClassification = ToBeClassified;
            TableRelation = Employee."No.";
        }
        field(50205; "Responsible Name"; Text[50])
        {
            Caption = 'Responsible Name';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = lookup(Employee.Name where("No." = field("Responsible Code")));
        }
        field(50206; "Status"; Option)
        {
            Caption = 'Status';
            OptionMembers = Open,Resolved,"Unresolved",Cancelled;
        }
    }
}
