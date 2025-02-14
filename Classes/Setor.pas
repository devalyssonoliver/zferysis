unit Setor;

interface

type
   TSetor = class
     private
    FDescricao: String;
    FCodigo: Integer;
    FDataCadastro: TDateTime;
     public
    property Codigo : Integer read FCodigo write FCodigo;
    property Descricao : String read FDescricao write FDescricao;
    property DataCadastro: TDateTime read FDataCadastro write FDataCadastro;
   end;

implementation

end.
