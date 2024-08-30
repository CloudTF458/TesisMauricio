unit UClientesa2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Menus, Vcl.ComCtrls,
  Vcl.ToolWin, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, dbisamtb,
  Vcl.CheckLst, System.ImageList, Vcl.ImgList, UBuscarClientes, uData;

type
  TfmClientesa2 = class(TForm)
    ToolBar1: TToolBar;
    btBuscarClientes: TToolButton;
    ImagClientesLista: TImageList;
    MenuClientes: TMainMenu;
    Menu1: TMenuItem;
    Buscar1: TMenuItem;
    Agregar1: TMenuItem;
    Modificar1: TMenuItem;
    Guardar1: TMenuItem;
    Borrar1: TMenuItem;
    N1: TMenuItem;
    Salir1: TMenuItem;
    Consultar1: TMenuItem;
    Configuraciones1: TMenuItem;
    EstadodeCuenta1: TMenuItem;
    OperacionesComerciales1: TMenuItem;
    ProductosComprados1: TMenuItem;
    erceros1: TMenuItem;
    btAgregarClientes: TToolButton;
    btModificarClientes: TToolButton;
    btGuardarCliente: TToolButton;
    btCancelarClientes: TToolButton;
    btBorrarClientes: TToolButton;
    btSalirClientes: TToolButton;
    Cancelar1: TMenuItem;
    edNombreCliente: TEdit;
    lbNombreCliente: TLabel;
    lbRut: TLabel;
    edRutCliente: TEdit;
    lbDireccionCliente: TLabel;
    mmDireccionCliente: TMemo;
    lbMunicipioCliente: TLabel;
    cbClienteMunicipio: TComboBox;
    lbDepartamentoCliente: TLabel;
    cbClienteDepartamento: TComboBox;
    lbPaisCliente: TLabel;
    cbClientePais: TComboBox;
    lbCorreoCliente: TLabel;
    lbTelefonoCliente: TLabel;
    edClienteTelefono: TEdit;
    edClienteCorreo: TEdit;
    lbCelularCliente: TLabel;
    edClienteCelular: TEdit;
    lbZonaCliente: TLabel;
    edClienteZona: TEdit;
    lbContactoCliente: TLabel;
    edClienteContacto: TEdit;
    QueryGuardado: TDBISAMQuery;
    procedure btBuscarClientesClick(Sender: TObject);
    procedure Buscar1Click(Sender: TObject);
    procedure Salir1Click(Sender: TObject);
    procedure btModificarClientesClick(Sender: TObject);
    procedure btSalirClientesClick(Sender: TObject);
    procedure Modificar1Click(Sender: TObject);
    procedure btAgregarClientesClick(Sender: TObject);
    procedure btCancelarClientesClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btGuardarClienteClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure RecibirDatos(datos: array of string; orden: String);
  end;

var
  fmClientesa2: TfmClientesa2;
implementation

{$R *.dfm}

uses UModificarClientes;

procedure TfmClientesa2.RecibirDatos(datos: array of string; orden: String);
var
i : Integer;
begin

if orden = 'Nombre :' then
begin
edNombreCliente.Text := datos[0];
edRutCliente.Text := datos[1];
edClienteContacto.Text := datos[2];
edClienteTelefono.Text := datos[3];
edClienteZona.Text := datos[4];
edClienteCorreo.Text := datos[5];
end;

if orden = 'Contacto :' then
begin
edClienteContacto.Text := datos[0];
edNombreCliente.Text := datos[1];
edRutCliente.Text := datos[2];
edClienteTelefono.Text := datos[3];
edClienteZona.Text := datos[4];
edClienteCorreo.Text := datos[5];
end;

if orden = 'Rut :' then
begin
edRutCliente.Text := datos[0];
edNombreCliente.Text := datos[1];
edClienteContacto.Text := datos[2];
edClienteTelefono.Text := datos[3];
edClienteZona.Text := datos[4];
edClienteCorreo.Text := datos[5];
end;

