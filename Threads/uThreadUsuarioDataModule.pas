unit uThreadUsuarioDataModule;

interface

uses
  System.Classes, dmUsuario, dmColaborador;

type
  TThreadCriarDataModuleUsuario = class(TThread)
  protected
    procedure Execute; override;
    procedure CriarDataModuleUsuario;
  end;

implementation

var
  UsuarioDataModule: TUsuarioDataModule;

  { TThreadCriarDataModuleUsuario }

procedure TThreadCriarDataModuleUsuario.CriarDataModuleUsuario;
begin
  Synchronize(CriarDataModuleUsuario);
end;

procedure TThreadCriarDataModuleUsuario.Execute;
begin
  UsuarioDataModule := TUsuarioDataModule.Create(nil);
end;

end.
