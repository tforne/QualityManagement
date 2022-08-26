pageextension 50187 NewFieldCreateInteraction extends "Create Interaction"
{
    Caption = 'Create Incident';

    layout
    {
        addafter("Salesperson Code")
        {
            field("Codigo responsable"; Rec."Codigo responsable")
            {
                Caption = 'Código responsable';
                ApplicationArea = all;
            }

            field("Nombre responsable"; Rec."Nombre responsable")
            {
                Caption = 'Nombre responsable';
                ApplicationArea = all;
            }
            field(Departamento; Rec.Departamento)
            {
                Caption = 'Departamento';
                ApplicationArea = all;
            }
            field(Estado; Rec.Estado)
            {
                Caption = 'Estado';
                ApplicationArea = all;
            }
        }
        addafter(Description)
        {
            field("Descripcion incidencia"; Rec."Descripcion incidencia")
            {
                caption = 'Descripción incidencia';
                ApplicationArea = All;
            }
        }
        addafter(Evaluation)
        {
            field("Potencial Solucion"; Rec."Potencial Solucion")
            {
                caption = 'Potencial solución';
                ApplicationArea = All;
            }
        }

    }
}
