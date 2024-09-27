table 50100 "Voice Central Function"
{
    DataClassification = SystemMetadata;

    fields
    {
        field(1; "Function Name"; Enum "VoiceCentralFunctions")
        {
        }
        field(2; Description; Text[250])
        {
        }
        field(3; "Parameter 1 Name"; Text[250])
        {
        }
        field(4; "Parameter 2 Name"; Text[250])
        {
        }
        field(5; "Parameter 3 Name"; Text[250])
        {
        }
        field(6; "Parameter 4 Name"; Text[250])
        {
        }
        field(7; "Parameter 5 Name"; Text[250])
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
}