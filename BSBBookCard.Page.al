page 50100 "BSB Book Card"
{
    Caption = 'Book Card';
    PageType = Card;
    SourceTable = "BSB Book";
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field(Description; Rec.Description)
                {
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Search Description"; Rec."Search Description")
                {
                    Importance = Additional;
                    ToolTip = 'Specifies the value of the Search Description field.';
                }
                field(Blocked; Rec.Blocked)
                {
                    ToolTip = 'Specifies the value of the Blocked field.';
                }
                field(Author; Rec.Author)
                {
                    ToolTip = 'Specifies the value of the Author field.';
                }
                field(Type; Rec."Type")
                {
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field(ISBN; Rec.ISBN)
                {
                    Importance = Additional;
                    ToolTip = 'Specifies the value of the ISBN field.';
                }
                field(Created; Rec.Created)
                {
                    Importance = Additional;
                    ToolTip = 'Specifies the value of the Created field.';
                }
                field("Last Date Modified"; Rec."Last Date Modified")
                {
                    Importance = Additional;
                    ToolTip = 'Specifies the value of the Last Date Modified field.';
                }
            }
            group(Invoicing)
            {
                Caption = 'Invoicing';
                field("Author Provision %"; Rec."Author Provision %")
                {
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Author Provision % field.';
                }
            }
            group(Publishing)
            {
                Caption = 'Publishing';
                field("Edition No."; Rec."Edition No.")
                {
                    ToolTip = 'Specifies the value of the Edition No. field.';
                }
                field("No. of Pages"; Rec."No. of Pages")
                {
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the No. of Pages field.';
                }
                field("Date of Publishing"; Rec."Date of Publishing")
                {
                    ToolTip = 'Specifies the value of the Date of Publishing field.';
                }
            }
        }
        area(FactBoxes)
        {
            systempart(Links; Links)
            {
                ApplicationArea = RecordLinks;
            }
            systempart(Notes; Notes)
            {
                ApplicationArea = Notes;
            }

        }
    }
}