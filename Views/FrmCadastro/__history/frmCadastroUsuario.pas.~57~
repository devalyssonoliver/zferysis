unit frmCadastroUsuario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.ButtonStylesAttributes,
  Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.StyledButton,
  dmUsuario, uFuncoes;

type
  TModoFormulario = (mfNovo, mfEditar, mfExibicao);

  TFrm_Cad_Usuario = class(TForm)
    pnlTopo: TPanel;
    pnlCentro: TPanel;
    pnlBotoes: TPanel;
    btnSalvar: TStyledButton;
    btnEditar: TStyledButton;
    btnFechar: TStyledButton;
    lbTitulo: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edtCadastro: TEdit;
    Label4: TLabel;
    ckbAtivo: TCheckBox;
    edtLogin: TEdit;
    edtSenha: TEdit;
    edtNome: TEdit;
    pnlCodigo: TPanel;
    lbCodigo: TLabel;
    procedure btnSalvarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
  private
    FModoFormulario: TModoFormulario;
    procedure ConfigurarModo;
    procedure AlterarModo(Modo: TModoFormulario);
    procedure AtualizarBotoesCampos(Modo: TModoFormulario);
    procedure RealizarAcaoCadastroEdicao;
  public
    property ModoFormulario: TModoFormulario read FModoFormulario
      write AlterarModo;
  end;

var
  Frm_Cad_Usuario: TFrm_Cad_Usuario;

implementation

{$R *.dfm}

procedure TFrm_Cad_Usuario.btnEditarClick(Sender: TObject);
begin
  AlterarModo(mfEditar);
end;

procedure TFrm_Cad_Usuario.btnSalvarClick(Sender: TObject);
begin
  RealizarAcaoCadastroEdicao;
end;

procedure TFrm_Cad_Usuario.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TFrm_Cad_Usuario.ConfigurarModo;
begin
  AtualizarBotoesCampos(FModoFormulario);
end;

procedure TFrm_Cad_Usuario.AlterarModo(Modo: TModoFormulario);
begin
  FModoFormulario := Modo;
  ConfigurarModo;
end;

procedure TFrm_Cad_Usuario.AtualizarBotoesCampos(Modo: TModoFormulario);
begin
  case Modo of
    mfNovo:
      begin
        GerenciarCamposEdit([edtNome, edtSenha, edtLogin], True);
        GerenciarBotoes(btnSalvar, True);
        GerenciarBotoes(btnEditar, False);
        ckbAtivo.Enabled := True;
      end;
    mfEditar:
      begin
        GerenciarCamposEdit([edtNome, edtSenha], True);
        GerenciarBotoes(btnSalvar, True);
        GerenciarBotoes(btnEditar, False);
        ckbAtivo.Enabled := True;
      end;
    mfExibicao:
      begin
        GerenciarCamposEdit([edtLogin, edtNome, edtSenha], False);
        GerenciarBotoes(btnSalvar, False);
        GerenciarBotoes(btnEditar, True);
        ckbAtivo.Enabled := False;
      end;
  end;
end;

procedure TFrm_Cad_Usuario.RealizarAcaoCadastroEdicao;
var
  Codigo: Integer;
  Nome, Login, Senha: String;
  Ativo: Boolean;
begin
  Codigo := StrToIntDef(lbCodigo.Caption, 0);
  Nome := edtNome.Text;
  Login := edtLogin.Text;
  Senha := edtSenha.Text;
  Ativo := ckbAtivo.Checked;
  edtCadastro.Text := DateTimeToStr(Now);

  case FModoFormulario of
    mfEditar:
      begin
        if UsuarioDataModule.Editar(Codigo, Nome, Senha, Ativo) then
        begin
          MsgBox('Sucesso!', 'Dados Salvos com sucesso!', False, 3);
          AtualizarBotoesCampos(mfExibicao);
        end
        else
          MsgBox('Erro!', 'Erro ao Salvar os dados.', False, 2);
      end;
    mfNovo:
      begin
        if validarCamposObrigatorios([edtNome, edtSenha, edtLogin]) then

          if UsuarioDataModule.Inserir(0, Nome, Login, Senha, Ativo) then
          begin
            MsgBox('Sucesso!', 'Usuário cadastrado com sucesso!', False, 3);
            AtualizarBotoesCampos(mfExibicao);
          end
          else
            MsgBox('Erro!',
              'Erro ao inserir usuário, verifique os dados e tente novamente.',
              False, 2);

      end;
  end;
end;

end.
