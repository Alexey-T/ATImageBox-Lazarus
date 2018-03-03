{ This file was automatically created by Lazarus. Do not edit!
  This source is only used to compile and install the package.
 }

unit atimagebox_package;

{$warn 5023 off : no warning about unused units}
interface

uses
  ATImageBox, atimagebox_register, LazarusPackageIntf;

implementation

procedure Register;
begin
  RegisterUnit('atimagebox_register', @atimagebox_register.Register);
end;

initialization
  RegisterPackage('atimagebox_package', @Register);
end.
