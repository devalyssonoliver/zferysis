unit Colaborador;

interface

uses
  System.SysUtils, System.DateUtils, uiColaborador;

type
  TColaborador = class(TInterfacedObject, IColaborador)
  private
    FCodigo: Integer;
    FNome: String;
    FMatricula: String;
    FDataContrato: TDate;
    FDataCadastro: TDate;
    FAtivo: Boolean;
    FPeriodoAquisitivo: TDate;
    FPeriodoConsessivo: TDate;
    FCodSetor : Integer;

  public
    property Codigo: Integer read FCodigo write FCodigo;
    property CodSetor: Integer read FCodSetor write FCodSetor;
    property Matricula: String read FMatricula write FMatricula;
    property Nome: String read FNome write FNome;
    property DataContrato: TDate read FDataContrato write FDataContrato;
    property PeriodoAquisitivo: TDate read FPeriodoAquisitivo
      write FPeriodoAquisitivo;
    property PeriodoConsessivo: TDate read FPeriodoConsessivo
      write FPeriodoConsessivo;
    property Ativo: Boolean read FAtivo write FAtivo;
    property DataCadastro: TDate read FDataCadastro write FDataCadastro;
   procedure CalcularPeriodoAquisitivo(DataContrato, PeriodoAquisitivo : TDateTime);
   procedure CalcularPeriodoConcessivo(DataContrato, PeriodoConcessivo : TDateTime);


  end;

implementation

{ TColaborador }

{ TColaborador }

procedure TColaborador.CalcularPeriodoAquisitivo(DataContrato: TDateTime;
  PeriodoAquisitivo: TDateTime);
begin
  PeriodoAquisitivo := IncMonth(DataContrato, 12) - 1;
  FPeriodoAquisitivo := PeriodoAquisitivo;
end;
procedure TColaborador.CalcularPeriodoConcessivo(DataContrato: TDateTime;
  PeriodoConcessivo: TDateTime);
begin
  PeriodoConcessivo := IncMonth(FPeriodoAquisitivo + 1, 12) - 1;
  FPeriodoConsessivo := PeriodoConcessivo;
end;
end.
