object SetoCadDataModule: TSetoCadDataModule
  OnCreate = DataModuleCreate
  Height = 316
  Width = 459
  object fdqrySetorCad: TFDQuery
    Connection = GerenciadorConexao.fdConn
    SQL.Strings = (
      'select * from setores ')
    Left = 216
    Top = 144
    object intgrfldSetorCadcodigo: TIntegerField
      FieldName = 'codigo'
      Origin = 'codigo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object wdstrngfldSetorCaddescricao: TWideStringField
      FieldName = 'descricao'
      Origin = 'descricao'
      Size = 150
    end
    object blnfldSetorCadativo: TBooleanField
      FieldName = 'ativo'
      Origin = 'ativo'
    end
    object dtfldSetorCaddata_cadastro: TDateField
      FieldName = 'data_cadastro'
      Origin = 'data_cadastro'
    end
  end
  object fdTransaction: TFDTransaction
    Connection = GerenciadorConexao.fdConn
    Left = 344
    Top = 40
  end
end
