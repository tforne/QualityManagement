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
        NoSeries: Record "No. Series";
        NoSeriesLine: Record "No. Series Line";

    begin

        QualitySetup.Code := '';
        if QualitySetup.insert then;
        QualitySetup."Archive Doc. Quality Nos." := 'CAL-ARC-DOC';
        QualitySetup.modify;

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
        QualityMeasure."Composition Quality Group" := 'CHEMICAL';
        QualityMeasure."Description mesure unit" := '%C';
        IF QualityMeasure.Insert() THEN;

        QualityMeasure.Code := 'QUI-02';
        QualityMeasure.Description := 'Mn';
        QualityMeasure."Composition Quality Group" := 'CHEMICAL';
        QualityMeasure."Description mesure unit" := '%Mn';
        IF QualityMeasure.Insert() THEN;

        QualityMeasure.Code := 'QUI-03';
        QualityMeasure.Description := 'Si';
        QualityMeasure."Composition Quality Group" := 'CHEMICAL';
        QualityMeasure."Description mesure unit" := '%Si';
        IF QualityMeasure.Insert() THEN;

        QualityMeasure.Code := 'QUI-04';
        QualityMeasure.Description := 'P';
        QualityMeasure."Composition Quality Group" := 'CHEMICAL';
        QualityMeasure."Description mesure unit" := '%P';
        IF QualityMeasure.Insert() THEN;

        QualityMeasure.Code := 'QUI-05';
        QualityMeasure.Description := 'S';
        QualityMeasure."Composition Quality Group" := 'CHEMICAL';
        QualityMeasure."Description mesure unit" := '%S';
        IF QualityMeasure.Insert() THEN;

        QualityMeasure.Code := 'QUI-06';
        QualityMeasure.Description := 'Cr';
        QualityMeasure."Composition Quality Group" := 'CHEMICAL';
        QualityMeasure."Description mesure unit" := '%.Cr';
        IF QualityMeasure.Insert() THEN;

        QualityMeasure.Code := 'QUI-07';
        QualityMeasure.Description := 'Ni';
        QualityMeasure."Composition Quality Group" := 'CHEMICAL';
        QualityMeasure."Description mesure unit" := '%Ni';
        IF QualityMeasure.Insert() THEN;

        QualityMeasure.Code := 'QUI-08';
        QualityMeasure.Description := 'Mo';
        QualityMeasure."Composition Quality Group" := 'CHEMICAL';
        QualityMeasure."Description mesure unit" := '%Mo';
        IF QualityMeasure.Insert() THEN;

        QualityMeasure.Code := 'QUI-09';
        QualityMeasure.Description := 'V';
        QualityMeasure."Composition Quality Group" := 'CHEMICAL';
        QualityMeasure."Description mesure unit" := '%V';
        IF QualityMeasure.Insert() THEN;

        QualityMeasure.Code := 'QUI-10';
        QualityMeasure.Description := 'Pb';
        QualityMeasure."Composition Quality Group" := 'CHEMICAL';
        QualityMeasure."Description mesure unit" := '%Pb';
        IF QualityMeasure.Insert() THEN;

        QualityMeasure.Code := 'QUI-11';
        QualityMeasure.Description := 'Se';
        QualityMeasure."Composition Quality Group" := 'CHEMICAL';
        QualityMeasure."Description mesure unit" := '%Se';
        IF QualityMeasure.Insert() THEN;

        QualityMeasure.Code := 'QUI-12';
        QualityMeasure.Description := 'Te';
        QualityMeasure."Composition Quality Group" := 'CHEMICAL';
        QualityMeasure."Description mesure unit" := '%te';
        IF QualityMeasure.Insert() THEN;

        QualityMeasure.Code := 'QUI-13';
        QualityMeasure.Description := 'Mo';
        QualityMeasure."Composition Quality Group" := 'CHEMICAL';
        QualityMeasure."Description mesure unit" := '%Mo';
        IF QualityMeasure.Insert() THEN;

        QualityMeasure.Code := 'QUI-14';
        QualityMeasure.Description := 'Al';
        QualityMeasure."Composition Quality Group" := 'CHEMICAL';
        QualityMeasure."Description mesure unit" := '%Al';
        IF QualityMeasure.Insert() THEN;

        QualityMeasure.Code := 'QUI-15';
        QualityMeasure.Description := 'Bi';
        QualityMeasure."Composition Quality Group" := 'CHEMICAL';
        QualityMeasure."Description mesure unit" := '%Bi';
        IF QualityMeasure.Insert() THEN;

        QualityMeasure.Code := 'QUI-16';
        QualityMeasure.Description := 'W';
        QualityMeasure."Composition Quality Group" := 'CHEMICAL';
        QualityMeasure."Description mesure unit" := '%W';
        IF QualityMeasure.Insert() THEN;

        QualityMeasure.Code := 'QUI-17';
        QualityMeasure.Description := 'Co';
        QualityMeasure."Composition Quality Group" := 'CHEMICAL';
        QualityMeasure."Description mesure unit" := '%Co';
        IF QualityMeasure.Insert() THEN;

        QualityMeasure.Code := 'QUI-18';
        QualityMeasure.Description := 'N';
        QualityMeasure."Composition Quality Group" := 'CHEMICAL';
        QualityMeasure."Description mesure unit" := '%N';
        IF QualityMeasure.Insert() THEN;

        QualityMeasure.Code := 'QUI-19';
        QualityMeasure.Description := 'Ti';
        QualityMeasure."Composition Quality Group" := 'CHEMICAL';
        QualityMeasure."Description mesure unit" := '%Ti';
        IF QualityMeasure.Insert() THEN;

        QualityMeasure.Code := 'QUI-21';
        QualityMeasure.Description := 'Cev';
        QualityMeasure."Composition Quality Group" := 'CHEMICAL';
        QualityMeasure."Description mesure unit" := '%Cev';
        IF QualityMeasure.Insert() THEN;

        QualityMeasure.Code := 'MEC-01';
        QualityMeasure.Description := 'TEST BAR SIZE';
        QualityMeasure."Composition Quality Group" := 'MECHANICAL';
        QualityMeasure."Description mesure unit" := 'mm.';
        IF QualityMeasure.Insert() THEN;

        QualityMeasure.Code := 'MEC-02';
        QualityMeasure.Description := 'TENS. STRETCH';
        QualityMeasure."Composition Quality Group" := 'MECHANICAL';
        QualityMeasure."Description mesure unit" := 'N/mm2';
        IF QualityMeasure.Insert() THEN;

        QualityMeasure.Code := 'MEC-03';
        QualityMeasure.Description := 'YIELD POINT';
        QualityMeasure."Composition Quality Group" := 'MECHANICAL';
        QualityMeasure."Description mesure unit" := 'N/mm2';
        IF QualityMeasure.Insert() THEN;

        QualityMeasure.Code := 'MEC-04';
        QualityMeasure.Description := 'ELONGATION';
        QualityMeasure."Composition Quality Group" := 'MECHANICAL';
        QualityMeasure."Description mesure unit" := 'Lo = 5do%';
        IF QualityMeasure.Insert() THEN;

        QualityMeasure.Code := 'MEC-05';
        QualityMeasure.Description := 'ROUGNESS';
        QualityMeasure."Composition Quality Group" := 'MECHANICAL';
        QualityMeasure."Description mesure unit" := 'RZ 63 MAX';
        IF QualityMeasure.Insert() THEN;

        QualityMeasure.Code := 'MEC-06';
        QualityMeasure.Description := 'HARDNESS';
        QualityMeasure."Composition Quality Group" := 'MECHANICAL';
        QualityMeasure."Description mesure unit" := 'NUCLEO HB';
        IF QualityMeasure.Insert() THEN;

        QualityMeasure.Code := 'SUP-01';
        QualityMeasure.Description := 'Services';
        QualityMeasure."Composition Quality Group" := 'SUPPLY';
        QualityMeasure."Description mesure unit" := '1..100';
        IF QualityMeasure.Insert() THEN;

        QualityMeasure.Code := 'SUP-02';
        QualityMeasure.Description := 'Quality supply';
        QualityMeasure."Composition Quality Group" := 'SUPPLY';
        QualityMeasure."Description mesure unit" := '1..100';
        IF QualityMeasure.Insert() THEN;

    end;
}