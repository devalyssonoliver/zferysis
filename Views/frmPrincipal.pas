unit frmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dmGerenciadorConexao, Vcl.StdCtrls,
  Vcl.ExtCtrls,
  uArquivoIni, frmCadastroUsuario, frmLocalizacaoUsuario, System.ImageList,
  Vcl.ImgList, Vcl.ToolWin, Vcl.ActnMan, Vcl.ActnCtrls,
  Vcl.Ribbon, System.Actions, Vcl.ActnList, Vcl.RibbonSilverStyleActnCtrls,
  Vcl.Buttons, frmConfigurarBanco, frmLocalizacaoColaborador, frmLogin;

type
  TFrm_Principal = class(TForm)
    Ribbon1: TRibbon;
    actionManager: TActionManager;
    RibbonPage1: TRibbonPage;
    RibbonGroup1: TRibbonGroup;
    ImageList: TImageList;
    sbtnFormUser: TSpeedButton;
    sbtnFormColaborador: TSpeedButton;
    procedure sbtnFormUserClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtnFormColaboradorClick(Sender: TObject);
    procedure FormShow(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_Principal: TFrm_Principal;

implementation

{$R *.dfm}

procedure TFrm_Principal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Application.Terminate;
end;

procedure TFrm_Principal.FormShow(Sender: TObject);
begin
  Application.CreateForm(TFrm_Login, Frm_Login);

  Frm_Login.ShowModal;

end;

procedure TFrm_Principal.sbtnFormColaboradorClick(Sender: TObject);
begin
  Application.CreateForm(TForm_Loc_Colaborador, Form_Loc_Colaborador);
  Form_Loc_Colaborador.Show;
end;

procedure TFrm_Principal.sbtnFormUserClick(Sender: TObject);
begin
  Application.CreateForm(TForm_Loc_Usuarios, Form_Loc_Usuarios);
  Form_Loc_Usuarios.Show;
end;

end.
