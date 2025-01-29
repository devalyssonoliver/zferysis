object GerenciadorConexao: TGerenciadorConexao
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 480
  Width = 640
  object fdConn: TFDConnection
    Params.Strings = (
      'Server=localhost'
      'Database=base_ferysis'
      'User_Name=postgres'
      'Password=postzeus2011'
      'Port=5433'
      'DriverID=pG')
    ConnectedStoredUsage = [auDesignTime]
    LoginPrompt = False
    Left = 304
    Top = 224
  end
  object pgDriver: TFDPhysPgDriverLink
    Left = 432
    Top = 256
  end
end
