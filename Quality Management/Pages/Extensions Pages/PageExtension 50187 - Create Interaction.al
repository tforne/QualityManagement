pageextension 50187 NewFieldCreateInteraction extends "Create Interaction"
{
    Caption = 'Create Incident';

    layout
    {
        addafter("Salesperson Code")
        {
            field("Responsible Code"; Rec."Responsible Code")
            {
                Caption = 'Responsible Code';
                ApplicationArea = all;
            }

            field("Responsible Name"; Rec."Responsible Name")
            {
                Caption = 'Responsible Name';
                ApplicationArea = all;
            }
            field("Departament Code"; Rec."Departament Code")
            {
                Caption = 'Departament Code';
                ApplicationArea = all;
            }
            field(Status; Rec.Status)
            {
                Caption = 'Status';
                ApplicationArea = all;
            }
        }
        addafter(Description)
        {
            field("Description Incident"; Rec."Description Incident")
            {
                caption = 'Description Incident';
                ApplicationArea = All;
            }
        }
        addafter(Evaluation)
        {
            field("Proposed solution"; Rec."Proposed solution")
            {
                caption = 'Proposed solution';
                ApplicationArea = All;
            }
        }

    }
}
