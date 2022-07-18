unit dmUser_Preset_u;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TdmUserPresets = class(TDataModule)
    conUser_Presets: TADOConnection;
    tblUsers: TADOTable;
    tblPresets: TADOTable;
    dscUsers: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
    function Locate_Casesense(sField,sQeury:String;iTable:Integer):Boolean;
  end;

var
  dmUserPresets: TdmUserPresets;

implementation

{$R *.dfm}

function TdmUserPresets.Locate_Casesense(sField: string; sQeury: string; iTable:Integer):Boolean;
var
  Table : TADOTable;
begin
  if iTable = 1 then
    Table := tblUsers
  else
    Table := tblPresets;

  Table.First;
  while not Table.Eof do
    begin
      if Table[sField] = sQeury then
        begin
          result := True;
          exit;
        end;
      Table.Next;
    end;
  result := False;
end;

end.
