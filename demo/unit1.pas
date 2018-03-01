unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  ExtDlgs, atimagebox;

type
  { TForm1 }

  TForm1 = class(TForm)
    btnOpen: TButton;
    chkFitBig: TCheckBox;
    chkFitToWindow: TCheckBox;
    chkCenter: TCheckBox;
    LabelStatus: TLabel;
    OpenPictureDialog1: TOpenPictureDialog;
    Panel1: TPanel;
    Panel2: TPanel;
    procedure btnOpenClick(Sender: TObject);
    procedure chkCenterChange(Sender: TObject);
    procedure chkFitBigChange(Sender: TObject);
    procedure chkFitToWindowChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    box: TATImagebox;
    procedure UpdateStatus(Sender: TObject);
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
  box.OnScroll:= @UpdateStatus;
end;

procedure TForm1.UpdateStatus(Sender: TObject);
begin
  LabelStatus.Caption:= IntToStr(box.ImageScale)+'%';
end;

procedure TForm1.chkFitToWindowChange(Sender: TObject);
begin
  box.ImageFitToWindow:= chkFitToWindow.Checked;
end;

procedure TForm1.chkCenterChange(Sender: TObject);
begin
  box.ImageCenter:= chkCenter.Checked;
end;

procedure TForm1.btnOpenClick(Sender: TObject);
begin
  if OpenPictureDialog1.Execute then
  begin
    box.LoadFromFile(OpenPictureDialog1.FileName);
  end;
end;

procedure TForm1.chkFitBigChange(Sender: TObject);
begin
  box.ImageFitOnlyBig:= chkFitBig.Checked;
end;

end.

