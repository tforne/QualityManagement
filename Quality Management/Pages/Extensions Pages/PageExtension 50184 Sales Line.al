pageextension 50184 NewFieldSalesLine extends "Sales Lines"
{
    layout
    {
        addafter("Line Amount")
        {
            //Visible = true;
            field("Composition Quality Code"; Rec."Composition Quality Code")
            {
                ApplicationArea = All;

            }
            // Add changes to page layout here
        }
    }
    var
        salesordersubform: page "Sales Order Subform";
}