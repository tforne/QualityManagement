page 50188 "Archive Compos. Quality Header"
{
    // version OneData016.01.00

    PageType = Card;
    SourceTable = 50184;
    ApplicationArea = All;
    UsageCategory = Administration;
    Caption = 'Archive Composition Quality';


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
            //part("Composition Quality Line"; "Quality Compos. Value Entry")
            //{
            //    ApplicationArea = Basic, Suite;
            //    Editable = true;
            // Enabled = "Sell-to Customer No." <> '';
            //    SubPageLink = "Composition Quality Code" = FIELD("Code");
            // UpdatePropagation = Both;
            // }
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
        SalesOrder: record 313;

}

