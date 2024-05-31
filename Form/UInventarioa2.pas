unit UInventarioa2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.DBCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls, Data.Win.ADODB;

type
  TfmInventario = class(TForm)
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmInventario: TfmInventario;

implementation

{$R *.dfm}

procedure TfmInventario.Button1Click(Sender: TObject);
begin
close;
end;

procedure TfmInventario.FormCreate(Sender: TObject);
begin
   close;
end;

end.
