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
            field("Composition Quality Group"; Rec."Composition Quality Group")
            {
                ApplicationArea = All;

            }
            // Add changes to page layout here
        }
    }

}