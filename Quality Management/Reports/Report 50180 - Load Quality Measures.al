report 50180 "Load Quality Measures"
{
    Caption = 'Load Quality Measures';
    ProcessingOnly = true;

    dataset
    {
        dataitem("Composition Quality Header"; "Composition Quality Header")
        {
            trigger OnAfterGetRecord()
            begin
                if not HideValidationDialog then
                    Window.Update;
                FindCompositionQualityLineAndInsert("Composition Quality Header", QualityMeasureGroup)
            end;

            trigger OnPostDataItem()
            begin
            end;

            trigger OnPreDataItem()
            var
            begin
                "Composition Quality Header".setrange(Code, CompositionQualitHeaderCode);
                if not HideValidationDialog then
                    Window.Open(Text002, "Composition Quality Header".Code);

            end;
        }
    }

    requestpage
    {
        SaveValues = true;

        layout
        {
            area(content)
            {
                group(Options)
                {
                    Caption = 'Options';
                    field(PostingDate; PostingDate)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Posting Date';
                        ToolTip = 'Specifies the date for the posting of this batch job. By default, the working date is entered, but you can change it.';

                        trigger OnValidate()
                        begin
                        end;
                    }
                    field(QualityMeasureGroup; QualityMeasureGroup)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Quality Measure Group';
                        ToolTip = 'Specifies the  group of the quality measures that is processed by the report or batch job.';
                        TableRelation = "Quality Measure Group";
                    }
                }
            }
        }

        actions
        {
        }

        trigger OnOpenPage()
        begin
            if PostingDate = 0D then
                PostingDate := WorkDate;
        end;
    }

    labels
    {
    }

    trigger OnPreReport()
    begin

    end;

    var
        Text000: Label 'Enter the posting date.';
        Text001: Label 'Enter the document no.';
        Text002: Label 'Processing Composition Quality Header :    #1##########';
        Window: Dialog;
        CompositionQualitHeaderCode: Code[20];
        QualityMeasureGroup: Code[20];

    protected var
        HideValidationDialog: Boolean;
        PostingDate: Date;


    procedure InsertLine(CompositionQualityHeader: record "Composition Quality Header"; QualityMeasure: record "Quality Measure")
    var
        CompositionQualityLine, InsCompositionQualityLine : record "Composition Quality Line";
        LineNo: Integer;
    begin
        LineNo := 1000;
        CompositionQualityLine.reset;
        CompositionQualityLine.setrange("Composition Quality Code", CompositionQualityHeader.Code);
        if CompositionQualityLine.findlast then
            LineNo := CompositionQualityLine."Line No." + 10000;

        InsCompositionQualityLine."Composition Quality Code" := CompositionQualityHeader.Code;
        InsCompositionQualityLine."Customer No." := '';
        InsCompositionQualityLine."Line No." := LineNo;
        InsCompositionQualityLine."Qlty Measure Code" := QualityMeasure.Code;
        InsCompositionQualityLine.Description := QualityMeasure.Description;
        InsCompositionQualityLine."Qlty Measure Group Code" := QualityMeasure."Quality Measure Group";
        InsCompositionQualityLine."Min. Value" := 0;
        InsCompositionQualityLine."Max. Value" := 0;
        InsCompositionQualityLine.Insert;
        LineNo := LineNo + 10000;

    end;

    local procedure FindCompositionQualityLineAndInsert(CompositionQualityHeader: record "Composition Quality Header"; QualityMeasureGroup: Code[20]);
    var
        QualityMeasure: record "Quality Measure";
    begin
        QualityMeasure.reset;
        QualityMeasure.setrange("Quality Measure Group", QualityMeasureGroup);
        if QualityMeasure.FindFirst() then repeat
            InsertLine(CompositionQualityHeader, QualityMeasure);
        until QualityMeasure.Next() = 0;
    end;

    procedure SetInf("CompQltyCode": code[20])
    begin
        CompositionQualitHeaderCode := "CompQltyCode";
    end;

}