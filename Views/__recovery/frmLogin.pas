unit frmLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.ButtonStylesAttributes, Vcl.StyledButton, Vcl.Mask, Vcl.Imaging.pngimage,
  System.ImageList, Vcl.ImgList, Vcl.Buttons, Usuario, dmUsuario, frmPrincipal,
  Vcl.StyledTaskDialog, uFuncoes;

type
  TFrm_Login = class(TForm)
    img32x32: TImageList;
    pnlAzul: TPanel;
    imgLogo: TImage;
    lbLogo: TLabel;
    lbVersao: TLabel;
    pnlLogin: TPanel;
    edtLogin: TEdit;
    pnlSenha: TPanel;
    edtSenha: TEdit;
    btnLogin: TStyledButton;
    spdIconSenha: TSpeedButton;
    spdIconUser: TSpeedButton;
    btnFechar: TStyledButton;
    StyledTaskDialog1: TStyledTaskDialog;
    procedure btnLoginClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RealizarLogin;
    procedure ExibirErroLogin;
    procedure btnFecharClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_Login: TFrm_Login;

implementation

{$R *.dfm}

procedure TFrm_Login.RealizarLogin;
begin
  ShowMessage('Login válido!');
  Close;
  Hide;
  Application.CreateForm(TFrm_Principal, Frm_Principal);
  Frm_Principal.ShowModal;

end;

procedure TFrm_Login.FormCreate(Sender: TObject);
begin
  if not Assigned(UsuarioDataModule) then
    UsuarioDataModule := TUsuarioDataModule.Create(Self);
end;

procedure TFrm_Login.ExibirErroLogin;
begin
  ShowMessage('Credenciais inválidas.');
end;

procedure TFrm_Login.btnFecharClick(Sender: TObject);
begin
  if ConfirmarFechamento then
    Application.Terminate;
end;

procedure TFrm_Login.btnLoginClick(Sender: TObject);
var
  LoginValido: Boolean;
begin
  LoginValido := UsuarioDataModule.VerificarCredenciais(edtLogin.Text,
    edtSenha.Text);
  if LoginValido then
    RealizarLogin
  else
    ExibirErroLogin;
end;

end.
