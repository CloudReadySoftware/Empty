table 86101 "Item Empty"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Item No."; Code[20])
        {
            Caption = '"Item No.';
            DataClassification = CustomerContent;
            TableRelation = Item."No.";
        }
        field(2; "Empty Code"; Code[20])
        {
            Caption = 'Empty Code';
            DataClassification = CustomerContent;
            TableRelation = Empty.Code;
        }
        field(3; "Qty. Per"; Decimal)
        {
            Caption = 'Qty. Per';
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(PK; "Item No.", "Empty Code")
        {
            Clustered = true;
        }
    }

}