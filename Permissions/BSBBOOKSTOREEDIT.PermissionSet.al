permissionset 50100 "BSB BOOKSTORE, EDIT"
{
    Caption = 'Edit and Create Books etc.';

    // Assignable = true;
    Permissions = tabledata "BSB Book" = RIMD,
        table "BSB Book" = X,
        tabledata "BSB AL Issue" = RIMD,
        table "BSB AL Issue" = X;
}