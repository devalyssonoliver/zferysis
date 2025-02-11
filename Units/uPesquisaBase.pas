unit uPesquisaBase;

interface

uses
  System.SysUtils, FireDAC.Comp.Client, Data.DB, Firedac.Stan.Param;

type
  TTipoPesquisa = (tpExato, tpComecaCom, tpContem, tpTerminaCom);

  TPesquisaHelper = class
  public
    class procedure Pesquisar(AQuery: TFDQuery; const ATabela, ACampo, AValor: string; TipoPesquisa: TTipoPesquisa = tpContem); static;
  end;

implementation

{ TPesquisaHelper }

class procedure TPesquisaHelper.Pesquisar(AQuery: TFDQuery; const ATabela, ACampo, AValor: string; TipoPesquisa: TTipoPesquisa);
var
  Parametro: string;
begin
  if not Assigned(AQuery) then
    Exit;

  case TipoPesquisa of
    tpExato:       Parametro := AValor;
    tpComecaCom:   Parametro := AValor + '%';
    tpContem:      Parametro := '%' + AValor + '%';
    tpTerminaCom:  Parametro := '%' + AValor;
  end;

  with AQuery do
  begin
    Close;
    SQL.Text := Format('SELECT * FROM %s WHERE %s ILIKE :Valor', [ATabela, ACampo]);
    ParamByName('Valor').AsString := Parametro;
    Open;
  end;
end;

end.

