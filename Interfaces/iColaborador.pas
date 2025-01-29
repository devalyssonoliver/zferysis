unit iColaborador;

interface

uses
  System.SysUtils, System.DateUtils, Colaborador, Data.DB;

type
  IColaboradorRepository = interface
    function Inserir(const Codigo, CodSetor: Integer; Nome, Matricula: String;
      DataContrato, DataCadastro, PeriodoAquisitivo, PeriodoConsessivo: TDate;
      Ativo: Boolean): Boolean;
    function Deletar(const Codigo: Integer): Boolean;
    function Editar(const Codigo, CodSetor: Integer; Nome, Matricula: String;
      DataContrato, PeriodoAquisitivo, PeriodoConsessivo: TDate;
      Ativo: Boolean): Boolean;
    procedure BuscarColaborador(const CriterioIndex: Integer; const Valor: Variant;
      ADataSet: TDataSet);
    procedure ListarTodos(ADataSet: TDataSet);
    function CarregarColaborador(const Codigo: Integer): TColaborador;

  end;

implementation

end.
