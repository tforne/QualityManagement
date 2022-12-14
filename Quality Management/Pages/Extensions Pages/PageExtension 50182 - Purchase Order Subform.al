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
            field("Cast No. Vendor"; Rec."Cast No. Vendor")
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
                    ApplicationArea = All;
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
                action("Documents Quality")
                {
                    ApplicationArea = all;
                    Caption = 'Documents Quality';
                    Ellipsis = true;
                    Image = Reserve;
                    Enabled = Rec.Type = Rec.Type::Item;
                    ToolTip = 'Document Quality';

                    trigger OnAction()
                    var
                        DocQlty: Record "Archive Document Qlty Header";
                    begin
                        DocQlty.FindArchiveDocumentQualityHeader(2, rec."Document No.", rec."Line No.", '')
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