unit dmUsuarioLoc;

interface

uses
  System.SysUtils, System.Classes, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, System.Variants, dmGerenciadorConexao,
  Vcl.Forms, Winapi.Windows;

type
  TUsuarioLocDataModule = class(TDataModule)
    fdqryUsuarioLoc: TFDQuery;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure BuscarUsuario(const CriterioIndex: Integer; const Valor: Variant);
    procedure ListarTodos;
  end;

var
  UsuarioLocDataModule: TUsuarioLocDataModule;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

const
  CRITERIO_CODIGO = 0;
  CRITERIO_NOME = 1;
  CRITERIO_LOGIN = 2;

{ TUsuarioLocDataModule }

procedure TUsuarioLocDataModule.BuscarUsuario(const CriterioIndex: Integer; const Valor: Variant);
begin
  try
    fdqryUsuarioLoc.SQL.Text := 'SELECT * FROM usuarios WHERE ';

    case CriterioIndex of
      CRITERIO_CODIGO:
        begin
          fdqryUsuarioLoc.SQL.Add('codigo = :Valor');
          fdqryUsuarioLoc.ParamByName('Valor').Value := StrToIntDef(VarToStr(Valor), 0);
        end;
      CRITERIO_NOME:
        begin
          fdqryUsuarioLoc.SQL.Add('nome LIKE :Valor');
          fdqryUsuarioLoc.ParamByName('Valor').AsString := '%' + VarToStr(Valor) + '%';
        end;
      CRITERIO_LOGIN:
        begin
          fdqryUsuarioLoc.SQL.Add('login LIKE :Valor');
          fdqryUsuarioLoc.ParamByName('Valor').AsString := '%' + VarToStr(Valor) + '%';
        end;
    end;
    fdqryUsuarioLoc.SQL.Add('LIMIT 50');
    fdqryUsuarioLoc.Open;
  except
    on E: Exception do
      Application.MessageBox('Não foi possível consultar com o parâmetro informado',
       'ZFERYS', MB_OK + MB_ICONERROR);
  end;
end;

procedure TUsuarioLocDataModule.DataModuleCreate(Sender: TObject);
begin
  fdqryUsuarioLoc.Connection := GerenciadorConexao.fdConn;
end;

procedure TUsuarioLocDataModule.ListarTodos;
var
  listarTodosSQL: String;
begin
  fdqryUsuarioLoc.Close;
  listarTodosSQL := 'SELECT * FROM usuarios';
  fdqryUsuarioLoc.Open(listarTodosSQL);
end;

end.

