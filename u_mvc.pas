unit U_mvc;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,uCanvasDemo;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure FormPaint(Sender: TObject);
    procedure DrawRow1(Canvas1 : TCanvas);
    procedure DrawRow2(Canvas1 : TCanvas);
    procedure DrawRow3(Canvas1: TCanvas);
    procedure DrawRow4(Canvas1: TCanvas);
    procedure FormResize(Sender: TObject);
    procedure Grid(MaxWidth, MaxHeight : integer);
  private

  public

  end;

var
  Form1: TForm1;
  MaxX, MaxY, Col1, Col2, Col3, Row1, Row2, Row3,
  X, Y : integer;
  PentagonPoints : array[1 .. 6] of TPoint;
  TrianglePoints : array[1 .. 4] of TPoint;


implementation


{$R *.lfm}
const
  HB = 100;     //Horizontal border
  VB = 100;     //Vertical border

{ TForm1 }

procedure TForm1.Button2Click(Sender: TObject);
begin
  ShowMessage('Databse,Ws,etc  library class');
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  ShowMessage('HTML');
end;

procedure TForm1.Button4Click(Sender: TObject);
begin

end;

procedure TForm1.FormCreate(Sender: TObject);
begin

end;

procedure TForm1.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var MyPuthaiX,MyPuthaiY:Integer;
   begin
    Self.Caption:='X:='+IntToStr(X)+',Y:='+IntToStr(Y);
end;

procedure TForm1.FormPaint(Sender: TObject);
begin
 Grid(ClientWidth, ClientHeight);
    Canvas.Pen.Width:=5;
    Canvas.Pen.Color:=clPurple;
    Canvas.Line(294,111,294,63);
    Canvas.Line(389,108,389,212);
    Canvas.Line(227,160,204,206);
    Canvas.Line(175,151,141,205);
    Canvas.Line(302,152,315,215);
    with Canvas do
    begin
     pen.Color := clRed;
      brush.Color := clRed;
      TrianglePoints[1] := Point(369,102);  //left
      TrianglePoints[2] := Point(402,105); //right
      TrianglePoints[3] := Point(388,89); //middle
      TrianglePoints[4] := TrianglePoints[1];
      polygon(TrianglePoints );

      TrianglePoints[1] := Point(208,160);  //left
      TrianglePoints[2] := Point(236,175); //right
      TrianglePoints[3] := Point(225,160); //middle
      TrianglePoints[4] := TrianglePoints[1];
      polygon(TrianglePoints );

      TrianglePoints[1] := Point(284,99);  //left
      TrianglePoints[2] := Point(307,100); //right
      TrianglePoints[3] := Point(292,111); //middle
      TrianglePoints[4] := TrianglePoints[1];
      polygon(TrianglePoints );

     TrianglePoints[1] := Point(294,197);  //left
      TrianglePoints[2] := Point(315,214); //right
      TrianglePoints[3] := Point(322,189); //middle
      TrianglePoints[4] := TrianglePoints[1];
      polygon(TrianglePoints );

      TrianglePoints[1] := Point(138,183); //left
      TrianglePoints[2] := Point(162,190); //right
      TrianglePoints[3] := Point(141,204); //middle
      TrianglePoints[4] := TrianglePoints[1];
      polygon(TrianglePoints );

    end;
    //DrawRow1(Canvas);
    //DrawRow2(Canvas);
    //DrawRow3(Canvas);
    //DrawRow4(Canvas);

end;

procedure TForm1.DrawRow1(Canvas1: TCanvas);
begin
  with Canvas do
    begin
      //Red rectangle
      pen.Color := clRed;
      rectangle(HB , VB, Col1 - HB, Row1 - VB);
      //Yellow filled rectangle
      brush.Color := clYellow;
      rectangle(Col1 + HB, VB, Col2 - HB, Row1 - VB);
      //Green circle needs bounding square
      pen.Color := clGreen;
      brush.Color := clBtnFace;
      ellipse(Col2 + HB, VB, Col3 - HB, Row1 - VB);
      //Blue filled ellipse needs bounding rectangle
      pen.Color := clBlue;
      brush.Color := clBlue;
      ellipse(Col3 + 2 * HB, VB, MaxX - 2 * HB, Row1 - VB);
    end;
end;

