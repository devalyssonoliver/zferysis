unit Colaborador;

interface

uses
  System.SysUtils;

type
  TColaborador = class
  private
    FCodigo       : Integer;
    FNome         : String;
    FMatricula    : String;
    FDataContrato : TDate;
    FDataCadastro : TDate;
    FAtivo        : Boolean;
  public
    property Codigo       : Integer read FCodigo       write FCodigo;
    property Matricula    : String  read FMatricula    write FMatricula;
    property Nome         : String  read FNome         write FNome;
    property DataContrato : TDate   read FDataContrato write FDataContrato;
    property Ativo        : Boolean read FAtivo        write FAtivo;
    property DataCadastro : TDate   read FDataCadastro write FDataCadastro;

  end;

implementation

end.
