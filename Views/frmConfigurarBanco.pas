unit frmConfigurarBanco;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls,
  Vcl.ButtonStylesAttributes, Vcl.StyledButton, Vcl.StdCtrls, Vcl.Mask,
  Vcl.Imaging.pngimage, uArquivoIni, uFuncoes, Conexao;

type
  TFrmConfigBanco = class(TForm)
    pnlTopDetail: TPanel;
    Panel1: TPanel;
    Label1: TLabel;
    pnlImgServidor: TPanel;
    imgServidor: TImage;
    edtBase: TLabeledEdit;
    edtServidor: TLabeledEdit;
    btnSalvar: TStyledButton;
    btnCancelar: TStyledButton;
    edtPorta: TLabeledEdit;
    procedure btnSalvarClick(Sender: TObject);
    function CampoVazio(const Campo: TLabeledEdit): Boolean;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConfigBanco: TFrmConfigBanco;

implementation

{$R *.dfm}

function TFrmConfigBanco.CampoVazio(const Campo: TLabeledEdit): Boolean;
begin
  Result := Campo.Text = '';
end;

procedure TFrmConfigBanco.btnSalvarClick(Sender: TObject);
begin

  if CampoVazio(edtBase) or CampoVazio(edtServidor) or CampoVazio(edtPorta) then
  begin
    ShowMessage('Todos os campos devem ser preenchidos.');
    Exit;
  end;

  try
    EscreverArquivoIni(edtBase.Text, edtServidor.Text, edtPorta.Text);

    GerenciarCamposTLabelEdit([edtBase, edtServidor, edtPorta], False);
    ShowMessage('Configuração salva com sucesso.');


  except
    on E: Exception do
    begin
      ShowMessage('Erro ao salvar configuração: ' + E.Message);
    end;
  end;
end;

end.
