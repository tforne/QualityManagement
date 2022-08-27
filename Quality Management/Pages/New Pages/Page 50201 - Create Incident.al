page 50201 "Create Incident"
{

    Caption = 'Create Incident';
    PageType = Card;
    SourceTable = "Interaction Log Entry";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Incident No."; Rec."Incident No.")
                {
                    Editable = false;
                    ToolTip = 'Specifies the value of the Incident No. field';
                    ApplicationArea = All;
                }
                field("Contact No."; Rec."Contact No.")
                {
                    Editable = false;
                    ToolTip = 'Specifies the value of the Contact No. field';
                    ApplicationArea = All;
                }
                field("Contact Name"; Rec."Contact Name")
                {
                    Editable = false;
                    ToolTip = 'Specifies the value of the Contact Name field';
                    ApplicationArea = All;
                }

                field("Document No."; Rec."Document No.")
                {
                    Editable = false;
                    ToolTip = 'Specifies the value of the Document No. field';
                    ApplicationArea = All;
                }

                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field';
                    ApplicationArea = All;
                }

                field("Description Incident"; Rec."Description Incident")
                {
                    MultiLine = true;
                    ToolTip = 'Specifies the value of the Description incidencia field';
                    ApplicationArea = All;
                }
                field("Salesperson Code"; Rec."Salesperson Code")
                {
                    ToolTip = 'Specifies the value of the Salesperson Code field';
                    ApplicationArea = All;
                }

                field("Responsible Code"; Rec."Responsible Code")
                {
                    Caption = 'Specifiec the value of the Responsible Code field';
                    ApplicationArea = all;
                }

                field("Responsible Name"; Rec."Responsible Name")
                {
                    Caption = 'Specifiec the value of the Responsible Name field';
                    ApplicationArea = all;
                }
                field("Departament Code"; Rec."Departament Code")
                {
                    Caption = 'Specifiec the value of theDepartament Code field';
                    ApplicationArea = all;
                }
                field(Status; Rec.Status)
                {
                    Caption = 'Specifiec the value of the Status field';
                    ApplicationArea = all;
                }
            }
            group(Detalles)
            {
                field("Interaction Template Code"; Rec."Interaction Template Code")
                {
                    ToolTip = 'Specifies the value of the Interaction Template Code field';
                    ApplicationArea = All;
                }
                field("Date"; Rec."Date")
                {
                    ToolTip = 'Specifies the value of the Date field';
                    ApplicationArea = All;
                }
                field("Proposed solution"; Rec."Proposed solution")
                {
                    MultiLine = true;
                    ToolTip = 'Specifies the value of the potencial solución field';
                    ApplicationArea = All;
                }

            }
        }
    }

}
