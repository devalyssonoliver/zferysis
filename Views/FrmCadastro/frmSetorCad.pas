unit frmSetorCad;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask,
  Vcl.ExtCtrls, Data.DB, Vcl.Imaging.pngimage, dmSetorCad;

type
TModoFormulario = (mfNovo, mfEditar, mfExibicao);
  TFrm_SetorCad = class(TForm)
    pnlCentro: TPanel;
    lblTitulo: TLabel;
    imgLogo: TImage;
    pnlBotoes: TPanel;
    btnSalvar: TButton;
    btnEditar: TButton;
    btnFechar: TButton;
    btnNovo: TButton;
    btnCancelar: TButton;
    pnlStatusFerias: TPanel;
    grpSetorCad: TGroupBox;
    dsSetor: TDataSource;
    lblCodigo: TLabel;
    dbedtcodigo: TDBEdit;
    lblDescricao: TLabel;
    dbedtdescricao: TDBEdit;
    dbchkativo: TDBCheckBox;
    lblDataCadastro: TLabel;
    dbedtdata_cadastro: TDBEdit;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
     FDMSetor : TSetoCadDataModule;
    FModoFormulario: TModoFormulario;

    procedure ConfigurarModo;
    procedure ConfigurarAtivoNosCampos(Ativo: Boolean);
    procedure AlterarModo(const Modo: TModoFormulario);
  public
    { Public declarations }
     property ModoFormulario: TModoFormulario read FModoFormulario write AlterarModo;
     procedure CarregarSetor(_Codigo : Integer);
  end;

var
  Frm_SetorCad: TFrm_SetorCad;

implementation

uses
  uFuncoes;

{$R *.dfm}

{ TFrm_SetorCad }

procedure TFrm_SetorCad.btnCancelarClick(Sender: TObject);
begin
  FDMSetor.Cancelar;
  AlterarModo(mfExibicao);
end;

procedure TFrm_SetorCad.btnEditarClick(Sender: TObject);
begin
  AlterarModo(mfEditar);
  FDMSetor.Editar;
end;

procedure TFrm_SetorCad.btnFecharClick(Sender: TObject);
begin
  if confirmarFechamento then
  close;
end;

procedure TFrm_SetorCad.btnNovoClick(Sender: TObject);
begin
   FDMSetor.Novo;
   AlterarModo(mfExibicao);
end;

procedure TFrm_SetorCad.btnSalvarClick(Sender: TObject);
begin
   FDMSetor.Salvar;
   AlterarModo(mfExibicao);
end;

procedure TFrm_SetorCad.CarregarSetor(_Codigo: Integer);
begin
  FDMSetor.CarregarSetor(_Codigo);
end;

procedure TFrm_SetorCad.ConfigurarAtivoNosCampos(Ativo: Boolean);
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

procedure TFrm_SetorCad.ConfigurarModo;
begin
   case FModoFormulario of
    mfNovo:
      begin
        FDMSetor.Novo;
        ConfigurarAtivoNosCampos(True);
        GerenciarBotoes([btnNovo, btnEditar], False);
        GerenciarBotoes([btnSalvar, btnCancelar], True);
      end;
    mfEditar:
      begin
        FDMSetor.Editar;
        ConfigurarAtivoNosCampos(True);
        GerenciarBotoes([btnNovo, btnEditar], False);
        GerenciarBotoes([btnSalvar, btnCancelar], True);
      end;
    mfExibicao:
      begin
        ConfigurarAtivoNosCampos(False);
        GerenciarBotoes([btnCancelar,btnSalvar], False);
        GerenciarBotoes([btnEditar, btnNovo], True);
       end;
end;
end;

procedure TFrm_SetorCad.FormCreate(Sender: TObject);
begin
  FDMSetor := TSetoCadDataModule.Create(Self);
end;

procedure TFrm_SetorCad.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
   begin
      Key := #0;
      Perform(WM_NEXTDLGCTL,0,0);
   end;
end;

procedure TFrm_SetorCad.FormShow(Sender: TObject);
begin
  dbedtdata_cadastro.Text := DateToStr(Now);
end;

procedure TFrm_SetorCad.AlterarModo(const Modo: TModoFormulario);
begin
  FModoFormulario := Modo;
  ConfigurarModo;
end;

end.
