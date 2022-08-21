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

    value(0; "Dentro del rango") { Caption = 'Dentro del rango'; }
    value(1; "Fuera del rango") { Caption = 'Fuera del rango'; }
    value(2; "Aceptado") { Caption = 'Aceptado'; }
}