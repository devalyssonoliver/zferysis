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
      'DriverID=pG')
    ConnectedStoredUsage = [auDesignTime]
    Connected = True
    LoginPrompt = False
    Left = 296
    Top = 224
  end
  object pgDriver: TFDPhysPgDriverLink
    VendorLib = 'C:\Program Files (x86)\PostgreSQL\psqlODBC\bin\libpq.dll'
    Left = 440
    Top = 176
  end
end
