tableextension 50187 NewFieldSegmentLine extends "Segment Line"
{
    fields
    {
        field(50200; "Potencial Solucion"; Text[250])
        {
            Caption = 'Potencial solución';
            DataClassification = ToBeClassified;
        }
        field(50201; "Nº Interaccion"; Code[20])
        {
            Caption = 'Nº Interaccion';
            DataClassification = ToBeClassified;
        }
        field(50202; "Descripcion incidencia"; text[250])
        {
            Caption = 'Descripción incidencia';
            DataClassification = ToBeClassified;
        }
        field(50203; "Departamento"; Code[20])
        {
            Caption = 'Departamento';
            DataClassification = ToBeClassified;
            TableRelation = Dimension.Code;
        }

        field(50204; "Codigo responsable"; Code[20])
        {
            Caption = 'Código responsable';
            DataClassification = ToBeClassified;
            TableRelation = Employee."No.";
        }
        field(50205; "Nombre responsable"; Text[50])
        {
            Caption = 'Nombre responsable';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = lookup(Employee.Name where("No." = field("Codigo responsable")));
        }
        field(50206; "Estado"; Option)
        {
            Caption = 'Estado';
            OptionMembers = Abierta,Resuelta,"No Resuelta",Anulada;
        }
    }
}
