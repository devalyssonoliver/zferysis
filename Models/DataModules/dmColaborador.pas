unit dmColaborador;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, iColaborador, Colaborador,
  iColaboradorRepositorio, dmGerenciadorConexao;

type
  TColaboradorDataModule = class(TDataModule)
    fdQueryColaborador: TFDQuery;
    dsColaborador: TDataSource;
    procedure DataModuleCreate(Sender: TObject);

  private
    { Private declarations }
    FColaboradorRepository: IColaboradorRepository;
  public

    function Inserir(const Codigo, CodSetor: Integer; Nome, Matricula: String;
      DataContrato, PeriodoAquisitivo, PeriodoConsessivo: TDate;
      Ativo: Boolean): Boolean;
    function Deletar(const Codigo: Integer): Boolean;
    function Editar(const Codigo, CodSetor: Integer; Nome, Matricula: String;
      DataContrato, PeriodoAquisitivo, PeriodoConsessivo: TDate;
      Ativo: Boolean): Boolean;
    procedure BuscarColaborador(const CriterioIndex: Integer;
      const Valor: Variant);
    procedure ListarTodos;
    function CarregarColaborador(const Codigo: Integer): TColaborador;
  end;

var
  ColaboradorDataModule: TColaboradorDataModule;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}
{ TColaboradorDataModule }

procedure TColaboradorDataModule.BuscarColaborador(const CriterioIndex: Integer;
  const Valor: Variant);
begin
  FColaboradorRepository.BuscarColaborador(CriterioIndex, Valor,
    fdQueryColaborador);
end;

function TColaboradorDataModule.CarregarColaborador(const Codigo: Integer)
  : TColaborador;
begin
  Result := FColaboradorRepository.CarregarColaborador(Codigo);
end;

procedure TColaboradorDataModule.DataModuleCreate(Sender: TObject);
begin
  FColaboradorRepository := TColaboradorRepository.Create;
end;

function TColaboradorDataModule.Deletar(const Codigo: Integer): Boolean;
begin
  Result := FColaboradorRepository.Deletar(Codigo);
end;

function TColaboradorDataModule.Editar(const Codigo, CodSetor: Integer;
  Nome, Matricula: String; DataContrato, PeriodoAquisitivo, PeriodoConsessivo
  : TDate; Ativo: Boolean): Boolean;
begin

end;

function TColaboradorDataModule.Inserir(const Codigo, CodSetor: Integer;
  Nome, Matricula: String; DataContrato, PeriodoAquisitivo, PeriodoConsessivo
  : TDate; Ativo: Boolean): Boolean;
begin
  Result := FColaboradorRepository.Inserir(Codigo, CodSetor, Nome, Matricula,
    DataContrato, PeriodoAquisitivo, PeriodoConsessivo, Ativo);
end;

procedure TColaboradorDataModule.ListarTodos;
begin
  FColaboradorRepository.ListarTodos(fdQueryColaborador);
  dsColaborador.DataSet := fdQueryColaborador;
end;

end.
