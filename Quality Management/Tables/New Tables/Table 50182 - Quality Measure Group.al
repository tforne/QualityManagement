table 50182 "Quality Measure Group"
{
    // version OneData016.01.00

    Caption = 'Quality Cue';
    DrillDownPageID = 50183;
    LookupPageID = 50183;

    fields
    {
        field(1; "Code"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Description"; Text[50])
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

