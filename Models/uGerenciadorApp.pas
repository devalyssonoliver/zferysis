unit uGerenciadorApp;

interface

uses
  Vcl.Forms, Vcl.Dialogs, dmGerenciadorConexao, frmLogin, frmConfigurarBanco;

procedure IniciarAplicacao;

implementation

procedure IniciarAplicacao;
begin
  Application.CreateForm(TGerenciadorConexao, GerenciadorConexao);

  if GerenciadorConexao.Conexao.ConectarAoBancoDeDados then
  begin
    Application.CreateForm(TFrm_Login, Frm_Login);
    Frm_Login.ShowModal;
    Frm_Login.Hide;
    Frm_Login.Free;
  end
  else
  begin
    Application.CreateForm(TFrmConfigBanco, FrmConfigBanco);
    FrmConfigBanco.ShowModal;
  end;
end;

end.

