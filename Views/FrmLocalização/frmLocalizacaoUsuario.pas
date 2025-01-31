unit frmLocalizacaoUsuario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, uFuncoes,
  dmUsuario, System.ImageList, Vcl.ImgList, frmCadastroUsuario, Usuario,
  Vcl.WinXCtrls, uThreadUsuarioDataModule;

type
  TCriterioPesquisa = (cpCodigo, cpNome, cpLogin);

  TForm_Loc_Usuarios = class(TForm)
    pnlListTop: TPanel;
    pnlGrid: TPanel;
    lbTitulo: TLabel;
    Panel1: TPanel;
    dbGrid: TDBGrid;
    cmbCriteriosdePesquisa: TComboBox;
    edtPesquisarCodigo: TEdit;
    edtPesquisarNome: TEdit;
    edtPesquisarLogin: TEdit;
    imgListAtivo: TImageList;
    Panel2: TPanel;
    tgsTodos: TToggleSwitch;
    Label1: TLabel;
    pnlBotoes: TPanel;
    btnNovo: TButton;
    btnExibir: TButton;
    btnFechar: TButton;
    btnRelatorio: TButton;
    procedure cmbCriteriosdePesquisaSelect(Sender: TObject);
    procedure dbGridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure edtPesquisarCodigoExit(Sender: TObject);
    procedure edtPesquisarLoginExit(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnExibirClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure tgsTodosClick(Sender: TObject);
    procedure btnRelatorioClick(Sender: TObject);
    procedure edtPesquisarNomeExit(Sender: TObject);

  private
    procedure BuscarUsuarioPorCriterio(const Criterio: TCriterioPesquisa;
      const Valor: string);
    procedure AlterarVisibilidadeCamposPesquisa;
    procedure DesativarBotoesELimparGrade;

  public
  end;

var
  Form_Loc_Usuarios: TForm_Loc_Usuarios;

implementation

{$R *.dfm}

procedure TForm_Loc_Usuarios.BuscarUsuarioPorCriterio(const Criterio
  : TCriterioPesquisa; const Valor: string);
begin
  if Trim(Valor) <> '' then
  begin
    try
      UsuarioDataModule.BuscarUsuario(Ord(Criterio), Valor);
      dbGrid.DataSource := UsuarioDataModule.dsUsuarios;
      GerenciarBotoes([btnRelatorio, btnExibir], True);
    except
      on E: Exception do
        MsgBox('Erro!', E.Message, False, 2);
    end;
  end;
end;

procedure TForm_Loc_Usuarios.AlterarVisibilidadeCamposPesquisa;
begin
  edtPesquisarCodigo.Visible := cmbCriteriosdePesquisa.ItemIndex = Ord
    (cpCodigo);
  edtPesquisarNome.Visible := cmbCriteriosdePesquisa.ItemIndex = Ord(cpNome);
  edtPesquisarLogin.Visible := cmbCriteriosdePesquisa.ItemIndex = Ord(cpLogin);
end;

procedure TForm_Loc_Usuarios.cmbCriteriosdePesquisaSelect(Sender: TObject);
begin
  AlterarVisibilidadeCamposPesquisa;
end;

procedure TForm_Loc_Usuarios.dbGridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  IndiceImagem: Byte;
  CentroX, CentroY: Integer;
begin
  if Column.FieldName = 'ativo' then
  begin
    IndiceImagem := Byte(Column.Field.AsBoolean);
    CentroX := Rect.Left + (Rect.Width - imgListAtivo.Width) div 2;
    CentroY := Rect.Top + (Rect.Height - imgListAtivo.Height) div 2;
    imgListAtivo.Draw(dbGrid.Canvas, CentroX, CentroY, IndiceImagem);
    Exit;
  end;
  dbGrid.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TForm_Loc_Usuarios.DesativarBotoesELimparGrade;
begin
  dbGrid.DataSource := nil;
  GerenciarBotoes([btnRelatorio, btnExibir], False);
end;

procedure TForm_Loc_Usuarios.btnExibirClick(Sender: TObject);
var
  Usuario: TUsuario;
  Identificador: String;
begin
  Identificador := dbGrid.Fields[2].AsString;

  if Identificador.Trim.IsEmpty then
  begin
    MsgBox('Aten��o!', 'Nenhum usu�rio selecionado!', False, 1);
    Exit;
  end;

  Usuario := UsuarioDataModule.CarregarUsuario(Identificador);
  if Assigned(Usuario) then
  begin
    Frm_Cad_Usuario := TFrm_Cad_Usuario.Create(Self);
    try
      Frm_Cad_Usuario.ModoFormulario := mfExibicao;
      Frm_Cad_Usuario.lbCodigo.Caption := Usuario.Codigo.ToString;
      Frm_Cad_Usuario.edtNome.Text := Usuario.Nome;
      Frm_Cad_Usuario.edtLogin.Text := Usuario.Login;
      Frm_Cad_Usuario.edtCadastro.Text := DateToStr(Usuario.DataCadastro);
      Frm_Cad_Usuario.ckbAtivo.Checked := Usuario.Ativo;
      Frm_Cad_Usuario.ShowModal;
    finally
      Frm_Cad_Usuario.Free;
      Usuario.Free;
    end;
  end
  else
    MsgBox('Aten��o!', 'Usu�rio n�o encontrado', False, 1);
end;

procedure TForm_Loc_Usuarios.edtPesquisarCodigoExit(Sender: TObject);
begin
  if verificarCampoPreenchido(edtPesquisarCodigo) then
  begin
    BuscarUsuarioPorCriterio(cpCodigo, edtPesquisarCodigo.Text);
    dbGrid.DataSource := UsuarioDataModule.dsUsuarios;
  end
  else
  begin
    DesativarBotoesELimparGrade;
  end;
end;

procedure TForm_Loc_Usuarios.edtPesquisarLoginExit(Sender: TObject);
begin
  if verificarCampoPreenchido(edtPesquisarLogin) then
  begin
    BuscarUsuarioPorCriterio(cpLogin, edtPesquisarLogin.Text);
    dbGrid.DataSource := UsuarioDataModule.dsUsuarios;
  end
  else
  begin
    DesativarBotoesELimparGrade;
  end;
end;

procedure TForm_Loc_Usuarios.edtPesquisarNomeExit(Sender: TObject);
begin
  if verificarCampoPreenchido(edtPesquisarNome) then
  begin
    BuscarUsuarioPorCriterio(cpNome, edtPesquisarNome.Text);
    dbGrid.DataSource := UsuarioDataModule.dsUsuarios;
  end
  else
  begin
    DesativarBotoesELimparGrade;
  end;
end;

procedure TForm_Loc_Usuarios.FormShow(Sender: TObject);
begin
  if not Assigned(UsuarioDataModule) then
    TThreadCriarDataModuleUsuario.Create(False);
  GerenciarBotoes([btnRelatorio, btnExibir], False);

end;

procedure TForm_Loc_Usuarios.tgsTodosClick(Sender: TObject);
begin
  if tgsTodos.State = tssOn then
  begin
    UsuarioDataModule.ListarTodos;
    GerenciarBotoes([btnRelatorio, btnExibir], True);
    dbGrid.DataSource := UsuarioDataModule.dsUsuarios;
  end
  else
  begin
    DesativarBotoesELimparGrade
  end;
end;

procedure TForm_Loc_Usuarios.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TForm_Loc_Usuarios.btnNovoClick(Sender: TObject);
begin
  Frm_Cad_Usuario := TFrm_Cad_Usuario.Create(Self);
  try
    Frm_Cad_Usuario.ModoFormulario := mfNovo;
    Frm_Cad_Usuario.ShowModal;
  finally
    Frm_Cad_Usuario.Free;
  end;
end;

procedure TForm_Loc_Usuarios.btnRelatorioClick(Sender: TObject);
var
  CaminhoRelatorio: String;
begin
  CaminhoRelatorio := ExtractFilePath(Application.ExeName);
  if UsuarioDataModule.frxUsuarios.LoadFromFile
    (CaminhoRelatorio + '\Relat�rios\rUsuarios.fr3') then
  begin
    UsuarioDataModule.frxUsuarios.Clear;

    UsuarioDataModule.frxUsuarios.LoadFromFile
      (CaminhoRelatorio + '\Relat�rios\rUsuarios.fr3');
    UsuarioDataModule.frxUsuarios.PrepareReport(True);
    UsuarioDataModule.frxUsuarios.ShowPreparedReport;
  end
  else
    MsgBox('Aten��o!',
      'N�o foi poss�vel visualizar o relat�rio de listagem de usu�rios.',
      False, 1);

end;

end.
