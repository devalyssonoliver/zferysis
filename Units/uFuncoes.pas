unit uFuncoes;

interface

uses
  Vcl.Forms, Vcl.Controls, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Dialogs,
  Vcl.Graphics,
  Vcl.ComCtrls, System.SysUtils, System.UITypes, Vcl.DBCtrls;

procedure GerenciarCamposTLabelEdit(const Campos: array of TLabeledEdit;
  Ativo: Boolean);
procedure GerenciarCamposEdit(const Campos: array of TEdit; Ativo: Boolean);
procedure GerenciarBotoes(const Buttons: array of TButton; Ativo: Boolean);
procedure VisibilidadeTEdit(const Edits: array of TEdit; Ativo: Boolean);
function confirmarFechamento: Boolean;
function MsgBox(Titulo, Texto: String; Buttons: Boolean; Tipo: Integer)
  : Integer;
function validarCamposObrigatorios(const Edits: array of TEdit): Boolean;
function verificarCampoPreenchido(const Edits: array of TEdit): Boolean;
procedure ConfigurarReadOnlyNosEdits(const Campos: array of TDBEdit;
  Ativo: Boolean);

implementation

procedure ConfigurarReadOnlyNosEdits(const Campos: array of TDBEdit;
  Ativo: Boolean);
var
  I: Integer;
begin
  for i := 0 to High(Campos) do
  begin
    Campos[i].ReadOnly := Ativo;
  end;
end;

function verificarCampoPreenchido(const Edits: array of TEdit): Boolean;
var
  i: Integer;
begin
  Result := True;
  for i := 0 to High(Edits) do
  begin
    if Trim(Edits[i].Text) = '' then
    begin
      Result := False;
      Exit;
    end;
  end;
end;

function validarCamposObrigatorios(const Edits: array of TEdit): Boolean;
var
  i: Integer;
begin
  Result := True;
  for i := 0 to High(Edits) do
  begin
    if Trim(Edits[i].Text) = '' then
    begin
      MsgBox('Erro!', 'Todos os campos precisam ser preenchidos.', False, 1);
      Edits[i].SetFocus;
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

procedure GerenciarBotoes(const Buttons: array of TButton; Ativo: Boolean);
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

function confirmarFechamento: Boolean;
var
  TaskDialog: TTaskDialog;
begin
  Result := False;

  TaskDialog := TTaskDialog.Create(nil);
  try
    TaskDialog.Caption := 'FerySIS';
    TaskDialog.Title := 'Confirmar Fechamento';
    TaskDialog.Text := 'Voc� tem certeza que deseja fechar?';
    TaskDialog.CommonButtons := [tcbYes, tcbNo];
    TaskDialog.DefaultButton := tcbNo;

    if TaskDialog.Execute then
      Result := TaskDialog.ModalResult = mrYes;

  finally
    TaskDialog.Free;
  end;
end;

function MsgBox(Titulo, Texto: String; Buttons: Boolean; Tipo: Integer)
  : Integer;
var
  DlgType: TMsgDlgType;
  Btns: TMsgDlgButtons;
begin
  case Tipo of
    1:
      DlgType := mtWarning;
    2:
      DlgType := mtError;
    3:
      DlgType := mtInformation;
    4:
      DlgType := mtConfirmation;
    5:
      DlgType := mtCustom;
  else
    DlgType := mtCustom;
  end;

  if Buttons then
    Btns := [mbYes, mbNo]
  else
    Btns := [mbOK];

  Result := MessageDlg(Texto, DlgType, Btns, 0);
end;

end.
