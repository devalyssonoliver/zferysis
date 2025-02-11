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
    procedure ConfigurarConexao(const Servidor, Base, Porta, Usuario,
      Senha: String);
    function ValidarConexao: Boolean;


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

procedure TGerenciadorConexao.ConfigurarConexao(const Servidor, Base, Porta,
  Usuario, Senha: String);
begin
  Conexao.Base := Base;
  Conexao.Servidor := Servidor;
  Conexao.Base := Base;
  Conexao.Porta := Porta;
  Conexao.Login := Usuario;
  Conexao.Senha := Senha;
end;

function TGerenciadorConexao.ValidarConexao: Boolean;
var
  Servidor, Base, Porta, Usuario, Senha: String;
begin
  Result := False;

  pgDriver.VendorLib := IncludeTrailingPathDelimiter
      (ExtractFilePath(Application.ExeName)) + 'lib\libpq.dll';
  Usuario := 'postgres';
  Senha := 'postzeus2011';

  try
    LerArquivoIni(Servidor, Base, Porta);
    ConfigurarConexao(Servidor, Base, Porta, Usuario, Senha);

    if not Conexao.ConectarAoBancoDeDados then
      raise Exception.Create('Não foi possível conectar ao banco de dados.');

    Result := True;
  except
    on E: Exception do
      MsgBox('Erro ao conectar ao banco de dados!', E.Message, False, 2);
  end;
end;

procedure TGerenciadorConexao.DataModuleCreate(Sender: TObject);
begin
  Conexao := TConexao.Create(fdConn);
end;

procedure TGerenciadorConexao.DataModuleDestroy(Sender: TObject);
begin
  Conexao.Free;
end;

end.
