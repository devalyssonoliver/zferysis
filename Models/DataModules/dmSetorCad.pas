unit dmSetorCad;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, dmGerenciadorConexao;

type
  TSetoCadDataModule = class(TDataModule)
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
    procedure Novo;
    procedure Cancelar;
  end;

var
  SetoCadDataModule: TSetoCadDataModule;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDataModule1 }

procedure TSetoCadDataModule.Cancelar;
begin
  if (fdqrySetorCad.state in [dsEdit, dsInsert]) then
  begin
    fdqrySetorCad.Cancel;
    fdTransaction.RollbackRetaining;
  end;

end;

procedure TSetoCadDataModule.CarregarSetor(_Codigo: Integer);
begin
  with fdqrySetorCad do
  begin
    Close;
    fdqrySetorCad.SQL.Add('where codigo = :codigo;');
    fdqrySetorCad.ParamByName('codigo').AsInteger := _Codigo;
    fdqrySetorCad.Open;
  end;
end;

procedure TSetoCadDataModule.DataModuleCreate(Sender: TObject);
begin
  fdqrySetorCad.Open;
end;

procedure TSetoCadDataModule.Editar;
begin
  fdqrySetorCad.Edit;
end;

procedure TSetoCadDataModule.Novo;
begin
   if not (fdqrySetorCad.State in [dsInsert, dsEdit]) then
   begin
    fdTransaction.StartTransaction;
     fdqrySetorCad.Insert;
   end;

end;

procedure TSetoCadDataModule.Salvar;
begin
    if (fdqrySetorCad.State in [dsInsert, dsEdit]) then
    begin
      fdqrySetorCad.Post;
      fdTransaction.CommitRetaining;
    end;
end;

end.
