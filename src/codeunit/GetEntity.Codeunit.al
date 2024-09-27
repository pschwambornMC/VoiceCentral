codeunit 50102 GetEntity
{
    internal procedure GetUniqueCustomer(customerNo: Code[20]; customerName: Text[100]) customer: Record Customer
    var
        customerFound: Boolean;
    begin
        customerFound := customer.Get(customerNo);

        if not customerFound then begin
            customer.SetRange("Search Name", customerName);

            if customer.Count > 1 then
                exit;

            if customer.FindFirst() then;
        end;
    end;

    internal procedure GetCompanyContact(customer: Record Customer) contact: Record Contact;
    begin
        contact.SetCurrentKey("Search Name");
        contact.SetRange("Search Name", customer."Search Name");
        contact.SetRange(Type, "Contact Type"::Company);

        if contact.FindFirst() then;
    end;
}
