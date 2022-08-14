table 50185 "Composition Quality Line"
{
    // version OneData016.01.00

    Caption = 'Composition Quality Line';
    DrillDownPageID = 50185;
    LookupPageID = 50185;


    fields
    {
        field(1; "Composition Quality Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Customer No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Line No."; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Qlty Measure Code"; code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Quality Measure";
            trigger OnValidate()
            var
                QualityMeasure: record "Quality Measure";
            begin
                if not QualityMeasure.get(rec."Qlty Measure Code") then QualityMeasure.init;
                rec.Description := QualityMeasure.Description;
                REC."Qlty Measure Group Code" := QualityMeasure."Quality Measure Group";
            end;
        }
        field(5; "Qlty Measure Group Code"; code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Quality Measure Group";
            Editable = false;
        }

        field(10; Description; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Min. Value"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(12; "Max. Value"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Composition Quality Code", "Customer No.", "Line No.")
        {
        }
    }

    fieldgroups
    {
    }


}

