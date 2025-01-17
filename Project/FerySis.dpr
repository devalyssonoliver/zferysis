program FerySis;

uses
  System.SysUtils,
  Vcl.Forms,
  Conexao in '..\Classes\Conexao.pas',
  frmLogin in '..\Views\frmLogin.pas' {Frm_Login},
  frmPrincipal in '..\Views\frmPrincipal.pas' {Frm_Principal},
  dmGerenciadorConexao in '..\Models\dmGerenciadorConexao.pas' {GerenciadorConexao: TDataModule},
  uGerenciadorApp in '..\Models\uGerenciadorApp.pas',
  Usuario in '..\Classes\Usuario.pas',
  dmUsuario in '..\Models\dmUsuario.pas' {UsuarioDataModule: TDataModule},
  frmConfigurarBanco in '..\Views\frmConfigurarBanco.pas' {FrmConfigBanco},
  uArquivoIni in '..\Units\uArquivoIni.pas',
  uFuncoes in '..\Units\uFuncoes.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TGerenciadorConexao, GerenciadorConexao);
  IniciarAplicacao;

end.
