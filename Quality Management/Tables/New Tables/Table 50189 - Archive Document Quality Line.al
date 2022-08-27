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
        field(2; "Line No."; Integer)
        {
            DataClassification = ToBeClassified;
        }

        field(3; "Composition Quality Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Description"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Legal Normative Code"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Raw Materials Group Code"; Text[20])
        {
            DataClassification = ToBeClassified;
        }
        field(7; Status; Enum "Quality Status")
        {
            DataClassification = ToBeClassified;
        }
        field(20; "Cast No. Vendor"; Text[50])
        {
            Caption = 'Cast No. Vendor';
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

            trigger OnValidate()
            begin
                rec.status := rec.status::"Inside the range";
                if (rec.value < rec."Min. Value") or (rec.Value > rec."Max. Value") then
                    rec.Status := rec.status::"Out of range";
            end;
        }
        field(40; "Link - Source Type"; Option)
        {
            Caption = 'Link - Source Type';
            OptionCaption = ',Sales Order,Purchase Order';
            OptionMembers = "","Sales Order","Purchase Order";

        }

        field(42; "Link - Source ID"; Code[20])
        {
            Caption = 'Link - Source ID';
            TableRelation =
                IF ("Link - Source Type" = CONST("Sales Order")) "Sales Header"."No." WHERE("document type" = CONST("order"), "Composition Quality Code" = field("Composition Quality Code"))
            ELSE
            if ("Link - Source Type" = CONST("Purchase Order")) "Purchase Header"."No." WHERE("document type" = CONST("order"), "Composition Quality Code" = field("Composition Quality Code"));
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
        key(Key1; "Document No.", "Line No.")
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
        if not ExistArchiveDocQltyHeader(SourceType, SourceSubtype, SourceID, SourceRefNo) then begin
            if ArchiveDocQltyHeader.insert(true) then begin
                ArchiveDocQltyHeader."Source Type" := SourceType;
                ArchiveDocQltyHeader."Source ID" := SourceID;
                ArchiveDocQltyHeader."Source Ref. No." := SourceRefNo;
                ArchiveDocQltyHeader.modify;
            end;
        end;
        commit;
        clear(ArchiveDocQlty);
        ArchiveDocQlty.SetRecord(ArchiveDocQltyHeader);
        ArchiveDocQlty.RunModal();
    end;

    procedure ExistArchiveDocQltyHeader(SourceType: Integer; SourceSubtype: Integer; SourceID: Code[20]; SourceRefNo: Integer): Boolean
    var
        ArchiveDocQltyHeader: Record "Archive Document Qlty Header";
    begin
        ArchiveDocQltyHeader.reset;
        ArchiveDocQltyHeader.SetRange("Source Type", SourceType);

        ArchiveDocQltyHeader.setrange("Source ID", SourceID);
        ArchiveDocQltyHeader.setrange("Source Ref. No.", SourceRefNo);
        exit(ArchiveDocQltyHeader.FindFirst());
    end;

    procedure SetStyle(): Text
    begin
        case status of
            rec.status::"Out of range":
                EXIT('Unfavorable');
            rec.Status::"Inside the range":
                EXIT('');
            rec.status::Accepted:
                exit('Favorable');
        end;
    end;
}

