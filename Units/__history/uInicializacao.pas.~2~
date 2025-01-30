unit uInicializacao;

interface

uses uArquivoIni, Vcl.Forms, frmConfigurarBanco;

procedure verificarConfiguracaoInicial;

implementation

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

end.
