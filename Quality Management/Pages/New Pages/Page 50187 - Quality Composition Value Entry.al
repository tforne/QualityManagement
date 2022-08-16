page 50187 "Quality Compos. Value Entry"
{
    Caption = 'Quality Composition Value Entry.al';
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = List;
    SourceTable = "Quality Compos. Value Entry";

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                field("Quality Status"; Rec."Quality Status")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the status of the reservation.';
                }
                field("Item No."; Rec."Item No.")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the number of the item that has been reserved in this entry.';
                }
                field("Variant Code"; Rec."Variant Code")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the variant of the item on the line.';
                    Visible = false;
                }
                field("Lot No."; Rec."Lot No.")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the lot number of the item that is being handled with the associated document line.';
                    Visible = true;
                }
                field("Package No."; Rec."Package No.")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the package number of the item that is being handled with the associated document line.';
                    Visible = PackageTrackingVisible;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies a description of the reservation entry.';
                    Visible = false;
                }
                field("Source Type"; Rec."Source Type")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies for which source type the reservation entry is related to.';
                    Visible = false;
                }
                field("Source Subtype"; Rec."Source Subtype")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies which source subtype the reservation entry is related to.';
                    Visible = false;
                }
                field("Source ID"; Rec."Source ID")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies which source ID the reservation entry is related to.';
                    Visible = false;
                }
                field("Source Batch Name"; Rec."Source Batch Name")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the journal batch name if the reservation entry is related to a journal or requisition line.';
                    Visible = false;
                }
                field("Source Ref. No."; Rec."Source Ref. No.")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies a reference number for the line, which the reservation entry is related to.';
                    Visible = false;
                }
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the number of the entry, as assigned from the specified number series when the entry was created.';
                }
                field("Creation Date"; Rec."Creation Date")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the date on which the entry was created.';
                    Visible = true;
                }
                field("Min. Value"; Rec."Min. Value")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = '';
                    Visible = true;
                }
                field("Max. Value"; Rec."Max. Value")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = '';
                    Visible = true;
                }
                field("Value"; Rec."Value")
                {
                    ApplicationArea = All;
                    Editable = true;
                    ToolTip = '';
                    Visible = true;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1900383207; Links)
            {
                ApplicationArea = RecordLinks;
                Visible = false;
            }
            systempart(Control1905767507; Notes)
            {
                ApplicationArea = Notes;
                Visible = false;
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("F&unctions")
            {
                Caption = 'F&unctions';
                Image = "Action";
                action(CancelValues)
                {
                    AccessByPermission = TableData Item = R;
                    ApplicationArea = Reservation;
                    Caption = 'Cancel values';
                    Image = Cancel;
                    ToolTip = 'Cancel the selected values entry.';
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedOnly = true;
                    Scope = Repeater;
                    trigger OnAction()
                    var
                        ReservEntry: Record "Reservation Entry";
                    begin
                        CurrPage.SetSelectionFilter(ReservEntry);
                        //                        if ReservEntry.Find('-') then
                        //                          repeat
                        //                               ReservEntry.TestField("Reservation Status", Rec."Reservation Status"::Reservation);
                        //                               ReservEntry.TestField("Disallow Cancellation", false);
                        //                               if Confirm(
                        //                                    CancelReservationQst, false, ReservEntry."Quantity (Base)",
                        //                                    ReservEntry."Item No.", ReservEngineMgt.CreateForText(Rec),
                        //                                    ReservEngineMgt.CreateFromText(Rec))
                        //                               then begin
                        //                                   ReservEngineMgt.CancelReservation(ReservEntry);
                        //                                   Commit();
                        //                               end;
                        //                           until ReservEntry.Next() = 0;
                    end;
                }
            }
        }
    }


    trigger OnOpenPage()
    begin
    end;

    var
        [InDataSet]
        PackageTrackingVisible: Boolean;
        CancelReservationQst: Label 'Cancel reservation of %1 of item number %2, reserved for %3 from %4?';
}