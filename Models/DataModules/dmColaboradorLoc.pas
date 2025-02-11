unit dmColaboradorLoc;

interface

uses
  System.SysUtils, System.Classes, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

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
    procedure Buscar(const CampoPesquisa, ValorPesquisa: string; TipoPesquisa: TTipoPesquisa);
  end;

var
  ColaboradorLocDataModule: TColaboradorLocDataModule;

implementation

uses
  dmGerenciadorConexao;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

const
  CAMPO_CODIGO = 'codigo';
  CAMPO_NOME = 'nome';
  CAMPO_MATRICULA = 'matricula';
  CAMPO_SETOR = 'codigo_setor';

{ TColaboradorLocDataModule }

procedure TColaboradorLocDataModule.Buscar(const CampoPesquisa, ValorPesquisa: string; TipoPesquisa: TTipoPesquisa);
begin
  if Trim(ValorPesquisa) = '' then
  begin
    fdqryColaboradorLoc.Close;
    Exit;
  end;

  fdqryColaboradorLoc.Close;
  fdqryColaboradorLoc.SQL.Text := 'SELECT * FROM public.vcolaboradores WHERE ' + CampoPesquisa + ' = :Valor';

  case TipoPesquisa of
    tpCodigo, tpSetor:
      fdqryColaboradorLoc.ParamByName('Valor').AsInteger := StrToIntDef(ValorPesquisa, 0);
    tpNome, tpMatricula:
      fdqryColaboradorLoc.ParamByName('Valor').AsString := '%' + ValorPesquisa + '%';
  else
    raise Exception.Create('Crit�rio de pesquisa inv�lido.');
  end;

  fdqryColaboradorLoc.Open;

  if fdqryColaboradorLoc.IsEmpty then
    raise Exception.Create('Nenhum colaborador encontrado com o crit�rio informado.');
end;

procedure TColaboradorLocDataModule.DataModuleCreate(Sender: TObject);
begin
  fdqryColaboradorLoc.Open;
end;

end.

