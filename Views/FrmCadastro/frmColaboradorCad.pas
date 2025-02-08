unit frmColaboradorCad;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Mask, System.ImageList, Vcl.ImgList, Vcl.Imaging.pngimage,
  Vcl.DBCtrls, Vcl.ComCtrls, Vcl.Buttons, Vcl.WinXCtrls, dmColaboradorCad, Data.DB;

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
    btnNovo: TButton;
    procedure btnSalvarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure AlterarModo(Modo: TModoFormulario);

  private
    FModoFormulario: TModoFormulario;
    procedure ConfigurarModo;
    procedure RealizarAcaoCadastroEdicao;
    procedure ConfigurarAtivoNosEdits(Ativo: Boolean);
  public
    property ModoFormulario: TModoFormulario read FModoFormulario write AlterarModo;
  end;

var
  Form_Cadastro_Colaborador: TForm_Cadastro_Colaborador;

implementation

uses
  uFuncoes, uThreadColaboradorDataModule;

{$R *.dfm}
procedure TForm_Cadastro_Colaborador.ConfigurarAtivoNosEdits(Ativo: Boolean);
var
  I: Integer;
begin
  for I := 0 to Self.ComponentCount - 1 do
    if Self.Components[I] is TDBEdit then
      TDBEdit(Self.Components[I]).Enabled := Ativo;
end;
procedure TForm_Cadastro_Colaborador.AlterarModo(Modo: TModoFormulario);
begin
  FModoFormulario := Modo;
  ConfigurarModo;
end;

procedure TForm_Cadastro_Colaborador.ConfigurarModo;
begin

  case FModoFormulario of
    mfNovo:
      begin
        dsColaborador.DataSet := ColaboradorDataModule.fdqryColaborador;
        ColaboradorDataModule.Salvar;
        ConfigurarAtivoNosEdits(True);
        GerenciarBotoes(btnEditar, False);
      end;
    mfEditar:
      begin
        dsColaborador.DataSet := ColaboradorDataModule.fdqryColaborador;
        ColaboradorDataModule.Salvar;
        ConfigurarAtivoNosEdits(True);
        GerenciarBotoes(btnNovo, False);
      end;
    mfExibicao:
      begin
        dsColaborador.DataSet := ColaboradorDataModule.fdqryColaborador;
        ConfigurarAtivoNosEdits(False);
        GerenciarBotoes(btnSalvar, True);
      end;
  end;
end;

procedure TForm_Cadastro_Colaborador.FormShow(Sender: TObject);
begin
 dsColaborador.DataSet := ColaboradorDataModule.fdqryColaborador;
   dsColaborador.DataSet.Active := True;


end;


procedure TForm_Cadastro_Colaborador.btnSalvarClick(Sender: TObject);
begin
   RealizarAcaoCadastroEdicao;
   ColaboradorDataModule.CarregarDados(StrToInt(dbeCodigo.Text));
   AlterarModo(mfExibicao);

end;

procedure TForm_Cadastro_Colaborador.RealizarAcaoCadastroEdicao;
begin
  if FModoFormulario = mfNovo then
  begin
    ColaboradorDataModule.Novo;
  end
  else if FModoFormulario = mfEditar then
  begin
    ColaboradorDataModule.Salvar;
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

procedure TForm_Cadastro_Colaborador.btnNovoClick(Sender: TObject);
begin

  AlterarModo(mfNovo);
end;

end.

