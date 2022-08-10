page 50183 "Quality Measures Group"
{
    // version OneData016.01.00

    SourceTable = 50182;
    ApplicationArea = All;
    UsageCategory = Administration;
    Caption = 'Quality Measures Group';

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
            action(Actions50180)
            {
                ApplicationArea = Basic, Suite;
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