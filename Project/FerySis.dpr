program FerySis;

uses
  System.SysUtils,
  Vcl.Forms,
  Conexao in '..\Classes\Conexao.pas',
  frmLogin in '..\Views\frmLogin.pas' {Frm_Login},
  frmPrincipal in '..\Views\frmPrincipal.pas' {Frm_Principal},
  dmGerenciadorConexao in '..\Models\dmGerenciadorConexao.pas' {GerenciadorConexao: TDataModule},
  Usuario in '..\Classes\Usuario.pas',
  dmUsuario in '..\Models\DataModules\dmUsuario.pas' {UsuarioDataModule: TDataModule},
  frmConfigurarBanco in '..\Views\frmConfigurarBanco.pas' {FrmConfigBanco},
  uArquivoIni in '..\Units\uArquivoIni.pas',
  uFuncoes in '..\Units\uFuncoes.pas',
  Colaborador in '..\Classes\Colaborador.pas',
  frmCadastroUsuario in '..\Views\FrmCadastro\frmCadastroUsuario.pas' {Frm_Cad_Usuario},
  frmLocalizacaoUsuario in '..\Views\FrmLocaliza��o\frmLocalizacaoUsuario.pas' {Form_Loc_Usuarios},
  iUsuario in '..\Interfaces\iUsuario.pas',
  iUsuarioRepositorio in '..\Models\Reposit�rios\iUsuarioRepositorio.pas',
  iColaborador in '..\Interfaces\iColaborador.pas',
  iColaboradorRepositorio in '..\Models\Reposit�rios\iColaboradorRepositorio.pas',
  dmColaborador in '..\Models\DataModules\dmColaborador.pas' {ColaboradorDataModule: TDataModule},
  frmLocalizacaoColaborador in '..\Views\FrmLocaliza��o\frmLocalizacaoColaborador.pas' {Form_Loc_Colaborador},
  uInicializacao in '..\Units\uInicializacao.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;

  Application.CreateForm(TFrm_Principal, Frm_Principal);
  Application.Run;

end.
