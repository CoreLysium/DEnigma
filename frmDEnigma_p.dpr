program frmDEnigma_p;

uses
  Forms,
  frmMain_u in 'frmMain_u.pas' {frmMain},
  untRotor_u in 'untRotor_u.pas',
  untReversing_Wheel_u in 'untReversing_Wheel_u.pas',
  untPlugboard_u in 'untPlugboard_u.pas',
  untPlug_u in 'untPlug_u.pas',
  untKeyOff_u in 'untKeyOff_u.pas',
  dmUser_Preset_u in 'dmUser_Preset_u.pas' {dmUserPresets: TDataModule},
  frmLogin_u in 'frmLogin_u.pas' {frmLogin},
  frmSignUp_u in 'frmSignUp_u.pas' {frmSignUp},
  frmPreset_Manager_u in 'frmPreset_Manager_u.pas' {frmPreset_Manager},
  frmAdmin_Controls_u in 'frmAdmin_Controls_u.pas' {frmAdmin_Controls};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TdmUserPresets, dmUserPresets);
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.CreateForm(TfrmSignUp, frmSignUp);
  Application.CreateForm(TfrmPreset_Manager, frmPreset_Manager);
  Application.CreateForm(TfrmAdmin_Controls, frmAdmin_Controls);
  Application.Run;
end.
