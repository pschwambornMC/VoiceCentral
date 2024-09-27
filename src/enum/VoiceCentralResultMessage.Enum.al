enum 50101 VoiceCentralResultMessage
{
    Extensible = true;

    value(0; CustomerNotFoundLbl) { Caption = 'Customer could not be found.'; }
    value(1; CustomerInformationNotFoundLbl) { Caption = 'Customer Information could not ne found'; }
    value(2; InteractionTemplateCodeNotFoundLbl) { Caption = 'Interaction Template Code %1 not found'; }
    value(3; CreatedSegementLbl) { Caption = 'Created Segment Line'; }
    value(4; CouldNoCreateSegmentLbl) { Caption = 'Could not create Segment'; }

}
