table 86102 "Empty Ledger Entry"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            DataClassification = CustomerContent;
            AutoIncrement = true;
        }
        field(2; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
            DataClassification = CustomerContent;
        }
        field(3; "Item Ledger Entry No."; Integer)
        {
            Caption = 'Cust. Ledger Entry No.';
            DataClassification = CustomerContent;
            TableRelation = "Cust. Ledger Entry"."Entry No.";
        }
        field(4; "Customer No."; Code[50])
        {
            Caption = 'Customer No.';
            DataClassification = CustomerContent;
            TableRelation = Customer."No.";
        }
        field(5; "Empty Code"; code[20])
        {
            Caption = 'Empty Code';
            DataClassification = CustomerContent;
            TableRelation = empty.Code;
        }
        field(6; "Quantity"; Decimal)
        {
            Caption = 'Quantity';
            DataClassification = CustomerContent;
        }
        field(7; "Amount"; Decimal)
        {
            Caption = 'Amount';
            DataClassification = CustomerContent;
        }
        field(8; "Sales Invoice No."; Code[20])
        {
            Caption = 'Sales Invoice No.';
            DataClassification = CustomerContent;
        }
        field(9; "Sales Invoice Line No."; Integer)
        {
            Caption = 'Sales Invoice Line No.';
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
    }

}