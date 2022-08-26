Codeunit 50182 "Incident Manegement"
{
    [EventSubscriber(ObjectType::table, database::"Segment Line", 'OnCreateInteractionFromInteractLogEntryOnBeforeStartWizard', '', TRUE, TRUE)]
    local procedure AsignarDocumentoMovInteraccion(var SegmentLine: Record "Segment Line"; var InteractionLogEntry: Record "Interaction Log Entry");
    begin
        EVALUATE(SegmentLine."Document Type", InteractionLogEntry.GetFilter("Document Type"));
        SegmentLine.VALIDATE("Document No.", InteractionLogEntry.GetFilter("Document No."));
        // SegmentLine.VALIDATE("Document Type", InteractionLogEntry."Document Type");
        // SegmentLine.VALIDATE("Document No.", InteractionLogEntry."Document No.");
    end;

    [EventSubscriber(ObjectType::table, database::"Segment Line", 'OnAfterFinishWizard', '', TRUE, TRUE)]
    local procedure AsignarNInteraccion(var SegmentLine: Record "Segment Line"; InteractionLogEntry: Record "Interaction Log Entry"; IsFinish: Boolean; Flag: Boolean);
    var
        rConfVentas: record "Sales & Receivables Setup";
        cNoseries: Codeunit NoSeriesManagement;
        cCode: Code[20];
    begin
        IF IsFinish = true then begin
            rConfVentas.Get();
            rConfVentas.TestField("Nº Serie Interaccion");
            cCode := cNoseries.GetNextNo(rConfVentas."Nº Serie Interaccion", WorkDate(), true);

            SegmentLine.VALIDATE("Nº Interaccion", cCode);
            InteractionLogEntry.VALIDATE("Nº Interaccion", cCode);
            InteractionLogEntry.VALIDATE("Descripcion incidencia", SegmentLine."Descripcion incidencia");
            InteractionLogEntry.VALIDATE("Potencial Solucion", SegmentLine."Potencial Solucion");
            SegmentLine.Modify();
            InteractionLogEntry.Modify();
        end
    end;
}