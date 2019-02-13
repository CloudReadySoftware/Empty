
page 86102 "Empty Ledger Entries"
{
    Caption = 'Empty Ledger Entries';
    PageType = List;
    SourceTable = "Empty Ledger Entry";
    UsageCategory = Lists;
    ApplicationArea = All;
    Editable = false;


    layout
    {

        area(content)
        {
            repeater(Group)
            {

                field("Entry No."; "Entry No.")
                {
                    ApplicationArea = All;
                }

                field("Cust. Ledger Entry No."; "Cust. Ledger Entry No.")
                {
                    ApplicationArea = All;
                }

                field("Customer No."; "Customer No.")
                {
                    ApplicationArea = All;
                }


                field("Empty Code"; "Empty Code")
                {
                    ApplicationArea = All;
                }

                field("Quantity"; "Quantity")
                {
                    ApplicationArea = All;
                }

                field("Amount"; "Amount")
                {
                    ApplicationArea = All;
                }

            }
        }
    }

}