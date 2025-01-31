unit iColaboradorRepositorio;

interface

uses
  System.SysUtils, iColaborador, Colaborador, FireDAC.Comp.Client,
  FireDAC.Comp.DataSet, FireDAC.Stan.Param, dmGerenciadorConexao, Data.DB,
  System.Variants, uFuncoes, Vcl.Dialogs;

type
  TColaboradorRepository = class(TInterfacedObject, IColaboradorRepository)
  public
    function Inserir(const Codigo, CodSetor: Integer; Nome, Matricula: String;
      DataContrato, PeriodoAquisitivo, PeriodoConcessivo: TDate;
      Ativo: Boolean): Boolean;
    function Editar(const Codigo, CodSetor: Integer; Nome, Matricula: String;
      DataContrato, PeriodoAquisitivo, PeriodoConcessivo: TDate;
      Ativo: Boolean): Boolean;
    function Deletar(const Codigo: Integer): Boolean;
    function CarregarColaborador(const Codigo: Integer): TColaborador;
    procedure BuscarColaborador(const CriterioIndex: Integer;
      const Valor: Variant; ADataSet: TDataSet);
    procedure ListarTodos(ADataSet: TDataSet);

  const
    CRITERIO_CODIGO = 0;
    CRITERIO_NOME = 1;
    CRITERIO_MATRICULA = 2;
  end;

implementation

{ TColaboradorRepository }

function TColaboradorRepository.Inserir(const Codigo, CodSetor: Integer;
  Nome, Matricula: String; DataContrato, PeriodoAquisitivo, PeriodoConcessivo
  : TDate; Ativo: Boolean): Boolean;
var
  Query: TFDQuery;
begin
  Result := False;
  Query := TFDQuery.Create(nil);
  try
    Query.Connection := GerenciadorConexao.fdConn;
    Query.SQL.Text :=
      'INSERT INTO colaboradores (codigo, nome, matricula, codigo_setor, data_contrato, periodo_aquisitivo, periodo_concessivo, ativo) '
      + 'VALUES (:codigo, :nome, :matricula, :codigo_setor, :data_contrato, :periodo_aquisitivo, :periodo_concessivo, :ativo)';
    Query.Params.ParamByName('codigo').AsInteger := Codigo;
    Query.Params.ParamByName('nome').AsString := Nome;
    Query.Params.ParamByName('matricula').AsString := Matricula;
    Query.Params.ParamByName('codigo_setor').AsInteger := CodSetor;
    Query.Params.ParamByName('data_contrato').AsDate := DataContrato;
    Query.Params.ParamByName('periodo_aquisitivo').AsDate := PeriodoAquisitivo;
    Query.Params.ParamByName('periodo_concessivo').AsDate := PeriodoConcessivo;
    Query.Params.ParamByName('ativo').AsBoolean := Ativo;
    Query.ExecSQL;
    Result := True;
  except
    on E: Exception do
      MsgBox('Erro ao inserir colaborador.', E.Message + sLineBreak + 'SQL: ' +
        Query.SQL.Text, False, 2);
  end;
  Query.Free;
end;

function TColaboradorRepository.Editar(const Codigo, CodSetor: Integer;
  Nome, Matricula: String; DataContrato, PeriodoAquisitivo, PeriodoConcessivo
  : TDate; Ativo: Boolean): Boolean;
var
  Query: TFDQuery;
begin
  Result := False;
  Query := TFDQuery.Create(nil);
  try
    Query.Connection := GerenciadorConexao.fdConn;
    Query.SQL.Text :=
      'UPDATE colaboradores SET nome=:nome, matricula=:matricula, codigo_setor=:codigo_setor, '
      + 'data_contrato=:data_contrato, periodo_aquisitivo=:periodo_aquisitivo, periodo_concessivo=:periodo_concessivo, ativo=:ativo '
      + 'WHERE codigo=:codigo';
    Query.Params.ParamByName('codigo').AsInteger := Codigo;
    Query.Params.ParamByName('nome').AsString := Nome;
    Query.Params.ParamByName('matricula').AsString := Matricula;
    Query.Params.ParamByName('codigo_setor').AsInteger := CodSetor;
    Query.Params.ParamByName('data_contrato').AsDate := DataContrato;
    Query.Params.ParamByName('periodo_aquisitivo').AsDate := PeriodoAquisitivo;
    Query.Params.ParamByName('periodo_concessivo').AsDate := PeriodoConcessivo;
    Query.Params.ParamByName('ativo').AsBoolean := Ativo;
    Query.ExecSQL;
    Result := True;
  except
    on E: Exception do
      MsgBox('Erro ao editar colaborador.', E.Message + sLineBreak + 'SQL: ' +
        Query.SQL.Text, False, 2);
  end;
  Query.Free;
