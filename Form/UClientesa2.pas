unit UClientesa2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Menus, Vcl.ComCtrls,
  Vcl.ToolWin, UPrincipal, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, dbisamtb,
  Vcl.CheckLst, System.ImageList, Vcl.ImgList, UBuscarClientes;

type
  TfmClientesa2 = class(TForm)
    ToolBar1: TToolBar;
    btBuscarClientes: TToolButton;
    DBISAMDatabase1: TDBISAMDatabase;
    DBISAMTable1: TDBISAMTable;
    DataSource1: TDataSource;
    ImageList1: TImageList;
    procedure btBuscarClientesClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmClientesa2: TfmClientesa2;

implementation

{$R *.dfm}

procedure TfmClientesa2.btBuscarClientesClick(Sender: TObject);
begin
fmBuscarClientes.ShowModal ;
end;

end.
