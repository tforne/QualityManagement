page 50186 "Composition Quality Subform"
{
    AutoSplitKey = true;
    Caption = 'Lines';
    DelayedInsert = true;
    LinksAllowed = false;
    MultipleNewLines = true;
    PageType = ListPart;
    SourceTable = "Composition Quality Line";
    // SourceTableView = WHERE("Document Type" = FILTER(Order));

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;

                field("Qlty Measure Code"; Rec."Qlty Measure Code")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = true;

                }
                field("Qlty Measure Group Code"; Rec."Qlty Measure Group Code")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = true;
                }
                field("Description"; Rec."Description")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = true;
                }

                field("Min. Value"; Rec."Min. Value")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = true;
                }
                field("Max. Value"; Rec."Max. Value")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = true;
                }
            }

        }
    }

    var
        SalesOrderSubform: page 392;
}