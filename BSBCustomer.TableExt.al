tableextension 50100 "BSB Customer" extends Customer
{
    fields
    {
        field(50100; "BSB Favorite Book No."; Code[20])
        {
            Caption = 'Favorite Book No.';
            DataClassification = ToBeClassified;
            TableRelation = "BSB Book";
            //TODO Bei der Auswahl eines gesperrten Buchs soll hier eine Fehlermeldung kommen

            trigger OnValidate()
            var
                BSBBook: Record "BSB Book";
            begin
                if ("BSB Favorite Book No." <> xRec."BSB Favorite Book No.") and
                    ("BSB Favorite Book No." <> '')
                then begin
                    BSBBook.Get("BSB Favorite Book No.");
                    BSBBook.TestBlocked();
                end;

                if ("BSB Favorite Book No." <> xRec."BSB Favorite Book No.") and (CurrFieldNo > 0) then
                    CalcFields("BSB Favorite Book Description")
            end;
        }
        field(50101; "BSB Favorite Book Description"; Text[100])
        {
            Caption = 'Favorite Book Description';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = lookup("BSB Book".Description where("No." = field("BSB Favorite Book No.")));
        }
    }
    keys
    {
        key(BSB1; "BSB Favorite Book No.") { }
    }
}
