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
    fdTransaction: TFDTransaction;
    procedure DataModuleCreate(Sender: TObject);

  public
    procedure Novo;
    procedure Salvar;
    procedure Editar;
    procedure Cancelar;
    procedure Carregar(_Codigo : Integer);


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
 if not (fdqryColaborador.State in [dsEdit, dsInsert]) then
 begin
    fdTransaction.StartTransaction;
    fdqryColaborador.Insert
 end;
end;

procedure TColaboradorDataModule.Salvar;
begin
  if fdqryColaborador.State in [dsEdit, dsInsert] then
  begin
     fdqryColaborador.Post;
     fdTransaction.CommitRetaining;
  end;
end;

procedure TColaboradorDataModule.Cancelar;
begin
   if (fdqryColaborador.State in [dsEdit, dsInsert]) then
  begin
    fdqryColaborador.Cancel;
    fdTransaction.RollbackRetaining;
  end;
end;

procedure TColaboradorDataModule.Carregar(_Codigo : Integer);
begin
  with fdqryColaborador do
  begin
    Close;
    fdqryColaborador.SQL.Add('where codigo = :codigo');
    fdqryColaborador.ParamByName('codigo').AsInteger := _Codigo;
    Open;
  end;
end;

procedure TColaboradorDataModule.DataModuleCreate(Sender: TObject);
begin
  fdqryColaborador.Connection := GerenciadorConexao.fdConn;
  fdqryColaborador.Open;
end;

procedure TColaboradorDataModule.Editar;
begin
   fdTransaction.StartTransaction;
   fdqryColaborador.Edit;
end;

end.

