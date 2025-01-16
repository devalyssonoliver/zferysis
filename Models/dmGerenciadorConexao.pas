unit dmGerenciadorConexao;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  FireDAC.Phys.PGDef, FireDAC.Phys.PG, Data.DB, FireDAC.Comp.Client, Conexao,
  FireDAC.Moni.Base, FireDAC.Moni.FlatFile, uArquivoIni;

type
  TGerenciadorConexao = class(TDataModule)
    fdConn: TFDConnection;
    pgDriver: TFDPhysPgDriverLink;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure ConfigurarConexao(const Base, Servidor, Porta, Login,
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
  Login, Senha: String);
begin
  Conexao.Base := Base;
  Conexao.Servidor := Servidor;
  Conexao.Porta := Porta;
  Conexao.Login := Login;
  Conexao.Senha := Senha;

end;

procedure TGerenciadorConexao.DataModuleCreate(Sender: TObject);
var
  Base, Servidor, Porta, Login, Senha: String;
begin
  Conexao := TConexao.Create(fdConn);
  LerArquivoIni(Base, Servidor, Porta, Login, Senha);
  ConfigurarConexao(Base, Servidor, Porta, Login, Senha);

end;

procedure TGerenciadorConexao.DataModuleDestroy(Sender: TObject);
begin
  Conexao.Free;
end;

end.
