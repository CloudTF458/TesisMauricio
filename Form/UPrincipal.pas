unit UPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Data.DB,
  Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Imaging.jpeg, Vcl.ComCtrls, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdDayTime, Data.Win.ADODB,
  Vcl.ToolWin, System.ImageList, Vcl.ImgList, Vcl.ActnMan, Vcl.ActnCtrls,
  Vcl.ActnMenus, Vcl.PlatformDefaultStyleActnCtrls, System.Actions, Vcl.ActnList,
  uAcceso, UProveedores, UTecnicos, uData, UInventario, UArrendamientos,
  Vcl.Grids, Vcl.DBGrids, dbisamtb;

type
  TfmPrincipal = class(TForm)
    MenuPrincipal: TMainMenu;
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
    ImagPrincipalLista: TImageList;
    ToolBar1: TToolBar;
    btPrincipalClientes: TToolButton;
    btPrincipalProveedores: TToolButton;
    btPrincipalTecnicos: TToolButton;
    btPrincipalInventario: TToolButton;
    btPrincipalArrendamientos: TToolButton;
    btPrincipalSalir: TToolButton;
    procedure btSalirClick(Sender: TObject);
    procedure btPrincipalClientesClick(Sender: TObject);
    procedure Salir1Click(Sender: TObject);
    procedure Configuracion1Click(Sender: TObject);
    procedure btPrincipalProveedoresClick(Sender: TObject);
    procedure btPrincipalTecnicosClick(Sender: TObject);
    procedure btPrincipalInventarioClick(Sender: TObject);
    procedure btPrincipalArrendamientosClick(Sender: TObject);
    procedure btPrincipalSalirClick(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmPrincipal: TfmPrincipal;

implementation

{$R *.dfm}

uses UClientesa2;


procedure TfmPrincipal.btSalirClick(Sender: TObject);
begin
close;
end;

procedure TfmPrincipal.Configuracion1Click(Sender: TObject);
begin
fmClientesa2.ShowModal;
end;

procedure TfmPrincipal.Salir1Click(Sender: TObject);
begin
Close;
end;

procedure TfmPrincipal.btPrincipalArrendamientosClick(Sender: TObject);
begin
fmArrendamientos.ShowModal;
end;

procedure TfmPrincipal.btPrincipalClientesClick(Sender: TObject);
begin
  fmClientesa2 := TfmClientesa2.Create(Self); // Crear el formulario fmPrincipal
  fmClientesa2.ShowModal;
  fmClientesa2.edRutCliente.Text := '';
  fmClientesa2.edNombreCliente.Text := '';
  fmClientesa2.mmDireccionCliente.Text	:= '';
  fmClientesa2.cbClientePais.Text := '';
  fmClientesa2.cbClienteDepartamento.Text := '';
  fmClientesa2.cbClienteMunicipio.Text := '';
  fmClientesa2.edClienteCorreo.Text := '';
  fmClientesa2.edClienteTelefono.Text := '';
  fmClientesa2.edClienteCelular.Text := '';
  fmClientesa2.edClienteZona.Text := '';
  fmClientesa2.edClienteContacto.Text := '';

  fmClientesa2.edRutCliente.Enabled := False;
  fmClientesa2.edNombreCliente.Enabled := False;
  fmClientesa2.mmDireccionCliente.Enabled	:= False;
  fmClientesa2.cbClientePais.Enabled := False;
  fmClientesa2.cbClienteDepartamento.Enabled := False;
  fmClientesa2.cbClienteMunicipio.Enabled := False;
  fmClientesa2.edClienteCorreo.Enabled := False;
  fmClientesa2.edClienteTelefono.Enabled := False;
  fmClientesa2.edClienteCelular.Enabled := False;
  fmClientesa2.edClienteZona.Enabled := False;
  fmClientesa2.edClienteContacto.Enabled := False;

  if (fmClientesa2.edRutCliente.Enabled)  or
     (fmClientesa2.edNombreCliente.Enabled) or
     (fmClientesa2.mmDireccionCliente.Enabled) or
     (fmClientesa2.cbClientePais.Enabled) or
     (fmClientesa2.cbClienteDepartamento.Enabled) or
     (fmClientesa2.cbClienteMunicipio.Enabled) or
     (fmClientesa2.edClienteCorreo.Enabled) or
     (fmClientesa2.edClienteTelefono.Enabled) or
     (fmClientesa2.edClienteCelular.Enabled)  or
     (fmClientesa2.edClienteZona.Enabled) or
     (fmClientesa2.edClienteContacto.Enabled)
  then
  begin
       fmClientesa2.edRutCliente.Color := clWindow ;
       fmClientesa2.edNombreCliente.Color := clWindow;
       fmClientesa2.mmDireccionCliente.Color := clWindow;
       fmClientesa2.cbClientePais.Color := clWindow;
       fmClientesa2.cbClienteDepartamento.Color := clWindow;
       fmClientesa2.cbClienteMunicipio.Color := clWindow;
       fmClientesa2.edClienteCorreo.Color := clWindow;
       fmClientesa2.edClienteTelefono.Color := clWindow;
       fmClientesa2.edClienteCelular.Color := clWindow;
       fmClientesa2.edClienteZona.Color := clWindow;
       fmClientesa2.edClienteContacto.Color := clWindow;
  end
  else
  begin


       fmClientesa2.edRutCliente.Color := cl3dLight;
       fmClientesa2.edNombreCliente.Color := cl3dLight;
       fmClientesa2.mmDireccionCliente.Color := cl3dLight;
       fmClientesa2.cbClientePais.Color := cl3dLight;
       fmClientesa2.cbClienteDepartamento.Color := cl3dLight;
       fmClientesa2.cbClienteMunicipio.Color := cl3dLight;
       fmClientesa2.edClienteCorreo.Color := cl3dLight;
       fmClientesa2.edClienteTelefono.Color := cl3dLight;
       fmClientesa2.edClienteCelular.Color := cl3dLight;
       fmClientesa2.edClienteZona.Color := cl3dLight;
       fmClientesa2.edClienteContacto.Color := cl3dLight;
   end

end;

procedure TfmPrincipal.btPrincipalProveedoresClick(Sender: TObject);
begin
fmProveedores.ShowModal;
end;

procedure TfmPrincipal.btPrincipalSalirClick(Sender: TObject);
begin
application.Terminate;
end;

procedure TfmPrincipal.btPrincipalTecnicosClick(Sender: TObject);
begin
fmTecnicos.ShowModal;
end;

procedure TfmPrincipal.btPrincipalInventarioClick(Sender: TObject);
begin
fmInventario.ShowModal;
end;

end.
