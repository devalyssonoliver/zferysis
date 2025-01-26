unit dmUsuario;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Comp.Client, Usuario,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  dmGerenciadorConexao, uArquivoIni, Conexao, Vcl.Dialogs, uFuncoes,
  System.Variants, frxSmartMemo, fcxDataSource, frCoreClasses, frxClass,
  frxDBSet;

type
  TUsuarioDataModule = class(TDataModule)
    fdQueryUsuarios: TFDQuery;
    dsUsuarios: TDataSource;
    frxUsuarios: TfrxReport;
    fdqUsuariosRelatorio: TFDQuery;
    dsUsuariosRelatorio: TDataSource;
    fdqUsuariosRelatoriocodigo: TIntegerField;
    fdqUsuariosRelatorionome: TWideStringField;
    fdqUsuariosRelatoriologin: TWideStringField;
    fdqUsuariosRelatoriodata_cadastro: TDateField;
    fdqUsuariosRelatorioativo: TBooleanField;
    frxDBUsuarios: TfrxDBDataset;

  private
    FUsuarioLogado: TUsuario;
  public
    function CarregarUsuario(const Login: String): TUsuario;
    function VerificarCredenciais(const Login, Senha: String): Boolean;
    function Inserir(const Codigo: Integer; Nome, Login, Senha: String;
      Ativo: Boolean): Boolean;
    function Editar(const Codigo: Integer; const Nome, Senha: String;
      Ativo: Boolean): Boolean;
    property UsuarioLogado: TUsuario read FUsuarioLogado write FUsuarioLogado;
    procedure BuscarUsuario(const CriterioIndex: Integer; const Valor: Variant);
    procedure ListarTodos;
  end;

var
  UsuarioDataModule: TUsuarioDataModule;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}

function TUsuarioDataModule.Inserir(const Codigo: Integer;
  Nome, Login, Senha: String; Ativo: Boolean): Boolean;
begin
  Result := False;

  try
    fdQueryUsuarios.Connection := GerenciadorConexao.fdConn;
    fdQueryUsuarios.SQL.Text :=
      'INSERT INTO public.usuarios(nome, login, senha, ativo, data_cadastro) ' +
      'VALUES(:Nome, :Login, MD5(:Senha), :Ativo, :DataCadastro)';
    fdQueryUsuarios.Params.ParamByName('Nome').AsString := Nome;
    fdQueryUsuarios.Params.ParamByName('Login').AsString := Login;
    fdQueryUsuarios.Params.ParamByName('Senha').AsString := Senha;
    fdQueryUsuarios.Params.ParamByName('Ativo').AsBoolean := Ativo;
    fdQueryUsuarios.Params.ParamByName('DataCadastro').AsDateTime := Now;

    fdQueryUsuarios.ExecSQL;
    Result := True;
  except
    on E: Exception do
      MsgBox('Ocorreu um erro ao inserir o usuário. Verifique os campos preenchidos e tente novamente.',
        E.Message, False, 2);
  end;
end;

procedure TUsuarioDataModule.ListarTodos;
begin
  fdQueryUsuarios.Connection := GerenciadorConexao.fdConn;
  fdQueryUsuarios.SQL.Text := 'SELECT * FROM vusuarios';
  try
    fdQueryUsuarios.Open;

    if fdQueryUsuarios.IsEmpty then
      raise Exception.Create('Nenhum usuário encontrado na base de dados.');
  except
    on E: Exception do
      raise Exception.CreateFmt('Erro ao listar todos os usuários: %s',
        [E.Message]);
  end;
end;

function TUsuarioDataModule.Editar(const Codigo: Integer;
  const Nome, Senha: String; Ativo: Boolean): Boolean;
var
  SQLBuilder: TStringBuilder;
