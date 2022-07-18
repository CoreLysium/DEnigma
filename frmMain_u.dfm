object frmMain: TfrmMain
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize, biMaximize, biHelp]
  Caption = 'D-Enigma'
  ClientHeight = 433
  ClientWidth = 694
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pcMain: TPageControl
    Left = 0
    Top = 0
    Width = 694
    Height = 433
    ActivePage = tsEncDec
    Align = alClient
    TabOrder = 0
    OnChange = pcMainChange
    object tsEncDec: TTabSheet
      Caption = 'Encrypt/Decrypt'
      object gbEnigma_Machine: TGroupBox
        Left = 3
        Top = 16
        Width = 680
        Height = 129
        Caption = 'Enigma Machine'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object pnlEnigmaOutput: TPanel
          Left = 16
          Top = 56
          Width = 649
          Height = 56
          TabOrder = 0
        end
        object cbEnigmaDynamic: TCheckBox
          Left = 520
          Top = 24
          Width = 145
          Height = 17
          Caption = 'Dynamic Encrypt/Decrypt'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnClick = cbEnigmaDynamicClick
        end
        object edtEnigmaInput: TEdit
          Left = 168
          Top = 17
          Width = 250
          Height = 27
          TabOrder = 2
        end
        object btnEnigmaRun: TButton
          Left = 424
          Top = 18
          Width = 75
          Height = 25
          Caption = 'Run'
          TabOrder = 3
          OnClick = btnEnigmaRunClick
        end
        object btnEnigmaReset: TButton
          Left = 16
          Top = 24
          Width = 75
          Height = 26
          Caption = 'Reset'
          TabOrder = 4
          Visible = False
          OnClick = btnEnigmaResetClick
        end
      end
      object gbBase64: TGroupBox
        Left = 3
        Top = 151
        Width = 680
        Height = 113
        Caption = 'Base64'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        object edtBase64_Decrypt: TEdit
          Left = 16
          Top = 78
          Width = 649
          Height = 24
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object edtBase64_Encrypt: TEdit
          Left = 16
          Top = 22
          Width = 649
          Height = 24
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object btnBase64_EncDec: TButton
          Left = 16
          Top = 52
          Width = 105
          Height = 25
          Caption = 'Encrypt/Decrypt'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          OnClick = btnBase64_EncDecClick
        end
        object btnBase64_EncryptfromEnig: TButton
          Left = 127
          Top = 52
          Width = 138
          Height = 25
          Caption = 'Encrypt from Enigma'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          OnClick = btnBase64_EncryptfromEnigClick
        end
        object btnBase64_DecryptfromEnig: TButton
          Left = 271
          Top = 52
          Width = 138
          Height = 25
          Caption = 'Decrypt from Enigma'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
          OnClick = btnBase64_DecryptfromEnigClick
        end
      end
      object gbKeyword_Offset: TGroupBox
        Left = 3
        Top = 270
        Width = 680
        Height = 123
        Caption = 'Keyword Offset Encryption'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        object btnKeyOff_EncDec: TButton
          Left = 16
          Top = 52
          Width = 97
          Height = 25
          Caption = 'Encrypt/Decrypt'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnClick = btnKeyOff_EncDecClick
        end
        object btnKeyOff_EncryptfromEnig: TButton
          Left = 119
          Top = 52
          Width = 146
          Height = 25
          Caption = 'Encrypt from Enigma'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnClick = btnKeyOff_EncryptfromEnigClick
        end
        object edtKeyOff_Encrypt: TEdit
          Left = 16
          Top = 22
          Width = 649
          Height = 24
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
        end
        object edtKeyOff_Decrypt: TEdit
          Left = 16
          Top = 83
          Width = 649
          Height = 24
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
        end
        object btnKeyOff_DecryptfromEnig: TButton
          Left = 271
          Top = 52
          Width = 130
          Height = 25
          Caption = 'Decrypt from Enigma'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
        end
      end
    end
    object tsSettings: TTabSheet
      Caption = 'Settings'
      ImageIndex = 1
      object lblPreset_Name: TLabel
        Left = 16
        Top = 375
        Width = 131
        Height = 19
        Caption = 'No Preset Selected'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object gbPlugboard: TGroupBox
        Left = 16
        Top = 148
        Width = 569
        Height = 221
        Caption = 'Plugboard'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object gbPlug1: TGroupBox
          Left = 23
          Top = 40
          Width = 74
          Height = 81
          Caption = 'Plug 1'
          Color = clMenu
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentBackground = False
          ParentColor = False
          ParentFont = False
          TabOrder = 0
          object edtPL1Con1: TEdit
            Left = 19
            Top = 19
            Width = 38
            Height = 24
            MaxLength = 1
            TabOrder = 0
            Text = 'a'
            OnChange = Settings_Changed
          end
          object edtPL1Con2: TEdit
            Left = 19
            Top = 49
            Width = 38
            Height = 24
            MaxLength = 1
            TabOrder = 1
            Text = 'b'
            OnChange = Settings_Changed
          end
        end
        object gbPlug2: TGroupBox
          Left = 127
          Top = 40
          Width = 74
          Height = 81
          Caption = 'Plug 2'
          Color = clMenu
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentBackground = False
          ParentColor = False
          ParentFont = False
          TabOrder = 1
          object edtPL2Con1: TEdit
            Left = 19
            Top = 19
            Width = 38
            Height = 24
            MaxLength = 1
            TabOrder = 0
            Text = 'c'
            OnChange = Settings_Changed
          end
          object edtPL2Con2: TEdit
            Left = 19
            Top = 49
            Width = 38
            Height = 24
            MaxLength = 1
            TabOrder = 1
            Text = 'd'
            OnChange = Settings_Changed
          end
        end
        object gbPlug3: TGroupBox
          Left = 231
          Top = 40
          Width = 74
          Height = 81
          Caption = 'Plug 3'
          Color = clMenu
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentBackground = False
          ParentColor = False
          ParentFont = False
          TabOrder = 2
          object edtPL3Con1: TEdit
            Left = 19
            Top = 19
            Width = 38
            Height = 24
            MaxLength = 1
            TabOrder = 0
            Text = 'e'
            OnChange = Settings_Changed
          end
          object edtPL3Con2: TEdit
            Left = 19
            Top = 49
            Width = 38
            Height = 24
            MaxLength = 1
            TabOrder = 1
            Text = 'f'
            OnChange = Settings_Changed
          end
        end
        object gbPlug4: TGroupBox
          Left = 335
          Top = 40
          Width = 74
          Height = 81
          Caption = 'Plug 4'
          Color = clMenu
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentBackground = False
          ParentColor = False
          ParentFont = False
          TabOrder = 3
          object edtPL4Con1: TEdit
            Left = 19
            Top = 19
            Width = 38
            Height = 24
            MaxLength = 1
            TabOrder = 0
            Text = 'g'
            OnChange = Settings_Changed
          end
          object edtPL4Con2: TEdit
            Left = 19
            Top = 49
            Width = 38
            Height = 24
            MaxLength = 1
            TabOrder = 1
            Text = 'h'
            OnChange = Settings_Changed
          end
        end
        object gbPlug5: TGroupBox
          Left = 439
          Top = 40
          Width = 74
          Height = 81
          Caption = 'Plug 5'
          Color = clMenu
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentBackground = False
          ParentColor = False
          ParentFont = False
          TabOrder = 4
          object edtPL5Con1: TEdit
            Left = 19
            Top = 19
            Width = 38
            Height = 24
            MaxLength = 1
            TabOrder = 0
            Text = 'i'
            OnChange = Settings_Changed
          end
          object edtPL5Con2: TEdit
            Left = 19
            Top = 49
            Width = 38
            Height = 24
            MaxLength = 1
            TabOrder = 1
            Text = 'j'
            OnChange = Settings_Changed
          end
        end
        object gbPlug6: TGroupBox
          Left = 23
          Top = 127
          Width = 74
          Height = 81
          Caption = 'Plug 6'
          Color = clMenu
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentBackground = False
          ParentColor = False
          ParentFont = False
          TabOrder = 5
          object edtPL6Con1: TEdit
            Left = 19
            Top = 19
            Width = 38
            Height = 24
            MaxLength = 1
            TabOrder = 0
            Text = 'k'
            OnChange = Settings_Changed
          end
          object edtPL6Con2: TEdit
            Left = 19
            Top = 49
            Width = 38
            Height = 24
            MaxLength = 1
            TabOrder = 1
            Text = 'l'
            OnChange = Settings_Changed
          end
        end
        object gbPlug7: TGroupBox
          Left = 127
          Top = 127
          Width = 74
          Height = 81
          Caption = 'Plug 7'
          Color = clMenu
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentBackground = False
          ParentColor = False
          ParentFont = False
          TabOrder = 6
          object edtPL7Con1: TEdit
            Left = 19
            Top = 19
            Width = 38
            Height = 24
            MaxLength = 1
            TabOrder = 0
            Text = 'm'
            OnChange = Settings_Changed
          end
          object edtPL7Con2: TEdit
            Left = 19
            Top = 49
            Width = 38
            Height = 24
            MaxLength = 1
            TabOrder = 1
            Text = 'n'
            OnChange = Settings_Changed
          end
        end
        object gbPlug8: TGroupBox
          Left = 231
          Top = 127
          Width = 74
          Height = 81
          Caption = 'Plug 8'
          Color = clMenu
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentBackground = False
          ParentColor = False
          ParentFont = False
          TabOrder = 7
          object edtPL8Con1: TEdit
            Left = 19
            Top = 19
            Width = 38
            Height = 24
            MaxLength = 1
            TabOrder = 0
            Text = 'o'
            OnChange = Settings_Changed
          end
          object edtPL8Con2: TEdit
            Left = 19
            Top = 49
            Width = 38
            Height = 24
            MaxLength = 1
            TabOrder = 1
            Text = 'p'
            OnChange = Settings_Changed
          end
        end
        object gbPlug10: TGroupBox
          Left = 439
          Top = 127
          Width = 74
          Height = 81
          Caption = 'Plug 10'
          Color = clMenu
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentBackground = False
          ParentColor = False
          ParentFont = False
          TabOrder = 8
          object edtPL10Con1: TEdit
            Left = 19
            Top = 19
            Width = 38
            Height = 24
            MaxLength = 1
            TabOrder = 0
            Text = 's'
            OnChange = Settings_Changed
          end
          object edtPL10Con2: TEdit
            Left = 19
            Top = 49
            Width = 38
            Height = 24
            MaxLength = 1
            TabOrder = 1
            Text = 't'
            OnChange = Settings_Changed
          end
        end
        object gbPlug9: TGroupBox
          Left = 335
          Top = 127
          Width = 74
          Height = 81
          Caption = 'Plug 9'
          Color = clMenu
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentBackground = False
          ParentColor = False
          ParentFont = False
          TabOrder = 9
          object edtPL9Con1: TEdit
            Left = 19
            Top = 19
            Width = 38
            Height = 24
            MaxLength = 1
            TabOrder = 0
            Text = 'q'
            OnChange = Settings_Changed
          end
          object edtPL9Con2: TEdit
            Left = 19
            Top = 49
            Width = 38
            Height = 24
            MaxLength = 1
            TabOrder = 1
            Text = 'r'
            OnChange = Settings_Changed
          end
        end
      end
      object btnApply: TButton
        Left = 591
        Top = 337
        Width = 75
        Height = 32
        Caption = 'Apply'
        Enabled = False
        TabOrder = 1
        OnClick = btnApplyClick
      end
      object gbRotor_Sel: TGroupBox
        Left = 16
        Top = 6
        Width = 170
        Height = 62
        Caption = 'Rotor Selection'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        object sedRotorSlot1: TSpinEdit
          Left = 16
          Top = 25
          Width = 41
          Height = 29
          MaxValue = 5
          MinValue = 1
          TabOrder = 0
          Value = 1
          OnChange = Settings_Changed
        end
        object sedRotorSlot2: TSpinEdit
          Left = 63
          Top = 25
          Width = 41
          Height = 29
          MaxValue = 5
          MinValue = 1
          TabOrder = 1
          Value = 2
          OnChange = Settings_Changed
        end
        object sedRotorSlot3: TSpinEdit
          Left = 110
          Top = 25
          Width = 41
          Height = 29
          MaxValue = 5
          MinValue = 1
          TabOrder = 2
          Value = 3
          OnChange = Settings_Changed
        end
      end
      object gbRotor_Rotation: TGroupBox
        Left = 16
        Top = 74
        Width = 170
        Height = 68
        Caption = 'Initial Rotation'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        object sedRotorSlot1_Rotation: TSpinEdit
          Left = 16
          Top = 28
          Width = 41
          Height = 29
          MaxValue = 26
          MinValue = 1
          TabOrder = 0
          Value = 1
          OnChange = Settings_Changed
        end
        object sedRotorSlot2_Rotation: TSpinEdit
          Left = 63
          Top = 28
          Width = 41
          Height = 29
          MaxValue = 26
          MinValue = 1
          TabOrder = 1
          Value = 1
          OnChange = Settings_Changed
        end
        object sedRotorSlot3_Rotation: TSpinEdit
          Left = 110
          Top = 28
          Width = 41
          Height = 29
          MaxValue = 26
          MinValue = 1
          TabOrder = 2
          Value = 1
          OnChange = Settings_Changed
        end
      end
      object gbKeyword_Offset_Options: TGroupBox
        Left = 200
        Top = 6
        Width = 385
        Height = 136
        Caption = 'Keyword Offset Options'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        object lblOffset_Mode: TLabel
          Left = 256
          Top = 19
          Width = 69
          Height = 16
          Caption = 'Offset Mode'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblCoefficient: TLabel
          Left = 16
          Top = 19
          Width = 60
          Height = 16
          Caption = 'Coefficient'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object ledOffset_String: TLabeledEdit
          Left = 16
          Top = 96
          Width = 345
          Height = 21
          EditLabel.Width = 72
          EditLabel.Height = 16
          EditLabel.Caption = 'Offset String'
          EditLabel.Font.Charset = DEFAULT_CHARSET
          EditLabel.Font.Color = clWindowText
          EditLabel.Font.Height = -13
          EditLabel.Font.Name = 'Tahoma'
          EditLabel.Font.Style = []
          EditLabel.ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxLength = 100
          ParentFont = False
          TabOrder = 0
          Text = 'Default'
          OnChange = Settings_Changed
        end
        object cmbOffset_Mode: TComboBox
          Left = 256
          Top = 41
          Width = 105
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ItemIndex = 0
          ParentFont = False
          TabOrder = 1
          Text = 'Add'
          OnChange = Settings_Changed
          Items.Strings = (
            'Add'
            'Subtract'
            'Alternate')
        end
        object ledKeyword: TLabeledEdit
          Left = 105
          Top = 41
          Width = 128
          Height = 21
          EditLabel.Width = 49
          EditLabel.Height = 16
          EditLabel.Caption = 'Keyword'
          EditLabel.Font.Charset = DEFAULT_CHARSET
          EditLabel.Font.Color = clWindowText
          EditLabel.Font.Height = -13
          EditLabel.Font.Name = 'Tahoma'
          EditLabel.Font.Style = []
          EditLabel.ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxLength = 20
          ParentFont = False
          TabOrder = 2
          Text = 'Default'
          OnChange = Settings_Changed
        end
        object sedCoefficient: TSpinEdit
          Left = 16
          Top = 41
          Width = 49
          Height = 22
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxValue = 2
          MinValue = 1
          ParentFont = False
          TabOrder = 3
          Value = 1
          OnChange = Settings_Changed
        end
      end
      object btnLoad_Preset: TButton
        Left = 591
        Top = 22
        Width = 75
        Height = 25
        Caption = 'Load Preset'
        TabOrder = 5
        OnClick = btnLoad_PresetClick
      end
      object btnCreate_Preset: TButton
        Left = 591
        Top = 53
        Width = 75
        Height = 25
        Caption = 'Create Preset'
        TabOrder = 6
        OnClick = btnCreate_PresetClick
      end
      object btnCancel: TButton
        Left = 591
        Top = 344
        Width = 75
        Height = 25
        Caption = 'Cancel'
        TabOrder = 7
        Visible = False
        OnClick = btnCancelClick
      end
      object btnSave_Changes: TButton
        Left = 591
        Top = 313
        Width = 75
        Height = 25
        Caption = 'Save Changes'
        TabOrder = 8
        Visible = False
        OnClick = btnSave_ChangesClick
      end
      object ledPreset_Name: TLabeledEdit
        Left = 112
        Top = 375
        Width = 233
        Height = 21
        EditLabel.Width = 89
        EditLabel.Height = 19
        EditLabel.Caption = 'Preset Name'
        EditLabel.Font.Charset = DEFAULT_CHARSET
        EditLabel.Font.Color = clWindowText
        EditLabel.Font.Height = -16
        EditLabel.Font.Name = 'Tahoma'
        EditLabel.Font.Style = []
        EditLabel.ParentFont = False
        LabelPosition = lpLeft
        MaxLength = 20
        TabOrder = 9
        Visible = False
      end
    end
    object tsAccount: TTabSheet
      Caption = 'Account'
      ImageIndex = 2
      object lblUserName: TLabel
        Left = 24
        Top = 32
        Width = 97
        Height = 23
        Caption = 'Username: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblDateOfBirth: TLabel
        Left = 24
        Top = 80
        Width = 122
        Height = 23
        Caption = 'Date Of Birth: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblContactCode: TLabel
        Left = 288
        Top = 32
        Width = 118
        Height = 23
        Caption = 'Contact Code:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblPassword: TLabel
        Left = 288
        Top = 80
        Width = 85
        Height = 23
        Caption = 'Password:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object gbContacts: TGroupBox
        Left = 24
        Top = 120
        Width = 625
        Height = 249
        Caption = 'Contacts'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object lblContact1: TLabel
          Left = 19
          Top = 32
          Width = 16
          Height = 23
          Caption = '1.'
        end
        object lblContact2: TLabel
          Left = 19
          Top = 69
          Width = 16
          Height = 23
          Caption = '2.'
        end
        object lblContact3: TLabel
          Left = 19
          Top = 104
          Width = 16
          Height = 23
          Caption = '3.'
        end
        object lblContact5: TLabel
          Left = 19
          Top = 184
          Width = 16
          Height = 23
          Caption = '5.'
        end
        object lblContact4: TLabel
          Left = 19
          Top = 144
          Width = 16
          Height = 23
          Caption = '4.'
        end
        object lblContact1_Code: TLabel
          Left = 288
          Top = 32
          Width = 6
          Height = 23
        end
        object lblContact2_Code: TLabel
          Left = 288
          Top = 69
          Width = 6
          Height = 23
        end
        object lblContact3_Code: TLabel
          Left = 288
          Top = 104
          Width = 6
          Height = 23
        end
        object lblContact4_Code: TLabel
          Left = 288
          Top = 144
          Width = 6
          Height = 23
        end
        object lblContact5_Code: TLabel
          Left = 288
          Top = 184
          Width = 6
          Height = 23
        end
        object btnAdd: TButton
          Left = 19
          Top = 213
          Width = 78
          Height = 25
          Caption = 'Add Contact'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnClick = btnAddClick
        end
        object btnRemove: TButton
          Left = 103
          Top = 213
          Width = 106
          Height = 25
          Caption = 'Remove Contact'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnClick = btnRemoveClick
        end
      end
      object btnDelete: TButton
        Left = 24
        Top = 375
        Width = 81
        Height = 25
        Caption = 'Delete Account'
        TabOrder = 1
        OnClick = btnDeleteClick
      end
      object btnEditAccount: TButton
        Left = 111
        Top = 375
        Width = 82
        Height = 25
        Caption = 'Edit Account'
        TabOrder = 2
        OnClick = btnEditAccountClick
      end
    end
    object tsLinksInfo: TTabSheet
      Caption = 'Links&&Info'
      ImageIndex = 3
    end
  end
  object btnAdmin_Controls: TButton
    Left = 600
    Top = 1
    Width = 86
    Height = 17
    Caption = 'Admin Controls'
    TabOrder = 1
    Visible = False
    OnClick = btnAdmin_ControlsClick
  end
end
