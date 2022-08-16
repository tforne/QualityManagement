pageextension 50183 NewFieldPostSalesShipm extends "Posted Sales Shipment"
{
    layout
    {
        addafter(General)
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
                action("Quality Compos. Headers")
                {
                    ApplicationArea = Reservation;
                    Caption = 'Quality Compos. Header';
                    Ellipsis = true;
                    Image = Reserve;
                    Enabled = true;
                    ToolTip = 'Quality Compos. Header';

                    trigger OnAction()
                    begin
                        // Find();
                        ShowQualityValueEntry();
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
                        CertificateOfSupply: Record "Certificate of Supply";
                    begin
                        CertificateOfSupply.SetRange("Document Type", CertificateOfSupply."Document Type"::"Sales Shipment");
                        CertificateOfSupply.SetRange("Document No.", Rec."No.");
                        CertificateOfSupply.Print;
                    end;
                }

            }

        }
        addafter(CertificateOfSupplyDetails)
        {
            action("Print Quality Certificate")
            {
                ApplicationArea = Basic, Suite;
                Caption = '&Print Quality Certificate';
                Ellipsis = true;
                Image = Print;
                Promoted = true;
                PromotedCategory = Category4;
                ToolTip = 'Print the Quality Certificate.';

                trigger OnAction()
                var
                    SalesShptHeader: record "Sales Shipment Header";
                begin
                    SalesShptHeader := Rec;
                end;
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