procedure TForm1.DrawRow2(Canvas1: TCanvas);
begin
  with Canvas do
    begin
      //Aqua line (solid)
      pen.Color := clAqua;
      pen.width := 4;
      moveTo(HB, Row1 + VB);
      lineTo (Col1 - HB, Row2 - VB);
      //Teal dashed line
      moveTo( Col1 + HB, Row2 - VB);
      pen.Width := 1;
      pen.Style := psDash;
      pen.Color:= clTeal;
      lineTo(Col2 - HB, Row1 + VB);
      //White ellipse with light grey outline
      pen.Color := clLtGray;
      pen.Style := psSolid;
      brush.Color := clBtnFace;
      Ellipse(Col2 + 2 * HB, Row1 + VB, Col3 - 2 * HB, Row2 - VB);
      //Purple filled circle
      pen.Color := clPurple;
      brush.Color := clPurple;
      Ellipse(Col3 + HB, Row1 + VB, MaxX - HB, Row2 - VB);
end;

end;

procedure TForm1.DrawRow3(Canvas1: TCanvas);
begin
  with Canvas do
    begin
      //Three quarters of lime ellipse
      pen.Color := clLime;
      brush.Color := clLime;
      pie(HB, Row2 + VB, Col1-HB, Row3 - VB, HB + Row1 div 2, Row2 + VB,
         Row2 + VB + Row1 div 2, Row2 + VB + Row1 div 2);
      //Dark grey rounded rectangle
      pen.Color := clDkGray;
      brush.Color := clDkGray;
      roundRect(Col1 + 2 * HB, Row2 + VB, Col2 - 2 * HB, Row3 - VB, 20, 20);
      //Fuchsia  pentagon
      pen.color := clFuchsia;
      PentagonPoints[1] := Point((Col3 + Col2) DIV 2,Row2 + VB);
      PentagonPoints[2] := Point(Col3 - HB,(Row2 + Row3) DIV 2);
      PentagonPoints[3] := Point(Col3 - (Col1 DIV 3), Row3 - VB);
      PentagonPoints[4] := Point(Col2 + (Col1 DIV 3), Row3 - VB);
      PentagonPoints[5] := Point(Col2 +  HB,(Row2 + Row3) DIV 2);
      PentagonPoints[6] := PentagonPoints[1];
      polyline(PentagonPoints);
      //Red filled triangle
      pen.Color := clRed;
      brush.Color := clRed;
      TrianglePoints[1] := Point((Col3 + MaxX) DIV 2, Row2 + VB);
      TrianglePoints[2] := Point(MaxX - HB, Row3 - VB);
      TrianglePoints[3] := Point(Col3 + HB, Row3 - VB);
      TrianglePoints[4] := TrianglePoints[1];
      polygon(TrianglePoints );
  end;
end;

procedure TForm1.DrawRow4(Canvas1: TCanvas);
var
  Count : integer;
begin
  with Canvas do
    begin
      //Navy arc of ellipse
      pen.Color := clNavy;
      arc(HB, Row3 + VB, Col1 - HB, MaxY - VB,
          HB + Row1 div 2, Row3 + VB, HB, Row3 + VB + Row1 div 2);
      //Blue text
      font.Color := clBlue;
      font.Size := 10;
      TextOut(col1 + HB, (Row3 + MaxY) DIV 2, 'pp4s.co.uk');
      //Maroon curve
      pen.Color := clMaroon;
      brush.Color := clMaroon;
      Count := 0;
      X := Col2 + HB;
      Y := Row3 + VB;
      while (X <= Col3) and (Y <= MaxY) do
        begin
          Rectangle(X - 1, Y - 1, X + 1, Y + 1);
          inc(Count);
          X := Col2 + HB + (Count * MaxX ) DIV 40;
          Y := Row3 + VB + (Count * Count * MaxY) DIV 150;
        end;
      pen.Color := clNavy;
      brush.Color := clSilver;
      Chord(HB + Col3, VB + Row3, MaxX - HB, MaxY - VB,
            HB + Col3, VB + Row3, MaxX - HB, MaxY - VB);
    end;
end;

procedure TForm1.FormResize(Sender: TObject);
begin
  Grid(ClientWidth, ClientHeight);
  Invalidate;
end;

procedure TForm1.Grid(MaxWidth, MaxHeight: integer);
begin
  Col1 := MaxWidth DIV 4;  //End of column
  Col2 := MaxWidth DIV 2;
  Col3 := Col1 + Col2;
  Row1 := MaxHeight DIV 4;   //End of row
  Row2 := MaxHeight DIV 2;
  Row3 := Row1 + Row2;
  MaxX := MaxWidth;
  MaxY := MaxHeight;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  ShowMessage('store code for Processs data from database ');
end;

end.

