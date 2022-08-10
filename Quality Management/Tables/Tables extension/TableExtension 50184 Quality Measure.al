tableextension 50184 NewFieldQualityMeasure extends "Quality Measure"
{
    fields
    {
        // Add changes to table fields here field(99300; "Comissions Zone"; Code[20])

        field(50180; "Composition Quality Group"; Code[20])
        {
            TableRelation = "Quality Measure Group";
            trigger OnValidate();
            begin

            end;
        }
        field(50181; "Description mesure unit"; Text[25])
        {
            trigger OnValidate();
            begin

            end;
        }

    }
    var

}