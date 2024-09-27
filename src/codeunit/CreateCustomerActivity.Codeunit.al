codeunit 50103 CreateCustomerActivity implements VoiceCentral
{

    procedure ExecuteCommand(customerNo: Text; customerName: Text; interactionTemplateText: Text; parm4: Text; param5: Text) result: Text
    var
        customerNoToProcess: Code[20];
        customerNameToProcess: Text[100];
    begin
        ClearGlobals();

        customerNoToProcess := CopyStr(customerNo, 1, MaxStrLen(customerNoToProcess));
        customerNameToProcess := CopyStr(customerName, 1, MaxStrLen(customerNameToProcess));

        if not GetCustomer(customerNoToProcess, customerNameToProcess) then begin
            result := Format(enum::VoiceCentralResultMessage::CustomerNotFoundLbl);

            exit;
        end;

        Contact := GetEntity.GetCompanyContact(Customer);

        if IsNullGuid(Contact.SystemId) then begin
            result := Format(enum::VoiceCentralResultMessage::CustomerInformationNotFoundLbl);

            exit;
        end;

        InteractionTemplate := GetInterActionTemplate(interactionTemplateText);

        if IsNullGuid(InteractionTemplate.SystemId) then begin
            result := StrSubstNo(Format(enum::VoiceCentralResultMessage::InteractionTemplateCodeNotFoundLbl), interactionTemplateText);

            exit;
        end;

        result := CreateSegLineInteractionFromContact();
    end;

    local procedure GetCustomer(customerNo: Code[20]; customerName: Text[100]) result: Boolean
    begin
        Customer := GetEntity.GetUniqueCustomer(customerNo, customerName);

        result := not IsNullGuid(Customer.SystemId);
    end;

    local procedure ClearGlobals()
    begin
        Clear(Customer);
        Clear(Contact);
        Clear(InteractionTemplate);
    end;

    local procedure CreateSegLineInteractionFromContact() result: Text
    var
        segmentLine: Record "Segment Line";
    begin
        segmentLine.Init();
        segmentLine.Validate("Interaction Template Code", InteractionTemplate.Code);
        segmentLine.Validate("Contact No.", Contact."No.");
        segmentLine."Initiated By" := segmentLine."Initiated By"::Us;
        segmentLine.Validate(Date, WorkDate());
        segmentLine."Time of Interaction" := DT2Time(RoundDateTime(CurrentDateTime + 1000, 60000, '>'));

        if segmentLine.Insert() then
            result := Format(enum::VoiceCentralResultMessage::CreatedSegementLbl)
        else
            result := Format(enum::VoiceCentralResultMessage::CouldNoCreateSegmentLbl);
    end;

    local procedure GetInterActionTemplate(interactionTemplateText: Text) interactionTemplate: Record "Interaction Template"
    begin
        if not interactionTemplate.Get(interactionTemplateText) then begin
            interactionTemplate.SetRange(Description, interactionTemplateText);

            if not interactionTemplate.FindFirst() then
                interactionTemplate.Init();
        end;
    end;

    var
        Contact: Record Contact;
        ContactProfileAnswer: Record "Contact Profile Answer";
        Customer: Record Customer;
        InteractionTemplate: Record "Interaction Template";
        GetEntity: Codeunit GetEntity;

}
