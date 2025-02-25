unit iUsuario;

interface

uses
  System.SysUtils, Usuario, System.Variants, Data.DB;

type
  IUsuarioRepository = interface

    function Inserir(const Codigo: Integer; Nome, Login, Senha: String;
      Ativo: Boolean): Boolean;
    function Editar(const Codigo: Integer; const Nome: String; Ativo: Boolean): Boolean;
    function CarregarUsuario(const Login: String): TUsuario;
    function VerificarCredenciais(const Login, Senha: String): Boolean;
    procedure BuscarUsuario(const CriterioIndex: Integer; const Valor: Variant;
      ADataSet: TDataSet);
    procedure ListarTodos(ADataSet: TDataSet);
    function EditarSenha(const Codigo: Integer; Senha: String): Boolean;
  end;

implementation

end.
