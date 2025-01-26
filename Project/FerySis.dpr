program FerySis;

uses
  System.SysUtils,
  Vcl.Forms,
  Conexao in '..\Classes\Conexao.pas',
  frmLogin in '..\Views\frmLogin.pas' {Frm_Login} ,
  frmPrincipal in '..\Views\frmPrincipal.pas' {Frm_Principal} ,
  dmGerenciadorConexao
    in '..\Models\dmGerenciadorConexao.pas' {GerenciadorConexao: TDataModule} ,
  Usuario in '..\Classes\Usuario.pas',
  dmUsuario in '..\Models\dmUsuario.pas' {UsuarioDataModule: TDataModule} ,
  frmConfigurarBanco in '..\Views\frmConfigurarBanco.pas' {FrmConfigBanco} ,
  uArquivoIni in '..\Units\uArquivoIni.pas',
  uFuncoes in '..\Units\uFuncoes.pas',
  Colaborador in '..\Classes\Colaborador.pas',
  frmCadastroUsuario
    in '..\Views\FrmCadastro\frmCadastroUsuario.pas' {Frm_Cad_Usuario} ,
  frmLocalizacaoUsuario
    in '..\Views\FrmLocaliza��o\frmLocalizacaoUsuario.pas' {Form_Loc_Usuarios};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
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
  Application.CreateForm(TFrm_Principal, Frm_Principal);
  Application.Run;

end.
