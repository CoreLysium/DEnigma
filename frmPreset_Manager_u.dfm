object frmPreset_Manager: TfrmPreset_Manager
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize, biMaximize, biHelp]
  BorderStyle = bsSingle
  Caption = 'Preset Manager'
  ClientHeight = 442
  ClientWidth = 428
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblContact: TLabel
    Left = 265
    Top = 351
    Width = 43
    Height = 16
    Caption = 'Contact'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbPresets: TListBox
    Left = 8
    Top = 8
    Width = 402
    Height = 337
    ItemHeight = 13
    Sorted = True
    TabOrder = 0
    TabWidth = 1000
    OnClick = lbPresetsClick
  end
  object btnLoad: TButton
    Left = 8
    Top = 351
    Width = 75
    Height = 25
    Caption = 'Load'
    Enabled = False
    TabOrder = 1
    OnClick = btnLoadClick
  end
  object btnEdit: TButton
    Left = 8
    Top = 376
    Width = 75
    Height = 25
    Caption = 'Edit'
    Enabled = False
    TabOrder = 2
    OnClick = btnEditClick
  end
  object sbtnMove_Pointer: TSpinButton
    Left = 89
    Top = 351
    Width = 32
    Height = 77
    DownGlyph.Data = {
      0E010000424D0E01000000000000360000002800000009000000060000000100
      200000000000D800000000000000000000000000000000000000008080000080
      8000008080000080800000808000008080000080800000808000008080000080
      8000008080000080800000808000000000000080800000808000008080000080
      8000008080000080800000808000000000000000000000000000008080000080
      8000008080000080800000808000000000000000000000000000000000000000
      0000008080000080800000808000000000000000000000000000000000000000
      0000000000000000000000808000008080000080800000808000008080000080
      800000808000008080000080800000808000}
    TabOrder = 3
    UpGlyph.Data = {
      0E010000424D0E01000000000000360000002800000009000000060000000100
      200000000000D800000000000000000000000000000000000000008080000080
      8000008080000080800000808000008080000080800000808000008080000080
      8000000000000000000000000000000000000000000000000000000000000080
      8000008080000080800000000000000000000000000000000000000000000080
      8000008080000080800000808000008080000000000000000000000000000080
      8000008080000080800000808000008080000080800000808000000000000080
      8000008080000080800000808000008080000080800000808000008080000080
      800000808000008080000080800000808000}
    OnDownClick = sbtnMove_PointerDownClick
    OnUpClick = sbtnMove_PointerUpClick
  end
  object cmbContacts: TComboBox
    Left = 265
    Top = 373
    Width = 145
    Height = 21
    TabOrder = 4
    Text = 'Me'
    OnChange = cmbContactsChange
    Items.Strings = (
      'Me')
  end
  object btnDelete: TButton
    Left = 8
    Top = 403
    Width = 75
    Height = 25
    Caption = 'Delete'
    Enabled = False
    TabOrder = 5
    OnClick = btnDeleteClick
  end
end
