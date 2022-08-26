report 50181 "Certificate of Quality"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Quality Management/Reports/RDLCLayout/Certificate of Quality.rdl';
    Caption = 'Certificate of Quality';

    dataset
    {
        dataitem(ArchiveDocumentQuality; "Archive Document Qlty Header")
        {
            column(DocumentNo; ArchiveDocumentQuality."Document No.")
            { }
            column(FORMAT_TODAY_0_4_; Format(Today, 0, 4))
            { }
            column(COMPANYNAME; COMPANYPROPERTY.DisplayName)
            { }
            column(COMPANYADDRESS; CompanyInfo.Address)
            { }
            column(COMPANYADDRESS2; CompanyInfo."Address 2")
            { }
            column(COMPANYCITY; CompanyInfo.City)
            { }
            column(COMPANYCOUNTRYCODE; CompanyInfo."Country/Region Code")
            { }
            column(CompanyInfo1Picture; CompanyInfo1.Picture)
            { }
            column(LogoCertificacion1Picture; QualitySetup."Logo Certification")
            { }
            column(Quality_Certificate_Lbl; Quality_Certificate_Lbl)
            { }
            column(Certificate_Nr_Lbl; Certificate_Nr_Lbl)
            { }
            column(Customer_Lbl; Customer_Lbl)
            { }
            column(Referencia_Lbl; Referencia_Lbl)
            { }
            column(Works_No_Lbl; Works_No_Lbl)
            { }
            column(Steel_Lbl; Steel_Lbl)
            { }
            column(Surface_Lbl; Surface_Lbl)
            { }
            column(Size_Lbl; Size_Lbl)
            { }
            column(Cast_Nr_Lbl; Cast_Nr_Lbl)
            { }
            column(Delivery_Nr_Lbl; Delivery_Nr_Lbl)
            { }
            column(Chemical_Composition_Lbl; Chemical_Composition_Lbl)
            { }
            column(Normative_Lbl; Normative_Lbl)
            { }
            column(Elements_Lbl; Elements_Lbl)
            { }
            column(Min_Lbl; Min_Lbl)
            { }
            column(Result_Lbl; Result_Lbl)
            { }
            column(Max_Lbl; Max_Lbl)
            { }
            column(Mechanical_Composition_Lbl; Mechanical_Composition_Lbl)
            { }
            column(Heat_Lbl; Heat_Lbl)
            { }
            column(Average_Lbl; Average_Lbl)
            { }
            column(Harddenability_Lbl; Harddenability_Lbl)
            { }
            column(Microscopic_Examitacion_Lbl; Microscopic_Examitacion_Lbl)
            { }
            column(Cast_No_Lbl; Cast_No_Lbl)
            { }
            column(Microinclusions_Lbl; Microinclusions_Lbl)
            { }
            column(Macroinclusions_Lbl; Macroinclusions_Lbl)
            { }
            column(Remarks_Lbl; Remarks_Lbl)
            { }
            column(Approved_Lbl; Approved_Lbl)
            { }
            column(Quality_Control_Departament_Lbl; Quality_Control_Departament_Lbl)
            { }
            column(ArchiveDocumentQuality_Description; ArchiveDocumentQuality.Description)
            { }
            column(Certificate_Nr; ArchiveDocumentQuality."Document No.")
            { }
            column(Customer_Name; SalesShipmentHeader."Sell-to Customer Name")
            { }
            // column(Referencia; Referencia)
            //{ }
            //column(Works_No; Works_No)
            //{ }
            //column(Steel; Steel)
            //{ }
            //column(Surface; Surface)
            //{ }
            //column(Size; Size)
            //{ }
            //column(Cast_Nr; Cast_Nr)
            //{ }

            column(Delivery_Nr; SalesShipmentHeader."No.")
            { }
            column(Chemical_Index_1; ChemicalQltyIndex[1])
            { }
            column(Chemical_Min_Value_1; ChemicalValues[1, 1])
            { }
            column(Chemical_Value_1; ChemicalValues[1, 2])
            { }
            column(Chemical_Max_Value_1; ChemicalValues[1, 3])
            { }
            column(Chemical_Index_2; ChemicalQltyIndex[2])
            { }
            column(Chemical_Min_Value_2; ChemicalValues[2, 1])
            { }
            column(Chemical_Value_2; ChemicalValues[2, 2])
            { }
            column(Chemical_Max_Value_2; ChemicalValues[2, 3])
            { }
            column(Chemical_Index_3; ChemicalQltyIndex[3])
            { }
            column(Chemical_Min_Value_3; ChemicalValues[3, 1])
            { }
            column(Chemical_Value_3; ChemicalValues[3, 2])
            { }
            column(Chemical_Max_Value_3; ChemicalValues[3, 3])
            { }



            trigger OnPreDataItem()
            var
                SalesShipmentHeader: Record "Sales Shipment Header";
                ServiceShipmentHeader: Record "Service Shipment Header";
                ReturnShipmentHeader: Record "Return Shipment Header";
            begin

            end;

            trigger OnAfterGetRecord()
            var
                Language: Codeunit Language;
            begin
                CurrReport.Language := Language.GetLanguageIdOrDefault(GetLanguageCode(ArchiveDocumentQuality));

                // if not SalesShipmentHeader.get(ArchiveDocumentQuality."Sales Shipment No.") then SalesShipmentHeader.init;
                // Reads measures value 
                message('antes getlines');
                GetLines(ArchiveDocumentQuality, ChemicalValues);
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
        companyInfo1.get();
        QualitySetup.get();
        CompanyInfo1.CalcFields(Picture);
        QualitySetup.CalcFields("Logo Certification");

    end;


    var
        CompanyInfo: Record "Company Information";
        CompanyInfo1: Record "Company Information";
        CompanyInfo2: Record "Company Information";
        CompanyInfo3: Record "Company Information";
        QualitySetup: Record "Quality Setup";
        PrintLineDetails: Boolean;
        MultipleDocumentsErr: Label 'Multiple Document Types are not allowed.';
        Quality_Certificate_Lbl: Label 'QUALITY CERTIFICATE';
        Certificate_Nr_Lbl: Label 'Certificate_Nr';
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
        Mechanical_Composition_Lbl: Label 'MECHANICAL COMPOSITION';
        Heat_Lbl: Label 'HEAT';
        Average_Lbl: Label 'AVERAGE';
        Harddenability_Lbl: Label 'HARDENABILITY';
        Microscopic_Examitacion_Lbl: label 'MICROSCOPIC EXAMINATION';
        Cast_No_Lbl: label 'Cast No.';
        Microinclusions_Lbl: Label 'MICROINCLUSIONS';
        Macroinclusions_Lbl: Label 'MACROINCLUSIONS';
        Remarks_Lbl: Label '*REMARKS';
        Approved_Lbl: Label 'Approved';
        Quality_Control_Departament_Lbl: Label 'Quality Control Departament';
        SalesShipmentHeader: Record "Sales Shipment Header";
        ChemicalQltyIndex: array[20] of Text;
        ChemicalValues: Array[20, 3] of Decimal;

    local procedure IsReportInPreviewMode(): Boolean
    var
        MailManagement: Codeunit "Mail Management";
    begin
        exit(CurrReport.Preview or MailManagement.IsHandlingGetEmailBody);
    end;

    local procedure GetLines(ArchiveDocumentQuality: Record "Archive Document Qlty Header"; ChemicalValues: Array[20, 3] of Decimal)
    var
        ArchiveDocQltyLine: Record "Archive Document Qlty Line";
        QualityMeasure: Record "Quality Measure";
        i: integer;
    begin
        i := 1;
        message('Inicio getlines');
        ArchiveDocQltyLine.reset;
        ArchiveDocQltyLine.SetRange("Document No.", ArchiveDocumentQuality."Document No.");
        ArchiveDocQltyLine.setrange("Qlty Measure Group Code", 'CHEMICAL');
        if ArchiveDocQltyLine.FindFirst() then
            repeat
                if i <= 20 then begin
                    if not QualityMeasure.get(ArchiveDocQltyLine."Qlty Measure Code") then QualityMeasure.init;
                    ChemicalQltyIndex[i] := QualityMeasure."Description mesure unit";
                    ChemicalValues[i, 1] := ArchiveDocQltyLine."Min. Value";
                    Chemicalvalues[i, 2] := ArchiveDocQltyLine.Value;
                    ChemicalValues[i, 3] := ArchiveDocQltyLine."Max. Value";
                    message('valor :%1', ChemicalValues[i, 2]);
                end;
                i := i + 1;
                message('%1', i)
            until (ArchiveDocQltyLine.next = 0)
    end;

    local procedure GetLanguageCode(ArchiveDocumentQuality: Record "Archive Document Qlty Header"): Code[10]
    var
        SalesHeader: Record "Sales Header";
        PurchaseHeader: Record "Purchase Header";
    begin
        case ArchiveDocumentQuality."Source Type" of
            ArchiveDocumentQuality."Source Type"::"Sales Order":
                begin
                    if SalesHeader.get(1, ArchiveDocumentQuality."Source ID") then
                        exit(SalesHeader."Language Code");
                end;
            ArchiveDocumentQuality."Source Type"::"Purchase Order":
                begin
                    if PurchaseHeader.get(1, ArchiveDocumentQuality."Source ID") then
                        exit(PurchaseHeader."Language Code");
                end;
        end;
    end;
}

