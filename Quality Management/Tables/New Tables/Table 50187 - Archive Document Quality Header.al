table 50187 "Archive Document Qlty Header"
{

    Caption = 'Archive Document Quality Header';
    DrillDownPageID = 50189;
    LookupPageID = 50189;


    fields
    {
        field(1; "Document No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Composition Quality Code"; Code[20])
        {
            TableRelation = "Composition Quality Header";
            DataClassification = ToBeClassified;
        }
        field(3; "Description"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Legal Normative Code"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Raw Materials Group Code"; Text[20])
        {
            DataClassification = ToBeClassified;
        }
        field(6; Status; Enum CompositionQualityStatus)
        {
            DataClassification = ToBeClassified;
        }
        field(9; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(8; "Creation Date"; Date)
        {
            Caption = 'Creation Date';
        }
        field(10; "Source Type"; Option)
        {
            Caption = 'Source Type';
            OptionCaption = ',Sales Order,Purchase Order';
            OptionMembers = "","Sales Order","Purchase Order";
        }

        field(12; "Source ID"; Code[20])
        {
            Caption = 'Source ID';
        }
        field(15; "Source Ref. No."; Integer)
        {
            Caption = 'Source Ref. No.';
        }
        field(16; "Item No."; code[20])
        {
            Caption = 'Item No.';
            Editable = false;
            TableRelation = "No. Series";

        }
        field(20; "Cast No. Vendor"; Text[50])
        {
            Caption = 'Cast No. Vendor';
            Editable = false;
            trigger OnValidate();
            begin

            end;
        }
        field(30; "Link - Source Type"; Option)
        {
            Caption = 'Link - Source Type';
            OptionCaption = ',Sales Order,Purchase Order';
            OptionMembers = "","Sales Order","Purchase Order";

        }

        field(32; "Link - Source ID"; Code[20])
        {
            Caption = 'Link - Source ID';
            TableRelation =
                IF ("Link - Source Type" = CONST("Sales Order")) "Sales Header"."No." WHERE("document type" = CONST("order"), "Composition Quality Code" = field("Composition Quality Code"))
            ELSE
            if ("Link - Source Type" = CONST("Purchase Order")) "Purchase Header"."No." WHERE("document type" = CONST("order"), "Composition Quality Code" = field("Composition Quality Code"));
        }
    }
    keys
    {
        key(Key1; "Document No.")
        {
        }
    }

    fieldgroups
    {
    }
    trigger OnInsert()
    var
        IsHandled: Boolean;
    begin
        IsHandled := false;
        if IsHandled then
            exit;

        if "Document No." = '' then begin
            QualitySetup.Get();
            QualitySetup.TestField("Archive Doc. Quality Nos.");
            NoSeriesMgt.InitSeries(QualitySetup."Archive Doc. Quality Nos.", xRec."No. Series", 0D, "Document No.", "No. Series");
        end;
    end;

    var
        Customer: record "Sales Header";
        QualitySetup: record "Quality Setup";
        NoseriesMgt: Codeunit NoSeriesManagement;
        SalesLine: Record "Purchase Line";

    procedure CalculateValuePurchaseOrder(ArchiveDocumentQlty: record "Archive Document Qlty Header"; QltyMeasureCode: Code[20]; var _Status: Enum "Quality Status"): Decimal;
    var
        PurchaseArchiveDocumentQlty: record "Archive Document Qlty Header";
        PurchaseArchiveDocumentQltyLine: record "Archive Document Qlty Line";
    begin
        PurchaseArchiveDocumentQlty.reset;
        PurchaseArchiveDocumentQlty.setrange("Source Type", ArchiveDocumentQlty."Source Type"::"Purchase Order");
        PurchaseArchiveDocumentQlty.Setrange("Source ID", ArchiveDocumentQlty."Link - Source ID");
        if PurchaseArchiveDocumentQlty.FindFirst() then begin
            PurchaseArchiveDocumentQltyLine.reset;
            PurchaseArchiveDocumentQltyLine.setrange("Document No.", PurchaseArchiveDocumentQlty."Document No.");
            PurchaseArchiveDocumentQltyLine.setrange("Qlty Measure Code", QltyMeasureCode);
            if PurchaseArchiveDocumentQltyLine.FindFirst() then begin
                _Status := PurchaseArchiveDocumentQltyLine.Status;
                exit(PurchaseArchiveDocumentQltyLine."Value");
            end;
        end;
        exit(0);
    end;

    procedure InitArchiveDocumentQualityHeader(ArchiveDocumentQlty: record "Archive Document Qlty Header");
    var
        PurchaseArchiveDocumentQlty: record "Archive Document Qlty Header";
        PurchaseArchiveDocumentQltyLine: record "Archive Document Qlty Line";
        ArchiveDocumentQltyLine: record "Archive Document Qlty Line";
        CompositionQualityHeader: record "Composition Quality Header";
        CompositionQualityLine: Record "Composition Quality Line";
        purchaseLine: Record "Purchase Line";
        LineNo: integer;
        _status: enum "Quality Status";
        _Value: decimal;
    begin
        ArchiveDocumentQlty.TestField("Composition Quality Code");
        if CompositionQualityHeader.get(ArchiveDocumentQlty."Composition Quality Code") then begin
            ArchiveDocumentQltyLine.reset;
            ArchiveDocumentQltyLine.setrange("Document No.", ArchiveDocumentQlty."Document No.");
            ArchiveDocumentQltyLine.DeleteAll();

            LineNo := 10000;
            CompositionQualityLine.reset;
            CompositionQualityLine.setrange("Composition Quality Code", CompositionQualityHeader.Code);
            if CompositionQualityLine.FindFirst() then
                repeat
                    ArchiveDocumentQltyLine."Document No." := ArchiveDocumentQlty."Document No.";
                    ArchiveDocumentQltyLine."Line No." := LineNo;
                    ArchiveDocumentQltyLine."Composition Quality Code" := ArchiveDocumentQlty."Composition Quality Code";
                    ArchiveDocumentQltyLine."Description" := CompositionQualityLine.Description;
                    ArchiveDocumentQltyLine."Legal Normative Code" := ArchiveDocumentQlty."Legal Normative Code";
                    ArchiveDocumentQltyLine."Raw Materials Group Code" := ArchiveDocumentQlty."Raw Materials Group Code";
                    ArchiveDocumentQltyLine.Status := ArchiveDocumentQltyLine.Status::"Dentro del rango";
                    ArchiveDocumentQltyLine."Cast No. Vendor" := ArchiveDocumentQlty."Cast No. Vendor";
                    ArchiveDocumentQltyLine."Item No." := ArchiveDocumentQlty."Item No.";
                    ArchiveDocumentQltyLine."Qlty Measure Code" := CompositionQualityLine."Qlty Measure Code";
                    ArchiveDocumentQltyLine."Qlty Measure Group Code" := CompositionQualityLine."Qlty Measure Group Code";
                    ArchiveDocumentQltyLine."Min. Value" := CompositionQualityLine."Min. Value";
                    ArchiveDocumentQltyLine."Max. Value" := CompositionQualityLine."Max. Value";
                    ArchiveDocumentQltyLine."Link - Source Type" := 0;
                    ArchiveDocumentQltyLine."Link - Source ID" := '';
                    ArchiveDocumentQltyLine."Value" := 0;
                    // Charge value
                    if ArchiveDocumentQlty."Link - Source Type" = ArchiveDocumentQlty."Link - Source Type"::"Purchase Order" then begin
                        if ArchiveDocumentQlty."Link - Source ID" <> '' then begin
                            _Value := CalculateValuePurchaseOrder(ArchiveDocumentQlty, CompositionQualityLine."Qlty Measure Code", _status);
                            if _Value <> 0 then begin
                                ArchiveDocumentQltyLine."Link - Source Type" := ArchiveDocumentQlty."Link - Source Type";
                                ArchiveDocumentQltyLine."Link - Source ID" := ArchiveDocumentQlty."Link - Source ID";
                                ArchiveDocumentQltyLine.validate(Value, _Value);
                                ArchiveDocumentQltyLine.Status := _status;
                            end;
                        end;
                    end;

                    ArchiveDocumentQltyLine."Lot No." := '';
                    ArchiveDocumentQltyLine."Variant Code" := '';
                    ArchiveDocumentQltyLine."Package No." := '';
                    ArchiveDocumentQltyLine.insert;
                    LineNo := LineNo + 10000;

                until CompositionQualityLine.next = 0;
        end;

    end;

    procedure FindArchiveDocumentQualityHeader(SourceType: Integer; SourceID: Code[20]; SourceRefNo: Integer): Boolean;
    var
        SalesHeader: Record "Sales Header";
        PurchaseHeader: Record "Purchase Header";
        PurchaseLine: Record "Purchase Line";
        CompositionQualityHeader: Record "Composition Quality Header";
        ArchiveDocQltyHeader: Record "Archive Document Qlty Header";

        ArchiveDocQlty: Page "Archive Document Qlty Headers";
        DocumentNo: code[20];
    begin
        clear(ArchiveDocQltyHeader);
        if not ExistArchiveDocQltyHeader(SourceType, SourceID, SourceRefNo, DocumentNo) then begin
            if ArchiveDocQltyHeader.insert(true) then begin
                ArchiveDocQltyHeader."Source Type" := SourceType;
                ArchiveDocQltyHeader."Source ID" := SourceID;
                ArchiveDocQltyHeader."Source Ref. No." := SourceRefNo;
                case SourceType of
                    ArchiveDocQltyHeader."Source Type"::"Sales Order":
                        begin
                            if SalesHeader.get(1, SourceID) then begin
                                ArchiveDocQltyHeader."Composition Quality Code" := SalesHeader."Composition Quality Code";
                            end;
                        end;
                    ArchiveDocQltyHeader."Source Type"::"Purchase Order":
                        begin
                            if PurchaseHeader.get(1, SourceID) then begin
                                ArchiveDocQltyHeader."Composition Quality Code" := PurchaseHeader."Composition Quality Code";
                            end;
                            if SourceRefNo <> 0 then begin
                                if PurchaseLine.get(1, SourceID, SourceRefNo) then begin
                                    ArchiveDocQltyHeader."Item No." := PurchaseLine."No.";
                                end;
                            end;
                        end;
                end;
                ArchiveDocQltyHeader.modify;
            end;
        end;
        Commit();
        ArchiveDocQltyHeader.setrange("Source Type", SourceType);
        ArchiveDocQltyHeader.SetRange("Source ID", SourceID);
        clear(ArchiveDocQlty);
        ArchiveDocQlty.SetRecord(ArchiveDocQltyHeader);
        ArchiveDocQlty.RunModal();
    end;

    procedure ExistArchiveDocQltyHeader(SourceType: Integer; SourceID: Code[20]; SourceRefNo: Integer; var DocumentNo: code[20]): Boolean
    var
        ArchiveDocQltyHeader: Record "Archive Document Qlty Header";
    begin
        "Document No." := '';
        ArchiveDocQltyHeader.reset;
        ArchiveDocQltyHeader.SetRange("Source Type", SourceType);
        ArchiveDocQltyHeader.setrange("Source ID", SourceID);
        ArchiveDocQltyHeader.setrange("Source Ref. No.", SourceRefNo);
        if ArchiveDocQltyHeader.FindFirst() then begin
            DocumentNo := ArchiveDocQltyHeader."Document No.";
            exit(true)
        end else
            exit(false);
    end;

    procedure Print(SourceType: Integer; SourceID: Code[20]; SourceRefNo: Integer): Boolean
    var
        ArchiveDocQltyHeader: Record "Archive Document Qlty Header";
    begin
        ArchiveDocQltyHeader.reset;
        ArchiveDocQltyHeader.SetRange("Source Type", SourceType);
        ArchiveDocQltyHeader.setrange("Source ID", SourceID);
        if "Source Ref. No." <> 0 then
            ArchiveDocQltyHeader.setrange("Source Ref. No.", SourceRefNo);
        if ArchiveDocQltyHeader.FindFirst() then
            REPORT.RunModal(REPORT::"Certificate of Quality", true, false, ArchiveDocQltyHeader);
    end;
}

