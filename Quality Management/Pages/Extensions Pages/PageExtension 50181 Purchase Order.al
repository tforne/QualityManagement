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
                field("No. colada proveedor"; Rec."No. colada proveedor")
                {
                    ApplicationArea = All;

                }
            }
            // Add changes to page layout here
        }
    }
}