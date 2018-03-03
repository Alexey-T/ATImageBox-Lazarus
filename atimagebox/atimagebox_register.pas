unit atimagebox_register;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, ATImageBox;

procedure Register;

implementation

{ Registration }
procedure Register;
begin
  RegisterComponents('Misc', [TATImageBox]);
end;

end.
