unit untKeyOff_u;

interface

type
  TKeyOff = class

    Private
      sKeyword, sOffsetString: String;
      iCoefficient, iKeyword: Integer;
      Procedure SetCoefficient(iCoef: Integer);
      Procedure SetKeyword(sKey: String);
      Procedure SetOffsetString(sOffset: String);
    Published
      Property Coefficient: Integer
      read iCoefficient
      write SetCoefficient;
      Property Keyword: String
      read sKeyword
      write SetKeyword;
      Property OffsetString: String
      read sOffsetString
      write SetOffsetString;
      constructor Create(sKey, sOffset: String; iCoef: Integer);
      function Encrypt(sInput: String; iMode: Integer): String;
      function Decrypt(sInput: String; iMode: Integer): String;
  end;

implementation

Procedure TKeyOff.SetCoefficient(iCoef: Integer);
begin
  iCoefficient := iCoef;
end;

Procedure TKeyOff.SetKeyword(sKey: string);
var
  I: Integer;
begin
  sKeyword := sKey;
  iKeyword := 0;
  for I := 1 to length(sKeyword) do
    inc(iKeyword, Ord(sKeyword[I]))

end;

Procedure TKeyOff.SetOffsetString(sOffset: string);
begin
  sOffsetString := sOffset
end;

Constructor TKeyOff.Create(sKey: string; sOffset: string; iCoef: Integer);
var
  I: Integer;
begin
  sKeyword := sKey;
  sOffsetString := sOffset;
  iCoefficient := iCoef;
  iKeyword := 0;
  for I := 1 to length(sKeyword) do
    inc(iKeyword, Ord(sKeyword[I]))
end;

function TKeyOff.Encrypt(sInput: string; iMode: Integer): String;
var
I, iChar, iLoopBack: Integer;
C: Char;
bAlt: Boolean;
begin
  bAlt := False;
  result := '';
  iLoopBack := Length(sOffsetString);
  for I := 1 to Length(sInput) do
    begin
      C := sInput[I];
      iChar := Ord(C);
      iChar := (iChar * iCoefficient) - (32 * iCoefficient);
      inc(iChar, iKeyword mod iCoefficient);
      case iMode of
        0: inc(iChar, Ord(sOffsetString[I mod iLoopback + 1]) mod 64);
        1: dec(iChar, Ord(sOffsetString[I mod iLoopback + 1]) mod 64 - 96);
        2: if bAlt then
            begin
              dec(iChar, Ord(sOffsetString[I mod iLoopback + 1]) mod 64 - 96);
              bAlt := False;
            end
           else
            begin
              inc(iChar, Ord(sOffsetString[I mod iLoopback + 1]) mod 64);
              bAlt := True;
            end;
      end;
      C := Char(iChar);
      result := result + C;
    end;
end;

function TKeyOff.Decrypt(sInput: string; iMode: Integer): String;
var
I, iChar, iLoopback: Integer;
C: Char;
bAlt: Boolean;
begin
  bAlt := False;
  result := '';
  iLoopback := Length(sOffsetString);
  for I := 1 to Length(sInput) do
    begin
      C := sInput[I];
      iChar := Ord(C);
      case iMode of
        0: dec(iChar, Ord(sOffsetString[I mod iLoopback + 1]) mod 64);
        1: inc(iChar, Ord(sOffsetString[I mod iLoopback + 1]) mod 64 - 96);
        2: if bAlt then
            begin
              inc(iChar, Ord(sOffsetString[I mod iLoopback + 1]) mod 64 - 96);
              bAlt := False;
            end
           else
            begin
              dec(iChar, Ord(sOffsetString[I mod iLoopback + 1]) mod 64);
              bAlt := True;
            end;
      end;
      dec(iChar, iKeyword mod iCoefficient);
      iChar := (iChar div iCoefficient) + (32 * iCoefficient div iCoefficient);
      C := Char(iChar);
      result := result + C;
    end;
end;

end.
