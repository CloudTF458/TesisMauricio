program Gestion;

uses
  Vcl.Forms,
  UPrincipal in '..\Form\UPrincipal.pas' {fmPrincipal},
  UDepartamentos in '..\Form\UDepartamentos.pas' {fmDepartamentos},
  UInventarioa2 in '..\Form\UInventarioa2.pas' {fmInventario},
  UClientesa2 in '..\Form\UClientesa2.pas' {fmClientesa2},
  Ucuentasxcobrar in '..\Form\Ucuentasxcobrar.pas' {fmcxc},
  UQuery in '..\Form\UQuery.pas' {Form1},
  uAcceso in '..\Form\uAcceso.pas' {frmacceso},
  Vcl.Themes,
  Vcl.Styles,
  UBuscarClientes in '..\Form\UBuscarClientes.pas' {fmBuscarClientes};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Silver');
  Application.CreateForm(TfmPrincipal, fmPrincipal);
  Application.CreateForm(TfmClientesa2, fmClientesa2);
  Application.CreateForm(Tfrmacceso, frmacceso);
  Application.CreateForm(TfmBuscarClientes, fmBuscarClientes);
  Application.Run;
end.
