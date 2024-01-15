table 50100 "BSB Book"
{
    Caption = 'Book';
    DataClassification = ToBeClassified;
    DataCaptionFields = "No.", Description;
    LookupPageId = "BSB Book List";

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            NotBlank = true;
        }
        field(2; Description; Text[100])
        {
            trigger OnValidate()
            begin
                if ("Search Description" = UpperCase(xRec.Description)) or ("Search Description" = '') then
                    "Search Description" := CopyStr(Description, 1, MaxStrLen("Search Description"));
            end;
        }
        field(3; "Search Description"; Code[100]) { Caption = 'Search Description'; } //TODO Suchbegriff-Impl. noch machen
        field(4; Blocked; Boolean) { Caption = 'Blocked'; }
        field(5; Type; Option)
        {
            Caption = 'Type';
            OptionMembers = " ",Hardcover,Paperback;
            OptionCaption = ' ,Hardcover,Paperback';
        }
        field(7; Created; Date) //TODO Created noch setzen
        {
            Caption = 'Created';
            Editable = false;
        }
        field(8; "Last Date Modified"; Date) //TODO Last Date Modified noch setzen
        {
            Caption = 'Last Date Modified';
            Editable = false;
        }
        field(10; Author; Text[50]) { Caption = 'Author'; }
        field(11; "Author Provision %"; Decimal)
        {
            Caption = 'Author Provision %';
            DecimalPlaces = 0 : 2;
            MinValue = 0;
            MaxValue = 100;
        }
        field(15; ISBN; Code[20]) { Caption = 'ISBN'; }
        field(16; "No. of Pages"; Integer)
        {
            Caption = 'No. of Pages';
            MinValue = 0;
        }
        field(17; "Edition No."; Integer)
        {
            Caption = 'Edition No.';
            MinValue = 0;
        }
        field(18; "Date of Publishing"; Date) { Caption = 'Date of Publishing'; }
    }

    keys
    {
        key(PK; "No.") { Clustered = true; }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "No.", Description, Author) { }
        fieldgroup(Brick; "No.", Description, Author, "No. of Pages") { }
    }

    var
        OnDeleteBookErr: Label 'A book cannot be deleted';

    trigger OnInsert()
    begin
        Created := Today;
    end;

    trigger OnDelete()
    begin
        Error(OnDeleteBookErr);
    end;

    trigger OnModify()
    begin
        "Last Date Modified" := Today;
    end;

    trigger OnRename()
    begin
        "Last Date Modified" := Today;
    end;

    procedure TestBlocked()
    begin
        TestField(Blocked, false);
    end;

    /// <summary>
    /// Open the Book Card with current
    /// </summary>
    procedure ShowCard()
    begin
        ShowCard(Rec);
    end;

    /// <summary>
    /// Open the Book Card for given BookNo
    /// </summary>
    /// <param name="BookNo">Code[20].</param>
    procedure ShowCard(BookNo: Code[20])
    var
        BSBBook: Record "BSB Book";
    begin
        if not BSBBook.Get(BookNo) then
            exit;
        BSBBook.ShowCard();
    end;

    /// <summary>
    /// Open the Book Card for given record 
    /// </summary>
    /// <param name="BSBBook">Record "BSB Book".</param>
    procedure ShowCard(BSBBook: Record "BSB Book")
    begin
        Page.Run(Page::"BSB Book Card", BSBBook);
    end;
}

//[x] TODO Ein Buch darf nicht gelöscht werden
//TODO TestBlocked() machen