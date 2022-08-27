pageextension 50189 NewFieldSalesReceivablesSetup extends "Sales & Receivables Setup"
{
    layout
    {

        addafter("Direct Debit Mandate Nos.")
        {
            field("Incident Nos."; Rec."Incident Nos.")
            {
                Caption = 'Incident Nos.';
                ApplicationArea = all;
            }
        }

    }
}
