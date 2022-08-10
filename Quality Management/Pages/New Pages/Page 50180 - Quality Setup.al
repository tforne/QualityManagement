page 50180 "Quality Setup"
{
    // version OneData016.01.00

    SourceTable = 50180;
    ApplicationArea = All;
    UsageCategory = Administration;
    Caption = 'Configuración calidad';

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("User Id. Quality Manager"; Rec."User Id. Quality Manager")
                {
                    ApplicationArea = Basic, Suite;
                    DrillDownPageID = "User Lookup";
                    ToolTip = 'Specifies the User Quality Manager';
                }
                field("Archive Doc. Quality Nos."; Rec."Archive Doc. Quality Nos.")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the User Quality Manager';
                }

            }
        }
    }

    actions
    {
        area(processing)
        {
            action(InicializeQualityModule)
            {
                ApplicationArea = All;
                Caption = 'Inicialize Quality Module';

                trigger OnAction()
                var
                    QualityManagementInstall: Codeunit 50180;
                begin
                    QualityManagementInstall.Golive;
                end;
            }
        }
        area(navigation)
        {
            action(QualityMeasuresGroup)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Quality measures group';
                Image = Setup;
                RunObject = Page 50183;
            }
            action(QualityMeasures)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Quality measures';
                Image = Setup;
                RunObject = Page "Quality measures";
            }
        }
    }

}