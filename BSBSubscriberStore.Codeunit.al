codeunit 50100 "BSB Subscriber Store"
{
    var
        FavoriteBookHintMsg: Label 'Do not forget to enter %1', Comment = '"DEU"=Vergessen Sie nicht %1 einzugeben';

    [EventSubscriber(ObjectType::Table, Database::Customer, OnAfterInsertEvent, '', true, true)]
    local procedure FavoriteBookHint(var Rec: Record Customer)
    begin
        if Rec."BSB Favorite Book No." = '' then
            Message(FavoriteBookHintMsg, Rec.FieldCaption("BSB Favorite Book No."));
    end;
}