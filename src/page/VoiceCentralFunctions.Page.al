page 50102 "Voice Central Functions"
{
    APIGroup = 'voiceCentral';
    APIPublisher = 'PSC';
    APIVersion = 'v2.0';
    Caption = 'VoiceCentralFunctions';
    DelayedInsert = true;
    EntityName = 'voiceCentralFunction';
    EntitySetName = 'voiceCentralFunctions';
    PageType = API;
    SourceTable = "Voice Central Function";
    ODataKeyFields = SystemId;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(id; Rec.SystemId)
                {
                    Caption = 'Id';
                    Editable = false;
                }
                field(description; Rec.Description)
                {
                    Caption = 'Description';
                }
                field(parameter1name; Rec."Parameter 1 Name")
                {
                    Caption = 'Parameter 1 Name';
                }
                field(parameter2name; Rec."Parameter 2 Name")
                {
                    Caption = 'Parameter 2 Name';
                }
                field(parameter3name; Rec."Parameter 3 Name")
                {
                    Caption = 'Parameter 3 Name';
                }
                field(parameter4name; Rec."Parameter 3 Name")
                {
                    Caption = 'Parameter 3 Name';
                }
                field(parameter5name; Rec."Parameter 3 Name")
                {
                    Caption = 'Parameter 3 Name';
                }
            }
        }
    }
}
