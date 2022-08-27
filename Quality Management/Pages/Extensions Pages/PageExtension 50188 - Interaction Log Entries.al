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
            field("Incident No."; Rec."Incident No.")
            {
                Caption = 'Incident No.';
                ApplicationArea = all;
            }
        }
        addafter(Description)
        {
            field("Description Incident"; Rec."Description Incident")
            {
                Caption = 'Description Incident';
                ApplicationArea = all;
            }
            field(Status; Rec.Status)
            {
                Caption = 'Status';
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
            action("Open Incident")
            {
                ApplicationArea = All;
                Caption = 'Open Incident', comment = 'Open Incident';
                Image = CreateInteraction;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Open an Incidencia with a specified contact.';

                trigger OnAction()
                var
                    rIntereaccion: record "Interaction Log Entry";
                    pIntereaccion: page "Create Incident";
                begin
                    rec.TestField("Incident No.");
                    rIntereaccion.Reset();
                    rIntereaccion.SetRange("Incident No.", Rec."Incident No.");
                    IF rIntereaccion.FINDFIRST() THEN
                        Page.RunModal(50201, rIntereaccion)

                end;

            }
        }

    }
}