for i := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TEdit then
    begin
      with TEdit(Components[i]) do
      begin
        Enabled := True;
        if Enabled then
          Color := clWindow
        else
          Color := cl3dLight;
      end;
    end

    else if Components[i] is TMemo then
    begin
      with TMemo(Components[i]) do
      begin
        Enabled := True;
        if Enabled then
          Color := clWindow
        else
          Color := cl3dLight;
      end;
    end

    else if Components[i] is TComboBox then
    begin
      with TComboBox(Components[i]) do
      begin
        Enabled := True;
        // No puedes cambiar el color de un TComboBox directamente
      end;
    end;

    if
      //Cambio el color a los componentes ComboBox.
     (fmClientesa2.cbClientePais.Enabled) or
     (fmClientesa2.cbClienteDepartamento.Enabled) or
     (fmClientesa2.cbClienteMunicipio.Enabled) or
     (fmClientesa2.mmDireccionCliente.Enabled)
    then
    begin
      fmClientesa2.cbClientePais.Color := clWindow;
       fmClientesa2.cbClienteDepartamento.Color := clWindow;
       fmClientesa2.cbClienteMunicipio.Color := clWindow;
       fmClientesa2.mmDireccionCliente.Color := clWindow;
    end
    else
    begin
       fmClientesa2.cbClientePais.Color := cl3dLight;
       fmClientesa2.cbClienteDepartamento.Color := cl3dLight;
       fmClientesa2.cbClienteMunicipio.Color := cl3dLight;
       fmClientesa2.mmDireccionCliente.Color := cl3dLight;
    end;
  end;

edRutCliente.Enabled := False;
edNombreCliente.Enabled := True;
edClienteContacto.Enabled := True;
edClienteTelefono.Enabled := True;
edClienteZona.Enabled := True;
edClienteCorreo.Enabled := True;
cbClientePais.Enabled := True;
cbClienteDepartamento.Enabled := True;
cbClienteMunicipio.Enabled := True;
edClienteCelular.Enabled := True;
edClienteZona.Enabled := True;

btBuscarClientes.Enabled := False;
btAgregarClientes.Enabled := False;
btModificarClientes.Enabled := False;
btGuardarCliente.Enabled := True;
btCancelarClientes.Enabled := True;
btBorrarClientes.Enabled := True;
btSalirClientes.Enabled := False;
end;


procedure TfmClientesa2.btBuscarClientesClick(Sender: TObject);
begin
fmBuscarClientes :=  TfmBuscarClientes.Create(Self);
fmBuscarClientes.ShowModal;
end;

procedure TfmClientesa2.Buscar1Click(Sender: TObject);
begin
fmBuscarClientes :=  TfmBuscarClientes.Create(Self);
fmBuscarClientes.ShowModal ;
end;

procedure TfmClientesa2.FormCreate(Sender: TObject);
var
  i: Integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TEdit then
    begin
      with TEdit(Components[i]) do
      begin
        Enabled := False;
        if Enabled then
          Color := clWindow
        else
          Color := cl3dLight;
      end;
    end

    else if Components[i] is TMemo then
    begin
      with TMemo(Components[i]) do
      begin
        Enabled := False;
        if Enabled then
          Color := clWindow
        else
          Color := cl3dLight;
      end;
    end

    else if Components[i] is TComboBox then
    begin
      TComboBox(Components[i]).Enabled := False;
      // No puedes cambiar el color de un TComboBox directamente
    end;
  end;
 //Componentes que se deshabilitan y no son necesarios al momento de abrir el formulario
  MenuClientes.Items[1].Enabled := False;
  btCancelarClientes.Enabled := False;
  btGuardarCliente.Enabled := False ;
  btBorrarClientes.Enabled := False;

end;




procedure TfmClientesa2.Modificar1Click(Sender: TObject);
begin
fmModificarClientes :=  tfmModificarClientes.Create(Self);
fmModificarClientes.ShowModal
end;

procedure TfmClientesa2.Salir1Click(Sender: TObject);
begin
Close;
end;

