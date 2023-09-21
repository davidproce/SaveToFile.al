codeunit 50100 "ExportExample"
{
    //Create a simple BC AL text file:
    //https://www.cloudthing.com/blogs/export-to-text-files-from-business-central

    //Line Endings:
    //https://docs.microsoft.com/en-us/dynamics365/business-central/dev-itpro/developer/devenv-write-read-methods-line-break-behavior

    //Duration:
    //https://docs.microsoft.com/en-us/dynamics365/business-central/dev-itpro/developer/methods-auto/duration/duration-data-type

    //We've created this thing that create the string, create this buffer, builds up the content 
    // that output it to a file.

    trigger OnRun()
    begin

    end;

    procedure CreateTextFile()
    var
        InStr: InStream;
        OutStr: OutStream;
        tmpBlob: Codeunit "Temp Blob"; //Referencing codeunit Temp Blob
        FileName: Text;

        StartTime: Time;
        EndTime: Time;
        ElapsedTime: Integer; //Data type returs of integer of miliseconds
        //HowLong: Duration; 
        CRLF: Text[2];
        Counter: Integer;

    begin
        StartTime := System.Time; //Checkpoint for starting

        CRLF[1] := 13;
        CRLF[2] := 10; //I declare my CRLF Starting from 13 and after 10

        FileName := 'TestFile.txt';  //Notice: There is not path
        tmpBlob.CreateOutStream(OutStr, TextEncoding::Windows); //tmpBlob creates the OutStream...

        OutStr.WriteText('Start time: ' + ': This is a line in the text file' + CRLF);
        // OutStr.WriteText();

        for Counter := 1 to 1000 do begin
            OutStr.WriteText(Format(Counter) + ': This is a line in the text file' + CRLF)
        end;

        EndTime := System.Time;
        OutStr.WriteText('End Time: ' + Format(StartTime) + CRLF);
        //OutStr.WriteText();

        ElapsedTime := EndTime - StartTime;

        OutStr.WriteText('Elapsed time: ' + Format(ElapsedTime));
        tmpBlob.CreateInStream(InStr, TextEncoding::Windows);
        DownloadFromStream(InStr, '', '', '', FileName);

    end;

    var
        myInt: Integer;



}