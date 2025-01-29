unit Conexao;

interface

uses
  FireDAC.Comp.Client, FireDAC.Stan.Intf, System.SysUtils;

type
  TConexao = class
  private
    FServidor: String;
    FSenha: String;
    FBase: String;
    FLogin: String;
    FPorta: String;
    FDBConnection: TFDConnection;
    FDriverId: String;
  public
    constructor Create(NomeConexao: TFDConnection);
    destructor Destroy; override;

    function ConectarAoBancoDeDados: Boolean;

    property DBConnection: TFDConnection read FDBConnection write FDBConnection;
    property Servidor: String read FServidor write FServidor;
    property Base: String read FBase write FBase;
    property Login: String read FLogin write FLogin;
    property Senha: String read FSenha write FSenha;
    property Porta: String read FPorta write FPorta;
    property DriverId: String read FDriverId write FDriverId;

  end;

implementation

constructor TConexao.Create(NomeConexao: TFDConnection);
begin
  FDBConnection := NomeConexao;
end;

function TConexao.ConectarAoBancoDeDados: Boolean;
var
  LibPath: string;
begin
  try
    FDBConnection.Params.Clear;
    FDBConnection.Params.Add('DriverID=' + 'PG');
    FDBConnection.Params.Add('Server=' + FServidor);
    FDBConnection.Params.Add('Database=' + Base);
    FDBConnection.Params.Add('User_Name=' + Login);
    FDBConnection.Params.Add('Password=' + Senha);
    FDBConnection.Params.Add('Port=' + FPorta);

    FDBConnection.Connected := True;
    if FDBConnection.Connected then
      Result := True
    else
      raise Exception.Create('A conexão foi configurada, mas não está ativa.');
  except
    on E: Exception do
    begin

      raise Exception.Create('Erro ao conectar ao banco de dados: ' +
        E.Message);
    end;
  end;
end;

destructor TConexao.Destroy;
begin
  if FDBConnection.Connected then
    FDBConnection.Connected := False;
  inherited;
end;

end.
