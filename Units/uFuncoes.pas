unit uFuncoes;

interface

uses
  Vcl.Forms, Vcl.Controls, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Dialogs,
  Vcl.Graphics,
  Vcl.StyledTaskDialog,
  Vcl.ComCtrls, System.SysUtils;

procedure DesabilitarCampos(const Campos: array of TLabeledEdit);
function ConfirmarFechamento: Boolean;

implementation

procedure DesabilitarCampos(const Campos: array of TLabeledEdit);
var
  i: Integer;
begin
  for i := 0 to High(Campos) do
  begin
    Campos[i].Enabled := False;
  end;
end;

function ConfirmarFechamento: Boolean;
var
  TaskDialog: TStyledTaskDialog;
begin
  Result := False;

  TaskDialog := TStyledTaskDialog.Create(nil);
  try
    TaskDialog.Caption := 'FerySIS';
    TaskDialog.Title := 'Confirmar Fechamento';
    TaskDialog.Text := 'Você tem certeza que deseja fechar a aplicação?';

    TaskDialog.CommonButtons := [tcbYes, tcbNo];
    TaskDialog.DefaultButton := tcbNo;


    if TaskDialog.Execute = mrYes then
    begin
      Result := True;
    end else
    begin
      Result := False;
    end;
  finally
    TaskDialog.Free;
  end;
end;
end.
