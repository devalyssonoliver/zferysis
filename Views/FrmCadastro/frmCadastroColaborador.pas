unit frmCadastroColaborador;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask,
  System.ImageList, Vcl.ImgList, Vcl.Imaging.pngimage, Vcl.DBCtrls,
  Vcl.ComCtrls, Vcl.Buttons, Vcl.WinXCtrls;

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
    edtNome: TEdit;
    lblMatricula: TLabel;
    edtMatricula: TEdit;
    lblCodSetor: TLabel;
    ImageList: TImageList;
    Edit1: TEdit;
    btnAbrirFormSetor: TSpeedButton;
    lblContrato: TLabel;
    gbPeriodos: TGroupBox;
    lblAquisitivoInicial: TLabel;
    dtpConcessivoInicial: TDateTimePicker;
    dtpContrato: TDateTimePicker;
    dtpConcessivoFim: TDateTimePicker;
    lblAquisitivoFim: TLabel;
    dtpAquisitivoInicial: TDateTimePicker;
    lblConcessivoInicio: TLabel;
    lblConcessivoFim: TLabel;
    dtpAquisitivoFim: TDateTimePicker;
    pnlStatusFerias: TPanel;
    tglAtivo: TToggleSwitch;
    lblAtivo: TLabel;
    imgFotoUsuario: TImage;
    btnLocalizarFoto: TSpeedButton;
    il32: TImageList;
    btnExcluirFoto: TSpeedButton;
    lblCodigo: TLabel;





  private
    FModoFormulario: TModoFormulario;
    procedure ConfigurarModo;
    procedure AlterarModo(Modo: TModoFormulario);
    procedure AtualizarBotoesCampos(Modo: TModoFormulario);
    procedure RealizarAcaoCadastroEdicao;
  public
    property ModoFormulario: TModoFormulario read FModoFormulario
      write AlterarModo;
  end;

var
  Form_Cadastro_Colaborador: TForm_Cadastro_Colaborador;

implementation

uses
  uFuncoes;

{$R *.dfm}

{ TForm_Cadastro_Colaborador }




{ TForm_Cadastro_Colaborador }

procedure TForm_Cadastro_Colaborador.AlterarModo(
  Modo: TModoFormulario);
begin
  FModoFormulario := Modo;
  ConfigurarModo;
end;


procedure TForm_Cadastro_Colaborador.AtualizarBotoesCampos(
  Modo: TModoFormulario);
begin
  case Modo of
    mfNovo:
      begin
        gbInformacoesBasicas.Enabled := True;
        gbContrato.Enabled := True;
        gbPeriodos.Enabled := True;
        GerenciarBotoes(btnSalvar, True);
        GerenciarBotoes(btnEditar, False);

      end;
    mfEditar:
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

procedure TForm_Cadastro_Colaborador.ConfigurarModo;
begin
  AtualizarBotoesCampos(FModoFormulario);
end;

procedure TForm_Cadastro_Colaborador.RealizarAcaoCadastroEdicao;
var
  Codigo, CodSetor: Integer;
  Nome, Matricula: String; DataContrato, PeriodoAquisitivo, PeriodoConsessivo
  : TDate; Ativo: Boolean;
begin
  Codigo := StrToIntDef(lblCodigo.Caption, 0);
  Nome   := edtNome.Text;
  Matricula  := edtMatricula.Text;
  DataContrato  := dtpContrato.Date;
  PeriodoAquisitivo := dtpAquisitivoInicial;
end;

end.
