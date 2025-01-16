unit dmUsuario;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Comp.Client, Usuario,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  dmGerenciadorConexao;

type
  TUsuarioDataModule = class(TDataModule)
    FDQuery: TFDQuery;
  public
    function CarregarUsuario(const Login: String): TUsuario;
    function VerificarCredenciais(const Login, Senha: String): Boolean;
  end;

var
  UsuarioDataModule: TUsuarioDataModule;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}

function TUsuarioDataModule.CarregarUsuario(const Login: String): TUsuario;
var
  Usuario: TUsuario;
begin
  Result := nil;
  FDQuery.Connection := GerenciadorConexao.fdConn;
  FDQuery.SQL.Text :=
    'SELECT codigo, nome, login, ativo FROM usuarios WHERE login = :login';
  FDQuery.ParamByName('login').AsString := Login;
  FDQuery.Open;

  if not FDQuery.IsEmpty then
  begin
    Usuario := TUsuario.Create;
    Usuario.Codigo := FDQuery.FieldByName('codigo').AsInteger;
    Usuario.Nome   := FDQuery.FieldByName('nome').AsString;
    Usuario.Login  := FDQuery.FieldByName('login').AsString;
    Usuario.Ativo  := FDQuery.FieldByName('ativo').AsBoolean;
    Result := Usuario;
  end;
end;

function TUsuarioDataModule.VerificarCredenciais(const Login,
  Senha: String): Boolean;
begin
  FDQuery.Connection := GerenciadorConexao.fdConn;
  FDQuery.SQL.Text :=
    'SELECT 1 FROM public.usuarios WHERE login = :login AND senha = MD5(:senha) AND ativo IS TRUE';
  FDQuery.ParamByName('login').AsString := Login;
  FDQuery.ParamByName('senha').AsString := Senha;
  FDQuery.Open;

  Result := not FDQuery.IsEmpty;
end;

end.
