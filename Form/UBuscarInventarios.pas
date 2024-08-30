unit UBuscarInventarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, System.ImageList,
  Vcl.ImgList, Vcl.Grids, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ActnMan,
  Vcl.ActnCtrls, Vcl.ToolWin;

type
  TfmBuscarProductos = class(TForm)
    ToolBar1: TToolBar;
    btOrdenarProductos: TToolButton;
    btInformeProducto: TToolButton;
    btSalirBuscarProductos: TToolButton;
    ActionToolBar1: TActionToolBar;
    edBuscarProductos: TEdit;
    lbBuscarDescripcioninv: TLinkLabel;
    StatusBar1: TStatusBar;
    StringGrid1: TStringGrid;
    ImagBuscarInventarioLista: TImageList;
    MenuOrdenarInventario: TPopupMenu;
    Nombre1: TMenuItem;
    Documento1: TMenuItem;
    Contacto1: TMenuItem;
    Ciudad1: TMenuItem;
    MenuInformeInventario: TPopupMenu;
    EstadodeCuenta1: TMenuItem;
    Ventas1: TMenuItem;
    ransaccionesComerciales1: TMenuItem;
    Modelo1: TMenuItem;
    Marca1: TMenuItem;
    Proveedores1: TMenuItem;
    Operaciones1: TMenuItem;
    procedure btSalirBuscarProductosClick(Sender: TObject);
    procedure Nombre1Click(Sender: TObject);
    procedure Documento1Click(Sender: TObject);
    procedure Contacto1Click(Sender: TObject);
    procedure Ciudad1Click(Sender: TObject);
    procedure Modelo1Click(Sender: TObject);
    procedure Marca1Click(Sender: TObject);
    procedure StringGrid1Click(Sender: TObject);
    procedure edBuscarProductosClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmBuscarProductos: TfmBuscarProductos;

implementation

{$R *.dfm}

procedure TfmBuscarProductos.btSalirBuscarProductosClick(Sender: TObject);
begin
Close;
end;

procedure TfmBuscarProductos.Ciudad1Click(Sender: TObject);
begin
lbBuscarDescripcioninv.Caption := 'Departamento :';
edBuscarProductos.Text := '';
edBuscarProductos.SetFocus;
end;

procedure TfmBuscarProductos.Contacto1Click(Sender: TObject);
begin
lbBuscarDescripcioninv.Caption := 'Referencia :';
edBuscarProductos.Text := '';
edBuscarProductos.SetFocus;
end;

procedure TfmBuscarProductos.Documento1Click(Sender: TObject);
begin
lbBuscarDescripcioninv.Caption := 'Descripci�n :';
edBuscarProductos.Text := '';
edBuscarProductos.SetFocus;
end;

procedure TfmBuscarProductos.edBuscarProductosClick(Sender: TObject);
begin
btInformeProducto.Enabled := False;
end;

procedure TfmBuscarProductos.Marca1Click(Sender: TObject);
begin
lbBuscarDescripcioninv.Caption := 'Marca :';
edBuscarProductos.Text := '';
edBuscarProductos.SetFocus;
end;

procedure TfmBuscarProductos.Modelo1Click(Sender: TObject);
begin
lbBuscarDescripcioninv.Caption := 'Modelo :';
edBuscarProductos.Text := '' ;
edBuscarProductos.SetFocus;
end;

procedure TfmBuscarProductos.Nombre1Click(Sender: TObject);
begin
lbBuscarDescripcioninv.Caption := 'C�digo :';
edBuscarProductos.Text := '' ;
edBuscarProductos.SetFocus;
end;

procedure TfmBuscarProductos.StringGrid1Click(Sender: TObject);
begin
btInformeProducto.Enabled := True;
end;

end.