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
        InteractionTemplate: record "Interaction Template";
        cNoseries: Codeunit NoSeriesManagement;
        cCode: Code[20];
    begin
        IF IsFinish = true then begin
            rConfVentas.Get();
            rConfVentas.TestField("Incident Nos.");
            cCode := cNoseries.GetNextNo(rConfVentas."Incident Nos.", WorkDate(), true);

            SegmentLine.VALIDATE("Incident No.", cCode);
            InteractionLogEntry.VALIDATE("Incident No.", cCode);
            InteractionLogEntry.VALIDATE("Description Incident", SegmentLine."Description Incident");
            InteractionLogEntry.VALIDATE("Proposed solution", SegmentLine."Proposed solution");
            InteractionTemplate.get(SegmentLine."Interaction Template Code");
            InteractionLogEntry."Quality Incident" := InteractionTemplate."Quality Incident";
            SegmentLine.Modify();
            InteractionLogEntry.Modify();
        end
    end;
}