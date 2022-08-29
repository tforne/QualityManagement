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
            group(SourceDocument)
            {
                Caption = 'Source Document';

                field("Source Type"; Rec."Source Type")
                {
                    ApplicationArea = All;
                    Editable = true;
                }
                field("Source ID"; Rec."Source ID")
                {
                    ApplicationArea = All;
                    Editable = true;
                }

            }
            group(LinkDocument)
            {
                Caption = 'Link Document';

                field("Link - Source Type"; Rec."Link - Source Type")
                {
                    ApplicationArea = All;
                    Editable = true;
                }
                field("Link - Source ID"; Rec."Link - Source ID")
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
        area(Reporting)
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

            action(PrintCertificateofQuality)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Print Certificate of Quality';
                Image = PrintReport;
                Promoted = true;
                ToolTip = 'Print the certificate of quality that you must send to your customer.';

                trigger OnAction()
                var
                    DocQlty: Record "Archive Document Qlty Header";
                begin
                    DocQlty.Print(DocQlty."Source Type"::"Sales Order", rec."Source ID", 0)
                end;
            }

        }
    }

}

