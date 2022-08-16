Codeunit 50181 "Quality Manegement"
{
    [EventSubscriber(ObjectType::Page, 1350, 'OnAfterRecordChanged', '', false, false)]
    local procedure "Page1350.OnAfterRecordChanged"(var SalesShipmentHeader: Record "Sales Shipment Header"; xSalesShipmentHeader: Record "Sales Shipment Header"; var IsChanged: Boolean)
    var

    begin
        IsChanged :=
          (SalesShipmentHeader."Composition Quality Code" <> xSalesShipmentHeader."Composition Quality Code");
    end;



    [EventSubscriber(ObjectType::Codeunit, 391, 'OnBeforeSalesShptHeaderModify', '', false, false)]
    local procedure "Codeunit391.OnBeforeSalesShptHeaderModify"(var SalesShptHeader: Record "Sales Shipment Header"; FromSalesShptHeader: Record "Sales Shipment Header")
    var

    begin
        SalesShptHeader."Composition Quality Code" := FromSalesShptHeader."Composition Quality Code";
    end;


}