
page 86100 "Empties"
{
    Caption = 'Empties';
    PageType = List;
    SourceTable = "Empty";
    UsageCategory = Administration;
    ApplicationArea = All;

    layout
    {

        area(content)
        {
            repeater(Group)
            {

                field("Code"; "Code")
                {
                    ApplicationArea = All;
                }

                field("Description"; "Description")
                {
                    ApplicationArea = All;
                }

                field("Price"; "Price")
                {
                    ApplicationArea = All;
                }

            }
        }
    }
    actions
    {
        area(Navigation)
        {
            action(ShowItems)
            {
                Caption = 'Items';
                Image = Item;
                RunObject = page "Item Empties";
                RunPageLink = "Empty Code" = field (Code);
                ApplicationArea = All;
                Scope = "Repeater";
            }
            action("Ledger Entries")
            {
                caption = 'Ledger Entries';
                Image = LedgerEntries;
                RunObject = page "Empty Ledger Entries";
                RunPageLink = "Empty Code" = field (Code);
                ApplicationArea = All;
                Scope = "Repeater";
            }
        }
    }

}