unit uGerenciadorApp;

interface

uses
  Vcl.Forms, Vcl.Dialogs, dmGerenciadorConexao, frmLogin, frmConfigurarBanco,
  frmPrincipal;

procedure IniciarAplicacao;

implementation

procedure IniciarAplicacao;
begin
  Application.CreateForm(TGerenciadorConexao, GerenciadorConexao);

  if GerenciadorConexao.Conexao.ConectarAoBancoDeDados then
  begin
    Application.CreateForm(TFrm_Login, Frm_Login);
    Frm_Login.ShowModal;
    Application.CreateForm(TFrm_Principal, Frm_Principal);
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
