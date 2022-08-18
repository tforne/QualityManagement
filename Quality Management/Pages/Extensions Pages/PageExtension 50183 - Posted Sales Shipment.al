pageextension 50183 NewFieldPostSalesShipm extends "Posted Sales Shipment"
{
    layout
    {
        addafter(Shipping)
        {
            group("Quality Information")
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
        // Adding a new action group 'MyNewActionGroup' in the 'Creation' area
        addlast(processing)
        {
            group("Quality")
            {
                Caption = 'Quality';
                action("Documents Quality")
                {
                    ApplicationArea = all;
                    Caption = 'Documents Quality';
                    Ellipsis = true;
                    Image = Reserve;
                    ToolTip = 'Document Quality';

                    trigger OnAction()
                    var
                        DocQlty: Record "Archive Document Qlty Header";
                    begin
                        DocQlty.FindArchiveDocumentQualityHeader(36, 1, rec."Order No.", '', 0, 0)
                    end;
                }
                action("Quality Compos. Value Entry")
                {
                    ApplicationArea = Reservation;
                    Caption = 'Quality Compos. Value Entry';
                    Ellipsis = true;
                    Image = Reserve;
                    Enabled = true;
                    ToolTip = 'Quality Compos. Value Entry';

                    trigger OnAction()
                    begin
                        // Find();
                        ShowQualityValueEntry();
                    end;
                }
                action(PrintCertificateofQuality)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Print Certificate of Quality';
                    Image = PrintReport;
                    Promoted = false;
                    ToolTip = 'Print the certificate of quality that you must send to your customer.';

                    trigger OnAction()
                    var
                        DocQlty: Record "Archive Document Qlty Header";
                    begin
                        DocQlty.Print(36, 1, rec."Order No.", '', 0, 0)
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

        rec.TestField("No.");
        Clear(QualityValueEntry);
        // Reservation.SetReservSource(Rec);
        QualityValueEntry.RunModal();
        //  UpdatePlanned();
    end;
}