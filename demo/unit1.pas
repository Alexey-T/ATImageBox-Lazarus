unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  atimagebox;

type
  { TForm1 }

  TForm1 = class(TForm)
    chkFitToWindow: TCheckBox;
    chkCenter: TCheckBox;
    Panel1: TPanel;
    Panel2: TPanel;
    procedure chkCenterChange(Sender: TObject);
    procedure chkFitToWindowChange(Sender: TObject);
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
  box.Parent:= Panel1;
  box.Align:= alClient;
  box.ImageCenter:= true;
  box.LoadFromFile(ExtractFilePath(Application.ExeName)+'test.jpg');
end;

procedure TForm1.chkFitToWindowChange(Sender: TObject);
begin
  box.ImageFitToWindow:= chkFitToWindow.Checked;
end;

procedure TForm1.chkCenterChange(Sender: TObject);
begin
  box.ImageCenter:= chkCenter.Checked;
end;

end.

