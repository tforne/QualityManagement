page 50189 "Archive Document Qlty Headers"
{
    // version OneData016.01.00
    PageType = List;
    SourceTable = 50187;
    ApplicationArea = All;
    UsageCategory = Administration;
    Caption = 'Archive Document Qlty Headers';
    CardPageId = 50188;


    layout
    {
        area(content)
        {
            repeater(Group)
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

}

