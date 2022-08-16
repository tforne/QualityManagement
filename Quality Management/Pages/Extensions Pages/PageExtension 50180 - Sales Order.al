pageextension 50180 NewFieldSalesOrder extends "Sales Order"
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
            }
            // Add changes to page layout here
        }
    }
    var
        salesordersubform: page "Sales Order Subform";
}