unit UPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Data.DB,
  Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Imaging.jpeg, Vcl.ComCtrls, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdDayTime, Data.Win.ADODB,
  Vcl.ToolWin, System.ImageList, Vcl.ImgList, Vcl.ActnMan, Vcl.ActnCtrls,
  Vcl.ActnMenus, Vcl.PlatformDefaultStyleActnCtrls, System.Actions, Vcl.ActnList,
  uAcceso, uData,
  Vcl.Grids, Vcl.DBGrids, dbisamtb;

type
  TfmPrincipal = class(TForm)
    StatusBar1: TStatusBar;
    ImagPrincipalLista: TImageList;
    ToolBar1: TToolBar;
    btPrincipalClientes: TToolButton;
    btPrincipalProveedores: TToolButton;
    btPrincipalTecnicos: TToolButton;
    btPrincipalInventario: TToolButton;
    btPrincipalArrendamientos: TToolButton;
    btPrincipalSalir: TToolButton;
    MenuPrincipal: TMainMenu;
    Menu11: TMenuItem;
    Configuracion1: TMenuItem;
    Opciones1: TMenuItem;
    cnicos1: TMenuItem;
    N1: TMenuItem;
    Salir1: TMenuItem;
    Menu21: TMenuItem;
    Inventario1: TMenuItem;
    Menu31: TMenuItem;
    Contratos1: TMenuItem;
    GestiondeAlquiles1: TMenuItem;
    Menu41: TMenuItem;
    Acercade1: TMenuItem;
    Reportes1: TMenuItem;
    Detalle1: TMenuItem;
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

uses UClientesa2, UProveedores, UInventario, UArrendamientos, UTecnicos;


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
fmArrendamientos := TfmArrendamientos.Create(Self);
fmArrendamientos.ShowModal;

fmArrendamientos.cbDuracion.Text := '';
fmArrendamientos.cbDeposito.Text := '';
fmArrendamientos.cbCliente.Text := '';
fmArrendamientos.cbTecnico.Text := '';
fmArrendamientos.edDocumento.Text := '';
fmArrendamientos.edCosto.Text := '';

fmArrendamientos.cbDuracion.Enabled := False;
fmArrendamientos.cbDeposito.Enabled := False;
fmArrendamientos.cbCliente.Enabled := False;
fmArrendamientos.cbTecnico.Enabled := False;
fmArrendamientos.edDocumento.Enabled := False;
fmArrendamientos.dtFecha.Enabled := False;
fmArrendamientos.edCosto.Enabled := False;

if (fmArrendamientos.cbDuracion.Enabled) or
   (fmArrendamientos.cbDeposito.Enabled) or
   (fmArrendamientos.cbCliente.Enabled) or
   (fmArrendamientos.cbTecnico.Enabled) or
   (fmArrendamientos.edDocumento.Enabled) or
   (fmArrendamientos.dtFecha.Enabled) or
   (fmArrendamientos.edCosto.Enabled)
then
begin
    fmArrendamientos.cbDuracion.Color := clWindow;
    fmArrendamientos.cbDeposito.Color := clWindow;
    fmArrendamientos.cbCliente.Color := clWindow;
    fmArrendamientos.cbTecnico.Color := clWindow;
    fmArrendamientos.edDocumento.Color := clWindow;
    fmArrendamientos.dtFecha.Color := clWindow;
    fmArrendamientos.edCosto.Color := clWindow;
end
else
begin
    fmArrendamientos.cbDuracion.Color := cl3dLight;
    fmArrendamientos.cbDeposito.Color := cl3dLight;
    fmArrendamientos.cbCliente.Color := cl3dLight;
    fmArrendamientos.cbTecnico.Color := cl3dLight;
    fmArrendamientos.edDocumento.Color := cl3dLight;
    fmArrendamientos.dtFecha.Color := cl3dLight;
    fmArrendamientos.edCosto.Color := cl3dLight;
end;

end;

