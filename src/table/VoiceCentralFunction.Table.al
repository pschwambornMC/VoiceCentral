table 50100 "Voice Central Function"
{
    DataClassification = SystemMetadata;

    fields
    {
        field(1; ID; Code[20])
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
        field(6; "Codeunit-Id"; Integer)
        {
        }
    }

    keys
    {
        key(PK; ID)
        {
            Clustered = true;
        }
    }
}