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
    actions
    {
        modify(PageInteractionLogEntries)
        {
            Caption = 'Open log incidents';
            Promoted = true;
            PromotedCategory = Process;
            PromotedIsBig = true;
            PromotedOnly = true;
        }
        moveafter("Create &Warehouse Shipment"; PageInteractionLogEntries)
    }
    var

}