unit UsuarioRepositorio;

interface

uses
  System.SysUtils, IUsuario, Usuario, FireDAC.Comp.Client,
  FireDAC.Comp.DataSet, FireDAC.Stan.Param, dmGerenciadorConexao, Data.DB,
  System.Variants, uFuncoes, Vcl.Dialogs;

type
  TUsuarioRepository = class(TInterfacedObject, IUsuarioRepository)
  public
    function Inserir(const Codigo: Integer; Nome, Login, Senha: String;
      Ativo: Boolean): Boolean;
    function Editar(const Codigo: Integer; const Nome: String;
      Ativo: Boolean): Boolean;
    function CarregarUsuario(const Login: String): TUsuario;
    function VerificarCredenciais(const Login, Senha: String): Boolean;
    procedure BuscarUsuario(const CriterioIndex: Integer; const Valor: Variant;
      ADataSet: TDataSet);
    procedure ListarTodos(ADataSet: TDataSet);
    function EditarSenha(const Codigo: Integer; Senha: String): Boolean;

  const
    CRITERIO_CODIGO = 0;
    CRITERIO_NOME = 1;
    CRITERIO_LOGIN = 2;

  end;

implementation

{ TUsuarioRepository }

function TUsuarioRepository.Inserir(const Codigo: Integer;
  Nome, Login, Senha: String; Ativo: Boolean): Boolean;
var
  Query: TFDQuery;
begin
  Result := False;
  Query := TFDQuery.Create(nil);
  try
    Query.Connection := GerenciadorConexao.fdConn;
    Query.SQL.Text :=
      'INSERT INTO public.usuarios(nome, login, senha, ativo, data_cadastro) ' +
      'VALUES(:Nome, :Login, :Senha , :Ativo, :DataCadastro)';
    Query.Params.ParamByName('Nome').AsString := Nome;
    Query.Params.ParamByName('Login').AsString := Login;
    Query.Params.ParamByName('Senha').AsString := Senha;
    Query.Params.ParamByName('Ativo').AsBoolean := Ativo;
    Query.Params.ParamByName('DataCadastro').AsDateTime := Now;

    Query.ExecSQL;
    Result := True;
  except
    on E: Exception do
      MsgBox('Ocorreu um erro ao inserir o usu�rio. Verifique os campos preenchidos e tente novamente.',
        E.Message, False, 2);
  end;
end;

function TUsuarioRepository.Editar(const Codigo: Integer; const Nome: String;
  Ativo: Boolean): Boolean;
var
  Query: TFDQuery;
begin
  Result := False;
  Query := TFDQuery.Create(nil);
  try
    Query.Connection := GerenciadorConexao.fdConn;
    Query.SQL.Text :=
      'UPDATE usuarios SET nome = :nome, ativo = :ativo WHERE codigo = :codigo';
    Query.Params.ParamByName('nome').AsString := Nome;
    Query.Params.ParamByName('ativo').AsBoolean := Ativo;
    Query.Params.ParamByName('codigo').AsInteger := Codigo;

    Query.ExecSQL;
    Result := True;
  except
    on E: Exception do
      MsgBox('Ocorreu um erro! Verifique os campos preenchidos e tente novamente.',
        E.Message, False, 2);
  end;
end;

function TUsuarioRepository.EditarSenha(const Codigo: Integer;
  Senha: String): Boolean;
var
  Query: TFDQuery;
begin
  Result := False;
  Query := TFDQuery.Create(nil);
  try
    Query.Connection := GerenciadorConexao.fdConn;
    Query.SQL.Text :=
      'UPDATE usuarios SET senha = :senha WHERE codigo = :codigo';
    Query.Params.ParamByName('codigo').AsInteger := Codigo;
    Query.Params.ParamByName('senha').AsString := Senha;

    Query.ExecSQL;
    Result := True;
  except
    on E: Exception do
      MsgBox('Ocorreu um erro! Verifique os campos preenchidos e tente novamente.',
        E.Message, False, 2);
  end;
end;

function TUsuarioRepository.CarregarUsuario(const Login: String): TUsuario;
var
  Query: TFDQuery;
  Usuario: TUsuario;
begin
  Query := TFDQuery.Create(nil);
  Result := nil;

  Query.Connection := GerenciadorConexao.fdConn;
  Query.SQL.Text :=
    'SELECT codigo, nome, login, ativo, data_cadastro FROM usuarios WHERE login = :login';
  Query.ParamByName('login').AsString := Login;
  Query.Open;

  if not Query.IsEmpty then
  begin
    Usuario := TUsuario.Create;
    Usuario.Codigo := Query.FieldByName('codigo').AsInteger;
    Usuario.Nome := Query.FieldByName('nome').AsString;
    Usuario.Login := Query.FieldByName('login').AsString;
    Usuario.Ativo := Query.FieldByName('ativo').AsBoolean;
    Usuario.DataCadastro := Query.FieldByName('data_cadastro').AsDateTime;
    Result := Usuario;
  end;
end;

function TUsuarioRepository.VerificarCredenciais(const Login,
  Senha: String): Boolean;
var
  Query: TFDQuery;
begin
  Query := TFDQuery.Create(nil);
  try
    Query.Connection := GerenciadorConexao.fdConn;
    Query.SQL.Text :=
      'SELECT 1 FROM public.usuarios WHERE login = :login AND senha = MD5(:senha) AND ativo IS TRUE';
    Query.ParamByName('login').AsString := Login;
    Query.ParamByName('senha').AsString := Senha;
    Query.Open;

    Result := not Query.IsEmpty;
  finally
    Query.Free;
  end;
end;

procedure TUsuarioRepository.BuscarUsuario(const CriterioIndex: Integer;
  const Valor: Variant; ADataSet: TDataSet);
begin
  if VarIsNull(Valor) or (Trim(VarToStr(Valor)) = '') then
    raise Exception.Create('Informe um valor v�lido para a pesquisa.');
  if ADataSet is TFDQuery then

    try
      TFDQuery(ADataSet).Connection := GerenciadorConexao.fdConn;
      TFDQuery(ADataSet).SQL.Text := 'SELECT * FROM public.vusuarios WHERE ';

      case CriterioIndex of
        CRITERIO_CODIGO:
          begin
            TFDQuery(ADataSet).SQL.Add('codigo = :Valor');
            TFDQuery(ADataSet).ParamByName('Valor').Value :=
              StrToIntDef(VarToStr(Valor), 0);
          end;
        CRITERIO_NOME:
          begin
            TFDQuery(ADataSet).SQL.Add('nome ILIKE :Valor');
            TFDQuery(ADataSet).ParamByName('Valor').AsString :=
              '%' + VarToStr(Valor) + '%';
          end;
        CRITERIO_LOGIN:
          begin
            TFDQuery(ADataSet).SQL.Add('login ILIKE :Valor');
            TFDQuery(ADataSet).ParamByName('Valor').AsString :=
              '%' + VarToStr(Valor) + '%';
          end;
      else
        raise Exception.Create('Crit�rio de pesquisa inv�lido.');
      end;

      TFDQuery(ADataSet).Open;

      if TFDQuery(ADataSet).IsEmpty then
        raise Exception.Create
          ('Nenhum usu�rio encontrado com o crit�rio informado.');

    finally

    end;
end;

procedure TUsuarioRepository.ListarTodos(ADataSet: TDataSet);
begin
  if ADataSet is TFDQuery then

  begin
    TFDQuery(ADataSet).SQL.Text := 'SELECT * FROM vusuarios';
    TFDQuery(ADataSet).Open;
  end;

end;

end.
