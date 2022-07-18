unit untReversing_Wheel_u;

interface

type
  TReversing_Wheel = Class
    private
      arrWiring: Array[0..25] of Array[0..1] of Integer;
    published
      constructor Create();
      function Process_Char(iInput: Integer; bReversed: Boolean):Integer;

  End;

implementation

uses
  SysUtils, Dialogs;

constructor TReversing_Wheel.Create;
var
tWiring: Textfile;
I, K: Integer;
sTemp: String;
begin
  if fileexists('Reversing_Wheel_Wiring.txt') then
    assignfile(tWiring, 'Reversing_Wheel_Wiring.txt')
  else
    begin
      showmessage('File not found');
      exit;
    end;

  reset(tWiring);

  for I := 0 to 25 do
    for K := 0 to 1 do
      begin
        ReadLN(tWiring, sTemp);
        arrWiring[I][K] := StrToInt(sTemp);
      end;
  closefile(tWiring)
end;

function TReversing_Wheel.Process_Char(iInput: Integer; bReversed: Boolean): Integer;
begin
  iInput := iInput mod 26;
  if not bReversed then
    result := arrWiring[iInput][1]
  else
    result := arrWiring[iInput][0];
end;

end.
