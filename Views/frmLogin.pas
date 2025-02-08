  unit frmLogin;

  interface

  uses
    Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
    System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
    Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask, Vcl.Imaging.pngimage, System.ImageList,
    Vcl.ImgList, Vcl.Buttons, Usuario, dmUsuario, uFuncoes,
    dmGerenciadorConexao, System.Types, Vcl.GraphUtil, Vcl.Menus;

  type
    TFrm_Login = class(TForm)
      imgLogo: TImage;
      lbLogo: TLabel;
      lbVersao: TLabel;
      pnlLogin: TPanel;
      pnlSenha: TPanel;
      lblDigiteSuaSenha: TLabel;
      lblDigiteSeuUsuario: TLabel;
      edtLogin: TEdit;
      edtSenha: TEdit;
    pnlFakeTab: TPanel;
    shpControlLogin: TShape;
    btnLogin: TSpeedButton;



      procedure FormCreate(Sender: TObject);
      procedure RealizarLogin;
      procedure ExibirErroLogin;
      procedure FormPaint(Sender: TObject);
    procedure btnFakeClick(Sender: TObject);
    procedure btnLoginClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);

    private
      { Private declarations }
      { Public declarations }
    end;

  var
    Frm_Login: TFrm_Login;

  implementation

  {$R *.dfm}

uses frmConfigurarBanco;

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

  procedure TFrm_Login.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key = VK_RETURN then
  begin
    Key := 0;
    // Verifique se o foco está no campo edtLogin
    if ActiveControl = edtLogin then
    begin
      edtSenha.SetFocus;  // Mover para o próximo campo (edtSenha)
    end
    // Verifique se o foco está no campo edtSenha
    else if ActiveControl = edtSenha then
    begin
      btnLogin.Click;  // Simula o clique no botão SpeedButton
    end;
  end;

end;

procedure TFrm_Login.FormPaint(Sender: TObject);
  var
    Rect: TRect;
  begin
    Rect := ClientRect;
    GradientFillCanvas(Canvas, clSkyBlue, clWhite, Rect, gdVertical);

  end;



procedure TFrm_Login.btnFakeClick(Sender: TObject);
begin
  btnLogin.Click;
end;

procedure TFrm_Login.btnLoginClick(Sender: TObject);
var
    LoginValido: Boolean;
  begin

    if not GerenciadorConexao.ValidarConexao then
    begin
      Application.CreateForm(TFrmConfigBanco, FrmConfigBanco);
       FrmConfigBanco.ShowModal;
       FreeAndNil(FrmConfigBanco);

    end;

    LoginValido := UsuarioDataModule.VerificarCredenciais(edtLogin.Text, edtSenha.Text);
    if LoginValido then
    begin
      RealizarLogin;
      ModalResult := mrOk;
    end
    else
      ExibirErroLogin;
end;

procedure TFrm_Login.ExibirErroLogin;
  begin
    MsgBox('Aviso', 'Login ou senha incorretas, verifique.', False, 1);

  end;
  end.

