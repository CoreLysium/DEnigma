unit untPlug_u;

interface

type
  TPlug = Class
    Private
    iConnection1: Integer;
    iConnection2: Integer;
    procedure SetConnection1(new_connect: Integer);
    procedure SetConnection2(new_connect: Integer);

    Published
    Property Connection_1: Integer
    read iConnection1
    write SetConnection1;

    Property Connection_2: Integer
    read iConnection2
    write SetConnection2;

    constructor Create(iConnect1: Integer; iConnect2: Integer);
  End;

implementation

constructor TPlug.Create(iConnect1: Integer; iConnect2: Integer);
begin
  iConnection1 := iConnect1;
  iConnection2 := iConnect2;
end;

procedure TPlug.SetConnection1(new_connect: Integer);
begin
  iConnection1 := new_connect;
end;

procedure TPlug.SetConnection2(new_connect: Integer);
begin
  iConnection2 := new_connect;
end;

end.
