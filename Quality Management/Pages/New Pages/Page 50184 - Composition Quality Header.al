page 50184 "Composition Quality Header"
{
    // version OneData016.01.00

    PageType = Card;
    SourceTable = 50183;
    ApplicationArea = All;
    UsageCategory = Administration;
    Caption = 'Composition Quality';


    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("Code"; Rec."Code")
                {
                    ApplicationArea = All;
                    Editable = true;
                }
                field("Description"; Rec.Description)
                {
                    ApplicationArea = All;
                    Editable = true;
                }
                field("Legal Normative Code"; Rec."Legal Normative Code")
                {
                    ApplicationArea = All;
                    Editable = true;
                }
                field("Raw Materials Group Code"; Rec."Raw Materials Group Code")
                {
                    ApplicationArea = All;
                    Editable = true;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    Editable = true;
                }
            }
            part("Composition Quality Line"; "Composition Quality Subform")
            {
                ApplicationArea = Basic, Suite;
                Editable = true;
                // Enabled = "Sell-to Customer No." <> '';
                SubPageLink = "Composition Quality Code" = FIELD("Code");
                // UpdatePropagation = Both;
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Load quality measures")
            {
                ApplicationArea = All;
                Caption = 'Load quality measures';
                Image = ImportCodes;
                Promoted = true;
                ToolTip = 'Load quality measures';

                trigger OnAction()
                begin
                    Rec.LoadQualityMesures(Rec.code);
                end;
            }

        }
        area(navigation)
        {
            action("Co&mments")
            {
                ApplicationArea = All;
                Caption = 'Co&mments';
                Image = ViewComments;
                ToolTip = 'View or add comments for the record.';

                trigger OnAction()
                begin
                    Rec.ShowComments();
                end;
            }
        }
    }
    procedure Print()
    begin
        REPORT.RunModal(REPORT::"Certificate of Quality", true, false, Rec);
    end;
}

