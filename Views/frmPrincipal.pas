unit frmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dmGerenciadorConexao,
  Vcl.ButtonStylesAttributes, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.StyledToolbar,
  uArquivoIni, frmCadastroUsuario, frmLocalizacaoUsuario, System.ImageList,
  Vcl.ImgList, Vcl.StyledButton, Vcl.ToolWin, Vcl.ActnMan, Vcl.ActnCtrls,
  Vcl.Ribbon, System.Actions, Vcl.ActnList, Vcl.RibbonSilverStyleActnCtrls,
  Vcl.Buttons, frmConfigurarBanco;

type
  TFrm_Principal = class(TForm)
    StyledToolbar1: TStyledToolbar;
    lbRotuloServidor: TLabel;
    lbServidor: TLabel;
    lbRotuloBase: TLabel;
    lbBase: TLabel;
    lbRotuloPorta: TLabel;
    lbPorta: TLabel;
    lbDataAtual: TLabel;
    lbUsuario: TLabel;
    Ribbon1: TRibbon;
    actionManager: TActionManager;
    RibbonPage1: TRibbonPage;
    RibbonGroup1: TRibbonGroup;
    ImageList: TImageList;
    sbtnFormUser: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure sbtnFormUserClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_Principal: TFrm_Principal;

implementation

{$R *.dfm}

uses frmLogin, dmUsuario;

procedure TFrm_Principal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Application.Terminate;
end;

procedure TFrm_Principal.FormCreate(Sender: TObject);
var
  Base, Servidor, Porta: String;
begin
  LerArquivoIni(Base, Servidor, Porta);
  lbServidor.Caption := Servidor;
  lbBase.Caption := Base;
  lbPorta.Caption := Porta;
  lbDataAtual.Caption := DatetimeToStr(Now);

end;

procedure TFrm_Principal.sbtnFormUserClick(Sender: TObject);
begin
  Application.CreateForm(TForm_Loc_Usuarios, Form_Loc_Usuarios);
  Form_Loc_Usuarios.Show;
end;

end.
