codeunit 50180 QualityManagementInstall
{
    Subtype = Install;

    trigger OnInstallAppPerCompany()
    var
    begin
        insertQualitySetup;
        insertQualityMeasuresGroup;
        insertQualityMeasures;
        message('Se ha inicializado el módulo...')
    end;

    procedure GoLive()
    var
    begin
        insertQualitySetup;
        insertQualityMeasuresGroup;
        insertQualityMeasures;
        message('Se ha inicializado el módulo...')
    end;

    procedure insertQualitySetup()
    var
        QualitySetup: Record "Quality Setup";
        SalesReceivablesSetup: Record "Sales & Receivables Setup";
        InteractionTemplate: Record "Interaction Template";
        InteractionGroup: Record "Interaction Group";
        InteractionLogEntry: Record "Interaction Log Entry";
        NoSeries: Record "No. Series";
        NoSeriesLine: Record "No. Series Line";

    begin

        QualitySetup.Code := '';
        if QualitySetup.insert then;
        QualitySetup."Archive Doc. Quality Nos." := 'CAL-ARC-DOC';
        QualitySetup.modify;

        if SalesReceivablesSetup.insert then;
        SalesReceivablesSetup."Incident Nos." := 'CAL-INC';
        SalesReceivablesSetup.Modify();

        NoSeries.Code := 'CAL-ARC-DOC';
        NoSeries.Description := 'Archivo docs. calidad';
        if NoSeries.insert then;

        NoSeriesLine."Series Code" := 'CAL-ARC-DOC';
        NoSeriesLine."Line No." := 1000;
        NoSeriesLine."Starting Date" := 20200101D;
        NoSeriesLine."Starting No." := '2000001';
        NoSeriesLine.open := true;
        NoSeriesLine."Increment-by No." := 1;
        if NoSeriesLine.insert then;

        NoSeries.Code := 'CAL-INC';
        NoSeries.Description := 'Incidencias calidad';
        if NoSeries.insert then;

        NoSeriesLine."Series Code" := 'CAL-INC';
        NoSeriesLine."Line No." := 1000;
        NoSeriesLine."Starting Date" := 20200101D;
        NoSeriesLine."Starting No." := 'INC-22-00001';
        NoSeriesLine.open := true;
        NoSeriesLine."Increment-by No." := 1;
        if NoSeriesLine.insert then;

        InteractionGroup.init;
        InteractionGroup.Code := 'CALIDAD';
        InteractionGroup.Description := ' Interacciones de calidad';
        if InteractionGroup.insert then;

        InteractionTemplate.init;
        InteractionTemplate.Code := 'CAL-INCIDE';
        InteractionTemplate.Description := 'Incidencias calidad';
        InteractionTemplate."Interaction Group Code" := 'CALIDAD';
        InteractionTemplate."Information Flow" := InteractionTemplate."Information Flow"::Inbound;
        InteractionTemplate."Initiated By" := InteractionTemplate."Initiated By"::Them;
        InteractionTemplate."Quality Incident" := true;
        if InteractionTemplate.insert then;

        InteractionLogEntry.reset;
        if InteractionLogEntry.FindFirst() then
            repeat
                InteractionTemplate.get(InteractionLogEntry."Interaction Template Code");
                if not InteractionTemplate."Quality Incident" then begin
                    InteractionLogEntry.Status := InteractionLogEntry.Status::Resolved;
                    InteractionLogEntry."Quality Incident" := false;
                    InteractionLogEntry.modify;
                end;
            until InteractionLogEntry.next = 0;

    end;

    procedure insertQualityMeasuresGroup()
    var
        QualityMeasuresGroup: Record "Quality Measure Group";
    begin
        QualityMeasuresGroup.Code := 'CHEMICAL';
        QualityMeasuresGroup.Description := 'Composición química';
        IF QualityMeasuresGroup.Insert() THEN;

        QualityMeasuresGroup.Code := 'MECHANICAL';
        QualityMeasuresGroup.Description := 'Propiedades mecánicas';
        IF QualityMeasuresGroup.Insert() THEN;

        QualityMeasuresGroup.Code := 'HARDENABIL';
        QualityMeasuresGroup.Description := 'Hardenability';
        IF QualityMeasuresGroup.Insert() THEN;

        QualityMeasuresGroup.Code := 'MICROSCOPI';
        QualityMeasuresGroup.Description := 'Microscopic Examination';
        IF QualityMeasuresGroup.Insert() THEN;

        QualityMeasuresGroup.Code := 'SUPPLY';
        QualityMeasuresGroup.Description := 'Evaluación del suministro';
        IF QualityMeasuresGroup.Insert() THEN;
    end;

    procedure insertQualityMeasures()
    var
        QualityMeasure: Record "Quality Measure";
    begin
        QualityMeasure.RESET;
        QualityMeasure.DeleteAll;
        QualityMeasure.Code := 'QUI-01';
        QualityMeasure.Description := 'C';
        QualityMeasure."Quality Measure Group" := 'CHEMICAL';
        QualityMeasure."Description mesure unit" := '%C';
        IF QualityMeasure.Insert() THEN;

        QualityMeasure.Code := 'QUI-02';
        QualityMeasure.Description := 'Mn';
        QualityMeasure."Quality Measure Group" := 'CHEMICAL';
        QualityMeasure."Description mesure unit" := '%Mn';
        IF QualityMeasure.Insert() THEN;

        QualityMeasure.Code := 'QUI-03';
        QualityMeasure.Description := 'Si';
        QualityMeasure."Quality Measure Group" := 'CHEMICAL';
        QualityMeasure."Description mesure unit" := '%Si';
        IF QualityMeasure.Insert() THEN;

        QualityMeasure.Code := 'QUI-04';
        QualityMeasure.Description := 'P';
        QualityMeasure."Quality Measure Group" := 'CHEMICAL';
        QualityMeasure."Description mesure unit" := '%P';
        IF QualityMeasure.Insert() THEN;

        QualityMeasure.Code := 'QUI-05';
        QualityMeasure.Description := 'S';
        QualityMeasure."Quality Measure Group" := 'CHEMICAL';
        QualityMeasure."Description mesure unit" := '%S';
        IF QualityMeasure.Insert() THEN;

        QualityMeasure.Code := 'QUI-06';
        QualityMeasure.Description := 'Cr';
        QualityMeasure."Quality Measure Group" := 'CHEMICAL';
        QualityMeasure."Description mesure unit" := '%.Cr';
        IF QualityMeasure.Insert() THEN;

        QualityMeasure.Code := 'QUI-07';
        QualityMeasure.Description := 'Ni';
        QualityMeasure."Quality Measure Group" := 'CHEMICAL';
        QualityMeasure."Description mesure unit" := '%Ni';
        IF QualityMeasure.Insert() THEN;

        QualityMeasure.Code := 'QUI-08';
        QualityMeasure.Description := 'Mo';
        QualityMeasure."Quality Measure Group" := 'CHEMICAL';
        QualityMeasure."Description mesure unit" := '%Mo';
        IF QualityMeasure.Insert() THEN;

        QualityMeasure.Code := 'QUI-09';
        QualityMeasure.Description := 'V';
        QualityMeasure."Quality Measure Group" := 'CHEMICAL';
        QualityMeasure."Description mesure unit" := '%V';
        IF QualityMeasure.Insert() THEN;

        QualityMeasure.Code := 'QUI-10';
        QualityMeasure.Description := 'Pb';
        QualityMeasure."Quality Measure Group" := 'CHEMICAL';
        QualityMeasure."Description mesure unit" := '%Pb';
        IF QualityMeasure.Insert() THEN;

        QualityMeasure.Code := 'QUI-11';
        QualityMeasure.Description := 'Se';
        QualityMeasure."Quality Measure Group" := 'CHEMICAL';
        QualityMeasure."Description mesure unit" := '%Se';
        IF QualityMeasure.Insert() THEN;

        QualityMeasure.Code := 'QUI-12';
        QualityMeasure.Description := 'Te';
        QualityMeasure."Quality Measure Group" := 'CHEMICAL';
        QualityMeasure."Description mesure unit" := '%te';
        IF QualityMeasure.Insert() THEN;

        QualityMeasure.Code := 'QUI-13';
        QualityMeasure.Description := 'Mo';
        QualityMeasure."Quality Measure Group" := 'CHEMICAL';
        QualityMeasure."Description mesure unit" := '%Mo';
        IF QualityMeasure.Insert() THEN;

        QualityMeasure.Code := 'QUI-14';
        QualityMeasure.Description := 'Al';
        QualityMeasure."Quality Measure Group" := 'CHEMICAL';
        QualityMeasure."Description mesure unit" := '%Al';
        IF QualityMeasure.Insert() THEN;

        QualityMeasure.Code := 'QUI-15';
        QualityMeasure.Description := 'Bi';
        QualityMeasure."Quality Measure Group" := 'CHEMICAL';
        QualityMeasure."Description mesure unit" := '%Bi';
        IF QualityMeasure.Insert() THEN;

        QualityMeasure.Code := 'QUI-16';
        QualityMeasure.Description := 'W';
        QualityMeasure."Quality Measure Group" := 'CHEMICAL';
        QualityMeasure."Description mesure unit" := '%W';
        IF QualityMeasure.Insert() THEN;

        QualityMeasure.Code := 'QUI-17';
        QualityMeasure.Description := 'Co';
        QualityMeasure."Quality Measure Group" := 'CHEMICAL';
        QualityMeasure."Description mesure unit" := '%Co';
        IF QualityMeasure.Insert() THEN;

        QualityMeasure.Code := 'QUI-18';
        QualityMeasure.Description := 'N';
        QualityMeasure."Quality Measure Group" := 'CHEMICAL';
        QualityMeasure."Description mesure unit" := '%N';
        IF QualityMeasure.Insert() THEN;

        QualityMeasure.Code := 'QUI-19';
        QualityMeasure.Description := 'Ti';
        QualityMeasure."Quality Measure Group" := 'CHEMICAL';
        QualityMeasure."Description mesure unit" := '%Ti';
        IF QualityMeasure.Insert() THEN;

        QualityMeasure.Code := 'QUI-21';
        QualityMeasure.Description := 'Cev';
        QualityMeasure."Quality Measure Group" := 'CHEMICAL';
        QualityMeasure."Description mesure unit" := '%Cev';
        IF QualityMeasure.Insert() THEN;

        QualityMeasure.Code := 'MEC-01';
        QualityMeasure.Description := 'TEST BAR SIZE';
        QualityMeasure."Quality Measure Group" := 'MECHANICAL';
        QualityMeasure."Description mesure unit" := 'mm.';
        IF QualityMeasure.Insert() THEN;

        QualityMeasure.Code := 'MEC-02';
        QualityMeasure.Description := 'TENS. STRETCH';
        QualityMeasure."Quality Measure Group" := 'MECHANICAL';
        QualityMeasure."Description mesure unit" := 'N/mm2';
        IF QualityMeasure.Insert() THEN;

        QualityMeasure.Code := 'MEC-03';
        QualityMeasure.Description := 'YIELD POINT';
        QualityMeasure."Quality Measure Group" := 'MECHANICAL';
        QualityMeasure."Description mesure unit" := 'N/mm2';
        IF QualityMeasure.Insert() THEN;

        QualityMeasure.Code := 'MEC-04';
        QualityMeasure.Description := 'ELONGATION';
        QualityMeasure."Quality Measure Group" := 'MECHANICAL';
        QualityMeasure."Description mesure unit" := 'Lo = 5do%';
        IF QualityMeasure.Insert() THEN;

        QualityMeasure.Code := 'MEC-05';
        QualityMeasure.Description := 'ROUGNESS';
        QualityMeasure."Quality Measure Group" := 'MECHANICAL';
        QualityMeasure."Description mesure unit" := 'RZ 63 MAX';
        IF QualityMeasure.Insert() THEN;

        QualityMeasure.Code := 'MEC-06';
        QualityMeasure.Description := 'HARDNESS';
        QualityMeasure."Quality Measure Group" := 'MECHANICAL';
        QualityMeasure."Description mesure unit" := 'NUCLEO HB';
        IF QualityMeasure.Insert() THEN;

        QualityMeasure.Code := 'SUP-01';
        QualityMeasure.Description := 'Services';
        QualityMeasure."Quality Measure Group" := 'SUPPLY';
        QualityMeasure."Description mesure unit" := '1..100';
        IF QualityMeasure.Insert() THEN;

        QualityMeasure.Code := 'SUP-02';
        QualityMeasure.Description := 'Quality supply';
        QualityMeasure."Quality Measure Group" := 'SUPPLY';
        QualityMeasure."Description mesure unit" := '1..100';
        IF QualityMeasure.Insert() THEN;

    end;
}