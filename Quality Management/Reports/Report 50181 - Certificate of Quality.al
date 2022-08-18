report 50181 "Certificate of Quality"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Quality Management/Reports/RDLCLayout/Certificate of Quality.rdl';
    Caption = 'Certificate of Quality';

    dataset
    {
        dataitem(ArchiveDocumentQuality; "Archive Document Qlty Header")
        {
            RequestFilterFields = "Document No.";
            dataitem("Integer"; "Integer")
            {
                DataItemTableView = SORTING(Number);
                MaxIteration = 1;
                column(DocumentNo; ArchiveDocumentQuality."Document No.")
                {
                }

                column(FORMAT_TODAY_0_4_; Format(Today, 0, 4))
                {
                }
                column(COMPANYNAME; COMPANYPROPERTY.DisplayName)
                {
                }
                column(COMPANYADDRESS; CompanyInfo.Address)
                {
                }
                column(COMPANYADDRESS2; CompanyInfo."Address 2")
                {
                }
                column(COMPANYCITY; CompanyInfo.City)
                {
                }
                column(COMPANYCOUNTRYCODE; CompanyInfo."Country/Region Code")
                {
                }
                column(Quality_Certificate_Lbl; Quality_Certificate_Lbl)
                {

                }
                column(Certificate_Nr_Lbl; Certificate_Nr_Lbl)
                {

                }
                column(Customer_Lbl; Customer_Lbl)
                {

                }
                column(Referencia_Lbl; Referencia_Lbl)
                {

                }
                column(Works_No_Lbl; Works_No_Lbl)
                {

                }
                column(Steel_Lbl; Steel_Lbl)
                {

                }
                column(Surface_Lbl; Surface_Lbl)
                {

                }
                column(Size_Lbl; Size_Lbl)
                {

                }
                column(Cast_Nr_Lbl; Cast_Nr_Lbl)
                {

                }
                column(Delivery_Nr_Lbl; Delivery_Nr_Lbl)
                {

                }
                column(Chemical_Composition_Lbl; Chemical_Composition_Lbl)
                {

                }
                column(Normative_Lbl; Normative_Lbl)
                {

                }
                column(Elements_Lbl; Elements_Lbl)
                {

                }
                column(Min_Lbl; Min_Lbl)
                {

                }
                column(Result_Lbl; Result_Lbl)
                {

                }
                column(Max_Lbl; Max_Lbl)
                {

                }
                trigger OnPostDataItem()
                begin

                end;
            }

            trigger OnAfterGetRecord()
            var
                Language: Codeunit Language;
            begin
                CurrReport.Language := Language.GetLanguageIdOrDefault(GetLanguageCode(ArchiveDocumentQuality));

                if PrintLineDetails then
                    GetLines(ArchiveDocumentQuality);
            end;

            trigger OnPreDataItem()
            var
                SalesShipmentHeader: Record "Sales Shipment Header";
                ServiceShipmentHeader: Record "Service Shipment Header";
                ReturnShipmentHeader: Record "Return Shipment Header";
                CertificateOfSupply2: Record "Certificate of Supply";
            begin
                if (GetFilter("Document No.") = '') xor
                   (GetRangeMin("Document No.") <> GetRangeMax("Document No."))
                then
                    Error(MultipleDocumentsErr);
            end;

        }
    }

    requestpage
    {
        layout
        {
            area(content)
            {
                field(PrintLineDetails; PrintLineDetails)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Print Line Details';
                    ToolTip = 'Specifies if you want to information from the lines on the shipment document on the certificate of supply.';
                }

            }
        }

        actions
        {
        }
    }

    labels
    {
    }

    trigger OnInitReport()
    begin
        CompanyInfo.Get();
        PrintLineDetails := true;

    end;

    var
        Quality_Certificate_Lbl: Label 'QUALITY CERTIFICATE';
        Certificate_Nr_Lbl: Label 'Certificate Nr';
        Customer_Lbl: Label 'Customer';
        Referencia_Lbl: Label 'Reference';
        Works_No_Lbl: Label 'Works No.';
        Steel_Lbl: Label 'Steel';
        Surface_Lbl: Label 'Surfase';
        Size_Lbl: Label 'Size (mm.)';
        Cast_Nr_Lbl: Label 'Cast Nr.';
        Delivery_Nr_Lbl: Label 'Delivery Nr.';
        Chemical_Composition_Lbl: Label 'CHEMICAL COMPOSITION';
        Normative_Lbl: Label 'NORM : DIN 17100';
        Elements_Lbl: Label 'Elements';
        Min_Lbl: Label 'MIN';
        Result_Lbl: Label 'RESULT';
        Max_Lbl: Label 'MAX';
        CompanyInfo: Record "Company Information";
        PrintLineDetails: Boolean;
        MultipleDocumentsErr: Label 'Multiple Document Types are not allowed.';
        Mechanical_Composition_Lbl: Label 'MECHANICAL COMPOSITION';
        Heat_Lbl : Label 'HEAT';

    local procedure IsReportInPreviewMode(): Boolean
    var
        MailManagement: Codeunit "Mail Management";
    begin
        exit(CurrReport.Preview or MailManagement.IsHandlingGetEmailBody);
    end;

    local procedure GetLines(ArchiveDocumentQuality: Record "Archive Document Qlty Header")
    var
    begin
    end;

    local procedure GetLanguageCode(ArchiveDocumentQuality: Record "Archive Document Qlty Header"): Code[10]
    var
        SalesHeader: Record "Sales Header";
        PurchaseHeader: Record "Purchase Header";
    begin
        case ArchiveDocumentQuality."Source Type" of
            36:
                begin
                    if SalesHeader.get(ArchiveDocumentQuality."Source Subtype", ArchiveDocumentQuality."Source ID") then
                        exit(SalesHeader."Language Code");

                end;
            38:
                begin
                    if PurchaseHeader.get(ArchiveDocumentQuality."Source Subtype", ArchiveDocumentQuality."Source ID") then
                        exit(PurchaseHeader."Language Code");
                end;
        end;
    end;
}

