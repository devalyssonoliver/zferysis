unit frmConfigurarBanco;

interface

uses
  System.SysUtils, System.Classes, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.ExtCtrls, Vcl.StdCtrls, uArquivoIni, uFuncoes, Vcl.Imaging.pngimage;

type
  TFrmConfigBanco = class(TForm)
    pnlTopDetail: TPanel;
    Panel1: TPanel;
    Label1: TLabel;
    pnlImgServidor: TPanel;
    imgServidor: TImage;
    edtBase: TEdit;
    edtServidor: TEdit;
    edtPorta: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    lblPorta: TLabel;
    btnSalvar: TButton;
    btnCancelar: TButton;
    procedure btnSalvarClick(Sender: TObject);

    procedure btnCancelarClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConfigBanco: TFrmConfigBanco;

implementation

{$R *.dfm}

procedure TFrmConfigBanco.btnCancelarClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFrmConfigBanco.btnSalvarClick(Sender: TObject);
begin

  if not validarCamposObrigatorios([edtBase, edtServidor, edtPorta]) then
  begin
    Exit;
  end;

  try
    EscreverArquivoIni(edtServidor.Text, edtBase.Text, edtPorta.Text);

    Close;
  except
    on E: Exception do
    begin
      MsgBox('Erro ao salvar configuração:', E.Message, False, 2);
    end;
  end;
end;

end.
