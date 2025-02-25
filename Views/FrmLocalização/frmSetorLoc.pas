unit frmSetorLoc;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.WinXCtrls, Vcl.ExtCtrls, dmSetorLoc, System.ImageList,
  Vcl.ImgList, frmSetorCad;

type
TCriterioPesquisa = (cpCodigo, cpNome);
  TFrm_Setor_Loc = class(TForm)
    pnlGrid: TPanel;
    lblTitulo: TLabel;
    pnl1: TPanel;
    cmbCriteriosdePesquisa: TComboBox;
    edtPesquisarCodigo: TEdit;
    edtPesquisarNome: TEdit;
    pnl2: TPanel;
    lbl1: TLabel;
    tglswtchTodos: TToggleSwitch;
    dbGrid: TDBGrid;
    pnlBotoes: TPanel;
    btnNovo: TButton;
    btnExibir: TButton;
    btnFechar: TButton;
    btnRelatorio: TButton;
    dsSetorLoc: TDataSource;
    ilListAtivo: TImageList;
    procedure dbGridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure edtPesquisarNomeExit(Sender: TObject);
    procedure TratarCampoPesquisa(Sender: TObject; Criterio: TCriterioPesquisa);
    procedure edtPesquisarCodigoExit(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tglswtchTodosClick(Sender: TObject);
    procedure dbGridDblClick(Sender: TObject);
  private
    { Private declarations }

    FDMSetorLoc : TSetorLoc_DataModule;
    FFormSetorCad: TFrm_SetorCad;
    procedure DesativarBotoesELimparGrade;
    procedure BuscarPorCriterio(const Criterio: TCriterioPesquisa;
    const Valor: string);
    procedure AlterarVisibilidadeCamposPesquisa;
   // procedure AbrirFormCadastro;
    procedure ExibirCadastroDeSetor;

  public
    { Public declarations }
  end;

var
  Frm_Setor_Loc: TFrm_Setor_Loc;
  FCodigoSetor: Integer;

implementation

uses
  uFuncoes;

{$R *.dfm}

{ TForm1 }

procedure TFrm_Setor_Loc.ExibirCadastroDeSetor;
begin
  FFormSetorCad	 := TFrm_SetorCad.Create(Self);
  try
    FCodigoSetor := dbGrid.Fields[0].AsInteger;
    FFormSetorCad.CarregarSetor(FCodigoSetor);
    FFormSetorCad.ModoFormulario := mfExibicao;
    FFormSetorCad.Show;
  except
      Application.MessageBox('N�o foi poss�vel abrir o formul�rio de cadastro.',
                              'ZFerySIS', MB_ICONWARNING);
  end;
end;


procedure TFrm_Setor_Loc.AlterarVisibilidadeCamposPesquisa;
begin
  edtPesquisarCodigo.Visible    := cmbCriteriosdePesquisa.ItemIndex = Ord(cpCodigo);
  edtPesquisarNome.Visible      := cmbCriteriosdePesquisa.ItemIndex = Ord(cpNome);
end;

procedure TFrm_Setor_Loc.btnNovoClick(Sender: TObject);
begin
     FFormSetorCad := TFrm_SetorCad.Create(nil);
    try
     FFormSetorCad.ModoFormulario := mfNovo;
     FFormSetorCad.Show;
    except
      on E:Exception do
      MsgBox('Erro!', E.Message, False, 2);
    end;
end;

procedure TFrm_Setor_Loc.BuscarPorCriterio(const Criterio: TCriterioPesquisa;
  const Valor: string);
begin
  if Trim(Valor) <> '' then
  begin
    try
      FDMSetorLoc.Buscar(Ord(Criterio), Valor);
      dbGrid.DataSource := dsSetorLoc;
      GerenciarBotoes([btnRelatorio, btnExibir], True);
    except
      on E: Exception do
        MsgBox('Erro!', E.Message, False, 2);
    end;
  end
end;

procedure TFrm_Setor_Loc.dbGridDblClick(Sender: TObject);
begin
  ExibirCadastroDeSetor;
end;

procedure TFrm_Setor_Loc.dbGridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  IndiceImagem: Byte;
  CentroX, CentroY: Integer;
begin
  if not dbGrid.DataSource.DataSet.IsEmpty then
  begin
    if Column.FieldName = 'ativo' then
    begin
      dbGrid.Canvas.FillRect(Rect);
      IndiceImagem := Byte(Column.Field.AsBoolean);
      CentroX := Rect.Left + (Column.Width - ilListAtivo.Width) div 2;
      CentroY := Rect.Top + (Rect.Height - ilListAtivo.Height) div 2;
      ilListAtivo.Draw(dbGrid.Canvas, CentroX, CentroY, IndiceImagem);
      Exit;
    end;
  end;
  dbGrid.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TFrm_Setor_Loc.DesativarBotoesELimparGrade;
begin
  dbGrid.DataSource := nil;
  GerenciarBotoes([btnRelatorio, btnExibir], False);
end;

procedure TFrm_Setor_Loc.edtPesquisarCodigoExit(Sender: TObject);
begin
  TratarCampoPesquisa(Sender, cpCodigo);
end;

procedure TFrm_Setor_Loc.edtPesquisarNomeExit(Sender: TObject);
begin
  TratarCampoPesquisa(Sender, cpNome);
end;

procedure TFrm_Setor_Loc.FormCreate(Sender: TObject);
begin
  FDMSetorLoc := TSetorLoc_DataModule.Create(Self);
end;

procedure TFrm_Setor_Loc.tglswtchTodosClick(Sender: TObject);
begin
   if tglswtchTodos.State = tssOn then
    begin
    FDMSetorLoc.ListarTodos;
    dbGrid.DataSource := dsSetorLoc;
    GerenciarBotoes([btnRelatorio, btnExibir], True);
    end
      else
       DesativarBotoesELimparGrade;
end;

procedure TFrm_Setor_Loc.TratarCampoPesquisa(Sender: TObject;
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
    end;
  end
  else
  begin
    DesativarBotoesELimparGrade;
  end;
end;

end.
