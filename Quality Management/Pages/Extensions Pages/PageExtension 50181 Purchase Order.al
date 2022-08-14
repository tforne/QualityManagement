pageextension 50181 NewFieldPurchaseOrder extends "Purchase Order"
{
    layout
    {
        addafter(General)
        {
            group(Quality)
            {
                //Visible = true;
                field("Composition Quality Code"; Rec."Composition Quality Code")
                {
                    ApplicationArea = All;

                }
                //Visible = true;
                field("Cast No. Vendor"; Rec."Cast No. Vendor")
                {
                    ApplicationArea = All;

                }
            }
            // Add changes to page layout here
        }
    }
}