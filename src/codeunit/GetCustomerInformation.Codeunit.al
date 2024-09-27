codeunit 50101 GetCustomerInformation implements VoiceCentral
{

    procedure ExecuteCommand(customerNo: Text; customerName: Text; param3: Text; parm4: Text; param5: Text) result: Text
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

        result := GetContactProfileAnswer();

        if result = '' then
            result := Format(enum::VoiceCentralResultMessage::CustomerInformationNotFoundLbl)
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
    end;

    local procedure GetContactProfileAnswer() result: Text
    var
        currentTextbuilder: TextBuilder;
        entityFound: Boolean;
    begin
        Contact := GetEntity.GetCompanyContact(Customer);

        entityFound := not IsNullGuid(Contact.SystemId);

        if entityFound = false then
            exit;

        ContactProfileAnswer.SetRange("Contact No.", Contact."No.");
        ContactProfileAnswer.SetFilter(Answer, '<>%1', '');

        if ContactProfileAnswer.FindSet() then
            repeat
                currentTextbuilder.AppendLine(ContactProfileAnswer.Question() + ' ' + ContactProfileAnswer.Answer);
            until ContactProfileAnswer.Next() = 0;

        result := currentTextbuilder.ToText();
    end;


    var
        Contact: Record Contact;
        ContactProfileAnswer: Record "Contact Profile Answer";
        Customer: Record Customer;
        GetEntity: Codeunit GetEntity;


}
