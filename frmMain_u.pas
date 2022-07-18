unit frmMain_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, untRotor_u, untReversing_Wheel_u,untPlugboard_u , ComCtrls, StdCtrls, Spin, ExtCtrls, IDcoder, IDcoderMIME,
  untKeyOff_u, dmUser_Preset_u, frmLogin_u, frmPreset_Manager_u, frmSignUp_u, frmAdmin_Controls_u;

type
  TfrmMain = class(TForm)
    pcMain: TPageControl;
    tsEncDec: TTabSheet;
    tsSettings: TTabSheet;
    tsAccount: TTabSheet;
    tsLinksInfo: TTabSheet;
    sedRotorSlot1: TSpinEdit;
    sedRotorSlot2: TSpinEdit;
    sedRotorSlot3: TSpinEdit;
    sedRotorSlot1_Rotation: TSpinEdit;
    sedRotorSlot2_Rotation: TSpinEdit;
    sedRotorSlot3_Rotation: TSpinEdit;
    pnlEnigmaOutput: TPanel;
    gbPlugboard: TGroupBox;
    gbPlug1: TGroupBox;
    gbPlug2: TGroupBox;
    gbPlug3: TGroupBox;
    gbPlug4: TGroupBox;
    gbPlug5: TGroupBox;
    edtPL1Con1: TEdit;
    edtPL1Con2: TEdit;
    edtPL2Con1: TEdit;
    edtPL2Con2: TEdit;
    edtPL3Con1: TEdit;
    edtPL3Con2: TEdit;
    edtPL4Con1: TEdit;
    edtPL4Con2: TEdit;
    edtPL5Con1: TEdit;
    edtPL5Con2: TEdit;
    gbPlug6: TGroupBox;
    edtPL6Con1: TEdit;
    edtPL6Con2: TEdit;
    gbPlug7: TGroupBox;
    edtPL7Con1: TEdit;
    edtPL7Con2: TEdit;
    gbPlug8: TGroupBox;
    edtPL8Con1: TEdit;
    edtPL8Con2: TEdit;
    gbPlug9: TGroupBox;
    edtPL9Con1: TEdit;
    edtPL9Con2: TEdit;
    gbPlug10: TGroupBox;
    edtPL10Con1: TEdit;
    edtPL10Con2: TEdit;
    btnApply: TButton;
    gbRotor_Sel: TGroupBox;
    gbRotor_Rotation: TGroupBox;
    cbEnigmaDynamic: TCheckBox;
    gbEnigma_Machine: TGroupBox;
    btnEnigmaRun: TButton;
    edtEnigmaInput: TEdit;
    btnEnigmaReset: TButton;
    gbBase64: TGroupBox;
    edtBase64_Decrypt: TEdit;
    edtBase64_Encrypt: TEdit;
    btnBase64_EncDec: TButton;
    btnBase64_EncryptfromEnig: TButton;
    gbKeyword_Offset: TGroupBox;
    edtKeyOff_Encrypt: TEdit;
    edtKeyOff_Decrypt: TEdit;
    btnKeyOff_EncDec: TButton;
    btnKeyOff_EncryptfromEnig: TButton;
    gbKeyword_Offset_Options: TGroupBox;
    ledOffset_String: TLabeledEdit;
    cmbOffset_Mode: TComboBox;
    lblOffset_Mode: TLabel;
    ledKeyword: TLabeledEdit;
    sedCoefficient: TSpinEdit;
    lblCoefficient: TLabel;
    btnBase64_DecryptfromEnig: TButton;
    btnKeyOff_DecryptfromEnig: TButton;
    btnLoad_Preset: TButton;
    btnCreate_Preset: TButton;
    lblPreset_Name: TLabel;
    btnCancel: TButton;
    btnSave_Changes: TButton;
    ledPreset_Name: TLabeledEdit;
    lblUserName: TLabel;
    lblDateOfBirth: TLabel;
    gbContacts: TGroupBox;
    lblContact1: TLabel;
    lblContact2: TLabel;
    lblContact3: TLabel;
    lblContact5: TLabel;
    lblContact4: TLabel;
    lblContact1_Code: TLabel;
    lblContact2_Code: TLabel;
    lblContact3_Code: TLabel;
    lblContact4_Code: TLabel;
    lblContact5_Code: TLabel;
    lblContactCode: TLabel;
    lblPassword: TLabel;
    btnAdd: TButton;
    btnRemove: TButton;
    btnDelete: TButton;
    btnEditAccount: TButton;
    btnAdmin_Controls: TButton;
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Move_Rotors();
    procedure Update_PlugBoard();
    procedure Update_Rotor_Wiring;
    procedure btnApplyClick(Sender: TObject);
    function Enigma_Run(Key: Char): Char;
    procedure cbEnigmaDynamicClick(Sender: TObject);
    procedure btnEnigmaRunClick(Sender: TObject);
    procedure Set_Rotor_Rotation();
    procedure btnEnigmaResetClick(Sender: TObject);
    procedure btnBase64_EncDecClick(Sender: TObject);
    procedure btnBase64_EncryptfromEnigClick(Sender: TObject);
    procedure btnKeyOff_EncDecClick(Sender: TObject);
    procedure btnKeyOff_EncryptfromEnigClick(Sender: TObject);
    procedure btnBase64_DecryptfromEnigClick(Sender: TObject);
    procedure Get_Settings_From_Database();
    procedure btnLoad_PresetClick(Sender: TObject);
    procedure btnSave_ChangesClick(Sender: TObject);
    procedure Save_Settings_To_Database;
    procedure Settings_Changed(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnCreate_PresetClick(Sender: TObject);
    procedure pcMainChange(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnRemoveClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnEditAccountClick(Sender: TObject);
    procedure btnAdmin_ControlsClick(Sender: TObject);
  private
    rRotor1: TRotor;
    rRotor2: TRotor;
    rRotor3: TRotor;
    rwReverse: TReversing_Wheel;
    plbPlugboard: TPlugboard;
    koKeyOff: TKeyOff;
    iRotor1_Init_Rotation, iRotor2_Init_Rotation, iRotor3_Init_Rotation: Integer;
    iID: Integer;
  public
    sUsername: String;
    bFirstLogin: Boolean;
    bEditMode : Boolean;
    bSettingsValid: Boolean;
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

procedure TfrmMain.Settings_Changed(Sender: TObject);
begin
  btnApply.Enabled := True;
  if not bEditMode then
    lblPreset_Name.Caption := 'No Preset Selected';
end;

procedure TfrmMain.Save_Settings_To_Database;
var
  sPlgbdConfig: String;
begin
  sPlgbdConfig := '';
  with dmUserPresets do
    begin
      tblPresets['RotorSlot1_Rotation'] := sedRotorSlot1_Rotation.Value - 1;
      tblPresets['RotorSlot2_Rotation'] := sedRotorSlot2_Rotation.Value - 1;
      tblPresets['RotorSlot3_Rotation'] := sedRotorSlot3_Rotation.Value - 1;
      tblPresets['RotorSlot1_Selection'] := sedRotorSlot1.Value;
      tblPresets['RotorSlot2_Selection'] := sedRotorSlot2.Value;
      tblPresets['RotorSlot3_Selection'] := sedRotorSlot3.Value;
      tblPresets['KeyOff_Coefficient'] := sedCoefficient.Value;
      tblPresets['KeyOff_Keyword'] := ledKeyword.Text;
      tblPresets['KeyOff_OffsetString'] := ledOffset_String.Text;
      tblPresets['KeyOff_OffsetMode'] := cmbOffset_Mode.ItemIndex;
      sPlgbdConfig := sPlgbdConfig + edtPL1Con1.Text;
      sPlgbdConfig := sPlgbdConfig + edtPL1Con2.Text;
      sPlgbdConfig := sPlgbdConfig + edtPL2Con1.Text;
      sPlgbdConfig := sPlgbdConfig + edtPL2Con2.Text;
      sPlgbdConfig := sPlgbdConfig + edtPL3Con1.Text;
      sPlgbdConfig := sPlgbdConfig + edtPL3Con2.Text;
      sPlgbdConfig := sPlgbdConfig + edtPL4Con1.Text;
      sPlgbdConfig := sPlgbdConfig + edtPL4Con2.Text;
      sPlgbdConfig := sPlgbdConfig + edtPL5Con1.Text;
      sPlgbdConfig := sPlgbdConfig + edtPL5Con2.Text;
      sPlgbdConfig := sPlgbdConfig + edtPL6Con1.Text;
      sPlgbdConfig := sPlgbdConfig + edtPL6Con2.Text;
      sPlgbdConfig := sPlgbdConfig + edtPL7Con1.Text;
      sPlgbdConfig := sPlgbdConfig + edtPL7Con2.Text;
      sPlgbdConfig := sPlgbdConfig + edtPL8Con1.Text;
      sPlgbdConfig := sPlgbdConfig + edtPL8Con2.Text;
      sPlgbdConfig := sPlgbdConfig + edtPL9Con1.Text;
      sPlgbdConfig := sPlgbdConfig + edtPL9Con2.Text;
      sPlgbdConfig := sPlgbdConfig + edtPL10Con1.Text;
      sPlgbdConfig := sPlgbdConfig + edtPL10Con2.Text;
      tblPresets['Plugboard_Config'] := sPlgbdConfig;
    end;
end;

procedure TfrmMain.Get_Settings_From_Database;
var
  sPlgbdConfig: String;
begin
  with dmUserPresets do
    begin
      iID := tblPresets['Preset_ID'];
      sedRotorSlot1_Rotation.Value := tblPresets['RotorSlot1_Rotation'] + 1;
      sedRotorSlot2_Rotation.Value := tblPresets['RotorSlot2_Rotation'] + 1;
      sedRotorSlot3_Rotation.Value := tblPresets['RotorSlot3_Rotation'] + 1;
      sedRotorSlot1.Value := tblPresets['RotorSlot1_Selection'];
      sedRotorSlot2.Value := tblPresets['RotorSlot2_Selection'];
      sedRotorSlot3.Value := tblPresets['RotorSlot3_Selection'];
      sedCoefficient.Value := tblPresets['KeyOff_Coefficient'];
      ledKeyword.Text := tblPresets['KeyOff_Keyword'];
      ledOffset_String.Text := tblPresets['KeyOff_OffsetString'];
      cmbOffset_Mode.ItemIndex := tblPresets['KeyOff_OffsetMode'];
      sPlgbdConfig := tblPresets['Plugboard_Config'];
      edtPL1Con1.Text := sPlgbdConfig[1];
      edtPL1Con2.Text := sPlgbdConfig[2];
      edtPL2Con1.Text := sPlgbdConfig[3];
      edtPL2Con2.Text := sPlgbdConfig[4];
      edtPL3Con1.Text := sPlgbdConfig[5];
      edtPL3Con2.Text := sPlgbdConfig[6];
      edtPL4Con1.Text := sPlgbdConfig[7];
      edtPL4Con2.Text := sPlgbdConfig[8];
      edtPL5Con1.Text := sPlgbdConfig[9];
      edtPL5Con2.Text := sPlgbdConfig[10];
      edtPL6Con1.Text := sPlgbdConfig[11];
      edtPL6Con2.Text := sPlgbdConfig[12];
      edtPL7Con1.Text := sPlgbdConfig[13];
      edtPL7Con2.Text := sPlgbdConfig[14];
      edtPL8Con1.Text := sPlgbdConfig[15];
      edtPL8Con2.Text := sPlgbdConfig[16];
      edtPL9Con1.Text := sPlgbdConfig[17];
      edtPL9Con2.Text := sPlgbdConfig[18];
      edtPL10Con1.Text := sPlgbdConfig[19];
      edtPL10Con2.Text := sPlgbdConfig[20];
      lblPreset_Name.Caption := tblPresets['Preset_Name'];
      ledPreset_Name.Text := tblPresets['Preset_Name']
    end;
end;

procedure TfrmMain.Set_Rotor_Rotation;
begin
  rRotor1.RotorPos := iRotor1_Init_Rotation;
  rRotor2.RotorPos := iRotor2_Init_Rotation;
  rRotor3.RotorPos := iRotor3_Init_Rotation;
end;

procedure TfrmMain.btnBase64_DecryptfromEnigClick(Sender: TObject);
begin
  edtBase64_Decrypt.Text := pnlEnigmaOutput.Caption;
end;

procedure TfrmMain.btnBase64_EncDecClick(Sender: TObject);
begin
  if (edtBase64_Encrypt.Text = '') and (edtBase64_Decrypt.Text = '') then
    begin
      MessageDlg('One field must be filled in.',mtWarning,[mbOK],0);
    end;
  if edtBase64_Decrypt.Text = '' then
    edtBase64_Decrypt.Text := TIdEncoderMIME.EncodeString(edtBase64_Encrypt.Text)
  else
  if edtBase64_Encrypt.Text = '' then
    edtBase64_Encrypt.Text := TIdDecoderMIME.DecodeString(edtBase64_Decrypt.Text)
  else
    MessageDlg('Only one field must be filled in.',mtWarning,[mbOK],0);
end;

procedure TfrmMain.btnBase64_EncryptfromEnigClick(Sender: TObject);
begin
  edtBase64_Encrypt.Text := pnlEnigmaOutput.Caption;
end;

procedure TfrmMain.btnCancelClick(Sender: TObject);
begin
  with dmUserPresets do
    begin
      if tblPresets.Locate('Preset_ID', iID, []) then
        begin
          Get_Settings_From_Database;
          btnApplyClick(btnApply);
        end;
    end;
  btnApply.Visible := True;
  btnLoad_Preset.Visible := True;
  btnCreate_Preset.Visible := True;
  btnSave_Changes.Visible := False;
  btnCancel.Visible := False;
  lblPreset_Name.Visible := True;
  ledPreset_Name.Visible := False;
  showmessage('Operation Cancelled')
end;

procedure TfrmMain.btnCreate_PresetClick(Sender: TObject);
begin
  btnApply.Visible := False;
  btnLoad_Preset.Visible := False;
  btnCreate_Preset.Visible := False;
  btnSave_Changes.Visible := True;
  btnCancel.Visible := True;
  lblPreset_Name.Visible := False;
  ledPreset_Name.Visible := True;
  ledPreset_Name.Text := '';
end;

procedure TfrmMain.btnDeleteClick(Sender: TObject);
begin
  with dmUserPresets do
    begin
      if MessageDLG('Are you sure you want to delete your account?',mtConfirmation,[mbOK,mbCancel],0) = mrOK then
        begin
          Locate_CaseSense('Username',sUsername,1);
          tblUsers.Delete;
          MessageDlg('Account Deleted. Closing program',mtInformation,[mbOK],0);
          Application.Terminate;
        end
      else
        MessageDlg('Operation Cancelled',mtInformation,[mbOK],0);
    end;
end;

procedure TfrmMain.btnKeyOff_EncDecClick(Sender: TObject);
begin
  if (edtKeyOff_Encrypt.Text = '') and (edtKeyOff_Decrypt.Text = '') then
    begin
      MessageDlg('One field must be filled in.',mtWarning,[mbOK],0);
    end;

  if edtKeyOff_Decrypt.Text = '' then
    edtKeyOff_Decrypt.Text := koKeyOff.Encrypt(edtKeyOff_Encrypt.Text, cmbOffset_Mode.ItemIndex)
  else
  if edtKeyOff_Encrypt.Text = '' then
    edtKeyOff_Encrypt.Text := koKeyOff.Decrypt(edtKeyOff_Decrypt.Text, cmbOffset_Mode.ItemIndex)
  else
    MessageDlg('Only one field must be filled in.',mtWarning,[mbOK],0);
end;

procedure TfrmMain.btnKeyOff_EncryptfromEnigClick(Sender: TObject);
begin
  edtKeyOff_Encrypt.Text := pnlEnigmaOutput.Caption;
end;

procedure TfrmMain.btnLoad_PresetClick(Sender: TObject);
begin
  frmPreset_Manager.ShowModal;
end;

procedure TfrmMain.btnRemoveClick(Sender: TObject);
var
  sContactName: String;
begin
  sContactName := Inputbox('Contact Name', 'Enter username of contact to delete', '');
  if sContactName = '' then
    begin
      MessageDlg('Operation Cancelled(Cancel button pressed or no Contact Name entered)',mtInformation,[mbOK],0);
      exit;
    end;
  with dmUserPresets do
    begin
      Locate_CaseSense('Username',sUsername,1);
      if tblUsers['User_Contact1'] = sContactName then
        begin
          tblUsers.Edit;
          tblUsers['User_Contact1'] := null;
          lblContact1.Caption := '1.';
          lblContact1_Code.Caption := '';
          tblUsers.Post;
        end
      else
      if tblUsers['User_Contact2'] = sContactName then
        begin
          tblUsers.Edit;
          tblUsers['User_Contact2'] := null;
          lblContact2.Caption := '2.';
          lblContact2_Code.Caption := '';
          tblUsers.Post;
        end
      else
      if tblUsers['User_Contact3'] = sContactName then
        begin
          tblUsers.Edit;
          tblUsers['User_Contact3'] := null;
          lblContact3.Caption := '3.';
          lblContact3_Code.Caption := '';
          tblUsers.Post;
        end
      else
      if tblUsers['User_Contact4'] = sContactName then
        begin
          tblUsers.Edit;
          tblUsers['User_Contact4'] := null;
          lblContact4.Caption := '4.';
          lblContact4_Code.Caption := '';
          tblUsers.Post;
        end
      else
      if tblUsers['User_Contact5'] = sContactName then
        begin
          tblUsers.Edit;
          tblUsers['User_Contact5'] := null;
          lblContact5.Caption := '5.';
          lblContact5_Code.Caption := '';
          tblUsers.Post;
        end
      else
        MessageDlg('No contact with that username',mtError,[mbOK],0);
    end;
end;

procedure TfrmMain.btnSave_ChangesClick(Sender: TObject);
begin
  frmMain.btnApplyClick(btnApply);
  if ledPreset_Name.Text = '' then
    begin
      MessageDlg('Preset must have a name.',mtWarning,[mbOK],0);
      bSettingsValid := False;
    end;
  if bSettingsValid then
    begin
      with dmUserPresets do
        begin
          if bEditMode then
            tblPresets.Edit
          else
            begin
              tblPresets.Insert;
              tblPresets['Created_by'] := sUsername;
            end;
          Save_Settings_To_Database;
          tblPresets['Preset_Name'] := ledPreset_Name.Text;
          tblPresets.Post;
          btnApply.Visible := True;
          btnLoad_Preset.Visible := True;
          btnCreate_Preset.Visible := True;
          btnSave_Changes.Visible := False;
          btnCancel.Visible := False;
          lblPreset_Name.Visible := True;
          ledPreset_Name.Visible := False;
          bEditMode := False;
        end;
    end;
end;

procedure TfrmMain.btnEditAccountClick(Sender: TObject);
begin
  frmSignUp.bEditMode := True;
  frmSignUp.ShowModal;
end;

procedure TfrmMain.btnEnigmaResetClick(Sender: TObject);
begin
 Set_Rotor_Rotation;
 pnlEnigmaOutput.Caption := '';
end;

procedure TfrmMain.btnEnigmaRunClick(Sender: TObject);
Var
I: Integer;
sInput, sOutput: String;
begin
  Set_Rotor_Rotation;
  sOutput := '';
  sInput := edtEnigmaInput.Text;
  for I := 1 to Length(sInput) do
    begin
      sOutput := sOutput + Enigma_Run(sInput[I]);
      Move_Rotors;
    end;
  pnlEnigmaOutput.Caption := sOutput;

end;

procedure TfrmMain.cbEnigmaDynamicClick(Sender: TObject);
begin
  if cbEnigmaDynamic.Checked then
    begin
      edtEnigmaInput.Visible := False;
      btnEnigmaRun.Visible := False;
      btnEnigmaReset.Visible := True;
    end
  else
    begin
      edtEnigmaInput.Visible := True;
      btnEnigmaRun.Visible := True;
      btnEnigmaReset.Visible := False;
    end;
end;

function TfrmMain.Enigma_Run(Key: Char): Char;
var
  iCurrentChar: Integer;
begin
  if CharinSet(Key,['a'..'z']) then
    begin
      iCurrentChar := Ord(Key) - 97;
      iCurrentChar := plbPlugboard.Processs_Char(iCurrentChar);
      iCurrentChar := rRotor1.Process_Char(iCurrentChar, False);
      iCurrentChar := rRotor2.Process_Char(iCurrentChar, False);
      iCurrentChar := rRotor3.Process_Char(iCurrentChar, False);
      iCurrentChar := rwReverse.Process_Char(iCurrentChar, False);
      iCurrentChar := rRotor3.Process_Char(iCurrentChar, True);
      iCurrentChar := rRotor2.Process_Char(iCurrentChar, True);
      iCurrentChar := rRotor1.Process_Char(iCurrentChar, True);
      iCurrentChar := plbPlugboard.Processs_Char(iCurrentChar);
      result := Char(iCurrentChar + 97);
      exit;
    end;

  if CharinSet(Key,['A'..'Z']) then
    begin
      Key := lowercase(Key)[1];
      iCurrentChar := Ord(Key) - 97;
      iCurrentChar := plbPlugboard.Processs_Char(iCurrentChar);
      iCurrentChar := rRotor1.Process_Char(iCurrentChar, False);
      iCurrentChar := rRotor2.Process_Char(iCurrentChar, False);
      iCurrentChar := rRotor3.Process_Char(iCurrentChar, False);
      iCurrentChar := rwReverse.Process_Char(iCurrentChar, False);
      iCurrentChar := rRotor3.Process_Char(iCurrentChar, True);
      iCurrentChar := rRotor2.Process_Char(iCurrentChar, True);
      iCurrentChar := rRotor1.Process_Char(iCurrentChar, True);
      iCurrentChar := plbPlugboard.Processs_Char(iCurrentChar);
      result := uppercase(Char(iCurrentChar + 97))[1];
      exit;
    end;
  if not (CharinSet(Key,['a'..'z']) or CharinSet(Key,['A'..'Z'])) and (Ord(Key) > 31) and (Ord(Key) <> 127) then
    begin
      result := Key;
      exit;
    end;

  result := '*'
end;

procedure TfrmMain.btnAddClick(Sender: TObject);
var
  sContactName, sContactCode: String;
  iContactCode: Integer;
begin
  try
    sContactName := InputBox('Contact Name', 'Enter the username of the contact you want to add.', '');
    if sContactName = '' then
      begin
        MessageDlg('Operation Cancelled(Cancel button pressed or no Contact Name entered)',mtInformation,[mbOK],0);
        exit;
      end;
    sContactCode := InputBox('Contact Code', 'Enter the Contact code of the contact you want to add.', '');
    if sContactCode = '' then
      begin
        MessageDlg('Operation Cancelled(Cancel button pressed or no Contact Code entered)',mtInformation,[mbOK],0);
        exit;
      end;
    iContactCode := StrToInt(sContactCode);
  except
    MessageDlg('Invalid Contact Code',mtError,[mbOK],0);
    exit;
  end;
  with dmUserPresets do
    begin
      if Locate_CaseSense('Username',sContactName,1) then
        begin
          if iContactCode = tblUsers['Contact_Code'] then
            begin
              Locate_CaseSense('Username',sUsername,1);
              if tblUsers['User_Contact1'] = null then
                begin
                  tblUsers.Edit;
                  tblUsers['User_Contact1'] := sContactName;
                  tblUsers.Post;
                  lblContact1.Caption := '1.' + sContactName;
                  lblContact1_Code.Caption := IntToStr(iContactCode);
                end
              else
              if tblUsers['User_Contact2'] = null then
                begin
                  tblUsers.Edit;
                  tblUsers['User_Contact2'] := sContactName;
                  tblUsers.Post;
                  lblContact2.Caption := '2.' + sContactName;
                  lblContact2_Code.Caption := IntToStr(iContactCode);
                end
              else
              if tblUsers['User_Contact3'] = null then
                begin
                  tblUsers.Edit;
                  tblUsers['User_Contact3'] := sContactName;
                  tblUsers.Post;
                  lblContact3.Caption := '3.' + sContactName;
                  lblContact3_Code.Caption := IntToStr(iContactCode);
                end
              else
              if tblUsers['User_Contact4'] = null then
                begin
                  tblUsers.Edit;
                  tblUsers['User_Contact4'] := sContactName;
                  tblUsers.Post;
                  lblContact4.Caption := '4.' + sContactName;
                  lblContact4_Code.Caption := IntToStr(iContactCode);
                end
              else
              if tblUsers['User_Contact5'] = null then
                begin
                  tblUsers.Edit;
                  tblUsers['User_Contact5'] := sContactName;
                  tblUsers.Post;
                  lblContact5.Caption := '5.' + sContactName;
                  lblContact5_Code.Caption := IntToStr(iContactCode);
                end
              else
                MessageDlg('No empty contact slots.',mtError,[mbOK],0);
            end
            else
              MessageDlg('Incorrect Contact Code.',mtError,[mbOK],0)
        end
        else
          MessageDlg('User does not exist.',mtError,[mbOK],0);
    end;
end;

procedure TfrmMain.btnAdmin_ControlsClick(Sender: TObject);
begin
  frmAdmin_Controls.Show;
end;

procedure TfrmMain.btnApplyClick(Sender: TObject);
begin
  btnApply.Enabled := False;
  bSettingsValid := True;
  if ledKeyword.Text = '' then
    begin
      MessageDlg('Enter a keyword for keyword offset.',mtWarning,[mbOK],0);
      bSettingsValid := False;
      exit;
    end;
  if ledOffset_String.Text = '' then
    begin
      MessageDlg('Enter an Offset String for Keyword Offset',mtWarning,[mbOK],0);
      bSettingsValid := False;
      exit;
    end;
  Update_Plugboard;
  if not bSettingsValid then
    exit;
  Update_Rotor_Wiring;
  if not bSettingsValid then
    exit;
  koKeyOff.Keyword := ledKeyword.Text;
  koKeyoff.OffsetString := ledOffset_String.Text;
  koKeyOff.Coefficient := sedCoefficient.Value;
  iRotor1_Init_Rotation := sedRotorSlot1_Rotation.Value - 1;
  iRotor2_Init_Rotation := sedRotorSlot2_Rotation.Value - 1;
  iRotor3_Init_Rotation := sedRotorSlot3_Rotation.Value - 1;
  Set_Rotor_Rotation;
  MessageDlg('Settings successfully updated.',mtInformation,[mbOK],0);
end;

procedure TfrmMain.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if cbEnigmaDynamic.Checked then
    begin
      Key := Enigma_Run(Key);
      Move_Rotors;

      pnlEnigmaOutput.Caption := pnlEnigmaOutput.Caption + Key;
    end;
end;

procedure TfrmMain.Update_PlugBoard;
begin
  plbPlugboard.Set_Plug(1,Ord(edtPL1Con1.Text[1]),Ord(edtPL1Con2.Text[1]));
  plbPlugboard.Set_Plug(2,Ord(edtPL2Con1.Text[1]),Ord(edtPL2Con2.Text[1]));
  plbPlugboard.Set_Plug(3,Ord(edtPL3Con1.Text[1]),Ord(edtPL3Con2.Text[1]));
  plbPlugboard.Set_Plug(4,Ord(edtPL4Con1.Text[1]),Ord(edtPL4Con2.Text[1]));
  plbPlugboard.Set_Plug(5,Ord(edtPL5Con1.Text[1]),Ord(edtPL5Con2.Text[1]));
  plbPlugboard.Set_Plug(6,Ord(edtPL6Con1.Text[1]),Ord(edtPL6Con2.Text[1]));
  plbPlugboard.Set_Plug(7,Ord(edtPL7Con1.Text[1]),Ord(edtPL7Con2.Text[1]));
  plbPlugboard.Set_Plug(8,Ord(edtPL8Con1.Text[1]),Ord(edtPL8Con2.Text[1]));
  plbPlugboard.Set_Plug(9,Ord(edtPL9Con1.Text[1]),Ord(edtPL9Con2.Text[1]));
  plbPlugboard.Set_Plug(10,Ord(edtPL10Con1.Text[1]),Ord(edtPL10Con2.Text[1]));

  if not plbPlugboard.Confirm_Plug_Validity then
    begin
      MessageDlg('Only lowercase, non-repeating characters are allowed in the plugboard',mtWarning,[mbOK],0);
      bSettingsValid := False;
    end;

end;

procedure TfrmMain.Update_Rotor_Wiring;
begin
  if (sedRotorSlot1.Value <> sedRotorSlot2.Value) and (sedRotorSlot1.Value <> sedRotorSlot3.Value) and (sedRotorSlot2.Value <> sedRotorSlot3.Value) then
    begin
      rRotor1.Change_Rotor_Wiring(sedRotorSlot1.Value);
      rRotor2.Change_Rotor_Wiring(sedRotorSlot2.Value);
      rRotor3.Change_Rotor_Wiring(sedRotorSlot3.Value);
    end
  else
    begin
      MessageDlg('There must be a different rotor in every rotor slot',mtWarning,[mbOK],0);
      bSettingsValid := False;
    end;
end;

procedure TfrmMain.Move_Rotors;
begin
   rRotor1.RotorPos := rRotor1.RotorPos + 1;
   if rRotor1.RotorPos = 26 then
    begin
      rRotor1.RotorPos := 0;
      rRotor2.RotorPos := rRotor2.RotorPos + 1;
      if rRotor2.RotorPos = 26 then
        begin
          rRotor2.RotorPos := 0;
          rRotor3.RotorPos := rRotor3.RotorPos + 1;
          if rRotor3.RotorPos = 26 then
            rRotor3.RotorPos := 0;
        end;
    end;
end;

procedure TfrmMain.pcMainChange(Sender: TObject);
begin
  if not bSettingsValid then
    pcMain.ActivePage := tsSettings;
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
  frmLogin.ShowModal;
  bEditMode := False;
  with dmUserPresets do
    begin
      if Locate_CaseSense('Created_by',sUsername,0) then
        begin
          Get_Settings_From_Database;
        end;
      if Locate_CaseSense('Username',sUsername,1) then
        begin
          lblContactCode.Caption := 'Contact Code:' + IntToStr(tblUsers['Contact_Code']);
          lblUsername.Caption := 'Username:' + sUsername;
          lblDateOfBirth.Caption := 'Date of Birth:' + DateToStr(tblUsers['Date_of_Birth']);
          lblPassword.Caption := 'Password:' + tblUsers['Password'];
          if tblUsers['Admin'] then
            btnAdmin_Controls.Visible := True;
        end
      else
        begin
          Application.Terminate;
        end;
      if tblUsers['User_Contact1'] <> null then
        begin
          lblContact1.Caption := '1.' + tblUsers['User_Contact1'];
          Locate_CaseSense('Username',tblUsers['User_Contact1'],1);
          lblContact1_Code.Caption := tblUsers['Contact_Code'];
          Locate_CaseSense('Username',sUsername,1);
        end;
      if tblUsers['User_Contact2'] <> null then
        begin
          lblContact2.Caption := '2.' + tblUsers['User_Contact2'];
          Locate_CaseSense('Username',tblUsers['User_Contact2'],1);
          lblContact2_Code.Caption := tblUsers['Contact_Code'];
          Locate_CaseSense('Username',sUsername,1);
        end;
      if tblUsers['User_Contact3'] <> null then
        begin
          lblContact3.Caption := '3.' + tblUsers['User_Contact3'];
          Locate_CaseSense('Username',tblUsers['User_Contact3'],1);
          lblContact3_Code.Caption := tblUsers['Contact_Code'];
          Locate_CaseSense('Username',sUsername,1);
        end;
      if tblUsers['User_Contact4'] <> null then
        begin
          lblContact4.Caption := '4.' + tblUsers['User_Contact4'];
          Locate_CaseSense('Username',tblUsers['User_Contact4'],1);
          lblContact4_Code.Caption := tblUsers['Contact_Code'];
          Locate_CaseSense('Username',sUsername,1);
        end;
      if tblUsers['User_Contact5'] <> null then
        begin
          lblContact5.Caption := '5.' + tblUsers['User_Contact5'];
          Locate_CaseSense('Username',tblUsers['User_Contact5'],1);
          lblContact5_Code.Caption := tblUsers['Contact_Code'];
          Locate_CaseSense('Username',sUsername,1);
        end;
      iRotor1_Init_Rotation := sedRotorSlot1_Rotation.Value - 1;
      iRotor2_Init_Rotation := sedRotorSlot2_Rotation.Value - 1;
      iRotor3_Init_Rotation := sedRotorSlot3_Rotation.Value - 1;
      rRotor1 := TRotor.Create(sedRotorSlot1.Value, sedRotorSlot1_Rotation.Value - 1);
      rRotor2 := TRotor.Create(sedRotorSlot2.Value, sedRotorSlot2_Rotation.Value - 1);
      rRotor3 := TRotor.Create(sedRotorSlot3.Value, sedRotorSlot3_Rotation.Value - 1);
      rwReverse := TReversing_Wheel.Create;
      plbPlugboard := TPlugboard.Create;
      Update_Plugboard;
      koKeyOff := TKeyOff.Create(ledKeyword.Text,ledOffset_String.Text,sedCoefficient.Value);
      frmPreset_Manager.sUsername := sUsername;
      bSettingsValid := True;
    end;
end;

end.
