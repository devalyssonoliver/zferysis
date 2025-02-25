unit dmUsuario;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Comp.Client, Usuario,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, IUsuario, UsuarioRepositorio,
  FireDAC.Stan.Error, frxSmartMemo, frxClass, frxDBSet, frCoreClasses;

type
  TUsuarioDataModule = class(TDataModule)
    fdQueryUsuarios: TFDQuery;
    dsUsuarios: TDataSource;
    frxUsuarios: TfrxReport;
    fdqUsuariosRelatorio: TFDQuery;
    dsUsuariosRelatorio: TDataSource;
    fdqUsuariosRelatoriocodigo: TIntegerField;
    fdqUsuariosRelatorionome: TWideStringField;
    fdqUsuariosRelatoriologin: TWideStringField;
    fdqUsuariosRelatoriodata_cadastro: TDateField;
    fdqUsuariosRelatorioativo: TBooleanField;
    frxDBUsuarios: TfrxDBDataset;
  private
    FUsuarioRepository: IUsuarioRepository;
  public
    constructor Create(AOwner: TComponent); override;
    function Inserir(const Codigo: Integer; Nome, Login, Senha: String;
      Ativo: Boolean): Boolean;
    function Editar(const Codigo: Integer; const Nome: String;
      Ativo: Boolean): Boolean;
    function CarregarUsuario(const Login: String): TUsuario;
    function VerificarCredenciais(const Login, Senha: String): Boolean;
    procedure BuscarUsuario(const CriterioIndex: Integer; const Valor: Variant);
    procedure ListarTodos;
    function EditarSenha(const Codigo: Integer; Senha: String): Boolean;
  end;

var
  UsuarioDataModule: TUsuarioDataModule;

implementation

{$R *.dfm}

constructor TUsuarioDataModule.Create(AOwner: TComponent);
begin
  inherited;
  FUsuarioRepository := TUsuarioRepository.Create;
end;

function TUsuarioDataModule.Inserir(const Codigo: Integer;
  Nome, Login, Senha: String; Ativo: Boolean): Boolean;
begin
  Result := FUsuarioRepository.Inserir(Codigo, Nome, Login, Senha, Ativo);
end;

function TUsuarioDataModule.Editar(const Codigo: Integer; const Nome: String;
  Ativo: Boolean): Boolean;
begin
  Result := FUsuarioRepository.Editar(Codigo, Nome, Ativo);
end;

function TUsuarioDataModule.EditarSenha(const Codigo: Integer;
  Senha: String): Boolean;
begin
  Result := FUsuarioRepository.EditarSenha(Codigo, Senha);
end;

function TUsuarioDataModule.CarregarUsuario(const Login: String): TUsuario;
begin
  Result := FUsuarioRepository.CarregarUsuario(Login);
end;

function TUsuarioDataModule.VerificarCredenciais(const Login,
  Senha: String): Boolean;
begin
  Result := FUsuarioRepository.VerificarCredenciais(Login, Senha);
end;

procedure TUsuarioDataModule.BuscarUsuario(const CriterioIndex: Integer;
  const Valor: Variant);
begin
  FUsuarioRepository.BuscarUsuario(CriterioIndex, Valor, fdQueryUsuarios);
end;

procedure TUsuarioDataModule.ListarTodos;
begin
  FUsuarioRepository.ListarTodos(fdQueryUsuarios);
  dsUsuarios.DataSet := fdQueryUsuarios;
end;

end.
