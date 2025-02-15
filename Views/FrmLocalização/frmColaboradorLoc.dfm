object Frm_Colaborador_Loc: TFrm_Colaborador_Loc
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  ClientHeight = 619
  ClientWidth = 918
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesktopCenter
  PrintScale = poNone
  Scaled = False
  OnClose = FormClose
  OnCreate = FormCreate
  TextHeight = 15
  object pnlGrid: TPanel
    Left = 0
    Top = 0
    Width = 918
    Height = 619
    Align = alClient
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    ExplicitWidth = 914
    ExplicitHeight = 618
    object lblTitulo: TLabel
      Left = 1
      Top = 4
      Width = 916
      Height = 37
      Align = alTop
      Alignment = taCenter
      Caption = 'Localiza'#231#227'o de Colaborador'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ExplicitWidth = 331
    end
    object pnlTop: TPanel
      Left = 1
      Top = 41
      Width = 916
      Height = 56
      Align = alTop
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 1
      ExplicitWidth = 912
      object edtPesquisarNome: TEdit
        Left = 160
        Top = 21
        Width = 121
        Height = 29
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        TextHint = 'Nome'
        Visible = False
        OnExit = edtPesquisarNomeExit
      end
      object edtPesquisarMatricula: TEdit
        Left = 160
        Top = 21
        Width = 121
        Height = 29
        BevelInner = bvNone
        BevelOuter = bvNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        TextHint = 'Matr'#237'cula'
        Visible = False
        OnExit = edtPesquisarMatriculaExit
      end
      object cmbCriteriosdePesquisa: TComboBox
        Left = 9
        Top = 21
        Width = 145
        Height = 29
        BevelInner = bvNone
        BevelOuter = bvNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ImeName = 'Portuguese (Brazilian ABNT)'
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        TextHint = 'Modo de Busca'
        StyleName = 'Windows'
        OnSelect = cmbCriteriosdePesquisaSelect
        Items.Strings = (
          'C'#243'digo'
          'Nome'
          'M'#225'tricula')
      end
      object edtPesquisarCodigo: TEdit
        Left = 160
        Top = 21
        Width = 121
        Height = 29
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        NumbersOnly = True
        ParentFont = False
        TabOrder = 3
        TextHint = 'C'#243'digo'
        OnExit = edtPesquisarCodigoExit
      end
      object pnl2: TPanel
        Left = 287
        Top = 6
        Width = 50
        Height = 44
        BevelOuter = bvNone
        TabOrder = 0
        object lblTodos: TLabel
          Left = 8
          Top = 8
          Width = 31
          Height = 12
          Caption = 'TODOS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clHotLight
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object tglswtchTodos: TToggleSwitch
          Left = 0
          Top = 22
          Width = 74
          Height = 20
          FrameColor = clHotLight
          StateCaptions.CaptionOn = 'yes'
          StateCaptions.CaptionOff = 'not'
          StyleName = 'Windows'
          TabOrder = 0
          ThumbColor = clHotLight
          OnClick = tglswtchTodosClick
        end
      end
    end
    object pnlBotoes: TPanel
      Left = 1
      Top = 582
      Width = 916
      Height = 36
      Align = alBottom
      ParentBackground = False
      TabOrder = 3
      ExplicitTop = 581
      ExplicitWidth = 912
      object btnNovo: TButton
        Left = 16
        Top = 6
        Width = 75
        Height = 25
        Caption = 'Novo'
        TabOrder = 0
        OnClick = btnNovoClick
      end
      object btnExibir: TButton
        Left = 97
        Top = 6
        Width = 75
        Height = 25
        Caption = 'Exibir'
        TabOrder = 1
        OnClick = btnExibirClick
      end
      object btnFechar: TButton
        Left = 833
        Top = 6
        Width = 75
        Height = 25
        Caption = 'Fechar'
        TabOrder = 3
      end
      object btnRelatorio: TButton
        Left = 752
        Top = 6
        Width = 75
        Height = 25
        Caption = 'Relat'#243'rio'
        TabOrder = 2
      end
    end
    object dbGrid: TDBGrid
      Left = 1
      Top = 97
      Width = 916
      Height = 485
      Cursor = crArrow
      Align = alClient
      BiDiMode = bdLeftToRight
      BorderStyle = bsNone
      Color = clWhite
      Ctl3D = False
      DataSource = dsColaboradorLoc
      DefaultDrawing = False
      DragCursor = crArrow
      DrawingStyle = gdsGradient
      FixedColor = clBtnHighlight
      GradientEndColor = clGray
      GradientStartColor = clGray
      Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
      ParentBiDiMode = False
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      Touch.ParentTabletOptions = False
      Touch.TabletOptions = []
      StyleName = 'Windows'
      OnDrawColumnCell = dbGridDrawColumnCell
      OnDblClick = dbGridDblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'codigo'
          Title.Caption = 'C'#243'digo'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Segoe UI'
          Title.Font.Style = [fsBold]
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nome'
          Title.Caption = 'Nome'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Segoe UI'
          Title.Font.Style = [fsBold]
          Width = 257
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'matricula'
          Title.Caption = 'Matr'#237'cula'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Segoe UI'
          Title.Font.Style = [fsBold]
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'codigo_setor'
          Title.Caption = 'C'#243'd.Setor'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Segoe UI'
          Title.Font.Style = [fsBold]
          Width = 79
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'data_contrato'
          Title.Caption = 'Data Contrato'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Segoe UI'
          Title.Font.Style = [fsBold]
          Width = 116
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'periodo_aquisitivo'
          Title.Caption = 'Per'#237'odo Aquisitivo'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Segoe UI'
          Title.Font.Style = [fsBold]
          Width = 122
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'periodo_concessivo'
          Title.Caption = 'Per'#237'odo Concessivo'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Segoe UI'
          Title.Font.Style = [fsBold]
          Width = 136
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ativo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clHighlight
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          Title.Caption = 'Ativo'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Segoe UI'
          Title.Font.Style = [fsBold]
          Width = 42
          Visible = True
        end>
    end
    object pnlListTop: TPanel
      Left = 1
      Top = 1
      Width = 916
      Height = 3
      Align = alTop
      BevelOuter = bvNone
      Color = clHotLight
      ParentBackground = False
      TabOrder = 0
      ExplicitWidth = 912
    end
  end
  object dsColaboradorLoc: TDataSource
    DataSet = ColaboradorLocDataModule.fdqryColaboradorLoc
    Left = 520
    Top = 312
  end
  object ilListAtivo: TImageList
    ColorDepth = cd32Bit
    DrawingStyle = dsTransparent
    Height = 18
    Width = 18
    Left = 808
    Top = 27
    Bitmap = {
      494C010102000800040012001200FFFFFFFF2110FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000480000001200000001002000000000004014
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000067000000110000000000000000000000000000
      0000000000400000004C00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000061000000020000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000015D0C1953C7000002730000000000000000000000000000
      0000030719A404081EAC00000003000000000000000000000000000000000000
      00000000000000000000000000000000000002030074344D17CC010200690000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000002690F206BCF2247EFFF070F37B90000002300000000000000000000
      004E132A90DD0F2170CF0000003E000000000000000000000000000000000000
      00000000000000000000000000000101005C3C571BD17BB339FF1B280DB70000
      0014000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000043060C2AB52246EAFE2244E8FD020513A400000006000000080409
      20AF1C3AC3EF01020A9300000001000000000000000000000000000000000000
      00000000000000000000000000432C3F14C57BB339FF7AAF39FE6EA333F70508
      0292000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000024050B27B42247EFFF1936B4EA01020683010206831A36
      B9EC030618A70000000B00000000000000000000000000000000000000000000
      000000000000000000341D2A0DB77BB339FF2B3D13C5131B09B27BB339FF4463
      1FD8000100590000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000031091443BF2247EFFF102170D0102272D1070E
      32B5000000220000000000000000000000000000000000000000000000000000
      0000000000371F2E0FBC7BB339FF577F29E602040177000000534B6B23DD7BB3
      39FF1E2B0DB80000002900000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000015C122379D52247EFFF142B93DC0000
      005C000000000000000000000000000000000000000000000000000000000000
      000000000034374F19CF6B9B31F50609039500000002000000010B1005A17BB3
      39FF7BB339FF141D09B000000024000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000C040A22B62247EFFF1F44E0FA0204
      109F000000030000000000000000000000000000000000000000000000000000
      000000000003121B09B60B0F05A20000000A00000000000000000000002F2C3F
      14C67BB339FF7BAF39FE121B08AE000000230000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000001030A921D3DCDF4112379D42247EFFF1932
      A9E50001057C0000000000000000000000000000000000000000000000000000
      0000000000000000004900000008000000000000000000000000000000000304
      017F679530F17BB339FF7BAF39FE1B270CB60000004600000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000026713298DDC132A92DD000001A9132B91DC2247
      EFFF102272D10000015300000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000A101607AC7BB339FF7BB339FF7BB339FF273A12C20000004D000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000003A0B174FC42247EFFF020616A200000003030719AA2247
      EFFF2247EFFF08123DBA0000002A000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000002C243510BF7BB339FF7BB339FF253511BE00000011000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000001F070C2CB42247EFFF0E1E64CB0000003C000000000000004C1328
      85D92247EFFF08133FBA00000025000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000001010058374F19CF7BB339FF0A0E059300000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000001030C9D2244E7FD2243E6FC01040C940000000000000000000000010409
      1FAD152D9ADF0000025D00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000101005817230BB90000005900000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000022030716A8070F35BD000000240000000000000000000000000000
      016A01040EA10000000100000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000170000000400000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000030000003C000000000000000000000000000000000000
      000E000000280000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000048000000120000000100010000000000D80000000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000}
  end
end
