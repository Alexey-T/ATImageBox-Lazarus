unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  ExtDlgs, Spin, atimagebox;

type
  { TForm1 }

  TForm1 = class(TForm)
    btnOpen: TButton;
    chkCheckers: TCheckBox;
    chkFitBig: TCheckBox;
    chkFitToWindow: TCheckBox;
    chkCenter: TCheckBox;
    LabelStatus: TLabel;
    Dlg: TOpenPictureDialog;
    Panel1: TPanel;
    Panel2: TPanel;
    edCheckersSize: TSpinEdit;
    procedure btnOpenClick(Sender: TObject);
    procedure chkCenterChange(Sender: TObject);
    procedure chkCheckersChange(Sender: TObject);
    procedure chkFitBigChange(Sender: TObject);
    procedure chkFitToWindowChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edCheckersSizeChange(Sender: TObject);
  private
    box: TATImagebox;
    FDirImages: string;
    procedure UpdateStatus(Sender: TObject);
  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
var
  fn: string;
begin
  box:= TATImageBox.Create(Self);
  box.Parent:= Panel1;
  box.Align:= alClient;
  box.Color:= clMedGray;
  box.BorderStyle:= bsNone;
  box.OptFitToWindow:= true;
  box.OptCenter:= true;
  box.OnScroll:= @UpdateStatus;

  FDirImages:= ExtractFilePath(Application.ExeName)+DirectorySeparator+'images';
  fn:= FDirImages+DirectorySeparator+'test.jpg';
  if FileExists(fn) then
    box.LoadFromFile(fn);
end;

procedure TForm1.edCheckersSizeChange(Sender: TObject);
begin
  box.OptChechersSize:= edCheckersSize.Value;
end;

procedure TForm1.UpdateStatus(Sender: TObject);
begin
  LabelStatus.Caption:= IntToStr(box.ImageZoom)+'%';
end;

procedure TForm1.chkFitToWindowChange(Sender: TObject);
begin
  box.OptFitToWindow:= chkFitToWindow.Checked;
end;

procedure TForm1.chkCenterChange(Sender: TObject);
begin
  box.OptCenter:= chkCenter.Checked;
end;

procedure TForm1.chkCheckersChange(Sender: TObject);
begin
  box.OptCheckers:= chkCheckers.Checked;
end;

procedure TForm1.btnOpenClick(Sender: TObject);
begin
  Dlg.InitialDir:= FDirImages;
  if Dlg.Execute then
  begin
    box.LoadFromFile(Dlg.FileName);
  end;
end;

procedure TForm1.chkFitBigChange(Sender: TObject);
begin
  box.OptFitOnlyBig:= chkFitBig.Checked;
end;

end.

