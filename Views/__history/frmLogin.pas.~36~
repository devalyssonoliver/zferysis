  unit frmLogin;

  interface

  uses
    Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
    System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
    Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask, Vcl.Imaging.pngimage, System.ImageList,
    Vcl.ImgList, Vcl.Buttons, Usuario, dmUsuario, uFuncoes, uInicializacao,
    dmGerenciadorConexao, System.Types, Vcl.GraphUtil, Vcl.Menus, System.Skia,
    Vcl.Skia;

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
    btnLogin: TSpeedButton;
    shpControlLogin: TShape;


      procedure btnLoginClick(Sender: TObject);
      procedure FormCreate(Sender: TObject);
      procedure RealizarLogin;
      procedure ExibirErroLogin;
      procedure FormPaint(Sender: TObject);





    private
      { Private declarations }
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

  procedure TFrm_Login.FormPaint(Sender: TObject);
  var
    Rect: TRect;
  begin
    Rect := ClientRect;
    GradientFillCanvas(Canvas, clSkyBlue, clWhite, Rect, gdVertical);

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

    LoginValido := UsuarioDataModule.VerificarCredenciais(edtLogin.Text, edtSenha.Text);
    if LoginValido then
    begin
      RealizarLogin;
      ModalResult := mrOk;
    end
    else
      ExibirErroLogin;

  end;

  end.

