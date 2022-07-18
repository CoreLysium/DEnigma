object dmUserPresets: TdmUserPresets
  OldCreateOrder = False
  Height = 191
  Width = 268
  object conUser_Presets: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=dbUser_Presets.mdb;' +
      'Mode=ReadWrite;Persist Security Info=False;Jet OLEDB:System data' +
      'base="";Jet OLEDB:Registry Path="";Jet OLEDB:Database Password="' +
      '";Jet OLEDB:Engine Type=5;Jet OLEDB:Database Locking Mode=1;Jet ' +
      'OLEDB:Global Partial Bulk Ops=2;Jet OLEDB:Global Bulk Transactio' +
      'ns=1;Jet OLEDB:New Database Password="";Jet OLEDB:Create System ' +
      'Database=False;Jet OLEDB:Encrypt Database=False;Jet OLEDB:Don'#39't ' +
      'Copy Locale on Compact=False;Jet OLEDB:Compact Without Replica R' +
      'epair=False;Jet OLEDB:SFP=False'
    LoginPrompt = False
    Mode = cmReadWrite
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 32
    Top = 80
  end
  object tblUsers: TADOTable
    Active = True
    Connection = conUser_Presets
    CursorType = ctStatic
    TableName = 'tblUsers'
    Left = 104
    Top = 56
  end
  object tblPresets: TADOTable
    Active = True
    Connection = conUser_Presets
    CursorType = ctStatic
    TableName = 'tblPresets'
    Left = 104
    Top = 120
  end
  object dscUsers: TDataSource
    DataSet = tblUsers
    Left = 168
    Top = 56
  end
end
