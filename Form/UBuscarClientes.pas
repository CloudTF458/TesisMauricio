unit UBuscarClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.ImageList, Vcl.ImgList,
  Vcl.ToolWin, Vcl.ComCtrls, Vcl.Menus, Vcl.ActnMan, Vcl.ActnCtrls, Vcl.StdCtrls;

type
  TfmBuscarClientes = class(TForm)
    ImageList1: TImageList;
    ToolBar1: TToolBar;
    btOrdenarClientes: TToolButton;
    PopupMenu1: TPopupMenu;
    Nombre1: TMenuItem;
    Documento1: TMenuItem;
    Contacto1: TMenuItem;
    Ciudad1: TMenuItem;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmBuscarClientes: TfmBuscarClientes;

implementation

{$R *.dfm}

end.
