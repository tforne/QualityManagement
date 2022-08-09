page 50180 "Quality Setup"
{
    // version OneData016.01.00

    SourceTable = 50180;
    ApplicationArea = All;
    UsageCategory = Administration;
    Caption = 'Configuración calidad';

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("User Id. Quality Manager"; Rec."User Id. Quality Manager")
                {
                    ApplicationArea = Basic, Suite;
                    DrillDownPageID = "User Group Members";
                    ToolTip = 'Specifies the number of sales orders that are not fully posted.';
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