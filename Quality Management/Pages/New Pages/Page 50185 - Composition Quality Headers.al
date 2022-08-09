page 50185 "Headers Composition Quality"
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
            }
        }
    }

    actions
    {
        area(processing)
        {
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

