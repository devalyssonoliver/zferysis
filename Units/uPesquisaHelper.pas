unit uPesquisaHelper;

interface

uses
  System.SysUtils, FireDAC.Comp.Client, Data.DB;

type
  TPesquisaHelper = class
  public
    class procedure Pesquisar(AQuery: TFDQuery; const ATabela, ACampo, AValor: string); static;
  end;

implementation

{ TPesquisaHelper }

class procedure TPesquisaHelper.Pesquisar(AQuery: TFDQuery; const ATabela, ACampo, AValor: string);
begin
  if not Assigned(AQuery) then
    Exit;

  with AQuery do
  begin
    Close;
    SQL.Text := Format('SELECT * FROM %s WHERE %s LIKE :Valor', [ATabela, ACampo]);
    ParamByName('Valor').AsString := '%' + AValor + '%';
    Open;
  end;
end;

end.

