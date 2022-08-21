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
                    StyleExpr = StyleTxt;
                }
                field("Description"; Rec.Description)
                {
                    ApplicationArea = All;
                    Editable = true;
                    StyleExpr = StyleTxt;
                }

                field("Qlty Measure Group Code"; Rec."Qlty Measure Group Code")
                {
                    ApplicationArea = All;
                    Editable = true;
                    StyleExpr = StyleTxt;
                }
                field("Min. Value"; Rec."Min. Value")
                {
                    ApplicationArea = All;
                    Editable = true;
                    StyleExpr = StyleTxt;
                }
                field("Max. Value"; Rec."Max. Value")
                {
                    ApplicationArea = All;
                    Editable = true;
                    StyleExpr = StyleTxt;
                }
                field("Link - Source Type"; Rec."Link - Source Type")
                {
                    ApplicationArea = All;
                    Editable = true;
                    StyleExpr = StyleTxt;
                }
                field("Link - Source ID"; Rec."Link - Source ID")
                {
                    ApplicationArea = All;
                    Editable = true;
                    StyleExpr = StyleTxt;
                }

                field("Value"; Rec."Value")
                {
                    ApplicationArea = All;
                    Editable = (Rec."Link - Source ID" = '');
                    StyleExpr = StyleTxt;
                    trigger OnValidate()
                    begin
                        CurrPage.Update();
                    end;
                }
                field("Status"; Rec."Status")
                {
                    ApplicationArea = All;
                    Editable = (Rec."Link - Source ID" = '');
                    StyleExpr = StyleTxt;
                    trigger OnValidate()
                    begin
                        CurrPage.Update();
                    end;
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
    var
        StyleTxt: Text;

    trigger OnAfterGetRecord()
    begin
        StyleTxt := rec.SetStyle();
    end;
}

