unit uThreadColaboradorDataModule;

interface

uses
  System.Classes, System.SysUtils, dmColaborador;

type
  TThreadCriarDataModuleColaborador = class(TThread)
  protected
    procedure Execute; override;
    procedure CriarDataModuleColaborador;
  end;

implementation

{ TThreadCriarDataModuleColaborador }

procedure TThreadCriarDataModuleColaborador.Execute;
begin
  Synchronize(CriarDataModuleColaborador);
end;

procedure TThreadCriarDataModuleColaborador.CriarDataModuleColaborador;
begin
  ColaboradorDataModule := TColaboradorDataModule.Create(nil);
end;

end.
