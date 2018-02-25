unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs,
  atimagebox;

type
  { TForm1 }

  TForm1 = class(TForm)
    procedure FormCreate(Sender: TObject);
  private
    box: TATImagebox;
  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin
  box:= TATImageBox.Create(Self);
  box.Parent:= Self;
  box.Align:= alClient;
  box.ImageCenter:= true;
  box.LoadFromFile(ExtractFilePath(Application.ExeName)+'test.jpg');
end;

end.

