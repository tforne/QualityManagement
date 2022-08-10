table 50187 "Archive Document Qlty Header"
{

    Caption = 'Archive Document Quality Header';
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
        field(20; "No. colada proveedor"; Text[50])
        {
            Caption = 'No. Colada';
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

