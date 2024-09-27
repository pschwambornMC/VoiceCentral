page 50101 VoiceCentralFunctionCalls
{
    APIGroup = 'voiceCentral';
    APIPublisher = 'PSC';
    APIVersion = 'v2.0';
    Caption = 'VoiceCentralFunctionCalls';
    DelayedInsert = true;
    EntityName = 'voiceCentralFunction';
    EntitySetName = 'getVoiceCentralResult';
    PageType = API;
    SourceTable = "VoiceCentralFunctionCall";
    ODataKeyFields = SystemId;

    layout
    {
        area(Content)
        {
            repeater(RepeaterControl)
            {
                field(id; Rec.SystemId)
                {
                    Caption = 'Id';
                    Editable = false;
                }
                field(functionName; Rec."Function Name") { }
                field(parameter1Name; Rec."Parameter 1 Name") { }
                field(parameter2NameS; Rec."Parameter 2 Name") { }
                field(parameter3Name; Rec."Parameter 3 Name") { }
                field(parameter4Name; Rec."Parameter 4 Name") { }
                field(parameter5Name; Rec."Parameter 5 Name") { }
                field(result; Rec.Result) { }
            }
        }
    }
    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    var
        voiceCentral: Interface VoiceCentral;
    begin
        voiceCentral := Rec."Function Name";
        Rec.Result := CopyStr(voiceCentral.ExecuteCommand(Rec."Parameter 1 Name", Rec."Parameter 2 Name", Rec."Parameter 3 Name", Rec."Parameter 4 Name", Rec."Parameter 5 Name"), 1, MaxStrLen(Rec.Result));

        if not IsNullGuid(Rec.SystemId) then
            Rec.Modify();
    end;

    [ServiceEnabled]
    procedure ExecuteCommand(var actionContext: WebServiceActionContext)
    var
        voiceCentral: Interface VoiceCentral;
    begin
        voiceCentral := Rec."Function Name";
        Rec.Result := CopyStr(voiceCentral.ExecuteCommand(Rec."Parameter 1 Name", Rec."Parameter 2 Name", Rec."Parameter 3 Name", Rec."Parameter 4 Name", Rec."Parameter 5 Name"), 1, MaxStrLen(Rec.Result));

        if not IsNullGuid(Rec.SystemId) then begin
            Rec.Modify();
            SetActionResponse(actionContext, Rec.SystemId, WebServiceActionResultCode::Updated);

            exit;
        end;

        SetActionResponse(actionContext, Rec.SystemId, WebServiceActionResultCode::None);
    end;

    local procedure SetActionResponse(var actionContext: WebServiceActionContext; recordId: Guid; currentWebServiceActionResultCode: WebServiceActionResultCode)
    begin
        actionContext.SetObjectType(ObjectType::Page);
        actionContext.SetObjectId(Page::VoiceCentralFunctionCalls);
        actionContext.AddEntityKey(Rec.FieldNo(SystemId), recordId);
        actionContext.SetResultCode(currentWebServiceActionResultCode);
    end;
}




