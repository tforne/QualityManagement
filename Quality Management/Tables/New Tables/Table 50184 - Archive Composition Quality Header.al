table 50184 "Archive Compos. Quality Header"
{

    Caption = 'Archive Composition Quality Header';
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
        field(10; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
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
            QualitySetup.TestField("Archive Compos. Quality Nos.");
            NoSeriesMgt.InitSeries(QualitySetup."Archive Compos. Quality Nos.", xRec."No. Series", 0D, "Document No.", "No. Series");
        end;

    end;

    var
        Customer: record "Sales Header";
        QualitySetup: record "Quality Setup";
        NoseriesMgt: Codeunit NoSeriesManagement;

    procedure SetNewArchiveComposQualityHeader()
    begin

    end;

    procedure InsertArchiveComposQualityHeader()
    begin

    end;

}

