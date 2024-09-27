page 50102 "Voice Central Functions"
{
    APIGroup = 'VoiceCentral';
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
                field(id; Rec.ID)
                {
                    Caption = 'ID';
                }
                field(Description; Rec.Description)
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
                field(codeunitid; Rec."Codeunit-Id")
                {
                    Caption = 'Codeunit-Id';
                }
                field(systemCreatedAt; Rec.SystemCreatedAt)
                {
                    Caption = 'SystemCreatedAt';
                }
                field(systemCreatedBy; Rec.SystemCreatedBy)
                {
                    Caption = 'SystemCreatedBy';
                }
                field(systemId; Rec.SystemId)
                {
                    Caption = 'SystemId';
                }
                field(systemModifiedAt; Rec.SystemModifiedAt)
                {
                    Caption = 'SystemModifiedAt';
                }
                field(systemModifiedBy; Rec.SystemModifiedBy)
                {
                    Caption = 'SystemModifiedBy';
                }
            }
        }
    }
}
