unit frmLogin_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, dmUser_Preset_u, frmSignUp_U;

type
  TfrmLogin = class(TForm)
    ledUsername: TLabeledEdit;
    ledPassword: TLabeledEdit;
    lblLoginDetails: TLabel;
    lblUsernameCheck: TLabel;
    lblPasswordCheck: TLabel;
    btnLogin: TButton;
    btnSign_up: TButton;
    btnCancel: TButton;
    procedure ledUsernameChange(Sender: TObject);
    procedure ledPasswordChange(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnLoginClick(Sender: TObject);
    procedure btnSign_upClick(Sender: TObject);
  private
    { Private declarations }
    bUsernameValid, bPasswordValid: Boolean;
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

uses
  frmMain_u;

{$R *.dfm}
procedure TfrmLogin.btnCancelClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmLogin.btnLoginClick(Sender: TObject);
begin
  with dmUserPresets do
  begin
    if Locate_CaseSense('Username',ledUsername.Text,1) then
      begin
        if tblUsers['Password'] = ledPassword.Text then
          begin
            if tblUsers['Banned'] then
              begin
                Messagedlg('You are currently banned from the system. If this is a mistake please contact an administrator', mtError, [mbOK], 0);
                Application.Terminate;
              end;
            frmMain.sUsername := ledUsername.Text;
            frmMain.bFirstLogin := False;
            frmLogin.Close;
          end
        else
          begin
            ledPassword.Text := '';
            lblPasswordCheck.Caption := '*Incorrect Passowrd';
            lblPasswordCheck.Font.Color := clRed;
            bPasswordValid := False;
          end;
      end
    else
      begin
        ledUsername.Text := '';
        lblUsernameCheck.Caption := '*Username does not exist';
        lblUsernameCheck.Font.Color := clRed;
        bUsernameValid := False;
      end;
  end;
end;

procedure TfrmLogin.btnSign_upClick(Sender: TObject);
begin
  frmSignUp.ShowModal;
end;

procedure TfrmLogin.ledPasswordChange(Sender: TObject);
begin
  if ledPassword.Text = '' then
    begin
      lblPasswordCheck.Caption := '*Required';
      lblPasswordCheck.Font.Color := clRed;
      bPasswordValid := False;
    end
  else
  if Length(ledPassword.Text) >= 8 then
    begin
      lblPasswordCheck.Caption := '*Password is valid';
      lblPasswordCheck.Font.Color := clGreen;
      bPasswordValid := True;
    end
  else
    begin
      lblPasswordCheck.Caption := '*Must have at least 8 characters';
      lblPasswordCheck.Font.Color := clRed;
      bPasswordValid := False;
    end;
  if bUsernameValid and bPasswordValid then
    btnLogin.Enabled := True
  else
    btnLogin.Enabled := False;
end;

procedure TfrmLogin.ledUsernameChange(Sender: TObject);
begin
  if ledUsername.Text = '' then
    begin
      lblUsernameCheck.Caption := '*Required';
      lblUsernameCheck.Font.Color := clRed;
      bUsernameValid := False;
    end
  else
    begin
      lblUsernameCheck.Caption := '*Username is valid';
      lblUsernameCheck.Font.Color := clGreen;
      bUsernameValid := True;
    end;

  if bUsernameValid and bPasswordValid then
    btnLogin.Enabled := True
  else
    btnLogin.Enabled := False;
end;

end.
