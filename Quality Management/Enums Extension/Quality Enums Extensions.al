enum 50180 "CompositionQualityStatus"
{
    Extensible = true;
    AssignmentCompatibility = true;

    value(0; Open) { Caption = 'Open'; }
    value(1; Released) { Caption = 'Released'; }
    value(2; "Pending Approval") { Caption = 'Pending Approval'; }
}
enum 50181 "Quality Status"
{
    AssignmentCompatibility = true;

    value(0; "Inside the range") { Caption = 'Inside the range'; }
    value(1; "Out of range") { Caption = 'Out of range'; }
    value(2; "Accepted") { Caption = 'Accepted'; }
}