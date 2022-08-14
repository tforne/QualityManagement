table 50183 "Composition Quality Header"
{

    Caption = 'Composition Quality Header';
    DrillDownPageID = 50185;
    LookupPageID = 50185;


    fields
    {
        field(1; "Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            NotBlank = true;
        }
        field(2; "Description"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Legal Normative Code"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Raw Materials Group Code"; Text[20])
        {
            DataClassification = ToBeClassified;
        }
        field(5; Status; Enum CompositionQualityStatus)
        {
            DataClassification = ToBeClassified;
        }

    }

    keys
    {
        key(Key1; "Code")
        {
        }
    }

    fieldgroups
    {
    }
    trigger OnDelete()
    begin
        CompositionQualityLine.SetRange("Composition Quality Code", Code);
        CompositionQualityLine.DeleteAll();

        CommentComposQltyHeader.setrange("Composition Quality Code", Code);
        CommentComposQltyHeader.DeleteAll();

    end;

    var
        CompositionQualityLine: Record "Composition Quality Line";
        CommentComposQltyHeader: Record "Comment Compos. Qlty Header";

    procedure LoadQualityMesures(CompositionQualityHeaderCode: code[20])
    var
        LoadQualities: Report 50180;
    begin
        LoadQualities.SetInf(CompositionQualityHeaderCode);
        LoadQualities.RunModal();
        Clear(LoadQualities);
    end;

    procedure ShowComments()
    var
        CommentComposQltyHeader: Record "Comment Compos. Qlty Header";
        PageCommentCompoQltyHeader: Page "Comment Compo. Qlty Header";
    begin
        CommentComposQltyHeader.SetRange("Composition Quality Code", Code);
        Clear(PageCommentCompoQltyHeader);
        PageCommentCompoQltyHeader.SetTableView(CommentComposQltyHeader);
        PageCommentCompoQltyHeader.RunModal();
    end;
}

