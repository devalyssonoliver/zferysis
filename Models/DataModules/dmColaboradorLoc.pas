unit dmColaboradorLoc;

interface

uses
  System.SysUtils, System.Classes, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, System.Variants;

type
  TTipoPesquisa = (tpCodigo, tpNome, tpMatricula, tpSetor);
  TColaboradorLocDataModule = class(TDataModule)
    fdqryColaboradorLoc: TFDQuery;
    fldColaboradorLoccodigo: TIntegerField;
    wdstrngfldColaboradorLocnome: TWideStringField;
    wdstrngfldColaboradorLocmatricula: TWideStringField;
    fldColaboradorLoccodigo_setor: TIntegerField;
    dtfldColaboradorLocdata_contrato: TDateField;
    dtfldColaboradorLocperiodo_aquisitivo: TDateField;
    dtfldColaboradorLocperiodo_concessivo: TDateField;
    dtfldColaboradorLocdata_cadastro: TDateField;
    blnfldColaboradorLocativo: TBooleanField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Buscar(const CriterioIndex: Integer; const Valor: Variant);
    procedure ListarTodos;
  end;

var
  ColaboradorLocDataModule: TColaboradorLocDataModule;

implementation

uses
  dmGerenciadorConexao;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

const
  CRITERIO_CODIGO = 0;
  CRITERIO_NOME = 1;
  CRITERIO_MATRICULA = 2;
  CRITERIO_SETOR = 3;

{ TColaboradorLocDataModule }

procedure TColaboradorLocDataModule.Buscar(const CriterioIndex: Integer; const Valor: Variant);
begin
  try
    fdqryColaboradorLoc.SQL.Text := 'SELECT * FROM colaboradores WHERE ';

    case CriterioIndex of
      CRITERIO_CODIGO:
        begin
          fdqryColaboradorLoc.SQL.Add('codigo = :Valor');
          fdqryColaboradorLoc.ParamByName('Valor').Value := StrToIntDef(VarToStr(Valor), 0);
        end;
      CRITERIO_NOME:
        begin
          fdqryColaboradorLoc.SQL.Add('nome ILIKE :Valor');
          fdqryColaboradorLoc.ParamByName('Valor').AsString := '%' + VarToStr(Valor) + '%';
        end;
      CRITERIO_MATRICULA:
        begin
          fdqryColaboradorLoc.SQL.Add('matricula ILIKE :Valor');
          fdqryColaboradorLoc.ParamByName('Valor').AsString := '%' + VarToStr(Valor) + '%';
        end;
      CRITERIO_SETOR:
      begin
        fdqryColaboradorLoc.SQL.Add('codigo_setor = :Valor');
        fdqryColaboradorLoc.ParamByName('Valor').Value := StrToIntDef(VarToStr(Valor), 0);
      end;
    end;
    fdqryColaboradorLoc.SQL.Add('LIMIT 50');
    fdqryColaboradorLoc.Open;
  finally
  end;
end;

procedure TColaboradorLocDataModule.DataModuleCreate(Sender: TObject);
begin
  fdqryColaboradorLoc.Connection  := GerenciadorConexao.fdConn;
end;

procedure TColaboradorLocDataModule.ListarTodos;
var
  listarTodosSQL : String;
begin
  fdqryColaboradorLoc.Close;
  listarTodosSQL := 'SELECT * FROM colaboradores;';
  fdqryColaboradorLoc.Open(listarTodosSQL);
end;

end.