begin
  Result := False;
  SQLBuilder := TStringBuilder.Create;
  try
    try
      SQLBuilder.Append('UPDATE usuarios SET ');

      if Nome <> '' then
        SQLBuilder.Append('nome = :nome, ');
      if Senha <> '' then
        SQLBuilder.Append('senha = MD5(:senha), ');
      SQLBuilder.Append('ativo = :ativo ');

      SQLBuilder.Append('WHERE codigo = :codigo');

      fdQueryUsuarios.Connection := GerenciadorConexao.fdConn;
      fdQueryUsuarios.SQL.Text := SQLBuilder.ToString;

      if Nome <> '' then
        fdQueryUsuarios.Params.ParamByName('nome').AsString := Nome;
      if Senha <> '' then
        fdQueryUsuarios.Params.ParamByName('senha').AsString := Senha;
      fdQueryUsuarios.Params.ParamByName('ativo').AsBoolean := Ativo;
      fdQueryUsuarios.Params.ParamByName('codigo').AsInteger := Codigo;

      fdQueryUsuarios.ExecSQL;
      Result := True;
    except
      on E: Exception do
      begin
        MsgBox('Ocorreu um erro! Verifique os campos preenchidos e tente novamente.',
          E.Message, False, 2);
      end;
    end;
  finally
    SQLBuilder.Free;
  end;
end;

function TUsuarioDataModule.CarregarUsuario(const Login: String): TUsuario;
var
  Usuario: TUsuario;
begin
  Result := nil;

  fdQueryUsuarios.Connection := GerenciadorConexao.fdConn;
  fdQueryUsuarios.SQL.Text :=
    'SELECT codigo, nome, login, ativo, data_cadastro FROM usuarios WHERE login = :login';
  fdQueryUsuarios.ParamByName('login').AsString := Login;
  fdQueryUsuarios.Open;

  if not fdQueryUsuarios.IsEmpty then
  begin
    Usuario := TUsuario.Create;
    Usuario.Codigo := fdQueryUsuarios.FieldByName('codigo').AsInteger;
    Usuario.Nome := fdQueryUsuarios.FieldByName('nome').AsString;
    Usuario.Login := fdQueryUsuarios.FieldByName('login').AsString;
    Usuario.Ativo := fdQueryUsuarios.FieldByName('ativo').AsBoolean;
    Usuario.DataCadastro := fdQueryUsuarios.FieldByName('data_cadastro')
      .AsDateTime;
    Result := Usuario;
  end;
end;

function TUsuarioDataModule.VerificarCredenciais(const Login,
  Senha: String): Boolean;
begin
  fdQueryUsuarios.Connection := GerenciadorConexao.fdConn;
  fdQueryUsuarios.SQL.Text :=
    'SELECT 1 FROM public.usuarios WHERE login = :login AND senha = MD5(:senha) AND ativo IS TRUE';
  fdQueryUsuarios.ParamByName('login').AsString := Login;
  fdQueryUsuarios.ParamByName('senha').AsString := Senha;
  fdQueryUsuarios.Open;

  Result := not fdQueryUsuarios.IsEmpty;

  if Result then
    FUsuarioLogado := CarregarUsuario(Login);
end;

procedure TUsuarioDataModule.BuscarUsuario(const CriterioIndex: Integer;
  const Valor: Variant);
begin
  if VarIsNull(Valor) or (Trim(VarToStr(Valor)) = '') then
    raise Exception.Create('Informe um valor válido para a pesquisa.');

  fdQueryUsuarios.Connection := GerenciadorConexao.fdConn;
  fdQueryUsuarios.SQL.Text := 'SELECT * FROM public.vusuarios WHERE ';

  case CriterioIndex of
    0:
      begin
        fdQueryUsuarios.SQL.Add('codigo = :Valor');
        fdQueryUsuarios.ParamByName('Valor').Value :=
          StrToIntDef(VarToStr(Valor), 0);
      end;
    1:
      begin
        fdQueryUsuarios.SQL.Add('nome ILIKE :Valor');
        fdQueryUsuarios.ParamByName('Valor').AsString :=
          '%' + VarToStr(Valor) + '%';
      end;
    2:
      begin
        fdQueryUsuarios.SQL.Add('login ILIKE :Valor');
        fdQueryUsuarios.ParamByName('Valor').AsString :=
          '%' + VarToStr(Valor) + '%';
      end;
  else
    raise Exception.Create('Critério de pesquisa inválido.');
  end;

  try
    fdQueryUsuarios.Open;

    if fdQueryUsuarios.IsEmpty then
      raise Exception.Create
        ('Nenhum usuário encontrado com o critério informado.');
  except
    on E: Exception do
      raise Exception.CreateFmt('Erro ao buscar usuário: %s', [E.Message]);
  end;
end;

end.
