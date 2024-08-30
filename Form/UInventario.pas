unit UInventario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, System.ImageList,
  Vcl.ImgList, Vcl.ComCtrls, Vcl.ToolWin, UBuscarInventarios,
  UModificarInventarios;

type
  TfmInventario = class(TForm)
    ToolBar1: TToolBar;
    btBuscarClientes: TToolButton;
    btAgregarInventario: TToolButton;
    btModificarInventario: TToolButton;
    btGuardarInventario: TToolButton;
    btCancelarInventario: TToolButton;
    btBorrarInventario: TToolButton;
    btSalirInventario: TToolButton;
    ImagInventarioLista: TImageList;
    MainMenu1: TMainMenu;
    Menu1: TMenuItem;
    Buscar1: TMenuItem;
    Agregar1: TMenuItem;
    Modificar1: TMenuItem;
    Guardar1: TMenuItem;
    Cancelar1: TMenuItem;
    Borrar1: TMenuItem;
    N1: TMenuItem;
    Salir1: TMenuItem;
    Consultar1: TMenuItem;
    EstadodeCuenta1: TMenuItem;
    OperacionesComerciales1: TMenuItem;
    ProductosComprados1: TMenuItem;
    Configuraciones1: TMenuItem;
    erceros1: TMenuItem;
    procedure btSalirInventarioClick(Sender: TObject);
    procedure btBuscarClientesClick(Sender: TObject);
    procedure btModificarInventarioClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmInventario: TfmInventario;

implementation

{$R *.dfm}

procedure TfmInventario.btBuscarClientesClick(Sender: TObject);
begin
  fmBuscarProductos.ShowModal;
end;

procedure TfmInventario.btModificarInventarioClick(Sender: TObject);
begin
fmModificarInventarios.ShowModal;
end;

procedure TfmInventario.btSalirInventarioClick(Sender: TObject);
begin
Close;
end;

end.
