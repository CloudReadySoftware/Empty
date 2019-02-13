
page 86101 "Item Empties"
{
    Caption = 'Item Empties';
    PageType = List;
    SourceTable = "Item Empty";
    UsageCategory = Administration;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {

                field("Item No."; "Item No.")
                {
                    ApplicationArea = All;
                }

                field("Empty Code"; "Empty Code")
                {
                    ApplicationArea = All;
                }

                field("Qty. Per"; "Qty. Per")
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
            action(ItemCard)
            {
                Caption = 'Item Card';
                Image = Item;
                RunObject = page "Item Card";
                RunPageLink = "No." = field ("Item No.");
                ApplicationArea = All;
                Scope = "Repeater";
            }
        }
    }

}