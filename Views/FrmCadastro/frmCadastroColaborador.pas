unit frmCadastroColaborador;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Mask, System.ImageList, Vcl.ImgList, Vcl.Imaging.pngimage,
  Vcl.DBCtrls, Vcl.ComCtrls, Vcl.Buttons, Vcl.WinXCtrls, dmColaborador, Data.DB;

type
  TModoFormulario = (mfNovo, mfEditar, mfExibicao);

  TForm_Cadastro_Colaborador = class(TForm)
    pnlCentro: TPanel;
    lbTitulo: TLabel;
    pnlBotoes: TPanel;
    btnSalvar: TButton;
    btnEditar: TButton;
    btnFechar: TButton;
    imgLogo: TImage;
    gbInformacoesBasicas: TGroupBox;
    gbContrato: TGroupBox;
    lblNome: TLabel;
    lblMatricula: TLabel;
    lblCodSetor: TLabel;
    ImageList: TImageList;
    btnAbrirFormSetor: TSpeedButton;
    lblContrato: TLabel;
    gbPeriodos: TGroupBox;
    lblAquisitivoInicial: TLabel;
    lblAquisitivoFim: TLabel;
    lblConcessivoInicio: TLabel;
    lblConcessivoFim: TLabel;
    pnlStatusFerias: TPanel;
    lblAtivo: TLabel;
    imgFotoUsuario: TImage;
    btnLocalizarFoto: TSpeedButton;
    il32: TImageList;
    btnExcluirFoto: TSpeedButton;
    dbenome: TDBEdit;
    dbeMatricula: TDBEdit;
    dbeCodSetor: TDBEdit;
    dbeContrato: TDBEdit;
    dbeAqusitivoInicio: TDBEdit;
    dbeAquisitivoFim: TDBEdit;
    dbeConcessivoInicio: TDBEdit;
    dsColaborador: TDataSource;
    tglAtivo: TDBCheckBox;
    Edit1: TEdit;
    dbeCodigo: TDBEdit;
    procedure btnSalvarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);

  private
    FModoFormulario: TModoFormulario;
    procedure ConfigurarModo;
    procedure AlterarModo(Modo: TModoFormulario);
    procedure AtualizarBotoesCampos(Modo: TModoFormulario);
    procedure RealizarAcaoCadastroEdicao;
  public
    property ModoFormulario: TModoFormulario read FModoFormulario write AlterarModo;
  end;

var
  Form_Cadastro_Colaborador: TForm_Cadastro_Colaborador;

implementation

uses
  uFuncoes, uThreadColaboradorDataModule;

{$R *.dfm}

procedure TForm_Cadastro_Colaborador.AlterarModo(Modo: TModoFormulario);
begin
  FModoFormulario := Modo;
  ConfigurarModo;
end;

procedure TForm_Cadastro_Colaborador.ConfigurarModo;
begin
  AtualizarBotoesCampos(FModoFormulario);

  case FModoFormulario of
    mfNovo:
      begin
        dsColaborador.DataSet := ColaboradorDataModule.fdqryColaborador;
        ColaboradorDataModule.Novo;  // Inicia um novo registro
      end;

    mfEditar:
      begin
        dsColaborador.DataSet := ColaboradorDataModule.fdqryColaborador;
        ColaboradorDataModule.fdqryColaborador.Edit;
      end;

    mfExibicao:
      begin
        dsColaborador.DataSet := ColaboradorDataModule.fdqryColaborador;
        ColaboradorDataModule.fdqryColaborador.DisableControls;
      end;
  end;
end;

procedure TForm_Cadastro_Colaborador.FormShow(Sender: TObject);
begin
 //if not Assigned(ColaboradorDataModule) then

  dsColaborador.DataSet := ColaboradorDataModule.fdqryColaborador;
   dsColaborador.DataSet.Active := True;
  if dsColaborador.DataSet.Active then
  ShowMessage('funcionou');
end;

procedure TForm_Cadastro_Colaborador.AtualizarBotoesCampos(Modo: TModoFormulario);
begin
  case Modo of
    mfNovo, mfEditar:
      begin
        gbInformacoesBasicas.Enabled := True;
        gbContrato.Enabled := True;
        gbPeriodos.Enabled := True;
        GerenciarBotoes(btnSalvar, True);
        GerenciarBotoes(btnEditar, False);
      end;
    mfExibicao:
      begin
        gbInformacoesBasicas.Enabled := False;
        gbContrato.Enabled := False;
        gbPeriodos.Enabled := False;
        GerenciarBotoes(btnSalvar, False);
        GerenciarBotoes(btnEditar, True);
      end;
  end;
end;

procedure TForm_Cadastro_Colaborador.btnSalvarClick(Sender: TObject);
begin
  RealizarAcaoCadastroEdicao;
end;

procedure TForm_Cadastro_Colaborador.RealizarAcaoCadastroEdicao;
var
  Codigo, CodSetor: Integer;
  Nome, Matricula: String;
  DataContrato, PeriodoAquisitivo, PeriodoConsessivo: TDate;
  Ativo: Boolean;
begin
  Codigo := StrToInt(dbeCodigo.Text);
  Nome := dbeNome.Text;
  Matricula := dbeMatricula.Text;
  DataContrato := StrToDate(dbeContrato.Text);
  PeriodoAquisitivo := StrToDate(dbeAqusitivoInicio.Text);
  PeriodoConsessivo := StrToDate(dbeConcessivoInicio.Text);
  Ativo := tglAtivo.Checked;

  if FModoFormulario = mfNovo then
  begin
    ColaboradorDataModule.Novo;  // Cria novo registro
  end
  else if FModoFormulario = mfEditar then
  begin
    ColaboradorDataModule.Salvar;  // Salva alterações
  end;
end;


procedure TForm_Cadastro_Colaborador.btnEditarClick(Sender: TObject);
begin
  AlterarModo(mfEditar);
end;


procedure TForm_Cadastro_Colaborador.btnFecharClick(Sender: TObject);
begin
  Close;
end;

end.

