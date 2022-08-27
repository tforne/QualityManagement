tableextension 50186 NewFieldSalesReceivablesSetup extends "Sales & Receivables Setup"
{
    fields
    {

        field(50202; "Incident Nos."; Code[20])
        {
            Caption = 'Incident Nos.';
            TableRelation = "No. Series".Code;
        }
    }
}