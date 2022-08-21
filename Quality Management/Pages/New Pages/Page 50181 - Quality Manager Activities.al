page 50181 "Quality Manager Activities"
{
    Caption = 'Activities';
    PageType = CardPart;
    RefreshOnActivate = true;
    SourceTable = "Quality Cue";
    Permissions = tabledata "Quality Cue" = rm;

    layout
    {
        area(content)
        {
            cuegroup("For Release")
            {
                Caption = 'For Release';
                field("Comp. Qlty - Open"; Rec."Comp. Qlty - Open")
                {
                    ApplicationArea = Basic, Suite;
                    DrillDownPageID = "Composition Quality Headers";
                    ToolTip = 'Specifies the number of Composition Quality opened.';
                }
                field("Comp. Qlty - Pending Approval"; Rec."Comp. Qlty - Pending Approval")
                {
                    ApplicationArea = Basic, Suite;
                    DrillDownPageID = "Composition Quality Headers";
                    ToolTip = 'Specifies the number of Composition Quality opened.';
                }
                field("Sales Document - Open Qlty."; Rec."Sales Document - Open Qlty.")
                {
                    ApplicationArea = Basic, Suite;
                    DrillDownPageID = "Archive Document Qlty Headers";
                    ToolTip = 'Specifies the number of Composition Quality opened.';
                }
                field("Sales Document - Pending Qlty."; Rec."Sales Document - Pending Qlty.")
                {
                    ApplicationArea = Basic, Suite;
                    DrillDownPageID = "Archive Document Qlty Headers";
                    ToolTip = 'Specifies the number of Composition Quality opened.';
                }
                field("Purch Document - Open Qlty."; Rec."Purch Document - Open Qlty.")
                {
                    ApplicationArea = Basic, Suite;
                    DrillDownPageID = "Archive Document Qlty Headers";
                    ToolTip = 'Specifies the number of Composition Quality opened.';
                }
                field("Purch Document - Pending Qlty."; Rec."Purch Document - Pending Qlty.")
                {
                    ApplicationArea = Basic, Suite;
                    DrillDownPageID = "Archive Document Qlty Headers";
                    ToolTip = 'Specifies the number of Composition Quality opened.';
                }
                actions
                {
                    action("New Sales Quote")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'New Sales Quote';
                        RunObject = Page "Sales Quote";
                        RunPageMode = Create;
                        ToolTip = 'Offer items or services to a customer.';
                    }
                    action("New Sales Order")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'New Sales Order';
                        RunObject = Page "Sales Order";
                        RunPageMode = Create;
                        ToolTip = 'Create a new sales order for items or services that require partial posting.';
                    }
                }
            }
            cuegroup("Sales Orders Released Not Shipped")
            {
            }
            cuegroup(Returns)
            {
            }
        }
    }

    actions
    {
        area(processing)
        {

        }
    }

    trigger OnAfterGetCurrRecord()
    var
        RoleCenterNotificationMgt: Codeunit "Role Center Notification Mgt.";
        TaskParameters: Dictionary of [Text, Text];
    begin
        RoleCenterNotificationMgt.HideEvaluationNotificationAfterStartingTrial();
        TaskParameters.Add('View', Rec.GetView());
        if CalcTaskId <> 0 then
            if CurrPage.CancelBackgroundTask(CalcTaskId) then;
        CurrPage.EnqueueBackgroundTask(CalcTaskId, Codeunit::"SO Activities Calculate", TaskParameters, 120000, PageBackgroundTaskErrorLevel::Warning);
    end;

    trigger OnAfterGetRecord()
    var
        DocExchServiceSetup: Record "Doc. Exch. Service Setup";
    begin
        ShowDocumentsPendingDodExchService := false;
        if DocExchServiceSetup.Get() then
            ShowDocumentsPendingDodExchService := DocExchServiceSetup.Enabled;
    end;

    trigger OnOpenPage()
    var
        RoleCenterNotificationMgt: Codeunit "Role Center Notification Mgt.";
        ConfPersonalizationMgt: Codeunit "Conf./Personalization Mgt.";
    begin
        Rec.Reset();
        if not Rec.Get() then begin
            Rec.Init();
            Rec.Insert();
        end;

        //Rec.SetRespCenterFilter();
        //Rec.SetRange("Date Filter", 0D, WorkDate());
        //Rec.SetFilter("Date Filter2", '>=%1', WorkDate());
        //Rec.SetRange("User ID Filter", UserId());

        RoleCenterNotificationMgt.ShowNotifications();
        ConfPersonalizationMgt.RaiseOnOpenRoleCenterEvent();


    end;

    trigger OnPageBackgroundTaskCompleted(TaskId: Integer; Results: Dictionary of [Text, Text])
    var
        SOActivitiesCalculate: Codeunit "SO Activities Calculate";
        PrevUpdatedOn: DateTime;
    begin
        if TaskId <> CalcTaskId then
            exit;

        CalcTaskId := 0;

        if Rec.Get() then;
        //PrevUpdatedOn := Rec."Avg. Days Delayed Updated On";
        //SOActivitiesCalculate.EvaluateResults(Results, Rec);
        //ReadyToShip := Rec."Ready to Ship";
        //AverageDaysDelayed := Rec."Average Days Delayed";
        //DelayedOrders := Rec.Delayed;
        //PartiallyShipped := Rec."Partially Shipped";

        //if Rec.WritePermission and (Rec."Avg. Days Delayed Updated On" > PrevUpdatedOn) then begin
        //    PrevUpdatedOn := Rec."Avg. Days Delayed Updated On";
        //    Rec.LockTable();
        //    Rec.Get();
        //    Rec."Avg. Days Delayed Updated On" := PrevUpdatedOn;
        //    Rec."Average Days Delayed" := AverageDaysDelayed;
        //    if Rec.Modify() then;
        //    Commit();
        //end;

        CurrPage.Update();
    end;

    var
        AverageDaysDelayed: Decimal;
        ReadyToShip: Integer;
        PartiallyShipped: Integer;
        DelayedOrders: Integer;
        CalcTaskId: Integer;
        ShowDocumentsPendingDodExchService: Boolean;
        IsAddInReady: Boolean;
        IsPageReady: Boolean;
}