procedure TfmClientesa2.btAgregarClientesClick(Sender: TObject);
var
  i: Integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TEdit then
    begin
      with TEdit(Components[i]) do
      begin
        Enabled := True;
        Text := '';
        if Enabled then
          Color := clWindow
        else
          Color := cl3dLight;
      end;
    end

    else if Components[i] is TMemo then
    begin
      with TMemo(Components[i]) do
      begin
        Enabled := True;
        Text := '';
        if Enabled then
          Color := clWindow
        else
          Color := cl3dLight;
      end;
    end

    else if Components[i] is TComboBox then
    begin
      with TComboBox(Components[i]) do
      begin
        Enabled := True;
        Text := '';
        // No puedes cambiar el color de un TComboBox directamente
      end;
    end;

    if
      //Cambio el color a los componentes ComboBox.
     (fmClientesa2.cbClientePais.Enabled) or
     (fmClientesa2.cbClienteDepartamento.Enabled) or
     (fmClientesa2.cbClienteMunicipio.Enabled) or
     (fmClientesa2.mmDireccionCliente.Enabled)
    then
    begin
      fmClientesa2.cbClientePais.Color := clWindow;
       fmClientesa2.cbClienteDepartamento.Color := clWindow;
       fmClientesa2.cbClienteMunicipio.Color := clWindow;
       fmClientesa2.mmDireccionCliente.Color := clWindow;
    end
    else
    begin
       fmClientesa2.cbClientePais.Color := cl3dLight;
       fmClientesa2.cbClienteDepartamento.Color := cl3dLight;
       fmClientesa2.cbClienteMunicipio.Color := cl3dLight;
       fmClientesa2.mmDireccionCliente.Color := cl3dLight;
    end;
    Begin
      btCancelarClientes.Enabled := True;

    End;
  end;

  edRutCliente.SetFocus;

  btBuscarClientes.Enabled := not btAgregarClientes.Enabled;
  btModificarClientes.Enabled := False;
  btBorrarClientes.Enabled := False;
  btGuardarCliente.Enabled := True;
  btSalirClientes.Enabled := False;
end;


procedure TfmClientesa2.btModificarClientesClick(Sender: TObject);
begin
fmModificarClientes :=  tfmModificarClientes.Create(Self);
fmModificarClientes.SetParentForm(Self);
fmModificarClientes.ShowModal
end;


procedure TfmClientesa2.btCancelarClientesClick(Sender: TObject);
var
  i: Integer;
  control: TControl;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if (Components[i] is TEdit) or (Components[i] is TComboBox) or (Components[i] is TMemo) then
    begin
      control := TControl(Components[i]);
      control.Enabled := False;
      if control is TCustomEdit then
        TCustomEdit(control).Text := '';
      if control is TMemo then
        TMemo(control).Lines.Clear;
      if edRutCliente.Enabled or
         edNombreCliente.Enabled or
         mmDireccionCliente.Enabled or
         cbClientePais.Enabled or
         cbClienteDepartamento.Enabled or
         cbClienteMunicipio.Enabled or
         edClienteCorreo.Enabled  or
         edClienteTelefono.Enabled or
         edClienteCelular.Enabled or
         edClienteZona.Enabled or
         edClienteContacto.Enabled

         then
         Begin
         edRutCliente.Color := clWindow ;
         edNombreCliente.Color := clWindow;
         mmDireccionCliente.Color := clWindow;
         cbClientePais.Color := clWindow;
         cbClienteDepartamento.Color := clWindow;
         cbClienteMunicipio.Color := clWindow;
         edClienteCorreo.Color := clWindow;
         edClienteTelefono.Color := clWindow;
         edClienteCelular.Color := clWindow;
         edClienteZona.Color := clWindow;
         edClienteContacto.Color := ClWindow;
         end
      else
         begin
         edRutCliente.Color := cl3dLight;
         edRutCliente.Color := cl3dLight ;
         edNombreCliente.Color := cl3dLight;
         mmDireccionCliente.Color := cl3dLight;
         cbClientePais.Color := cl3dLight;
         cbClienteDepartamento.Color := cl3dLight;
         cbClienteMunicipio.Color := cl3dLight;
         edClienteCorreo.Color := cl3dLight;
         edClienteTelefono.Color := cl3dLight;
         edClienteCelular.Color := cl3dLight;
         edClienteZona.Color := cl3dLight;
         edClienteContacto.Color := cl3dLight;
         end
    end;
  end;

  btBuscarClientes.Enabled := True;
  btModificarClientes.Enabled := True;
  btBorrarClientes.Enabled := True;
  btSalirClientes.Enabled := True;
  btAgregarClientes.Enabled := True;
  begin
  MenuClientes.Items[1].Enabled := False;
  btCancelarClientes.Enabled := False;
  btGuardarCliente.Enabled := False ;
  btBorrarClientes.Enabled := False;
  end;
