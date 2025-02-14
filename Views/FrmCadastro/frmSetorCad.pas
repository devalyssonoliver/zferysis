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
  private
    { Private declarations }
     FDMSetor : TSetoCadrDataModule;
    FModoFormulario: TModoFormulario;
    procedure ConfigurarModo;
    procedure ConfigurarAtivoNosCampos(Ativo: Boolean);
  public
    { Public declarations }
     property ModoFormulario: TModoFormulario read FModoFormulario write AlterarModo;
     procedure CarregarSetor(_Codigo : Integer);
  end;

var
  Frm_SetorCad: TFrm_SetorCad;

implementation

{$R *.dfm}

end.
