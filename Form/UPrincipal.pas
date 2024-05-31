unit UPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Data.DB,
  Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Imaging.jpeg, Vcl.ComCtrls, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdDayTime, Data.Win.ADODB,
  Vcl.ToolWin, System.ImageList, Vcl.ImgList, Vcl.ActnMan, Vcl.ActnCtrls,
  Vcl.ActnMenus, Vcl.PlatformDefaultStyleActnCtrls, System.Actions, Vcl.ActnList,
  uAcceso;

type
  TfmPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    Menu11: TMenuItem;
    Menu21: TMenuItem;
    Menu31: TMenuItem;
    Menu41: TMenuItem;
    Configuracion1: TMenuItem;
    Opciones1: TMenuItem;
    N1: TMenuItem;
    Salir1: TMenuItem;
    Acercade1: TMenuItem;
    Inventario1: TMenuItem;
    Contratos1: TMenuItem;
    GestiondeAlquiles1: TMenuItem;
    cnicos1: TMenuItem;
    Reportes1: TMenuItem;
    Detalle1: TMenuItem;
    StatusBar1: TStatusBar;
    ImageList1: TImageList;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    procedure Departamentos1Click(Sender: TObject);
    procedure btSalirClick(Sender: TObject);
    procedure Inventario1Click(Sender: TObject);
    procedure btInventarioa2Click(Sender: TObject);
    procedure btClientesClick(Sender: TObject);
    procedure Query1Click(Sender: TObject);
    procedure CuentasporCobrar1Click(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmPrincipal: TfmPrincipal;

implementation

{$R *.dfm}

uses UDepartamentos, UInventarioa2, UClientesa2, Ucuentasxcobrar, UQuery;

procedure TfmPrincipal.btSalirClick(Sender: TObject);
begin
close;
end;

procedure TfmPrincipal.CuentasporCobrar1Click(Sender: TObject);
begin
//fmcxc.Show;
end;

procedure TfmPrincipal.btClientesClick(Sender: TObject);
begin
//fmClientesa2.Show;
end;

procedure TfmPrincipal.btInventarioa2Click(Sender: TObject);
begin
//fmInventario.show;
end;


procedure TfmPrincipal.Departamentos1Click(Sender: TObject);
begin
//FmDepartamentos.Show;
end;

procedure TfmPrincipal.Inventario1Click(Sender: TObject);
begin
//fmInventario.Show;
end;

procedure TfmPrincipal.Query1Click(Sender: TObject);
begin
//form1.Show;
end;

procedure TfmPrincipal.ToolButton1Click(Sender: TObject);
begin
fmClientesa2.ShowModal;
end;

end.