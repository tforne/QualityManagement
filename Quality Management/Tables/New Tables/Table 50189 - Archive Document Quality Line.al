table 50189 "Archive Document Qlty Line"
{

    Caption = 'Archive Document Quality Line';
    DrillDownPageID = 50185;
    LookupPageID = 50185;


    fields
    {
        field(1; "Document No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Composition Quality Code"; Code[20])
        {
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
        field(20; "No. colada proveedor"; Text[50])
        {
            Caption = 'No. Colada';
            Editable = false;
            trigger OnValidate();
            begin

            end;
        }
        field(21; "Item No."; Code[20])
        {
            Caption = 'Item No.';
            TableRelation = Item;
        }
        field(25; "Qlty Measure Code"; code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Quality Measure";
            trigger OnValidate()
            var
                QualityMeasure: record "Quality Measure";
            begin
                if not QualityMeasure.get(rec."Qlty Measure Code") then QualityMeasure.init;
                rec.Description := QualityMeasure.Description
            end;
        }

        field(30; "Qlty Measure Group Code"; code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Quality Measure Group";
            Editable = false;
        }

        field(31; "Min. Value"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(32; "Max. Value"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(33; "Value"; Decimal)
        {
            DataClassification = ToBeClassified;
        }

        field(5400; "Lot No."; Code[50])
        {
            Caption = 'Lot No.';
        }
        field(5401; "Variant Code"; Code[10])
        {
            Caption = 'Variant Code';
            TableRelation = "Item Variant".Code WHERE("Item No." = FIELD("Item No."));
        }
        field(6515; "Package No."; Code[50])
        {
            Caption = 'Package No.';
            CaptionClass = '6,1';
            Editable = false;
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


    var
        Customer: record "Sales Header";
        QualitySetup: record "Quality Setup";
        NoseriesMgt: Codeunit NoSeriesManagement;

    procedure SetNewArchiveDocumentQualityHeader()
    begin

    end;

    procedure FindArchiveDocumentQualityHeader(SourceType: Integer; SourceSubtype: Integer; SourceID: Code[20];
                                        SourceBatchName: Code[10]; SourceProdOrderLine: Integer; SourceRefNo: Integer): Boolean
    var
        ArchiveDocQltyHeader: Record "Archive Document Qlty Header";
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

