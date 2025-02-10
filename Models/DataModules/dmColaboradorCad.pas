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
    fdqryColaboradorcodigo: TIntegerField;
    fdqryColaboradornome: TWideStringField;
    fdqryColaboradormatricula: TWideStringField;
    fdqryColaboradorcodigo_setor: TIntegerField;
    fdqryColaboradordata_contrato: TDateField;
    fdqryColaboradorperiodo_aquisitivo: TDateField;
    fdqryColaboradorperiodo_concessivo: TDateField;
    fdqryColaboradordata_cadastro: TDateField;
    fdqryColaboradorativo: TBooleanField;
    wdstrngfldColaboradorcpf: TWideStringField;
    procedure DataModuleCreate(Sender: TObject);

  public
    procedure Novo;
    procedure Salvar;
    procedure Editar;
    procedure Cancelar;

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
     fdqryColaborador.Post
end;

procedure TColaboradorDataModule.Cancelar;
begin
  fdqryColaborador.Cancel;
end;

procedure TColaboradorDataModule.DataModuleCreate(Sender: TObject);
begin
  fdqryColaborador.Connection := GerenciadorConexao.fdConn;
  fdqryColaborador.Open;
end;

procedure TColaboradorDataModule.Editar;
begin
    fdqryColaborador.Cancel;
end;

end.

