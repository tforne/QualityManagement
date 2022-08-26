tableextension 50186 NewFieldSalesReceivablesSetup extends "Sales & Receivables Setup"
{
    fields
    {

        field(50202; "Nº Serie Interaccion"; Code[20])
        {
            Caption = 'Nº Serie Interacción';
            TableRelation = "No. Series".Code;
        }
    }
}