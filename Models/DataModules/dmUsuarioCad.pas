unit dmUsuarioCad;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, dmGerenciadorConexao;

type
  TUsuarioCad_DataModule = class(TDataModule)
    fdqryUsuarioCad: TFDQuery;
    fdTransaction: TFDTransaction;
    intgrfldUsuarioCadcodigo: TIntegerField;
    wdstrngfldUsuarioCadnome: TWideStringField;
    wdstrngfldUsuarioCadlogin: TWideStringField;
    fldUsuarioCadsenha: TWideMemoField;
    blnfldUsuarioCadativo: TBooleanField;
    dtfldUsuarioCaddata_cadastro: TDateField;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Salvar;
    procedure Inserir;
    procedure Cancelar;
    procedure Editar;
  end;

var
  UsuarioCad_DataModule: TUsuarioCad_DataModule;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TUsuarioCad_DataModule }

procedure TUsuarioCad_DataModule.Cancelar;
begin
  if (fdqryUsuarioCad.state in [dsEdit, dsInsert]) then
  begin
  fdqryUsuarioCad.Cancel;
  fdTransaction.RollbackRetaining;
  end;
end;

procedure TUsuarioCad_DataModule.Editar;
begin
  fdqryUsuarioCad.Edit;
end;

procedure TUsuarioCad_DataModule.Inserir;
begin
  if not (fdqryUsuarioCad.state in [dsEdit, dsInsert]) then
  begin
  fdTransaction.StartTransaction;
  fdqryUsuarioCad.Insert;
  end

end;

procedure TUsuarioCad_DataModule.Salvar;
begin
  if (fdqryUsuarioCad.state in [dsEdit, dsInsert]) then
  begin
  fdqryUsuarioCad.Post;
  fdTransaction.CommitRetaining;
  end;
end;

end.
