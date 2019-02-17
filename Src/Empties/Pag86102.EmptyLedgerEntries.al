
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
                field("Posting Date"; "Posting Date")
                {
                    ApplicationArea = All;
                }
                field("Item Ledger Entry No."; "Item Ledger Entry No.")
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
                field("Sales Invoice No."; "Sales Invoice No.")
                {
                    ApplicationArea = All;
                }
                field("Sales Invoice Line No."; "Sales Invoice Line No.")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

}