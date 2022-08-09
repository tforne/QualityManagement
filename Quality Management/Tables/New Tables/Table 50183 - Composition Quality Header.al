table 50183 "Composition Quality Header"
{

    Caption = 'Composition Quality Header';
    DrillDownPageID = 50185;
    LookupPageID = 50185;


    fields
    {
        field(1; "Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Description"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Legal Normative Code"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Raw Materials Group Code"; Text[20])
        {
            DataClassification = ToBeClassified;
        }
        field(5; Status; Enum CompositionQualityStatus)
        {
            DataClassification = ToBeClassified;
        }

    }

    keys
    {
        key(Key1; "Code")
        {
        }
    }

    fieldgroups
    {
    }

}

