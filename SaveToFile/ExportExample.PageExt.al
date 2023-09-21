pageextension 50100 "ExportExample" extends "Company Information"
{
    layout
    {

    }
    actions
    {
        addlast(Processing)
        {
            Action("Export Text")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Category4;
                Image = ExportElectronicDocument;


                trigger OnAction()
                var
                    ExportExample: Codeunit "ExportExample";
                begin
                    ExportExample.CreateTextFile();
                end;
            }


        }
    }

    var
        myInt: Integer;
}