unit UProveedores;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, System.ImageList,
  Vcl.ImgList, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ToolWin;

type
  TfmProveedores = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    ToolBar1: TToolBar;
    btBuscarClientes: TToolButton;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Memo1: TMemo;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit3: TEdit;
    Edit7: TEdit;
    ImagProveedoreslLista: TImageList;
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
    procedure ToolButton6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmProveedores: TfmProveedores;

implementation

{$R *.dfm}

procedure TfmProveedores.ToolButton6Click(Sender: TObject);
begin
Close;
end;

end.
