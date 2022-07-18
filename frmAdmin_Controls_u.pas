unit frmAdmin_Controls_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dmUser_Preset_u, Grids, DBGrids, StdCtrls, ExtCtrls, Spin;

type
  TfrmAdmin_Controls = class(TForm)
    dbgUsers: TDBGrid;
    lbResults: TListBox;
    btnSearch: TButton;
    gbSearch_Criteria: TGroupBox;
    btnBanAll: TButton;
    btnBan: TButton;
    cbBanned: TCheckBox;
    ledUsername: TLabeledEdit;
    ledContact_Code: TLabeledEdit;
    sedYear: TSpinEdit;
    lblYear: TLabel;
    btnOwnerControls: TButton;
    btnDelete_Entry: TButton;
    procedure btnSearchClick(Sender: TObject);
    procedure lbResultsClick(Sender: TObject);
    procedure btnBanClick(Sender: TObject);
    procedure btnBanAllClick(Sender: TObject);
    procedure btnOwnerControlsClick(Sender: TObject);
    procedure btnDelete_EntryClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAdmin_Controls: TfrmAdmin_Controls;

implementation

{$R *.dfm}

procedure TfrmAdmin_Controls.btnBanAllClick(Sender: TObject);
var
  I: Integer;
begin
  if lbResults.Count = 0 then
    begin
      MessageDlg('There are no users in the search results box.',mtError,[mbOK],0);
      exit;
    end;
  for I := 0 to lbResults.Count - 1 do
    begin
      with dmUserPresets do
        begin
          Locate_CaseSense('Username',lbResults.Items[I],1);
          tblUsers.Edit;
          tblUsers['Banned'] := not tblUsers['Banned'];
          tblUsers.Post;
        end;
    end;
  if btnBanAll.Caption = 'Ban All' then
    btnBanAll.Caption := 'Unban All'
  else
    btnBanAll.Caption := 'Ban All'
end;

procedure TfrmAdmin_Controls.btnBanClick(Sender: TObject);
begin
  if lbResults.ItemIndex > - 1 then
    begin
      with dmUserPresets do
        begin
          tblUsers.Edit;
          tblUsers['Banned'] := not tblUsers['Banned'];
          tblUsers.Post;
          lbResultsClick(lbResults);
          btnBanAll.Enabled := False;
        end;
    end
  else
    begin
      MessageDlg('No user selected',mtError,[mbOK],0);
    end;
end;

procedure TfrmAdmin_Controls.btnDelete_EntryClick(Sender: TObject);
begin
  dmUserPresets.tblUsers.Delete;
end;

procedure TfrmAdmin_Controls.btnOwnerControlsClick(Sender: TObject);
var
  sPassword: String;
begin
  sPassword := InputBox('Owner Password', 'Enter Database Owner Password','');
  if sPassword = 'OwnerDB' then
    begin
      dbgUsers.Options := [dgEditing,dgTitles,dgIndicator,dgColumnResize,dgColLines,dgRowLines,dgTabs,dgConfirmDelete,dgCancelOnExit,dgTitleClick,dgTitleHotTrack];
      btnOwnerControls.Visible := False;
      btnDelete_Entry.Visible := True;
      dbgUsers.Columns.RebuildColumns;
    end
  else
  if sPassword = '' then
    MessageDlg('Operation Cancelled(Cancel pressed or no password entered)',mtInformation,[mbOK],0)
  else
    MessageDlg('Incorrect Password',mtError,[mbOK],0);
end;

procedure TfrmAdmin_Controls.btnSearchClick(Sender: TObject);
begin
  lbResults.Items.Clear;
  with dmUserPresets do
    begin
      tblUsers.First;
      while not tblUsers.Eof do
        begin
          if (Pos(ledUsername.Text,tblUsers['Username']) > 0) or (ledUsername.Text = '') then
            if (Pos(ledContact_Code.Text,IntToStr(tblUsers['Contact_Code'])) > 0) or (ledContact_Code.Text = '') then
              if (Pos(sedYear.Text,DateTimeToStr(tblUsers['Date_of_Birth'])) > 0) or (sedYear.Value < 1900) then
                if tblUsers['Banned'] = cbBanned.Checked then
                  lbResults.Items.Add(tblUsers['Username']);
          tblUsers.Next;
        end;
      btnBanAll.Enabled := True;
      if cbBanned.Checked then
        btnBanAll.Caption := 'Unban All'
      else
        btnBanAll.Caption := 'Ban All';
    end;
end;

procedure TfrmAdmin_Controls.lbResultsClick(Sender: TObject);
begin
  with dmUserPresets do
    begin
      if Locate_CaseSense('Username',lbResults.Items[lbResults.ItemIndex],1) then
        begin
          if tblUsers['Banned'] then
            btnBan.Caption := 'Unban Selected'
          else
            btnBan.Caption := 'Ban Selected';
          exit;
        end;
      tblUsers.First;
    end;
end;

end.
