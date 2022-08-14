page 50185 "Composition Quality Headers"
{
    // version OneData016.01.00
    PageType = List;
    SourceTable = 50183;
    ApplicationArea = All;
    UsageCategory = Administration;
    Caption = 'Composition Quality';
    CardPageId = 50184;


    layout
    {
        area(content)
        {
            repeater(Group)
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

            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Co&mments")
            {
                ApplicationArea = All;
                Caption = 'Co&mments';
                Image = ViewComments;
                ToolTip = 'View or add comments for the record.';

                trigger OnAction()
                begin
                    rEC.ShowComments();
                end;
            }
        }
        area(navigation)
        {
            action("Action50184")
            {
                //ApplicationArea = Basic, Suite;
                //Caption = 'Commiss. Sales Persons Setup';
                //Image = Setup;
                // Promoted = true;
                // PromotedCategory = Category4;
                // PromotedIsBig = true;
                //RunObject = Page 99302;
            }
        }
    }
}

