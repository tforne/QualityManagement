page 50200 "Comment Compo. Qlty Header"
{
    PageType = List;
    SourceTable = 50184;
    ApplicationArea = All;
    UsageCategory = Administration;
    Caption = 'Composition Quality';

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
                ShowCaption = false;
                field(Date; REc.Date)
                {
                    ApplicationArea = Comments;
                    ToolTip = 'Specifies the date the comment was created.';
                }
                field(Comment; Rec.Comment)
                {
                    ApplicationArea = Comments;
                    ToolTip = 'Specifies the comment itself.';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
        }
        area(navigation)
        {
            action("Action50184")
            {
                //ApplicationArea = Basic, Suite;
                //Caption = 'Commiss. Sales Persons Setup';
                //Image = Setup;
                // Promoted = true;
                // PromotedCategory = Category4;
                // PromotedIsBig = true;
                //RunObject = Page 99302;
            }
        }
    }
    var

}

