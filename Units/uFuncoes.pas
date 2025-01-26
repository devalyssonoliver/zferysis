unit uFuncoes;

interface

uses
  Vcl.Forms, Vcl.Controls, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Dialogs,
  Vcl.Graphics,
  Vcl.StyledTaskDialog, Vcl.StyledAnimatedTaskDialog,
  Vcl.ComCtrls, System.SysUtils, Vcl.StyledButton;

procedure GerenciarCamposTLabelEdit(const Campos: array of TLabeledEdit;
  Ativo: Boolean);
procedure GerenciarCamposEdit(const Campos: array of TEdit; Ativo: Boolean);
procedure GerenciarBotoes(const Buttons: array of TStyledButton;
  Ativo: Boolean);
procedure VisibilidadeTEdit(const Edits: array of TEdit; Ativo: Boolean);
function ConfirmarFechamento: Boolean;
procedure MsgBox(Titulo, Text: String; Buttons: Boolean; Tipo: Integer);
function VerificarPreenchimento(const Edits: array of TEdit): Boolean;

implementation

function VerificarPreenchimento(const Edits: array of TEdit): Boolean;
var
  i: Integer;
begin
  Result := True;
  for i := 0 to High(Edits) do
  begin
    if Trim(Edits[i].Text) = '' then
    begin
      MsgBox('Erro!', 'Todos os campos precisam ser preenchidos.', False, 1);
      Result := False;
      Exit;
    end;
  end;
end;

procedure GerenciarCamposTLabelEdit(const Campos: array of TLabeledEdit;
  Ativo: Boolean);
var
  i: Integer;
begin
  for i := 0 to High(Campos) do
  begin
    Campos[i].Enabled := Ativo;
  end;
end;

procedure GerenciarCamposEdit(const Campos: array of TEdit; Ativo: Boolean);
var
  i: Integer;
begin
  for i := 0 to High(Campos) do
  begin
    if Assigned(Campos[i]) then
      Campos[i].Enabled := Ativo;
  end;
end;

procedure GerenciarBotoes(const Buttons: array of TStyledButton;
  Ativo: Boolean);
var
  i: Integer;
begin
  for i := 0 to High(Buttons) do
  begin
    Buttons[i].Enabled := Ativo;
  end;
end;

procedure VisibilidadeTEdit(const Edits: array of TEdit; Ativo: Boolean);
var
  i: Integer;
begin
  for i := 0 to High(Edits) do
  begin
    Edits[i].Visible := Ativo;
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
    TaskDialog.Text := 'Voc� tem certeza que deseja fechar a aplica��o?';
    TaskDialog.UseAnimations := True;
    TaskDialog.CommonButtons := [tcbYes, tcbNo];
    TaskDialog.DefaultButton := tcbNo;

    if TaskDialog.Execute then
      Result := TaskDialog.ModalResult = mrYes;

  finally
    TaskDialog.Free;
  end;
end;

procedure MsgBox(Titulo, Text: String; Buttons: Boolean; Tipo: Integer);
var
  TaskDialog: TStyledTaskDialog;
begin
  TaskDialog := TStyledTaskDialog.Create(nil);
  try
    TaskDialog.Title := Titulo;
    TaskDialog.Text := Text;
    case Tipo of
      1:
        TaskDialog.FooterIcon := tdiWarning;
      2:
        TaskDialog.FooterIcon := tdiError;
      3:
        TaskDialog.FooterIcon := tdiInformation;
      4:
        TaskDialog.FooterIcon := tdiShield;
      5:
        TaskDialog.FooterIcon := tdiQuestion;
    else
      TaskDialog.FooterIcon := tdiNone;
    end;

    if Buttons then
      TaskDialog.CommonButtons := [tcbYes, tcbNo]
    else
      TaskDialog.CommonButtons := [tcbOk];

    TaskDialog.Execute;
  finally
    TaskDialog.Free;
  end;
end;

end.
