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
        field(10; "Source Type"; Integer)
        {
            Caption = 'Source Type';
        }
        field(11; "Source Subtype"; Option)
        {
            Caption = 'Source Subtype';
            OptionCaption = '0,1,2,3,4,5,6,7,8,9,10';
            OptionMembers = "0","1","2","3","4","5","6","7","8","9","10";
        }
        field(12; "Source ID"; Code[20])
        {
            Caption = 'Source ID';
        }
        field(13; "Source Batch Name"; Code[10])
        {
            Caption = 'Source Batch Name';
        }
        field(14; "Source Prod. Order Line"; Integer)
        {
            Caption = 'Source Prod. Order Line';
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

    procedure InitArchiveDocumentQualityHeader(ArchiveDocumentQlty: record "Archive Document Qlty Header")
    var
        ArchiveDocumentQltyLine: record "Archive Document Qlty Line";
        CompositionQualityHeader: record "Composition Quality Header";
        CompositionQualityLine: Record "Composition Quality Line";
        LineNo: integer;
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
                    ArchiveDocumentQltyLine."Description" := ArchiveDocumentQlty.Description;
                    ArchiveDocumentQltyLine."Legal Normative Code" := ArchiveDocumentQlty."Legal Normative Code";
                    ArchiveDocumentQltyLine."Raw Materials Group Code" := ArchiveDocumentQlty."Raw Materials Group Code";
                    ArchiveDocumentQltyLine.Status := 0;
                    ArchiveDocumentQltyLine."Cast No. Vendor" := ArchiveDocumentQlty."Cast No. Vendor";
                    ArchiveDocumentQltyLine."Item No." := ArchiveDocumentQlty."Item No.";
                    ArchiveDocumentQltyLine."Qlty Measure Code" := CompositionQualityLine."Qlty Measure Code";
                    ArchiveDocumentQltyLine."Qlty Measure Group Code" := CompositionQualityLine."Qlty Measure Group Code";
                    ArchiveDocumentQltyLine."Min. Value" := CompositionQualityLine."Min. Value";
                    ArchiveDocumentQltyLine."Max. Value" := CompositionQualityLine."Max. Value";
                    ArchiveDocumentQltyLine."Value" := 0;
                    ArchiveDocumentQltyLine."Lot No." := '';
                    ArchiveDocumentQltyLine."Variant Code" := '';
                    ArchiveDocumentQltyLine."Package No." := '';
                    ArchiveDocumentQltyLine.insert;
                    LineNo := LineNo + 10000;

                until CompositionQualityLine.next = 0;
        end;

    end;

    procedure FindArchiveDocumentQualityHeader(SourceType: Integer; SourceSubtype: Integer; SourceID: Code[20];
                                        SourceBatchName: Code[10]; SourceProdOrderLine: Integer; SourceRefNo: Integer): Boolean;
    var
        ArchiveDocQltyHeader: Record "Archive Document Qlty Header";
        SalesHeader: Record "Sales Header";
        PurchaseHeader: Record "Purchase Header";
        PurchaseLine: record "Purchase Line";
        ArchiveDocQlty: Page "Archive Document Qlty Header";
    begin
        clear(ArchiveDocQltyHeader);
        if not ExistArchiveDocQltyHeader(SourceType, SourceSubtype, SourceID, SourceBatchName, SourceProdOrderLine, SourceRefNo) then begin
            if ArchiveDocQltyHeader.insert(true) then begin
                ArchiveDocQltyHeader."Source Type" := SourceType;
                ArchiveDocQltyHeader."Source Subtype" := SourceSubtype;
                ArchiveDocQltyHeader."Source ID" := SourceID;
                ArchiveDocQltyHeader."Source Batch Name" := SourceBatchName;
                ArchiveDocQltyHeader."Source Prod. Order Line" := SourceProdOrderLine;
                ArchiveDocQltyHeader."Source Ref. No." := SourceRefNo;
                case SourceType of
                    36:
                        begin
                            if SalesHeader.get(SourceSubtype, SourceID) then begin
                                ArchiveDocQltyHeader."Composition Quality Code" := SalesHeader."Composition Quality Code";
                            end;
                        end;
                    38:
                        begin
                            if PurchaseHeader.get(SourceSubtype, SourceID) then begin
                                ArchiveDocQltyHeader."Composition Quality Code" := PurchaseHeader."Composition Quality Code";
                            end;
                            if SourceRefNo <> 0 then begin
                                if PurchaseLine.get(SourceSubtype, SourceID, SourceRefNo) then begin
                                    ArchiveDocQltyHeader."Item No." := PurchaseLine."No.";
                                end;
                            end;
                        end;
                end;
                ArchiveDocQltyHeader.modify;
            end;
        end;
        commit;
        clear(ArchiveDocQlty);
        ArchiveDocQlty.SetRecord(ArchiveDocQltyHeader);
        ArchiveDocQlty.RunModal();
    end;

    procedure ExistArchiveDocQltyHeader(SourceType: Integer; SourceSubtype: Integer; SourceID: Code[20];
                                        SourceBatchName: Code[10]; SourceProdOrderLine: Integer; SourceRefNo: Integer): Boolean
    var
        ArchiveDocQltyHeader: Record "Archive Document Qlty Header";
    begin
        ArchiveDocQltyHeader.reset;
        ArchiveDocQltyHeader.SetRange("Source Type", SourceType);
        ArchiveDocQltyHeader.setrange("Source Subtype", SourceSubtype);
        ArchiveDocQltyHeader.setrange("Source ID", SourceID);
        ArchiveDocQltyHeader.setrange("Source Batch Name", SourceBatchName);
        ArchiveDocQltyHeader.setrange("Source Prod. Order Line", SourceProdOrderLine);
        ArchiveDocQltyHeader.setrange("Source Ref. No.", SourceRefNo);
        exit(ArchiveDocQltyHeader.FindFirst());
    end;

}

