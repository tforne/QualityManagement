pageextension 50186 NewFieldPostSalShipmentUpdate extends "Posted Sales Shipment - Update"
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
                // Add changes to page layout here
            }
        }
    }
}