pageextension 50188 NewFieldInteractionLogEntries extends "Interaction Log Entries"
{
    Caption = 'Movs. log. incident';

    layout
    {
        modify("Document No.")
        {
            Visible = true;
            ApplicationArea = All;
        }
        addafter("Document No.")
        {
            field("Nº Interaccion"; Rec."Nº Interaccion")
            {
                Caption = 'Nº Incidencia';
                ApplicationArea = all;
            }
        }
        addafter(Description)
        {
            field("Descripcion incidencia"; Rec."Descripcion incidencia")
            {
                Caption = 'Descripción incidencia';
                ApplicationArea = all;
            }
            field(Estado; Rec.Estado)
            {
                Caption = 'Estado';
                ApplicationArea = all;
            }
        }

        modify(Canceled)
        {
            Visible = false;
        }
        modify("Attempt Failed")
        {
            Visible = false;
        }
        modify(Attachment)
        {
            Visible = false;
        }

        modify("Contact No.")
        {
            Visible = false;
        }
        modify("Contact Name")
        {
            Visible = false;
        }
        modify("Contact Company Name")
        {
            Visible = false;
        }
        modify(Evaluation)
        {
            Visible = false;
        }
        modify("Duration (Min.)")
        {
            Visible = false;
        }
        modify("Campaign No.")
        {
            Visible = false;
        }
        modify("Entry No.")
        {
            Visible = false;
        }
    }

    actions
    {
        modify("Create &Interaction")
        {
            Caption = 'Create Incident';
        }

        addafter("Create &Interaction")
        {
            action("Abrir Interaccion")
            {
                ApplicationArea = All;
                Caption = 'Abrir Incidencia', comment = 'ESP="Abrir Incidencia"';
                Image = CreateInteraction;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Open an Incidencia with a specified contact.';

                trigger OnAction()
                var
                    rIntereaccion: record "Interaction Log Entry";
                    pIntereaccion: page "Interaction";
                begin
                    rIntereaccion.Reset();
                    rIntereaccion.SetRange("Nº Interaccion", Rec."Nº Interaccion");
                    IF rIntereaccion.FINDFIRST() THEN
                        Page.RunModal(50201, rIntereaccion)

                end;

            }
        }

    }
}

