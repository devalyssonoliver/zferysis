object GerenciadorConexao: TGerenciadorConexao
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 480
  Width = 640
  object fdConn: TFDConnection
    Params.Strings = (
      'Server=localhost'
      'DriverID=pG')
    LoginPrompt = False
    Left = 304
    Top = 224
  end
  object pgDriver: TFDPhysPgDriverLink
    VendorLib = 'C:\Zeus\Versions\libpq.dll'
    Left = 432
    Top = 256
  end
end
