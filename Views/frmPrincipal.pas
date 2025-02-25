unit frmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, dxUIAClasses, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, dxRibbonCustomizationForm, dxCore,
  dxRibbonSkins, cxClasses, dxRibbon, cxTextEdit, cxContainer, cxEdit,
  dxStatusBar, dxRibbonStatusBar, cxLabel, dxGallery, dxGalleryControl,
  dxRibbonBackstageViewGalleryControl, dxRibbonBackstageView, dxBar,
  cxBarEditItem, Vcl.Buttons, Vcl.StdCtrls, dxRichEdit.Actions, System.Actions,
  Vcl.ActnList, dxActions, System.ImageList, Vcl.ImgList, cxImageList,
  dxSkinsForm, Vcl.ExtCtrls, frmUsuarioLocNew;

type
  TFrm_Principal = class(TForm)
    dxbrManagerPrincipal: TdxBarManager;
    dxBarManagerBar: TdxBar;
    dxBarManagerPrincipalBarInfoBasic: TdxBar;
    dxbrlrgbtnbtn1_FormColaboradores: TdxBarLargeButton;
    dxbrlrgbtnbtn2_FormSetores: TdxBarLargeButton;
    dxbrlrgbtnbtn3_FormUsuarios: TdxBarLargeButton;
    dxRibbonStatusBar: TdxRibbonStatusBar;
    dxSkinController: TdxSkinController;
    Timer: TTimer;
    dxRibbon: TdxRibbon;
    dxrbntbCadastros: TdxRibbonTab;
    dxbrbtnlLogoff: TdxBarButton;
    procedure dxbrlrgbtnbtn1_FormColaboradoresClick(Sender: TObject);
    procedure dxbrlrgbtnbtn2_FormSetoresClick(Sender: TObject);
    procedure dxbrlrgbtnbtn3_FormUsuariosClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_Principal: TFrm_Principal;

implementation

uses
  frmColaboradorLoc, frmSetorLoc, frmLocalizacaoUsuario;

{$R *.dfm}



procedure TFrm_Principal.dxbrlrgbtnbtn1_FormColaboradoresClick(Sender: TObject);
begin
  FFrm_Colaborador_Loc := TFrm_Colaborador_Loc.Create(Self);
  try
    FFrm_Colaborador_Loc.ShowModal;
  finally
    FFrm_Colaborador_Loc.Free;
  end;
end;

procedure TFrm_Principal.dxbrlrgbtnbtn2_FormSetoresClick(Sender: TObject);
begin
  Frm_Setor_Loc := TFrm_Setor_Loc.Create(Self);
  try
   Frm_Setor_Loc.ShowModal;
  finally
   Frm_Setor_Loc.Free;
  end;
end;

procedure TFrm_Principal.dxbrlrgbtnbtn3_FormUsuariosClick(Sender: TObject);
begin
   NewLocUser    := TNewLocUser.Create(Self);
   try
    NewLocUser.ShowModal;
   finally
    NewLocUser.Free;
   end;


{   Form_Loc_Usuarios := TForm_Loc_Usuarios.Create(Self);
   try
        Form_Loc_Usuarios.ShowModal;
           finally
                Form_Loc_Usuarios.Free;
                   end;}
end;

procedure TFrm_Principal.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   Form_Loc_Usuarios := TForm_Loc_Usuarios.Create(Self);
   if Key = VK_F12 then
    if Form_Loc_Usuarios.ShowModal = mrOk then
    begin
      FreeAndNil(Form_Loc_Usuarios);
    end
    else
      Application.Terminate;
end;

end.
