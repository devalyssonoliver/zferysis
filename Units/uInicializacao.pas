unit uInicializacao;

interface

uses uArquivoIni, Vcl.Forms, frmConfigurarBanco, System.SysUtils, Controls;

procedure ChamarTelaDeConfigBanco;

implementation


procedure ChamarTelaDeConfigBanco;
begin
    Application.CreateForm(TFrmConfigBanco, FrmConfigBanco);
    FrmConfigBanco.ShowModal;

end;

end.
