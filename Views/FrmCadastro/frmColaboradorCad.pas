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
    ImageList: TImageList;
    pnlStatusFerias: TPanel;
    il32: TImageList;
    btnNovo: TButton;
    dsColaborador: TDataSource;
    dbedtCodigo: TDBEdit;
    lblNome: TLabel;
    lblMatricula: TLabel;
    dbedtMatricula: TDBEdit;
    lblCodigoSetor: TLabel;
    dbedtcodsetor: TDBEdit;
    lblDataContrato: TLabel;
    dbedtData_contrato: TDBEdit;
    lblPeriodoAquisitivo: TLabel;
    dbedtPeriodoAquisitivo: TDBEdit;
    lblPeriodoConcessivo: TLabel;
    dbedtPeriodo_concessivo: TDBEdit;
    lblDataCadastro: TLabel;
    dbchkAtivo: TDBCheckBox;
    dbedtNome: TDBEdit;
    lblCpf: TLabel;
    dbedtCpf: TDBEdit;
    edtDataCadastro: TEdit;
    btnCancelar: TButton;
    procedure btnSalvarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure AlterarModo(Modo: TModoFormulario);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);



  private
    FDmColaborador : TColaboradorDataModule;
    FModoFormulario: TModoFormulario;
    procedure ConfigurarModo;
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
  begin
    if Self.Components[I] is TDBEdit then
      TDBEdit(Self.Components[I]).Enabled := Ativo
    else if Self.Components[I] is TDBCheckBox then
      TDBCheckBox(Self.Components[I]).Enabled := Ativo
    else if Self.Components[I] is TDBComboBox then
      TDBComboBox(Self.Components[I]).Enabled := Ativo;
  end;
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
        FDmColaborador.Novo;
        ConfigurarAtivoNosEdits(True);
        GerenciarBotoes(btnEditar, False);
      end;
    mfEditar:
      begin
        FDmColaborador.Editar;
        ConfigurarAtivoNosEdits(True);
        GerenciarBotoes([btnNovo, btnEditar], False);
        GerenciarBotoes(btnSalvar, True);
      end;
    mfExibicao:
      begin
        ConfigurarAtivoNosEdits(False);
        GerenciarBotoes(btnSalvar, False);
        GerenciarBotoes([btnEditar, btnNovo], True);

      end;
  end;
end;


procedure TForm_Cadastro_Colaborador.FormCreate(Sender: TObject);
begin

    FDmColaborador := TColaboradorDataModule.Create(nil);
    if Assigned(FDmColaborador) then
        begin
        dsColaborador.DataSet := FDmColaborador.fdqryColaborador;
        dsColaborador.DataSet.Active := True;
        end

end;

procedure TForm_Cadastro_Colaborador.FormDestroy(Sender:
TObject);
begin
  FreeAndNil(FDmColaborador);
end;

procedure TForm_Cadastro_Colaborador.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    Perform(WM_NEXTDLGCTL,0,0);
  end;

end;


procedure TForm_Cadastro_Colaborador.FormShow(Sender: TObject);
begin
  edtDataCadastro.Text := DateToStr(Now);
end;

procedure TForm_Cadastro_Colaborador.btnSalvarClick(Sender: TObject);

begin
   ColaboradorDataModule.Salvar;
   AlterarModo(mfExibicao);
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