end;

function TColaboradorRepository.CarregarColaborador(const Codigo: Integer)
  : TColaborador;
var
  Query: TFDQuery;
  Colaborador: TColaborador;
begin
  Result := nil;
  Query := TFDQuery.Create(nil);
  try
    Query.Connection := GerenciadorConexao.fdConn;
    Query.SQL.Text :=
      'SELECT codigo, nome, matricula, codigo_setor, data_contrato, periodo_aquisitivo, periodo_concessivo, data_cadastro FROM colaboradores WHERE codigo = :codigo;';
    Query.Params.ParamByName('codigo').AsInteger := Codigo;
    Query.Open;

    if not Query.IsEmpty then
    begin
      Colaborador := TColaborador.Create;
      Colaborador.Codigo := Query.Params.ParamByName('codigo').AsInteger;
      Colaborador.Nome := Query.Params.ParamByName('nome').AsString;
      Colaborador.Matricula := Query.Params.ParamByName('matricula').AsString;
      Colaborador.CodSetor := Query.Params.ParamByName('codigo_setor')
        .AsInteger;
      Colaborador.DataContrato := Query.Params.ParamByName
        ('data_contrato').AsDate;
      Colaborador.DataCadastro := Query.Params.ParamByName
        ('data_cadastro').AsDate;
      Colaborador.PeriodoAquisitivo := Query.Params.ParamByName
        ('periodo_aquisitivo').AsDate;
      Colaborador.PeriodoConsessivo := Query.Params.ParamByName
        ('periodo_concessivo').AsDate;
      Result := Colaborador;
      Result := Colaborador;
    end;
  except
    on E: Exception do
      MsgBox('Erro ao carregar colaborador.', E.Message, False, 2);
  end;
  Query.Free;
end;

function TColaboradorRepository.Deletar(const Codigo: Integer): Boolean;
var
  Query: TFDQuery;
begin
  Result := False;
  Query := TFDQuery.Create(nil);
  try
    Query.Connection := GerenciadorConexao.fdConn;
    Query.SQL.Text := 'DELETE FROM colaboradores WHERE codigo = :codigo';
    Query.Params.ParamByName('codigo').AsInteger := Codigo;
    Query.ExecSQL;
    Result := True;
  except
    on E: Exception do
      MsgBox('Erro ao excluir colaborador.', E.Message, False, 2);
  end;
  Query.Free;
end;

procedure TColaboradorRepository.ListarTodos(ADataSet: TDataSet);
begin
  if ADataSet is TFDQuery then
  begin
    TFDQuery(ADataSet).Connection := GerenciadorConexao.fdConn;
    TFDQuery(ADataSet).SQL.Text := 'SELECT * FROM vcolaboradores';
    TFDQuery(ADataSet).Open;
  end;
end;

procedure TColaboradorRepository.BuscarColaborador(const CriterioIndex: Integer;
  const Valor: Variant; ADataSet: TDataSet);
begin
  if VarIsNull(Valor) or (Trim(VarToStr(Valor)) = '') then
    raise Exception.Create('Informe um valor válido para a pesquisa.');

  if ADataSet is TFDQuery then
  begin
    try
      TFDQuery(ADataSet).Connection := GerenciadorConexao.fdConn;
      TFDQuery(ADataSet).SQL.Text := 'SELECT * FROM vcolaboradores WHERE ';

      case CriterioIndex of
        CRITERIO_CODIGO:
          begin
            TFDQuery(ADataSet).SQL.Add('codigo = :Valor');
            TFDQuery(ADataSet).ParamByName('Valor').AsInteger :=
              StrToIntDef(VarToStr(Valor), 0);
          end;
        CRITERIO_NOME:
          begin
            TFDQuery(ADataSet).SQL.Add('nome ILIKE :Valor');
            TFDQuery(ADataSet).ParamByName('Valor').AsString :=
              '%' + VarToStr(Valor) + '%';
          end;
        CRITERIO_MATRICULA:
          begin
            TFDQuery(ADataSet).SQL.Add('matricula ILIKE :Valor');
            TFDQuery(ADataSet).ParamByName('Valor').AsString :=
              '%' + VarToStr(Valor) + '%';
          end;
      else
        raise Exception.Create('Critério de pesquisa inválido.');
      end;

      TFDQuery(ADataSet).Open;
    except
      on E: Exception do
        MsgBox('Erro ao buscar colaborador.', E.Message, False, 2);
    end;
  end;
end;

end.
