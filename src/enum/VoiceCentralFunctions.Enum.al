enum 50100 VoiceCentralFunctions implements VoiceCentral
{
    Extensible = true;

    value(0; GetCustomerInformation) { Implementation = VoiceCentral = GetCustomerInformation; }
    value(1; CreateCustomerActivity) { Implementation = VoiceCentral = CreateCustomerActivity; }
}
