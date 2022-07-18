object frmAdmin_Controls: TfrmAdmin_Controls
  Left = 0
  Top = 0
  Caption = 'Admin Controls'
  ClientHeight = 512
  ClientWidth = 461
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object dbgUsers: TDBGrid
    Left = 8
    Top = 8
    Width = 441
    Height = 329
    DataSource = dmUserPresets.dscUsers
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Username'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Date_of_Birth'
        Width = 79
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Banned'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Admin'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Contact_Code'
        Visible = True
      end>
  end
  object lbResults: TListBox
    Left = 224
    Top = 343
    Width = 225
    Height = 161
    ItemHeight = 13
    TabOrder = 1
    OnClick = lbResultsClick
  end
  object btnSearch: TButton
    Left = 160
    Top = 479
    Width = 50
    Height = 25
    Caption = 'Search'
    TabOrder = 2
    OnClick = btnSearchClick
  end
  object gbSearch_Criteria: TGroupBox
    Left = 8
    Top = 343
    Width = 202
    Height = 123
    Caption = 'Search Criteria'
    TabOrder = 3
    object lblYear: TLabel
      Left = 130
      Top = 18
      Width = 47
      Height = 13
      Caption = 'Year Born'
    end
    object cbBanned: TCheckBox
      Left = 130
      Top = 88
      Width = 97
      Height = 17
      Caption = 'Banned'
      TabOrder = 0
    end
    object ledUsername: TLabeledEdit
      Left = 3
      Top = 91
      Width = 121
      Height = 21
      EditLabel.Width = 89
      EditLabel.Height = 13
      EditLabel.Caption = 'Username (Partial)'
      MaxLength = 20
      TabOrder = 1
    end
    object ledContact_Code: TLabeledEdit
      Left = 3
      Top = 37
      Width = 121
      Height = 21
      EditLabel.Width = 107
      EditLabel.Height = 13
      EditLabel.Caption = 'Contact Code (Partial)'
      MaxLength = 12
      NumbersOnly = True
      TabOrder = 2
    end
    object sedYear: TSpinEdit
      Left = 130
      Top = 37
      Width = 69
      Height = 22
      MaxValue = 2100
      MinValue = 1899
      TabOrder = 3
      Value = 1899
    end
  end
  object btnBanAll: TButton
    Left = 8
    Top = 479
    Width = 57
    Height = 25
    Caption = 'Ban All'
    TabOrder = 4
    OnClick = btnBanAllClick
  end
  object btnBan: TButton
    Left = 71
    Top = 479
    Width = 83
    Height = 25
    Caption = 'Ban Selected'
    TabOrder = 5
    OnClick = btnBanClick
  end
  object btnOwnerControls: TButton
    Left = 8
    Top = 312
    Width = 124
    Height = 25
    Caption = 'Enable Database Editing'
    TabOrder = 6
    OnClick = btnOwnerControlsClick
  end
  object btnDelete_Entry: TButton
    Left = 8
    Top = 288
    Width = 75
    Height = 25
    Caption = 'Delete Entry'
    TabOrder = 7
    Visible = False
    OnClick = btnDelete_EntryClick
  end
end
