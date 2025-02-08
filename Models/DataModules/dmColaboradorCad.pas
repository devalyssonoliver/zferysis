unit dmColaboradorCad;

interface

uses
  System.SysUtils, System.Classes, Data.DB, FireDAC.Comp.Client,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet;

type
  TColaboradorDataModule = class(TDataModule)
    fdqryColaborador: TFDQuery;
    fdqryAux: TFDQuery;
    procedure DataModuleCreate(Sender: TObject);

  public
    procedure Novo;
    procedure Salvar;
    procedure Excluir;
    procedure CarregarDados(_Codigo : Integer);
    function ObterProximoCodigo: Integer;
  end;

var
  ColaboradorDataModule: TColaboradorDataModule;

implementation

uses
  dmGerenciadorConexao;

{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}

procedure TColaboradorDataModule.Novo;
begin
  fdqryColaborador.Append;
end;

procedure TColaboradorDataModule.Salvar;
begin
  if fdqryColaborador.State in [dsEdit, dsInsert] then
    fdqryColaborador.Post;
end;


procedure TColaboradorDataModule.DataModuleCreate(Sender: TObject);
begin
   fdqryColaborador.Connection := GerenciadorConexao.fdConn;

end;

procedure TColaboradorDataModule.Excluir;
begin
  if not fdqryColaborador.IsEmpty then
    fdqryColaborador.Delete;
end;

procedure TColaboradorDataModule.CarregarDados(_Codigo : Integer);
begin
  fdqryColaborador.Locate('codigo', _Codigo, []);
end;

function TColaboradorDataModule.ObterProximoCodigo: Integer;
begin
  Result := 0;
  fdqryAux.Close;
  fdqryAux.SQL.Text := 'SELECT nextval(''colaborador_codigo_seq'') AS proximo_codigo';
  fdqryAux.Open;
  if not fdqryAux.IsEmpty then
    Result := fdqryAux.FieldByName('proximo_codigo').AsInteger;
end;

end.

