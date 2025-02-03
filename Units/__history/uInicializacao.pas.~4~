unit uInicializacao;

interface

uses uArquivoIni, Vcl.Forms, frmConfigurarBanco, System.SysUtils, Controls;

procedure verificarConfiguracaoInicial;

implementation

uses
frmLogin;
procedure verificarConfiguracaoInicial;
var
  Base, Servidor, Porta, Usuario, Senha: String;
begin
  if not ArquivoIniExiste then
  begin
    Application.CreateForm(TFrmConfigBanco, FrmConfigBanco);
    FrmConfigBanco.Show;
  end
  else

end;


function ChamarLogin:Boolean;
begin
  Result := False;
  Application.CreateForm(TFrm_Login, Frm_Login);
  if Frm_Login.ShowModal = mrOk then
  begin
    Result := True;
    FreeAndNil(Frm_Login);
  end
  else
    Application.Terminate;

end;

end.
