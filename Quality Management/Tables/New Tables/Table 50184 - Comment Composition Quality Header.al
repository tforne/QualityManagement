table 50184 "Comment Compos. Qlty Header"
{

    Caption = 'Comment composition quality header';
    DrillDownPageID = "Comment Compo. Qlty Header";
    LookupPageID = "Comment Compo. Qlty Header";

    fields
    {

        field(1; "Composition Quality Code"; Code[20])
        {
            Caption = 'No.';
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(4; Date; Date)
        {
            Caption = 'Date';
        }
        field(5; "Code"; Code[10])
        {
            Caption = 'Code';
        }
        field(6; Comment; Text[80])
        {
            Caption = 'Comment';
        }
    }

    keys
    {
        key(Key1; "Composition Quality Code", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }


}