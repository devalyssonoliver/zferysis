object Frm_Cad_Usuario: TFrm_Cad_Usuario
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Cadastro de Usu'#225'rio'
  ClientHeight = 400
  ClientWidth = 417
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesktopCenter
  PrintScale = poNone
  Scaled = False
  TextHeight = 15
  object pnlCentro: TPanel
    Left = 0
    Top = 9
    Width = 417
    Height = 391
    Align = alClient
    Color = clWhite
    ParentBackground = False
    TabOrder = 1
    object lbTitulo: TLabel
      Left = 24
      Top = 48
      Width = 377
      Height = 37
      Caption = 'Formul'#225'rio Cadastro de Usu'#225'rio'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel
      Left = 24
      Top = 125
      Width = 46
      Height = 21
      Caption = 'Nome:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 24
      Top = 181
      Width = 42
      Height = 21
      Caption = 'Login:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 24
      Top = 237
      Width = 46
      Height = 21
      Caption = 'Senha:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 198
      Top = 303
      Width = 65
      Height = 21
      Caption = 'Cadastro:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object pnlBotoes: TPanel
      Left = 1
      Top = 341
      Width = 415
      Height = 49
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 0
      object btnSalvar: TStyledButton
        Left = 8
        Top = 8
        Width = 89
        Height = 33
        Caption = '&Salvar'
        TabOrder = 0
        OnClick = btnSalvarClick
        StyleRadius = 1
        StyleFamily = 'Bootstrap'
      end
      object btnEditar: TStyledButton
        Left = 103
        Top = 8
        Width = 89
        Height = 33
        Caption = '&Editar'
        TabOrder = 1
        OnClick = btnEditarClick
        StyleRadius = 1
        StyleFamily = 'Bootstrap'
        StyleClass = 'Dark'
      end
      object btnFechar: TStyledButton
        Left = 319
        Top = 8
        Width = 89
        Height = 33
        Caption = '&Fechar'
        TabOrder = 2
        OnClick = btnFecharClick
        StyleRadius = 1
        StyleFamily = 'Bootstrap'
        StyleClass = 'Danger'
      end
    end
    object edtCadastro: TEdit
      Left = 272
      Top = 301
      Width = 121
      Height = 23
      Color = clInfoBk
      Enabled = False
      TabOrder = 1
    end
    object ckbAtivo: TCheckBox
      Left = 24
      Top = 304
      Width = 57
      Height = 17
      Caption = 'Ativo'
      Checked = True
      State = cbChecked
      TabOrder = 2
    end
    object edtNome: TEdit
      Left = 24
      Top = 152
      Width = 369
      Height = 23
      TabOrder = 3
    end
    object edtLogin: TEdit
      Left = 24
      Top = 208
      Width = 369
      Height = 23
      TabOrder = 4
    end
    object edtSenha: TEdit
      Left = 24
      Top = 264
      Width = 369
      Height = 23
      PasswordChar = '*'
      TabOrder = 5
    end
    object pnlCodigo: TPanel
      Left = 231
      Top = 1
      Width = 185
      Height = 41
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 6
      object lbCodigo: TLabel
        AlignWithMargins = True
        Left = 174
        Top = 3
        Width = 4
        Height = 35
        Margins.Right = 7
        Align = alRight
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMenuHighlight
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitHeight = 21
      end
    end
  end
  object pnlTopo: TPanel
    Left = 0
    Top = 0
    Width = 417
    Height = 9
    Align = alTop
    Color = clHighlight
    ParentBackground = False
    TabOrder = 0
  end
end
