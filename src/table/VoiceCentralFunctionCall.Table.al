table 50101 VoiceCentralFunctionCall
{
    Caption = 'VoiceCentralFunctionCall';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Entry No."; Integer)
        {

        }
        field(2; "Function Name"; Enum "VoiceCentralFunctions")
        {
        }
        field(3; Description; Text[250])
        {
        }
        field(4; "Parameter 1 Name"; Text[250])
        {
        }
        field(5; "Parameter 2 Name"; Text[250])
        {
        }
        field(6; "Parameter 3 Name"; Text[250])
        {
        }
        field(7; "Parameter 4 Name"; Text[250])
        {
        }
        field(8; "Parameter 5 Name"; Text[250])
        {
        }
        field(9; Result; Text[2048])
        {

        }
    }

    keys
    {
        key(PK; "Function Name")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    begin
        "Entry No." := GetLastEntryNo();

        if "Entry No." = 0 then
            "Entry No." := 1
    end;


    procedure GetLastEntryNo(): Integer;
    var
        findRecordManagement: Codeunit "Find Record Management";
    begin
        exit(findRecordManagement.GetLastEntryIntFieldValue(Rec, FieldNo("Entry No.")))
    end;



}
