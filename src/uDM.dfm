object DM: TDM
  OldCreateOrder = False
  Height = 376
  Width = 570
  object FDConnection: TFDConnection
    ConnectionName = 'MCon'
    Params.Strings = (
      'Database=C:\Git\Receituario\data\BDADOS'
      'Password=masterkey'
      'User_Name=SYSDBA'
      'Server=localhost'
      'DriverID=FB')
    UpdateOptions.AssignedValues = [uvAutoCommitUpdates]
    UpdateOptions.AutoCommitUpdates = True
    Connected = True
    LoginPrompt = False
    Left = 304
    Top = 72
  end
  object FDPhysFBDriverLink1: TFDPhysFBDriverLink
    VendorLib = 'C:\Program Files (x86)\Firebird\Firebird_2_5\bin\fbclient.dll'
    Left = 216
    Top = 104
  end
end
