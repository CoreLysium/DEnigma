unit frmPreset_Manager_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Spin, dmUser_Preset_u;

type
  TfrmPreset_Manager = class(TForm)
    lbPresets: TListBox;
    btnLoad: TButton;
    btnEdit: TButton;
    sbtnMove_Pointer: TSpinButton;
    cmbContacts: TComboBox;
    lblContact: TLabel;
    btnDelete: TButton;
    procedure FormShow(Sender: TObject);
    procedure cmbContactsChange(Sender: TObject);
    procedure sbtnMove_PointerUpClick(Sender: TObject);
    procedure sbtnMove_PointerDownClick(Sender: TObject);
    procedure btnLoadClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure lbPresetsClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    sUsername: String;
  end;

var
  frmPreset_Manager: TfrmPreset_Manager;

implementation

{$R *.dfm}

uses
  frmMain_u;

procedure TfrmPreset_Manager.btnDeleteClick(Sender: TObject);
var
  iID, iTabPos: Integer;
  sItem: String;
begin
  if MessageDlg('Are you sure you want to delete this preset',mtConfirmation,[mbOK,mbCancel],0) = mrOK then
    begin
      sItem := lbPresets.Items[lbPresets.ItemIndex];
      iTabPos := Pos(#9,sItem);
      iID := StrToInt(Copy(sItem,iTabPos + 1,Length(sItem) - iTabPos));
      if dmUserPresets.tblPresets.Locate('Preset_ID',iID,[]) then
        dmUserPresets.tblPresets.Delete;
      cmbContactsChange(cmbContacts);
      MessageDlg('Preset successfully deleted',mtInformation,[mbOK],0);
    end
  else
    MessageDlg('Operation Cancelled',mtInformation,[mbOK],0)
end;

procedure TfrmPreset_Manager.btnEditClick(Sender: TObject);
var
  iID, iTabPos: Integer;
  sItem: String;
begin
  sItem := lbPresets.Items[lbPresets.ItemIndex];
  iTabPos := Pos(#9,sItem);
  iID := StrToInt(Copy(sItem,iTabPos + 1,Length(sItem) - iTabPos));
  if dmUserPresets.tblPresets.Locate('Preset_ID',iID,[]) then
    frmMain.Get_Settings_From_Database;
  with frmMain do
    begin
      btnSave_Changes.Visible := True;
      btnCancel.Visible := True;
      btnLoad_Preset.Visible := False;
      btnCreate_Preset.Visible := False;
      ledPreset_Name.Visible := True;
      lblPreset_Name.Visible := False;
      btnApply.Visible := False;
      bEditMode := True;
    end;
  frmPreset_Manager.Close;

end;

procedure TfrmPreset_Manager.btnLoadClick(Sender: TObject);
var
  iID, iTabPos: Integer;
  sItem: String;
begin
  sItem := lbPresets.Items[lbPresets.ItemIndex];
  iTabPos := Pos(#9,sItem);
  iID := StrToInt(Copy(sItem,iTabPos + 1,Length(sItem) - iTabPos));
  if dmUserPresets.tblPresets.Locate('Preset_ID',iID,[]) then
    frmMain.Get_Settings_From_Database;
  frmMain.btnApplyClick(frmMain.btnApply);
  frmMain.btnApply.Enabled := False;
  frmPreset_Manager.Close;
end;

procedure TfrmPreset_Manager.cmbContactsChange(Sender: TObject);
var
sQeury: String;
begin
  lbPresets.Items.Clear;
  if cmbContacts.Text = 'Me' then
    sQeury := sUsername
  else
    sQeury := cmbContacts.Text;
  with dmUserPresets do
    begin
      tblPresets.First;
      while not tblPresets.Eof do
        begin
          if tblPresets['Created_by'] = sQeury then
            lbPresets.Items.Add(tblPresets['Preset_Name'] + #9 + IntToStr(tblPresets['Preset_ID']));
          tblPresets.Next;
        end;
    end;
end;

procedure TfrmPreset_Manager.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frmMain.bSettingsValid := True;
end;

procedure TfrmPreset_Manager.FormShow(Sender: TObject);
begin
  with dmUserPresets do
    begin
      Locate_CaseSense('Username',frmMain.sUsername,1);
      cmbContacts.Items.Clear;
      cmbContacts.Items.Add('Me');
      if tblUsers['User_Contact1'] <> null then
        cmbContacts.Items.Add(tblUsers['User_Contact1']);
      if tblUsers['User_Contact2'] <> null then
        cmbContacts.Items.Add(tblUsers['User_Contact2']);
      if tblUsers['User_Contact3'] <> null then
        cmbContacts.Items.Add(tblUsers['User_Contact3']);
      if tblUsers['User_Contact4'] <> null then
        cmbContacts.Items.Add(tblUsers['User_Contact4']);
      if tblUsers['User_Contact5'] <> null then
        cmbContacts.Items.Add(tblUsers['User_Contact5']);
    end;
  cmbContactsChange(cmbContacts);
  lbPresetsClick(lbPresets);
end;

procedure TfrmPreset_Manager.lbPresetsClick(Sender: TObject);
begin
  if lbPresets.ItemIndex >= 0 then
    begin
      btnLoad.Enabled := True;
      btnEdit.Enabled := True;
      btnDelete.Enabled := True;
    end
  else
    begin
      btnLoad.Enabled := False;
      btnEdit.Enabled := False;
      btnDelete.Enabled := False;
    end;
end;

procedure TfrmPreset_Manager.sbtnMove_PointerDownClick(Sender: TObject);
begin
  if lbPresets.ItemIndex = lbPresets.Count - 1 then
    lbPresets.ItemIndex := 0
  else
    lbPresets.ItemIndex := lbPresets.ItemIndex + 1;

  lbPresetsClick(lbPresets)
end;

procedure TfrmPreset_Manager.sbtnMove_PointerUpClick(Sender: TObject);
begin
  lbPresets.ItemIndex := lbPresets.ItemIndex - 1;
  if lbPresets.ItemIndex < 0 then
    lbPresets.ItemIndex := lbPresets.Count - 1;

  lbPresetsClick(lbPresets);
end;

end.
