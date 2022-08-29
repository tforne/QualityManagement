query 50180 "Power BI Cust. Interact. Logs"
{
    Caption = 'Power BI Cust. Interactions';

    elements
    {
        dataitem(Customer; Customer)
        {
            column(No; "No.")
            {
                Caption = 'No';
            }
            column(Name; Name)
            {
                Caption = 'Name';
            }
            dataitem(Contact_Business_Relation; "Contact Business Relation")
            {
                DataItemLink = "No." = Customer."No.";

                dataitem(Interaction_Log_Entry; "Interaction Log Entry")
                {
                    DataItemLink = "Contact No." = Contact_Business_Relation."Contact No.";
                    DataItemTableFilter = "Quality Incident" = const(true);
                    column(Entry_No_; "Entry No.")
                    {
                        Caption = 'Entry No.';
                    }
                    column(Date; Date)
                    {
                        Caption = 'Date';
                    }
                    column(Interaction_Group_Code; "Interaction Group Code")
                    {
                        caption = 'Interaction Group Code';
                    }
                    column(Interaction_Template_Code; "Interaction Template Code")
                    {
                        Caption = 'Interaction Template Code';
                    }
                    column(Description_Incident; "Description Incident")
                    {
                        Caption = 'Description';
                    }
                    column(Responsible_Name; "Responsible Name")
                    {
                        Caption = 'Reponsible';
                    }
                    column(Quality_Incident; "Quality Incident")
                    {
                        Caption = 'Quality Incident';
                    }
                    column(Status; Status)
                    {
                        Caption = 'Status';
                    }
                }
            }
        }
    }
}