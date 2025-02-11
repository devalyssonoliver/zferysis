object ColaboradorLocDataModule: TColaboradorLocDataModule
  OnCreate = DataModuleCreate
  Height = 480
  Width = 640
  object fdqryColaboradorLoc: TFDQuery
    Active = True
    Connection = GerenciadorConexao.fdConn
    SQL.Strings = (
      'SELECT * FROM colaboradores')
    Left = 288
    Top = 256
    object fldColaboradorLoccodigo: TIntegerField
      FieldName = 'codigo'
      Origin = 'codigo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object wdstrngfldColaboradorLocnome: TWideStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 50
    end
    object wdstrngfldColaboradorLocmatricula: TWideStringField
      FieldName = 'matricula'
      Origin = 'matricula'
    end
    object fldColaboradorLoccodigo_setor: TIntegerField
      FieldName = 'codigo_setor'
      Origin = 'codigo_setor'
    end
    object dtfldColaboradorLocdata_contrato: TDateField
      FieldName = 'data_contrato'
      Origin = 'data_contrato'
    end
    object dtfldColaboradorLocperiodo_aquisitivo: TDateField
      FieldName = 'periodo_aquisitivo'
      Origin = 'periodo_aquisitivo'
    end
    object dtfldColaboradorLocperiodo_concessivo: TDateField
      FieldName = 'periodo_concessivo'
      Origin = 'periodo_concessivo'
    end
    object dtfldColaboradorLocdata_cadastro: TDateField
      FieldName = 'data_cadastro'
      Origin = 'data_cadastro'
    end
    object blnfldColaboradorLocativo: TBooleanField
      FieldName = 'ativo'
      Origin = 'ativo'
    end
  end
end
