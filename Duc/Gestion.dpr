program Gestion;

uses
  Vcl.Forms,
  UPrincipal in '..\Form\UPrincipal.pas' {fmPrincipal},
  UClientesa2 in '..\Form\UClientesa2.pas' {fmClientesa2},
  uAcceso in '..\Form\uAcceso.pas' {fmAcceso},
  Vcl.Themes,
  Vcl.Styles,
  UBuscarClientes in '..\Form\UBuscarClientes.pas' {fmBuscarClientes},
  UModificarClientes in '..\Form\UModificarClientes.pas' {fmModificarClientes},
  UProveedores in '..\Form\UProveedores.pas' {fmProveedores},
  UTecnicos in '..\Form\UTecnicos.pas' {fmTecnicos},
  UInventario in '..\Form\UInventario.pas' {fmInventario},
  uData in '..\Form\uData.pas' {moduloDatos: TDataModule},
  UArrendamientos in '..\Form\UArrendamientos.pas' {fmArrendamientos},
  UBuscarInventarios in '..\Form\UBuscarInventarios.pas' {fmBuscarInventario},
  UModificarInventarios in '..\Form\UModificarInventarios.pas' {fmModificarInventario},
  UBuscarProveedores in '..\Form\UBuscarProveedores.pas' {fmBuscarProveedores},
  UModificarProveedores in '..\Form\UModificarProveedores.pas' {fmModificarProveedores},
  UBuscarTecnicos in '..\Form\UBuscarTecnicos.pas' {fmBuscarTecnicos},
  UModificarTecnicos in '..\Form\UModificarTecnicos.pas' {fmModificarTecnicos};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Silver');
  Application.CreateForm(TmoduloDatos, moduloDatos);
  Application.CreateForm(TfmAcceso, fmAcceso);
  Application.Run;
end.
