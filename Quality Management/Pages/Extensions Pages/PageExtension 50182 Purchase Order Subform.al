pageextension 50182 NewFieldPurchaseOrderLine extends "Purchase Order Subform"
{
    layout
    {
        addafter("Bin Code")
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

    actions
    {
        // Adding a new action group 'MyNewActionGroup' in the 'Creation' area
        addafter("O&rder")
        {
            group(Quality)
            {

                action("Quality Compos. Value Entry")
                {
                    ApplicationArea = Reservation;
                    Caption = 'Quality Compos. Value Entry';
                    Ellipsis = true;
                    Image = Reserve;
                    Enabled = Rec.Type = Rec.Type::Item;
                    ToolTip = 'Quality Compos. Value Entry';

                    trigger OnAction()
                    begin
                        // Find();
                        ShowQualityValueEntry();
                    end;
                }
            }
        }
    }
    procedure ShowQualityValueEntry()
    var
        QualityValueEntry: Page "Quality Compos. Value Entry";
        IsHandled: Boolean;
    begin
        IsHandled := false;

        if IsHandled then
            exit;

        rec.TestField(rec.Type, rec.Type::Item);
        rec.TestField("No.");
        Clear(QualityValueEntry);
        // Reservation.SetReservSource(Rec);
        QualityValueEntry.RunModal();
        //  UpdatePlanned();
    end;
}