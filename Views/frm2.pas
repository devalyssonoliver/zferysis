  unit frm2;

  interface

  uses
    Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
    System.Classes, Vcl.Graphics,
    Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dmGerenciadorConexao, Vcl.StdCtrls,
    Vcl.ExtCtrls,
    uArquivoIni, frmUsuarioCad, frmLocalizacaoUsuario, System.ImageList,
    Vcl.ImgList, Vcl.ToolWin, Vcl.ActnMan, Vcl.ActnCtrls,
    Vcl.Ribbon, System.Actions, Vcl.ActnList, Vcl.RibbonSilverStyleActnCtrls,
    Vcl.Buttons, frmConfigurarBanco, frmLogin,  frmColaboradorLoc, frmSetorLoc;

  type
    TFrm_Principal = class(TForm)
      Ribbon1: TRibbon;
      actionManager: TActionManager;
      RibbonPage1: TRibbonPage;
      RibbonGroup1: TRibbonGroup;
      ImageList: TImageList;
      sbtnFormUser: TSpeedButton;
      sbtnFormColaborador: TSpeedButton;
    btnFormSetor: TSpeedButton;
      procedure sbtnFormUserClick(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure sbtnFormColaboradorClick(Sender: TObject);
      procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnFormSetorClick(Sender: TObject);


    private
      { Private declarations }
    public
      { Public declarations }
    end;

  var
    Frm_Principal: TFrm_Principal;

  implementation

  {$R *.dfm}

procedure TFrm_Principal.btnFormSetorClick(Sender: TObject);
begin
    Application.CreateForm(TFrm_Setor_Loc, Frm_Setor_Loc);
    Frm_Setor_Loc.Show;
end;

procedure TFrm_Principal.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    Application.Terminate;
  end;

  procedure TFrm_Principal.FormKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
  begin
    Application.CreateForm(TFrm_Login, Frm_Login);
   if Key = VK_F12 then
    if Frm_Login.ShowModal = mrOk then
    begin
      FreeAndNil(Frm_Login);
    end
    else
      Application.Terminate;

   end;

  procedure TFrm_Principal.sbtnFormColaboradorClick(Sender: TObject);
  begin
    Application.CreateForm(TFrm_Colaborador_Loc, FFrm_Colaborador_Loc);
    FFrm_Colaborador_Loc.Show;
  end;

  procedure TFrm_Principal.sbtnFormUserClick(Sender: TObject);
  begin
    Application.CreateForm(TForm_Loc_Usuarios, Form_Loc_Usuarios);
    Form_Loc_Usuarios.Show;
  end;

  end.
