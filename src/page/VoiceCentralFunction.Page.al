page 50100 VoiceCentralFunction
{
    ApplicationArea = All;
    Caption = 'VoiceCentralFunction';
    PageType = List;
    SourceTable = "Voice Central Function";
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Function Name"; Rec."Function Name")
                {
                    ToolTip = 'Specifies the value of the Function Name field.', Comment = '%';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.', Comment = '%';
                }
                field("Parameter 1 Name"; Rec."Parameter 1 Name")
                {
                    ToolTip = 'Specifies the value of the Parameter 1 Name field.', Comment = '%';
                }
                field("Parameter 2 Name"; Rec."Parameter 2 Name")
                {
                    ToolTip = 'Specifies the value of the Parameter 2 Name field.', Comment = '%';
                }
                field("Parameter 3 Name"; Rec."Parameter 3 Name")
                {
                    ToolTip = 'Specifies the value of the Parameter 3 Name field.', Comment = '%';
                }
                field("Parameter 4 Name"; Rec."Parameter 4 Name")
                {
                    ToolTip = 'Specifies the value of the Parameter 4 Name field.', Comment = '%';
                }
                field("Parameter 5 Name"; Rec."Parameter 5 Name")
                {
                    ToolTip = 'Specifies the value of the Parameter 5 Name field.', Comment = '%';
                }
            }
        }
    }
}