end;


procedure TfmClientesa2.btGuardarClienteClick(Sender: TObject);
var
filterText, basePath, rut, nombre, contacto, telefono, direccion, correo : String;
respuesta : Integer;
begin
  basePath := uData.moduloDatos.a2Database.Directory;
 { if (edRutCliente.Text = '') or (mmDireccionCliente.Text = '') or (cbClientePais.Text = '') then
  begin
    ShowMessage('Por favor, complete todos los campos antes de guardar.');
  end
  else
  begin      }
    // Aquí va el código para guardar los datos
    filterText := Trim(edRutCliente.Text);
    QueryGuardado.Close;
    QueryGuardado.SQL.Text :=
      'SELECT COUNT(*) AS Existe ' +
      'FROM "' + basePath + '\Sclientes.dat" Sclientes ' +
      'WHERE Sclientes.FC_CODIGO = ' + QuotedStr(filterText);
    QueryGuardado.Open;

    nombre := Trim(edNombreCliente.Text);
    contacto := Trim(edClienteContacto.Text);
    telefono := Trim(edClienteTelefono.Text);
    direccion := Trim(mmDireccionCliente.Text);
    correo := Trim(edClienteCorreo.Text);
    respuesta := QueryGuardado.FieldByName('Existe').AsInteger;
    uData.moduloDatos.Sclientes.Active := False;
    if respuesta > 0 then
    begin
      QueryGuardado.Close;
      QueryGuardado.SQL.Text :=
      'UPDATE "' + basePath + '\Sclientes.dat" Sclientes ' +
      'SET Sclientes.FC_DESCRIPCION = ' + QuotedStr(nombre) + ', ' +
      'Sclientes.FC_CONTACTO = ' + QuotedStr(contacto) + ', ' +
      'Sclientes.FC_TELEFONO = ' + QuotedStr(telefono) + ', ' +
      'Sclientes.FC_DIRECCION1 = ' + QuotedStr(direccion) + ', ' +
      'Sclientes.FC_EMAIL = ' + QuotedStr(correo) + ' ' +
      'WHERE Sclientes.FC_CODIGO = ' + QuotedStr(filterText);
      QueryGuardado.ExecSQL;
      ShowMessage('Datos Guardados Exitosamente');
    end
    else
    begin
      QueryGuardado.Close;
      QueryGuardado.SQL.Text :=
      'INSERT INTO "' + basePath + '\Sclientes.dat" Sclientes (Sclientes.FC_CODIGO, Sclientes.FC_DESCRIPCION, Sclientes.FC_CONTACTO, Sclientes.FC_TELEFONO, Sclientes.FC_DIRECCION1, Sclientes.FC_EMAIL) ' +
      'VALUES ( ' + QuotedStr(filterText) + ', ' +
       QuotedStr(nombre) + ', ' +
       QuotedStr(contacto) + ', ' +
       QuotedStr(telefono) + ', ' +
       QuotedStr(direccion) + ', ' +
       QuotedStr(correo) + ' )';
      QueryGuardado.ExecSQL;
      ShowMessage('Datos Insertados Exitosamente');
    end;

  {end;}
  uData.moduloDatos.Sclientes.Active := True;
  btSalirClientes.Enabled := True;
  btAgregarClientes.Enabled := True;
end;

procedure TfmClientesa2.btSalirClientesClick(Sender: TObject);

Begin
btBuscarClientes.Enabled := True;
btModificarClientes.Enabled :=True;
btBorrarClientes.Enabled := False;
btCancelarClientes.Enabled := False;
BtGuardarCliente.Enabled  := False;
Close;
end;

end.
