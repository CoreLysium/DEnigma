unit frmSignUp_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, dmUser_Preset_u;

type
  TfrmSignUp = class(TForm)
    ledUsername: TLabeledEdit;
    ledPassword: TLabeledEdit;
    lblSignUp: TLabel;
    ledPasswordConfirm: TLabeledEdit;
    dtpDateOfBirth: TDateTimePicker;
    lblDateOfBirth: TLabel;
    lblPasswordCheck: TLabel;
    lblDateOfBirthCheck: TLabel;
    lblUsernameCheck: TLabel;
    lblConfirmPasswordCheck: TLabel;
    btnCancel: TButton;
    btnSignUp: TButton;
    procedure ledPasswordChange(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure ledUsernameChange(Sender: TObject);
    procedure dtpDateOfBirthChange(Sender: TObject);
    procedure is_data_valid();
    procedure FormShow(Sender: TObject);
    procedure btnSignUpClick(Sender: TObject);
  private
    { Private declarations }
    bDateOfBirthValid, bUserNameValid, bPasswordValid, bConfirmPassword: Boolean;
  public
    { Public declarations }
    bEditMode: Boolean;
  end;

var
  frmSignUp: TfrmSignUp;

implementation

{$R *.dfm}

uses
  frmLogin_U, frmMain_u;

procedure TfrmSignUp.is_data_valid;
begin
  if bDateofBirthValid and bUsernameValid and bPasswordValid and bConfirmPassword then
    btnSignup.Enabled := True
  else
    btnSignup.Enabled := False;
end;

procedure TfrmSignUp.btnCancelClick(Sender: TObject);
begin
  if bEditMode then
    MessageDlg('Operation Cancelled',mtInformation,[mbOK],0);
  frmSignUp.Close
end;

procedure TfrmSignUp.btnSignUpClick(Sender: TObject);
begin
  with dmUserPresets do
    begin
      if bEditMode then
        begin
          Locate_CaseSense('Username',frmMain.sUsername,1);
          tblUsers.Edit;
        end
      else
        tblUsers.Insert;
      tblUsers['Username'] := ledUsername.Text;
      tblUsers['Password'] := ledPassword.Text;
      tblUsers['Date_of_Birth'] := dtpDateOfBirth.Date;
      tblUsers['Banned'] := False;
      tblUsers['Admin'] := False;
      tblUsers.Post;
      if bEditMode then
        begin
          with frmMain do
            begin
              sUsername := tblUsers['Username'];
              lblContactCode.Caption := 'Contact Code:' + IntToStr(tblUsers['Contact_Code']);
              lblUsername.Caption := 'Username:' + sUsername;
              lblDateOfBirth.Caption := 'Date of Birth:' + DateToStr(tblUsers['Date_of_Birth']);
              lblPassword.Caption := 'Password:' + tblUsers['Password'];
            end;
          MessageDlg('Account Settings Updated',mtInformation,[mbOK],0);
        end;
    end;
  if not bEditMode then
    begin
      frmLogin.ledUsername.Text := ledUsername.Text;
      frmLogin.ledPassword.Text := ledPassword.Text;
      frmLogin.btnLoginClick(frmLogin.btnLogin);
      frmMain.bFirstLogin := True;
    end;
  frmSignUp.Close;
end;

procedure TfrmSignUp.dtpDateOfBirthChange(Sender: TObject);
begin
  if Date - dtpDateOfBirth.Date < 0 then
    begin
      lblDateOfBirthCheck.Caption := '*Cannot be born in the future';
      lblDateOfBirthCheck.Font.Color := clRed;
      bDateOfBirthValid := False;
    end
  else
  if Date - dtpDateOfBirth.Date < 4745 then
    begin
      lblDateOfBirthCheck.Caption := '*Must be 13 or older.';
      lblDateOfBirthCheck.Font.Color := clRed;
      bDateOfBirthValid := False;
    end
  else
    begin
      lblDateOfBirthCheck.Caption := '*Valid Date of Birth';
      lblDateOfBirthCheck.Font.Color := clGreen;
      bDateOfBirthValid := True;
    end;
  is_Data_Valid;
end;

procedure TfrmSignUp.FormShow(Sender: TObject);
begin
  bDateOfBirthValid := False;
  bUserNameValid := False;
  bPasswordValid := False;
  bConfirmPassword := False;
  if bEditMode then
    begin
      frmSignUp.Caption := 'Edit';
      lblSignUp.Caption := 'Edit Account';
      dtpDateOfBirth.Visible := False;
      lblDateOfBirthCheck.Visible := False;
      lblDateOfBirth.Visible := False;
      btnSignUp.Caption := 'Save';
      bDateOfBirthValid := True;
      ledPasswordChange(ledPassword);
      ledUsernameChange(ledUsername);
    end;
  is_Data_Valid;
end;

procedure TfrmSignUp.ledPasswordChange(Sender: TObject);
begin
  if ledPassword.Text = '' then
    begin
      lblPasswordCheck.Caption := '*Required';
      lblPasswordCheck.Font.Color := clRed;
      bPasswordValid := False;
    end
  else
  begin
    if length(ledPassword.Text) < 8 then
      begin
        lblPasswordCheck.Caption := '*Must be at least 8 characters';
        lblPasswordCheck.Font.Color := clRed;
        bPasswordValid := False;
      end
    else
      begin
        lblPasswordCheck.Caption := '*Password is valid';
        lblPasswordCheck.Font.Color := clGreen;
        bPasswordValid := True;
      end;

    if ledPasswordConfirm.Text <> ledPassword.Text then
      begin
        lblConfirmPasswordCheck.Caption := '*Passwords do not match';
        lblConfirmPasswordCheck.Font.Color := clRed;
        bConfirmPassword := False;
      end
    else
      begin
        lblConfirmPasswordCheck.Caption := '*Passwords match';
        lblConfirmPasswordCheck.Font.Color := clGreen;
        bConfirmPassword := True;
      end;
  end;
  is_Data_Valid;


end;

procedure TfrmSignUp.ledUsernameChange(Sender: TObject);
begin
  with dmUserPresets do
    begin
      if ledUsername.Text = '' then
        begin
          lblUsernameCheck.Caption := '*Required';
          lblUsernameCheck.Font.Color := clRed;
          bUserNameValid := False;
        end
      else
      if Locate_CaseSense('Username',ledUsername.Text,1) then
        begin
          if bEditMode and (ledUsername.Text = frmMain.sUsername) then
            begin
              lblUsernameCheck.Caption := '*Username available';
              lblUsernameCheck.Font.Color := clGreen;
              bUserNameValid := True;
            end
          else
            begin
              lblUsernameCheck.Caption := '*Username unavailable';
              lblUsernameCheck.Font.Color := clRed;
              bUserNameValid := False;
            end;
        end
      else
        begin
          lblUsernameCheck.Caption := '*Username available';
          lblUsernameCheck.Font.Color := clGreen;
          bUserNameValid := True;
        end;
    end;
    is_Data_Valid;
end;

end.
