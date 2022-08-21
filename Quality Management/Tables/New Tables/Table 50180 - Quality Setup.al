table 50180 "Quality Setup"
{
    // version OneData016.01.00

    Caption = 'Quality Setup';
    DrillDownPageID = 50180;
    LookupPageID = 50180;

    fields
    {
        field(1; "Code"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "User Id. Quality Manager"; Guid)
        {
            Caption = 'User Id. Quality Manager';
            DataClassification = ToBeClassified;
            Editable = true;
            TableRelation = User."User Security ID" WHERE("License Type" = CONST("Full User"));
        }
        field(3; "Full Name Quality Manager"; Text[80])
        {
            Caption = 'Full Name Quality Manager';
            Editable = false;
        }
        field(10; "Archive Doc. Quality Nos."; Code[20])
        {
            AccessByPermission = TableData Insurance = R;
            Caption = 'Archive Compos. Quality Nos.';
            TableRelation = "No. Series";
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
    var
}

