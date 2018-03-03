unit atimagebox_register;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, ATImageBox;

procedure Register;

implementation

{$R res/atimagebox.dcr}

procedure Register;
begin
  RegisterComponents('Misc', [TATImageBox]);
end;

end.
