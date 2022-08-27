query 50180 "Power BI Cust. Interactions Logs"
{
    Caption = 'Power BI Cust. Interactions';

    elements
    {
        dataitem(Customer; Customer)
        {
            column(No; "No.")
            {
            }
            dataitem(Item_Ledger_Entry; "Interaction Log Entry")
            {
                DataItemLink = "Contact Company No." = Customer."No.";
            }
        }
    }
}