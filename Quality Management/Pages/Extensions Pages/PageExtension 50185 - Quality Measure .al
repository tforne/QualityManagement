pageextension 50185 NewFieldQualityMeasure extends "Quality Measures"
{
    layout
    {
        addafter("Description")
        {
            //Visible = true;
            field("Description mesure unit"; Rec."Description mesure unit")
            {
                ApplicationArea = All;

            }
            field("Quality Measure Group"; Rec."Quality Measure Group")
            {
                ApplicationArea = All;

            }
            // Add changes to page layout here
        }
    }

}