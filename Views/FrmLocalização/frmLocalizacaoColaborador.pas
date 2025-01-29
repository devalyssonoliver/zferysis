unit frmLocalizacaoColaborador;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.ButtonStylesAttributes, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.StyledButton,
  Vcl.WinXCtrls, dmColaborador, System.ImageList, Vcl.ImgList, uFuncoes;

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
    btnFechar: TStyledButton;
    btnExibir: TStyledButton;
    btnRelatorio: TStyledButton;
    btnNovo: TStyledButton;
    dbGrid: TDBGrid;
    imgListAtivo: TImageList;
    pnlListTop: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    tgsTodos: TToggleSwitch;
    procedure dbGridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DesativarBotoesELimparGrade;
    procedure tgsTodosClick(Sender: TObject);
    procedure BuscarPorCriterio(const Criterio: TCriterioPesquisa;
      const Valor: string);
    procedure AlterarVisibilidadeCamposPesquisa;
    procedure edtPesquisarCodigoExit(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
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

procedure TForm_Loc_Colaborador.dbGridDrawColumnCell(Sender: TObject;
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

procedure TForm_Loc_Colaborador.DesativarBotoesELimparGrade;
begin
  dbGrid.DataSource := nil;
  GerenciarBotoes([btnRelatorio, btnExibir], False);
end;

procedure TForm_Loc_Colaborador.edtPesquisarCodigoExit(Sender: TObject);
begin
  if verificarCampoPreenchido(edtPesquisarCodigo) then
  begin
    BuscarPorCriterio(cpCodigo, edtPesquisarCodigo.Text);
    dbGrid.DataSource := ColaboradorDataModule.dsColaborador;
  end
  else
  begin
    DesativarBotoesELimparGrade;
  end;
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

end.
