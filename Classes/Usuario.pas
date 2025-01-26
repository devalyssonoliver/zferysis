unit Usuario;

interface

type
  TUsuario = class
  private
    FCodigo: Integer;
    FNome: String;
    FLogin: String;
    FSenha: String;
    FAtivo: Boolean;
    FDataCadastro: TDateTime;
  public
    property Codigo: Integer read FCodigo write FCodigo;
    property Nome: String read FNome write FNome;
    property Login: String read FLogin write FLogin;
    property Senha: String read FSenha write FSenha;
    property Ativo: Boolean read FAtivo write FAtivo;
    property DataCadastro : TDateTime read FDataCadastro write FDataCadastro;
  end;

implementation

end.