procedure TfmPrincipal.btPrincipalClientesClick(Sender: TObject);
begin
  fmClientesa2 := TfmClientesa2.Create(Self); // Crear el formulario fmClientes
  fmClientesa2.ShowModal;
  fmClientesa2.edRutCliente.Text := '';
  fmClientesa2.edNombreCliente.Text := '';
  fmClientesa2.mmDireccionCliente.Text	:= '';
  fmClientesa2.cbClientePais.Text := '';
  fmClientesa2.cbClienteDepartamento.Text := '';
  fmClientesa2.cbClienteMunicipio.Text := '';
  fmClientesa2.edClienteCorreo.Text := '';
  fmClientesa2.edClienteTelefono.Text := '';
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
       fmClientesa2.edClienteZona.Color := cl3dLight;
       fmClientesa2.edClienteContacto.Color := cl3dLight;
   end

end;

procedure TfmPrincipal.btPrincipalProveedoresClick(Sender: TObject);
begin
fmProveedores := TfmProveedores.Create(Self);
fmProveedores.ShowModal;

  fmProveedores.edRutProveedor.Text := '';
  fmProveedores.edNombreProveedor.Text := '';
  fmProveedores.mmDireccionProveedor.Text	:= '';
  fmProveedores.cbProveedorPais.Text := '';
  fmProveedores.cbProveedorDepartamento.Text := '';
  fmProveedores.cbProveedorMunicipio.Text := '';
  fmProveedores.edProveedorCorreo.Text := '';
  fmProveedores.edProveedorTelefono.Text := '';
  fmProveedores.edProveedorContacto.Text := '';

  fmProveedores.edRutProveedor.Enabled := False;
  fmProveedores.edNombreProveedor.Enabled := False;
  fmProveedores.mmDireccionProveedor.Enabled	:= False;
  fmProveedores.cbProveedorPais.Enabled := False;
  fmProveedores.cbProveedorDepartamento.Enabled := False;
  fmProveedores.cbProveedorMunicipio.Enabled := False;
  fmProveedores.edProveedorCorreo.Enabled := False;
  fmProveedores.edProveedorTelefono.Enabled := False;
  fmProveedores.cbEstadoProveedores.Enabled := False;
  fmProveedores.edProveedorContacto.Enabled := False;

  if (fmProveedores.edRutProveedor.Enabled)  or
     (fmProveedores.edNombreProveedor.Enabled) or
     (fmProveedores.mmDireccionProveedor.Enabled) or
     (fmProveedores.cbProveedorPais.Enabled) or
     (fmProveedores.cbProveedorDepartamento.Enabled) or
     (fmProveedores.cbProveedorMunicipio.Enabled) or
     (fmProveedores.edProveedorCorreo.Enabled) or
     (fmProveedores.edProveedorTelefono.Enabled) or
     (fmProveedores.cbEstadoProveedores.Enabled) or
     (fmProveedores.edProveedorContacto.Enabled)
  then
  begin
       fmProveedores.edRutProveedor.Color := clWindow ;
       fmProveedores.edNombreProveedor.Color := clWindow;
       fmProveedores.mmDireccionProveedor.Color := clWindow;
       fmProveedores.cbProveedorPais.Color := clWindow;
       fmProveedores.cbProveedorDepartamento.Color := clWindow;
       fmProveedores.cbProveedorMunicipio.Color := clWindow;
       fmProveedores.edProveedorCorreo.Color := clWindow;
       fmProveedores.edProveedorTelefono.Color := clWindow;
       fmProveedores.cbEstadoProveedores.Color := clWindow;
       fmProveedores.edProveedorContacto.Color := clWindow;
  end
  else
  begin
       fmProveedores.edRutProveedor.Color := cl3dLight ;
       fmProveedores.edNombreProveedor.Color := cl3dLight;
       fmProveedores.mmDireccionProveedor.Color := cl3dLight;
       fmProveedores.cbProveedorPais.Color := cl3dLight;
       fmProveedores.cbProveedorDepartamento.Color := cl3dLight;
       fmProveedores.cbProveedorMunicipio.Color := cl3dLight;
       fmProveedores.edProveedorCorreo.Color := cl3dLight;
       fmProveedores.edProveedorTelefono.Color := cl3dLight;
       fmProveedores.cbEstadoProveedores.Color := cl3dLight;
       fmProveedores.edProveedorContacto.Color := cl3dLight;
   end
end;

procedure TfmPrincipal.btPrincipalSalirClick(Sender: TObject);
begin
application.Terminate;
end;

