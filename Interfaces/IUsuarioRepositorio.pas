unit IUsuarioRepositorio;

interface

uses
  System.SysUtils, Usuario, System.Variants, Data.DB;

type
  IUsuarioRepository = interface
    ['{5A1C4F37-F29D-4F29-8E27-A0D91F788D6C}']

    function Inserir(const Codigo: Integer; Nome, Login, Senha: String; Ativo: Boolean): Boolean;
    function Editar(const Codigo: Integer; const Nome, Senha: String; Ativo: Boolean): Boolean;
    function CarregarUsuario(const Login: String): TUsuario;
    function VerificarCredenciais(const Login, Senha: String): Boolean;
    procedure BuscarUsuario(const CriterioIndex: Integer; const Valor: Variant; ADataSet: TDataSet);
    procedure ListarTodos(ADataSet: TDataSet);
  end;

implementation

end.

