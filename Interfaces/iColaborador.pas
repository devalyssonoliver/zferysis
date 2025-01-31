unit iColaborador;

interface

uses
  System.SysUtils, System.DateUtils, Colaborador, Data.DB;

type
  IColaboradorRepository = interface
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

  end;

implementation

end.
