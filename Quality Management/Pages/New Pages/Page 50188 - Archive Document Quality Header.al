page 50188 "Archive Document Qlty Header"
{
    // version OneData016.01.00

    PageType = Card;
    SourceTable = 50187;
    ApplicationArea = All;
    UsageCategory = Administration;
    Caption = 'Archive Document Quality Header';


    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = All;
                    Editable = true;
                }

                field("Composition Quality Code"; Rec."Composition Quality Code")
                {
                    ApplicationArea = All;
                    Editable = true;
                }
                field("Description"; Rec.Description)
                {
                    ApplicationArea = All;
                    Editable = true;
                }
                field("Legal Normative Code"; Rec."Legal Normative Code")
                {
                    ApplicationArea = All;
                    Editable = true;
                }
                field("Raw Materials Group Code"; Rec."Raw Materials Group Code")
                {
                    ApplicationArea = All;
                    Editable = true;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    Editable = true;
                }
            }
            part("Archive Document Qlty Line"; "Archive Document Qlty Subform")
            {
                ApplicationArea = Basic, Suite;
                Editable = true;
                Enabled = true;
                SubPageLink = "Document No." = FIELD("Document No.");
                UpdatePropagation = Both;
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Init Document")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Init Document';
                Image = Setup;
                Promoted = true;
                PromotedIsBig = true;
                trigger onaction()
                var
                    myInt: Integer;
                begin
                    rec.InitArchiveDocumentQualityHeader(Rec);
                end;
            }
            action(PostValue)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Post Value';
                Image = Post;
                Promoted = true;
                PromotedIsBig = true;
                //RunObject = Page 99302;
            }

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

