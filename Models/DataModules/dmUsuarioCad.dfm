object UsuarioCad_DataModule: TUsuarioCad_DataModule
  Height = 296
  Width = 322
  object fdqryUsuarioCad: TFDQuery
    ActiveStoredUsage = [auRunTime]
    Active = True
    Connection = GerenciadorConexao.fdConn
    Transaction = fdTransaction
    UpdateTransaction = fdTransaction
    SQL.Strings = (
      'select * from usuarios')
    Left = 96
    Top = 144
    object wdstrngfldUsuarioCadnome: TWideStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 100
    end
    object intgrfldUsuarioCadcodigo: TIntegerField
      FieldName = 'codigo'
      Origin = 'codigo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object wdstrngfldUsuarioCadlogin: TWideStringField
      FieldName = 'login'
      Origin = '"login"'
      Size = 100
    end
    object fldUsuarioCadsenha: TWideMemoField
      FieldName = 'senha'
      Origin = 'senha'
      BlobType = ftWideMemo
    end
    object blnfldUsuarioCadativo: TBooleanField
      FieldName = 'ativo'
      Origin = 'ativo'
    end
    object dtfldUsuarioCaddata_cadastro: TDateField
      FieldName = 'data_cadastro'
      Origin = 'data_cadastro'
    end
  end
  object fdTransaction: TFDTransaction
    Connection = GerenciadorConexao.fdConn
    Left = 216
    Top = 152
  end
end
