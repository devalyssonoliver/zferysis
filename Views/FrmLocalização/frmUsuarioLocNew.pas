unit frmUsuarioLocNew;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.WinXCtrls,
  Vcl.ExtCtrls, System.ImageList, Vcl.ImgList, cxGraphics, dxUIAClasses,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, dxDateRanges,
  dxScrollbarAnnotations, Data.DB, cxDBData, cxLocalization, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, dmUsuarioLoc, Vcl.Menus, dxGDIPlusClasses, cxButtons, dmUsuario;

type
  TCriterioPesquisa = (cpCodigo, cpNome, cpLogin);

  TNewLocUser = class(TForm)
    ilListAtivo: TImageList;
    pnlGrid: TPanel;
    pnlBotoes: TPanel;
    pnlListTop: TPanel;
    cxGridDBTableView: TcxGridDBTableView;
    cxgdLevelGrid1Level1: TcxGridLevel;
    cxgrd: TcxGrid;
    cxLocalizer: TcxLocalizer;
    fieldCodigo: TcxGridDBColumn;
    fieldNome: TcxGridDBColumn;
    fieldLogin: TcxGridDBColumn;
    fieldDataCadastro: TcxGridDBColumn;
    fieldAtivo: TcxGridDBColumn;
    cxbtnNovo: TcxButton;
    cxbtnExibir: TcxButton;
    cxbtnExcluir: TcxButton;
    cxbtnRelatorio: TcxButton;
    cxbtnFechar: TcxButton;
    iListImg: TImageList;
    pnlCenterTop: TPanel;
    pnlTitle: TPanel;
    img: TImage;
    lblTitle: TLabel;
    pnlCampoPesquisar: TPanel;
    cbbCriteriosdePesquisa: TComboBox;
    edtPesquisarCodigo: TEdit;
    edtPesquisarLogin: TEdit;
    edtPesquisarNome: TEdit;
    pnlTodos: TPanel;
    lblTodos: TLabel;
    tglswtchTodos: TToggleSwitch;
    dsUsuarioLoc: TDataSource;

    procedure edtPesquisarNomeExit(Sender: TObject);
    procedure edtPesquisarLoginExit(Sender: TObject);
    procedure edtPesquisarCodigoExit(Sender: TObject);
    procedure tglswtchTodosClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cxbtnExcluirClick(Sender: TObject);
    procedure cbbCriteriosdePesquisaSelect(Sender: TObject);
  private
    FDMUsuarioLoc: TUsuarioLocDataModule;

    procedure AlterarVisibilidadeCamposPesquisa;
    procedure BuscarPorCriterio(const Criterio: TCriterioPesquisa; const Valor: string);
    procedure DesativarBotoesELimparGrade;

  public
    { Public declarations }
  end;

var
  NewLocUser: TNewLocUser;

implementation

uses
  uFuncoes;

{$R *.dfm}

procedure TNewLocUser.AlterarVisibilidadeCamposPesquisa;
begin
  edtPesquisarCodigo.Visible := cbbCriteriosdePesquisa.ItemIndex = Ord(cpCodigo);
  edtPesquisarNome.Visible   := cbbCriteriosdePesquisa.ItemIndex = Ord(cpNome);
  edtPesquisarLogin.Visible  := cbbCriteriosdePesquisa.ItemIndex = Ord(cpLogin);
end;

procedure TNewLocUser.BuscarPorCriterio(const Criterio: TCriterioPesquisa; const Valor: string);
begin
  if Trim(Valor) <> '' then
  begin
    try
      FDMUsuarioLoc.BuscarUsuario(Ord(Criterio), Valor);
      cxGridDBTableView.DataController.DataSource := dsUsuarioLoc;
      GerenciarTCXBotoes([cxbtnRelatorio, cxbtnExibir], True);
    except
      on E: Exception do
        MsgBox('Erro!', E.Message, False, 2);
    end;
  end;
end;

procedure TNewLocUser.cbbCriteriosdePesquisaSelect(Sender: TObject);
begin
  AlterarVisibilidadeCamposPesquisa;
end;

procedure TNewLocUser.cxbtnExcluirClick(Sender: TObject);
begin
  if Application.MessageBox('Tem certeza que deseja excluir o registro?', 'Confirmação', MB_YESNO or MB_ICONQUESTION) = IDYES then
  begin
    cxGridDBTableView.DataController.DeleteSelection;
  end;
end;

procedure TNewLocUser.DesativarBotoesELimparGrade;
begin
    cxGridDBTableView.DataController.DataSource	 := nil;
    GerenciarTCXBotoes([cxbtnRelatorio, cxbtnExibir], False);
end;

procedure TNewLocUser.edtPesquisarCodigoExit(Sender: TObject);
begin
  BuscarPorCriterio(cpCodigo, edtPesquisarCodigo.Text);
end;

procedure TNewLocUser.edtPesquisarLoginExit(Sender: TObject);
begin
  BuscarPorCriterio(cpLogin, edtPesquisarLogin.Text);
end;

procedure TNewLocUser.edtPesquisarNomeExit(Sender: TObject);
begin
  BuscarPorCriterio(cpNome, edtPesquisarNome.Text);
end;

procedure TNewLocUser.FormShow(Sender: TObject);
begin
  if not Assigned(FDMUsuarioLoc) then
  begin
    FDMUsuarioLoc := TUsuarioLocDataModule.Create(nil);
  end;
end;

procedure TNewLocUser.tglswtchTodosClick(Sender: TObject);
begin
  if tglswtchTodos.State = tssOn then
  begin
  FDMUsuarioLoc.ListarTodos;
  cxGridDBTableView.DataController.DataSource := dsUsuarioLoc;
  cxGridDBTableView.DataController.DataSet.Active := True;
  GerenciarTCXBotoes([cxbtnRelatorio, cxbtnExibir], True);
  end
  else
  begin
    DesativarBotoesELimparGrade;
  end;
end;

end.

