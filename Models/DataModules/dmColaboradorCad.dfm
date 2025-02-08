object ColaboradorDataModule: TColaboradorDataModule
  OnCreate = DataModuleCreate
  Height = 482
  Width = 537
  object fdqryColaborador: TFDQuery
    Connection = GerenciadorConexao.fdConn
    UpdateOptions.AssignedValues = [uvEInsert, uvFetchGeneratorsPoint, uvGeneratorName]
    UpdateOptions.FetchGeneratorsPoint = gpImmediate
    UpdateOptions.GeneratorName = 'colaborador_codigo_seq'
    UpdateOptions.AutoIncFields = 'codigo'
    SQL.Strings = (
      'select * from colaboradores')
    Left = 352
    Top = 256
    object fdqryColaboradorcodigo: TIntegerField
      Alignment = taCenter
      AutoGenerateValue = arAutoInc
      FieldName = 'codigo'
      Origin = 'codigo'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object fdqryColaboradornome: TWideStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 100
    end
    object fdqryColaboradormatricula: TWideStringField
      FieldName = 'matricula'
      Origin = 'matricula'
    end
    object fdqryColaboradorcodigo_setor: TIntegerField
      FieldName = 'codigo_setor'
      Origin = 'codigo_setor'
    end
    object fdqryColaboradordata_contrato: TDateField
      FieldName = 'data_contrato'
      Origin = 'data_contrato'
      EditMask = '!99/99/00;0;_'
    end
    object fdqryColaboradorperiodo_aquisitivo: TDateField
      FieldName = 'periodo_aquisitivo'
      Origin = 'periodo_aquisitivo'
      EditMask = '!99/99/00;0;_'
    end
    object fdqryColaboradorperiodo_concessivo: TDateField
      FieldName = 'periodo_concessivo'
      Origin = 'periodo_concessivo'
      EditMask = '!99/99/00;0;_'
    end
    object fdqryColaboradordata_cadastro: TDateField
      FieldName = 'data_cadastro'
      Origin = 'data_cadastro'
      ReadOnly = True
    end
    object fdqryColaboradorativo: TBooleanField
      FieldName = 'ativo'
      Origin = 'ativo'
    end
    object wdstrngfldColaboradorcpf: TWideStringField
      FieldName = 'cpf'
      Origin = 'cpf'
      EditMask = '999-000-000-00;_'
      Size = 11
    end
  end
  object fdqryAux: TFDQuery
    Connection = GerenciadorConexao.fdConn
    Left = 280
    Top = 256
  end
end
