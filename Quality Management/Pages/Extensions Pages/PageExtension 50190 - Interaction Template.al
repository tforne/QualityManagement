pageextension 50190 NewFieldSalesInteracTemplate extends "Interaction Templates"
{
    layout
    {

        addafter("Description")
        {
            field("Quality Incident"; Rec."Quality Incident")
            {
                Caption = 'Quality Incident';
                ApplicationArea = all;
            }
        }
    }
}