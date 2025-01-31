unit frmLocalizacaoColaborador;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.WinXCtrls, dmColaborador, System.ImageList, Vcl.ImgList, uFuncoes,
  dmGerenciadorConexao, uThreadColaboradorDataModule, frmCadastroColaborador;

type
  TCriterioPesquisa = (cpCodigo, cpNome, cpMatricula);

  TForm_Loc_Colaborador = class(TForm)
    pnlGrid: TPanel;
    lbTitulo: TLabel;
    Panel1: TPanel;
    cmbCriteriosdePesquisa: TComboBox;
    edtPesquisarCodigo: TEdit;
    edtPesquisarNome: TEdit;
    edtPesquisarMatricula: TEdit;
    pnlBotoes: TPanel;
    dbGrid: TDBGrid;
    imgListAtivo: TImageList;
    pnlListTop: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    tgsTodos: TToggleSwitch;
    btnNovo: TButton;
    btnExibir: TButton;
    btnFechar: TButton;
    btnRelatorio: TButton;
    procedure dbGridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DesativarBotoesELimparGrade;
    procedure tgsTodosClick(Sender: TObject);
    procedure BuscarPorCriterio(const Criterio: TCriterioPesquisa;
      const Valor: string);
    procedure AlterarVisibilidadeCamposPesquisa;
    procedure edtPesquisarCodigoExit(Sender: TObject);
    procedure cmbCriteriosdePesquisaSelect(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtPesquisarNomeExit(Sender: TObject);
    procedure edtPesquisarMatriculaExit(Sender: TObject);
    procedure TratarCampoPesquisa(Sender: TObject; Criterio: TCriterioPesquisa);
    procedure btnNovoClick(Sender: TObject);

  end;

var
  Form_Loc_Colaborador: TForm_Loc_Colaborador;

implementation

{$R *.dfm}

procedure TForm_Loc_Colaborador.AlterarVisibilidadeCamposPesquisa;
begin
  edtPesquisarCodigo.Visible := cmbCriteriosdePesquisa.ItemIndex = Ord
    (cpCodigo);
  edtPesquisarNome.Visible := cmbCriteriosdePesquisa.ItemIndex = Ord(cpNome);
  edtPesquisarMatricula.Visible := cmbCriteriosdePesquisa.ItemIndex = Ord
    (cpMatricula);
end;

procedure TForm_Loc_Colaborador.btnNovoClick(Sender: TObject);
begin
  Application.CreateForm(TForm_Cadastro_Colaborador, Form_Cadastro_Colaborador);
  Form_Cadastro_Colaborador.Show;
end;

procedure TForm_Loc_Colaborador.BuscarPorCriterio(const Criterio
  : TCriterioPesquisa; const Valor: string);
begin
  if Trim(Valor) <> '' then
  begin
    try
      ColaboradorDataModule.BuscarColaborador(Ord(Criterio), Valor);
      dbGrid.DataSource := ColaboradorDataModule.dsColaborador;
      GerenciarBotoes([btnRelatorio, btnExibir], True);
    except
      on E: Exception do
        MsgBox('Erro!', E.Message, False, 2);
    end;
  end;
end;

procedure TForm_Loc_Colaborador.cmbCriteriosdePesquisaSelect(Sender: TObject);
begin
  AlterarVisibilidadeCamposPesquisa;
end;

procedure TForm_Loc_Colaborador.dbGridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  IndiceImagem: Byte;
  CentroX, CentroY: Integer;
begin
  if not dbGrid.DataSource.DataSet.IsEmpty then
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

procedure TForm_Loc_Colaborador.DesativarBotoesELimparGrade;
begin
  dbGrid.DataSource := nil;
  GerenciarBotoes([btnRelatorio, btnExibir], False);
end;

procedure TForm_Loc_Colaborador.FormShow(Sender: TObject);
begin
  if not Assigned(ColaboradorDataModule) then
    TThreadCriarDataModuleColaborador.Create(False);
  GerenciarBotoes([btnRelatorio, btnExibir], False);
end;

procedure TForm_Loc_Colaborador.tgsTodosClick(Sender: TObject);
begin
  if tgsTodos.State = tssOn then
  begin
    ColaboradorDataModule.ListarTodos;
    GerenciarBotoes([btnRelatorio, btnExibir], True);
    dbGrid.DataSource := ColaboradorDataModule.dsColaborador;
  end
  else
  begin
    DesativarBotoesELimparGrade;
  end;
end;

procedure TForm_Loc_Colaborador.TratarCampoPesquisa(Sender: TObject;
  Criterio: TCriterioPesquisa);
var
  EditField: TEdit;
begin
  EditField := TEdit(Sender);
  if verificarCampoPreenchido(EditField) then
  begin
    case Criterio of
      cpCodigo:
        BuscarPorCriterio(cpCodigo, edtPesquisarCodigo.Text);
      cpNome:
        BuscarPorCriterio(cpNome, edtPesquisarNome.Text);
      cpMatricula:
        BuscarPorCriterio(cpMatricula, edtPesquisarMatricula.Text);
    end;
    dbGrid.DataSource := ColaboradorDataModule.dsColaborador;
  end
  else
  begin
    DesativarBotoesELimparGrade;
  end;
end;

procedure TForm_Loc_Colaborador.edtPesquisarCodigoExit(Sender: TObject);
begin
  TratarCampoPesquisa(Sender, cpCodigo);
end;

procedure TForm_Loc_Colaborador.edtPesquisarNomeExit(Sender: TObject);
begin
  TratarCampoPesquisa(Sender, cpNome);
end;

procedure TForm_Loc_Colaborador.edtPesquisarMatriculaExit(Sender: TObject);
begin
  TratarCampoPesquisa(Sender, cpMatricula);
end;

end.
