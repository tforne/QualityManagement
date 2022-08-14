page 50190 "Archive Document Qlty Subform"
{
    // version OneData016.01.00
    PageType = ListPart;
    SourceTable = 50189;
    ApplicationArea = All;
    UsageCategory = Administration;
    Caption = 'Lines';

    AutoSplitKey = true;
    DelayedInsert = true;
    LinksAllowed = false;
    MultipleNewLines = true;


    layout
    {
        area(content)
        {
            repeater(Group)
            {
                Caption = 'General';

                field("Qlty Measure Code"; Rec."Qlty Measure Code")
                {
                    ApplicationArea = All;
                    Editable = true;
                }
                field("Description"; Rec.Description)
                {
                    ApplicationArea = All;
                    Editable = true;
                }

                field("Qlty Measure Group Code"; Rec."Qlty Measure Group Code")
                {
                    ApplicationArea = All;
                    Editable = true;
                }
                field("Min. Value"; Rec."Min. Value")
                {
                    ApplicationArea = All;
                    Editable = true;
                }
                field("Max. Value"; Rec."Min. Value")
                {
                    ApplicationArea = All;
                    Editable = true;
                }

                field("Value"; Rec."Value")
                {
                    ApplicationArea = All;
                    Editable = true;
                }
            }
        }
    }
    actions
    {
        area(processing)
        {
        }
    }
}

