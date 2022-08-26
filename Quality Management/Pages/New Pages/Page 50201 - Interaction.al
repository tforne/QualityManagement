page 50201 Interaction
{

    Caption = 'Interaction';
    PageType = Card;
    SourceTable = "Interaction Log Entry";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Nº Interaccion"; Rec."Nº Interaccion")
                {
                    Editable = false;
                    ToolTip = 'Specifies the value of the Nº Incidencia field';
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

                // field("Document Type"; Rec."Document Type")
                // {
                //     Editable = false;
                //     ToolTip = 'Specifies the value of the Document Type field';
                //     ApplicationArea = All;
                // }
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

                field("Descripcion incidencia"; Rec."Descripcion incidencia")
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

                field("Codigo responsable"; Rec."Codigo responsable")
                {
                    Caption = 'Código responsable';
                    ApplicationArea = all;
                }

                field("Nombre responsable"; Rec."Nombre responsable")
                {
                    Caption = 'Nombre responsable';
                    ApplicationArea = all;
                }
                field(Departamento; Rec.Departamento)
                {
                    Caption = 'Departamento';
                    ApplicationArea = all;
                }
                field(Estado; Rec.Estado)
                {
                    Caption = 'Estado';
                    ApplicationArea = all;
                }

                // field(Evaluation; Rec.Evaluation)
                // {
                //     Editable = true;
                //     ToolTip = 'Specifies the value of the Evaluation field';
                //     ApplicationArea = All;
                // }
            }
            group(Detalles)
            {
                field("Interaction Template Code"; Rec."Interaction Template Code")
                {
                    ToolTip = 'Specifies the value of the Interaction Template Code field';
                    ApplicationArea = All;
                }
                // field("Interaction Language Code"; Rec."Interaction Language Code")
                // {
                //     ToolTip = 'Specifies the value of the Interaction Language Code field';
                //     ApplicationArea = All;
                // }
                // field("Interaction Group Code"; Rec."Interaction Group Code")
                // {
                //     ToolTip = 'Specifies the value of the Interaction Group Code field';
                //     ApplicationArea = All;
                // }
                // field("Correspondence Type"; Rec."Correspondence Type")
                // {
                //     ToolTip = 'Specifies the value of the Correspondence Type field';
                //     ApplicationArea = All;
                // }
                field("Date"; Rec."Date")
                {
                    ToolTip = 'Specifies the value of the Date field';
                    ApplicationArea = All;
                }
                // field(Postponed; Rec.Postponed)
                // {
                //     ToolTip = 'Specifies the value of the Postponed field';
                //     ApplicationArea = All;
                // }

                // field("Opportunity No."; Rec."Opportunity No.")
                // {
                //     ToolTip = 'Specifies the value of the Opportunity No. field';
                //     ApplicationArea = All;
                // }
                // field("Campaign No."; Rec."Campaign No.")
                // {
                //     ToolTip = 'Specifies the value of the Campaign No. field';
                //     ApplicationArea = All;
                // }
                // field("To-do No."; Rec."To-do No.")
                // {
                //     ToolTip = 'Specifies the value of the Task No. field';
                //     ApplicationArea = All;
                // }
                // field("Version No."; Rec."Version No.")
                // {
                //     ToolTip = 'Specifies the value of the Version No. field';
                //     ApplicationArea = All;
                // }
                // field(Comment; Rec.Comment)
                // {
                //     ToolTip = 'Specifies the value of the Comment field';
                //     ApplicationArea = All;
                // }
                field("Potencial Solucion"; Rec."Potencial Solucion")
                {
                    MultiLine = true;
                    ToolTip = 'Specifies the value of the potencial solución field';
                    ApplicationArea = All;
                }

            }
        }
    }

}
