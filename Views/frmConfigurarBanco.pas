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
    edtBase: TEdit;
    edtServidor: TEdit;
    edtPorta: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    lblPorta: TLabel;
    btnSalvar: TStyledButton;
    btnCancelar: TStyledButton;
    procedure btnSalvarClick(Sender: TObject);

    procedure btnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);

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
    EscreverArquivoIni(edtBase.Text, edtServidor.Text, edtPorta.Text);

    gerenciarCamposEdit([edtBase, edtServidor, edtPorta], False);
    MsgBox('Sucesso!', 'Reinicialize a aplicação para acessar o sistema.',
      False, 3);

  except
    on E: Exception do
    begin
      MsgBox('Erro ao salvar configuração:', E.Message, False, 2);
    end;
  end;
end;

procedure TFrmConfigBanco.FormCreate(Sender: TObject);
begin
  edtBase.SetFocus;

end;

end.
