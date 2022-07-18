unit untPlugboard_u;

interface
uses
  untPlug_u;

type
  TPlugboard = Class
    Private
      arrPlug: Array[1..10] of TPlug;

    Published
      constructor Create();
      function Processs_Char(iInput: Integer): Integer;
      function Confirm_Plug_Validity(): Boolean;
      procedure Set_Plug(iPlug_Number: Integer; iConnection1: Integer; iConnection2:Integer);
  End;

implementation

constructor TPlugboard.Create;
var
I, iCounter: Integer;
begin
  iCounter := 0;
  for I := 1 to 10 do
    begin
      arrPlug[I] := TPlug.Create(iCounter, iCounter + 1);
      inc(iCounter);
    end;
end;

function TPlugboard.Processs_Char(iInput: Integer):Integer;
var
  I: Integer;
begin
  for I := 1 to 10 do
    begin
      if arrPlug[I].Connection_1 = iInput then
        begin
          result := arrPlug[I].Connection_2;
          exit;
        end
      else
      if arrPlug[I].Connection_2 = iInput then
        begin
          result := arrPlug[I].Connection_1;
          exit;
        end;
    end;
  result := iInput;
end;

function TPlugboard.Confirm_Plug_Validity(): Boolean;
Var
I, K: Integer;
begin
  for I := 1 to 10 do
    begin
      if (arrPlug[I].Connection_1 in [0..25]) and (arrPlug[I].Connection_2 in [0..25]) then
        begin
          if arrPlug[I].Connection_1 <> arrPlug[I].Connection_2 then
            begin
              for K := I + 1 to 10 do
                begin
                  if (arrPlug[I].Connection_1 = arrPlug[K].Connection_1) or (arrPlug[I].Connection_2 = arrPlug[K].Connection_2) or (arrPlug[I].Connection_1 = arrPlug[K].Connection_2) or (arrPlug[I].Connection_2 = arrPlug[K].Connection_1) then
                    begin
                      result := False;
                      exit;
                    end;
                end;
            end
            else
              begin
                result := False;
                exit;
              end;
        end
        else
          begin
            result := False;
            exit;
          end;
    end;
  result := True;
end;

procedure TPlugboard.Set_Plug(iPlug_Number: Integer; iConnection1: Integer; iConnection2: Integer);
begin
  arrPlug[iPlug_Number].Connection_1 := iConnection1 - 97;
  arrPlug[iPlug_Number].Connection_2 := iConnection2 - 97;
end;

end.
