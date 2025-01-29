unit dmGerenciadorConexao;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  FireDAC.Phys.PGDef, FireDAC.Phys.PG, Data.DB, FireDAC.Comp.Client, Conexao,
  FireDAC.Moni.Base, FireDAC.Moni.FlatFile, uArquivoIni, Vcl.Dialogs,
  Vcl.Forms, uFuncoes;

type
  TGerenciadorConexao = class(TDataModule)
    fdConn: TFDConnection;
    pgDriver: TFDPhysPgDriverLink;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure ConfigurarConexao(const Base, Servidor, Porta, Usuario,
      Senha: String);

  private
    { Private declarations }
  public
    { Public declarations }
    Conexao: TConexao;
  end;

var
  GerenciadorConexao: TGerenciadorConexao;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}

procedure TGerenciadorConexao.ConfigurarConexao(const Base, Servidor, Porta,
  Usuario, Senha: String);
begin
  Conexao.Base := Base;
  Conexao.Servidor := Servidor;
  Conexao.Porta := Porta;
  Conexao.Login := Usuario;
  Conexao.Senha := Senha;

end;

procedure TGerenciadorConexao.DataModuleCreate(Sender: TObject);
var
  Base, Servidor, Porta, Usuario, Senha: String;
begin
  pgDriver.VendorLib := IncludeTrailingPathDelimiter
    (ExtractFilePath(Application.ExeName)) + 'lib\libpq.dll';
  Usuario := 'postgres';
  Senha := 'postzeus2011';

  Conexao := TConexao.Create(fdConn);
  try
    LerArquivoIni(Base, Servidor, Porta);
    ConfigurarConexao(Base, Servidor, Porta, Usuario, Senha);

    if not Conexao.ConectarAoBancoDeDados then
      raise Exception.Create('Não foi possível conectar ao banco de dados.');
  except
    on E: Exception do
      MsgBox('Erro ao conectar ao banco de dados!', E.Message, False, 2);
  end;
end;

procedure TGerenciadorConexao.DataModuleDestroy(Sender: TObject);
begin
  Conexao.Free;
end;

end.
