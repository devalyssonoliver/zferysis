unit dmSetorLoc;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, System.Variants, dmGerenciadorConexao;

type
  TSetorLoc_DataModule = class(TDataModule)
    fdqrySetorLoc: TFDQuery;
    intgrfldSetorLoccodigo: TIntegerField;
    wdstrngfldSetorLocdescricao: TWideStringField;
    blnfldSetorLocativo: TBooleanField;
    dtfldSetorLocdata_cadastro: TDateField;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Buscar(const CriterioIndex: Integer; const Valor: Variant);
    procedure ListarTodos;
  end;

var
  SetorLoc_DataModule: TSetorLoc_DataModule;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}
const
  CRITERIO_CODIGO = 0;
  CRITERIO_NOME = 1;

{ TFrm_SetorLoc }

procedure TSetorLoc_DataModule.Buscar(const CriterioIndex: Integer;
  const Valor: Variant);
begin
try
    fdqrySetorLoc.SQL.Text := 'SELECT * FROM setores WHERE ';
    case CriterioIndex of
      CRITERIO_CODIGO:
        begin
          fdqrySetorLoc.SQL.Add('codigo = :Valor');
          fdqrySetorLoc.ParamByName('Valor').Value := StrToIntDef(VarToStr(Valor), 0);
        end;
      CRITERIO_NOME:
        begin
          fdqrySetorLoc.SQL.Add('nome ILIKE :Valor');
          fdqrySetorLoc.ParamByName('Valor').AsString := '%' + VarToStr(Valor) + '%';
        end;
    end;
    fdqrySetorLoc.SQL.Add('LIMIT 50');
    fdqrySetorLoc.Open;
    finally
end;
end;

procedure TSetorLoc_DataModule.ListarTodos;
var
  listarTodosSQL : String;
begin
  fdqrySetorLoc.Close;
  listarTodosSQL := 'SELECT * FROM setores;';
  fdqrySetorLoc.Open(listarTodosSQL);
end;

end.
