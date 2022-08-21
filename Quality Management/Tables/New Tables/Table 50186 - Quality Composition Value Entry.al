table 50186 "Quality Compos. Value Entry"
{
    Caption = 'Movimientos de valores de calidad';
    DrillDownPageID = "Quality Compos. Value Entry";
    LookupPageID = "Quality Compos. Value Entry";

    fields
    {
        field(1; "Entry No."; Integer)
        {
            AutoIncrement = true;
            Caption = 'Entry No.';
        }
        field(2; "Item No."; Code[20])
        {
            Caption = 'Item No.';
            TableRelation = Item;
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
                rec.Description := QualityMeasure.Description
            end;
        }
        field(5; "Quality Status"; Enum "Quality Status")
        {
            Caption = 'Quality Status';
        }
        field(7; Description; Text[100])
        {
            Caption = 'Description';
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
        field(25; "Created By"; Code[50])
        {
            Caption = 'Created By';
            DataClassification = EndUserIdentifiableInformation;
            TableRelation = User."User Name";
            //This property is currently not supported
            //TestTableRelation = false;
        }
        field(27; "Changed By"; Code[50])
        {
            Caption = 'Changed By';
            DataClassification = EndUserIdentifiableInformation;
            TableRelation = User."User Name";
            //This property is currently not supported
            //TestTableRelation = false;
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
        key(Key1; "Entry No.")
        {
            Clustered = true;

        }
    }
}