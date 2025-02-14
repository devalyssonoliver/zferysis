unit dmSetorCad;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, dmGerenciadorConexao;

type
  TSetoCadrDataModule = class(TDataModule)
    fdqrySetorCad: TFDQuery;
    fdTransaction: TFDTransaction;
    intgrfldSetorCadcodigo: TIntegerField;
    wdstrngfldSetorCaddescricao: TWideStringField;
    blnfldSetorCadativo: TBooleanField;
    dtfldSetorCaddata_cadastro: TDateField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Salvar;
    procedure Editar;
    procedure CarregarSetor(_Codigo : Integer);
    procedure Inserir;
    procedure Cancelar;
  end;

var
  SetoCadrDataModule: TSetoCadrDataModule;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDataModule1 }

procedure TSetoCadrDataModule.Cancelar;
begin
  if (fdqrySetorCad.state in [dsEdit, dsInsert]) then
  begin
    fdqrySetorCad.Cancel;
    fdTransaction.RollbackRetaining;
  end;

end;

procedure TSetoCadrDataModule.CarregarSetor(_Codigo: Integer);
begin
  with fdqrySetorCad do
  begin
    Close;
    fdqrySetorCad.SQL.Add('where codigo = :codigo;');
    fdqrySetorCad.ParamByName('codigo').AsInteger := _Codigo;
    fdqrySetorCad.Open;
  end;
end;

procedure TSetoCadrDataModule.DataModuleCreate(Sender: TObject);
begin
  fdqrySetorCad.Connection := GerenciadorConexao.fdConn;
  fdqrySetorCad.Open;
end;

procedure TSetoCadrDataModule.Editar;
begin

end;

procedure TSetoCadrDataModule.Inserir;
begin
   if not (fdqrySetorCad.State in [dsInsert, dsEdit]) then
   begin
    fdTransaction.StartTransaction;
     fdqrySetorCad.Insert;
   end;

end;

procedure TSetoCadrDataModule.Salvar;
begin
    if (fdqrySetorCad.State in [dsInsert, dsEdit]) then
    begin
      fdqrySetorCad.Post;
      fdTransaction.CommitRetaining;
    end;
end;

end.
