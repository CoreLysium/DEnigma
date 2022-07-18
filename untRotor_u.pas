unit untRotor_u;

interface

type
  TRotor = Class

    private
      iRotorNO: Integer;
      iRotorPos: Integer;
      arrWiring: Array[0..25] of Array[0..1] of Integer;

      procedure SetRotorPos(const new_pos: Integer);

    published
      property RotorPos: Integer
      read iRotorPos
      write SetRotorPos;

      constructor Create(iRotorNumber: Integer; iRotorPosition: Integer);
      function Process_Char(iInput: Integer; bReversed: Boolean):Integer;
      procedure Change_Rotor_Wiring(iRotorNumber: Integer);
    end;
implementation

  uses
    Sysutils, Dialogs;

  constructor TRotor.Create(iRotorNumber: Integer; iRotorPosition: Integer);
  var
    I, K: Integer;
    tRotor_Wiring: TextFile;
    sTemp, sFileName: String;
  begin
    iRotorNO := iRotorNumber;
    iRotorPos := iRotorPosition;
    sFileName := 'Rotor' + IntToStr(iRotorNO) + '_Wiring.txt';
    if fileexists(sFileName) then
          assignfile(tRotor_Wiring, sFileName)
        else
          begin
            showmessage('file ' + sFilename + ' not found');
            exit;
          end;
        reset(tRotor_Wiring);

        for I := 0 to 25 do
          for K := 0 to 1 do
            begin
              ReadLN(tRotor_Wiring, sTemp);
              arrWiring[I][K] := StrToInt(sTemp);
            end;
        closefile(tRotor_Wiring);
  end;

  procedure TRotor.SetRotorPos(const new_pos: Integer);
  begin
    iRotorPos := new_pos;
  end;

  function TRotor.Process_Char(iInput: Integer; bReversed: Boolean): Integer;
  var
  I: Integer;
  begin
    if not bReversed then
      begin
        iInput := (iInput + iRotorPos) mod 26;

        result := arrWiring[iInput][1];
      end
    else
      begin
        for I := 0 to 25 do
          if iInput = arrWiring[I][1] then
            begin
              result := arrWiring[I][0] - iRotorPos;
              while result < 0 do
                result := 26 + result;
              result := result mod 26;
            end;
      end;
  end;

  procedure TRotor.Change_Rotor_Wiring(iRotorNumber: Integer);
  var
    I, K: Integer;
    tRotor_Wiring: TextFile;
    sTemp, sFileName: String;
  begin
    iRotorNO := iRotorNumber;
    sFileName := 'Rotor' + IntToStr(iRotorNO) + '_Wiring.txt';
    if fileexists(sFileName) then
          assignfile(tRotor_Wiring, sFileName)
        else
          begin
            showmessage('file ' + sFilename + ' not found');;
            exit;
          end;
        reset(tRotor_Wiring);

        for I := 0 to 25 do
          for K := 0 to 1 do
            begin
              ReadLN(tRotor_Wiring, sTemp);
              arrWiring[I][K] := StrToInt(sTemp);
            end;
        closefile(tRotor_Wiring);
  end;

end.
