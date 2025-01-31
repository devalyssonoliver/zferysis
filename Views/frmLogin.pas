unit frmLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask,
  Vcl.Imaging.pngimage,
  System.ImageList, Vcl.ImgList, Vcl.Buttons, Usuario, dmUsuario,
  uFuncoes, uInicializacao, dmGerenciadorConexao;

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

    spdIconSenha: TSpeedButton;
    spdIconUser: TSpeedButton;
    btnLogin: TButton;

    procedure btnLoginClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RealizarLogin;
    procedure ExibirErroLogin;

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
  ModalResult := mrOk;
  Close;
end;

procedure TFrm_Login.FormCreate(Sender: TObject);
begin
  if not Assigned(UsuarioDataModule) then
    UsuarioDataModule := TUsuarioDataModule.Create(nil);
end;

procedure TFrm_Login.ExibirErroLogin;
begin
  MsgBox('Aviso', 'Login ou senha incorretas, verifique.', False, 1);

end;

procedure TFrm_Login.btnLoginClick(Sender: TObject);
var
  LoginValido: Boolean;
begin

  if not GerenciadorConexao.ValidarConexao then
  begin
    verificarConfiguracaoInicial;
    Exit;
  end;

  LoginValido := UsuarioDataModule.VerificarCredenciais(edtLogin.Text,
    edtSenha.Text);
  if LoginValido then
  begin
    RealizarLogin;
    ModalResult := mrOk;
  end
  else
    ExibirErroLogin;

end;

end.
