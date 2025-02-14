object UsuarioDataModule: TUsuarioDataModule
  Height = 480
  Width = 640
  object fdQueryUsuarios: TFDQuery
    Connection = GerenciadorConexao.fdConn
    SQL.Strings = (
      'SELECT * FROM vusuarios')
    Left = 512
    Top = 280
  end
  object dsUsuarios: TDataSource
    DataSet = fdQueryUsuarios
    Left = 384
    Top = 153
  end
end