procedure TfmPrincipal.btPrincipalTecnicosClick(Sender: TObject);
begin
fmTecnicos := TfmTecnicos.Create(Self);
fmTecnicos.ShowModal;

  fmTecnicos.edRut.Text := '';
  fmTecnicos.edNombre.Text := '';
  fmTecnicos.mmDireccion.Text	:= '';
  fmTecnicos.edCorreo.Text := '';
  fmTecnicos.edTelefono.Text := '';
  fmTecnicos.edComision.Text := '';

  fmTecnicos.edRut.Enabled := False;
  fmTecnicos.edNombre.Enabled := False;
  fmTecnicos.mmDireccion.Enabled := False;
  fmTecnicos.edCorreo.Enabled := False;
  fmTecnicos.edTelefono.Enabled := False;
  fmTecnicos.edComision.Enabled := False;
  fmTecnicos.cbEstado.Enabled := False;

  if (fmTecnicos.edRut.Enabled)  or
     (fmTecnicos.edNombre.Enabled) or
     (fmTecnicos.mmDireccion.Enabled) or
     (fmTecnicos.edCorreo.Enabled) or
     (fmTecnicos.edTelefono.Enabled) or
     (fmTecnicos.edComision.Enabled) or
     (fmTecnicos.cbEstado.Enabled)
  then
  begin
       fmTecnicos.edRut.Color := clWindow ;
       fmTecnicos.edNombre.Color := clWindow;
       fmTecnicos.mmDireccion.Color := clWindow;
       fmTecnicos.edCorreo.Color := clWindow;
       fmTecnicos.edTelefono.Color := clWindow;
       fmTecnicos.edComision.Color := clWindow;
       fmTecnicos.cbEstado.Color := clWindow;
  end
  else
  begin
       fmTecnicos.edRut.Color := cl3dLight ;
       fmTecnicos.edNombre.Color := cl3dLight;
       fmTecnicos.mmDireccion.Color := cl3dLight;
       fmTecnicos.edCorreo.Color := cl3dLight;
       fmTecnicos.edTelefono.Color := cl3dLight;
       fmTecnicos.edComision.Color := cl3dLight;
       fmTecnicos.cbEstado.Color := cl3dLight;
   end
end;

procedure TfmPrincipal.btPrincipalInventarioClick(Sender: TObject);
begin
fmInventario := TfmInventario.Create(Self);
fmInventario.ShowModal;

  fmInventario.edRut.Text := '';
  fmInventario.edNombre.Text := '';
  fmInventario.cbCategoria.Text	:= '';
  fmInventario.cbDeposito.Text := '';
  fmInventario.edPrecio.Text := '';
  fmInventario.edExistencia.Text := '';

  fmInventario.edRut.Enabled := False;
  fmInventario.edNombre.Enabled := False;
  fmInventario.cbCategoria.Enabled := False;
  fmInventario.cbDeposito.Enabled := False;
  fmInventario.edPrecio.Enabled := False;
  fmInventario.cbEstado.Enabled := False;
  fmInventario.edExistencia.Enabled := False;

  if (fmInventario.edRut.Enabled)  or
     (fmInventario.edNombre.Enabled) or
     (fmInventario.cbCategoria.Enabled) or
     (fmInventario.cbDeposito.Enabled) or
     (fmInventario.edPrecio.Enabled) or
     (fmInventario.cbEstado.Enabled) or
     (fmInventario.edExistencia.Enabled)
  then
  begin
       fmInventario.edRut.Color := clWindow ;
       fmInventario.edNombre.Color := clWindow;
       fmInventario.cbCategoria.Color := clWindow;
       fmInventario.cbDeposito.Color := clWindow;
       fmInventario.edPrecio.Color := clWindow;
       fmInventario.cbEstado.Color := clWindow;
       fmInventario.edExistencia.Color := clWindow;
  end
  else
  begin
       fmInventario.edRut.Color := cl3dLight ;
       fmInventario.edNombre.Color := cl3dLight;
       fmInventario.cbCategoria.Color := cl3dLight;
       fmInventario.cbDeposito.Color := cl3dLight;
       fmInventario.edPrecio.Color := cl3dLight;
       fmInventario.cbEstado.Color := cl3dLight;
       fmInventario.edExistencia.Color := cl3dLight;
   end
end;

end.
