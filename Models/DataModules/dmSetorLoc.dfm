object SetorLoc_DataModule: TSetorLoc_DataModule
  Height = 393
  Width = 462
  object fdqrySetorLoc: TFDQuery
    Connection = GerenciadorConexao.fdConn
    SQL.Strings = (
      'select * from setores')
    Left = 128
    Top = 272
    object intgrfldSetorLoccodigo: TIntegerField
      FieldName = 'codigo'
      Origin = 'codigo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object wdstrngfldSetorLocdescricao: TWideStringField
      FieldName = 'descricao'
      Origin = 'descricao'
      Size = 150
    end
    object blnfldSetorLocativo: TBooleanField
      FieldName = 'ativo'
      Origin = 'ativo'
    end
    object dtfldSetorLocdata_cadastro: TDateField
      FieldName = 'data_cadastro'
      Origin = 'data_cadastro'
    end
  end
end
