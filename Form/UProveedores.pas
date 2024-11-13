unit UProveedores;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, System.ImageList,
  Vcl.ImgList, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ToolWin, Data.DB, UBuscarProveedores, dbisamtb, uData;

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
    Label10: TLabel;
    Label11: TLabel;
    ToolBar1: TToolBar;
    btBuscar: TToolButton;
    btAgregar: TToolButton;
    btModificar: TToolButton;
    btGuardar: TToolButton;
    btCancelar: TToolButton;
    btSalir: TToolButton;
    ImagLista: TImageList;
    Menu: TMainMenu;
    Menu1: TMenuItem;
    Buscar1: TMenuItem;
    Agregar1: TMenuItem;
    Modificar1: TMenuItem;
    Guardar1: TMenuItem;
    Cancelar1: TMenuItem;
    N1: TMenuItem;
    Salir1: TMenuItem;
    Consultar1: TMenuItem;
    EstadodeCuenta1: TMenuItem;
    OperacionesComerciales1: TMenuItem;
    ProductosComprados1: TMenuItem;
    Configuraciones1: TMenuItem;
    erceros1: TMenuItem;
    mmDireccionProveedor: TMemo;
    edNombreProveedor: TEdit;
    edRutProveedor: TEdit;
    cbProveedorPais: TComboBox;
    cbProveedorDepartamento: TComboBox;
    cbProveedorMunicipio: TComboBox;
    edProveedorCorreo: TEdit;
    edProveedorTelefono: TEdit;
    edProveedorContacto: TEdit;
    QueryFiltroUbicacion: TDBISAMQuery;
    QueryGuardado: TDBISAMQuery;
    QueryUbicacion: TDBISAMQuery;
    cbEstadoProveedores: TCheckBox;
    procedure btSalirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btBuscarClick(Sender: TObject);
    procedure cbProveedorPaisChange(Sender: TObject);
    procedure cbProveedorDepartamentoChange(Sender: TObject);
    procedure cbProveedorMunicipioChange(Sender: TObject);
    procedure btAgregarClick(Sender: TObject);
    procedure btModificarClick(Sender: TObject);
    procedure btGuardarClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure RecibirDatos(datos: array of string; orden: String);
  end;

var
  fmProveedores: TfmProveedores;

implementation

{$R *.dfm}

uses UModificarProveedores;
var idPais, idDepartamento, idMunicipio: Integer;

procedure TfmProveedores.RecibirDatos(datos: array of string; orden: String);
var
i, col, index : Integer;
basePath, filterText, default : String;
pais, departamento, municipio: array of string;
begin
basePath := uData.moduloDatos.a2Database.Directory;
if orden = 'Nombre :' then
begin
edNombreProveedor.Text := datos[0];
edRutProveedor.Text := datos[1];
edProveedorContacto.Text := datos[2];
edProveedorTelefono.Text := datos[3];
mmDireccionProveedor.Text := datos[4];
edProveedorCorreo.Text := datos[8];
edProveedorTelefono.Text := datos[9];
edProveedorContacto.Text := datos[10];

end;

if orden = 'Contacto :' then
begin
edProveedorContacto.Text := datos[0];
edNombreProveedor.Text := datos[1];
edRutProveedor.Text := datos[2];
edProveedorTelefono.Text := datos[3];
mmDireccionProveedor.Text := datos[4];
edProveedorCorreo.Text := datos[8];
edProveedorTelefono.Text := datos[9];
edProveedorContacto.Text := datos[10];
end;

if orden = 'Rut :' then
begin
edRutProveedor.Text := datos[0];
edNombreProveedor.Text := datos[1];
edProveedorContacto.Text := datos[2];
edProveedorTelefono.Text := datos[3];
mmDireccionProveedor.Text := datos[4];
edProveedorCorreo.Text := datos[8];
edProveedorTelefono.Text := datos[9];
edProveedorContacto.Text := datos[10];
end;

if datos[11] = 'True' then
begin
cbEstadoProveedores.Checked := True;
end
else
begin
cbEstadoProveedores.Checked := False;
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
     (fmProveedores.cbProveedorPais.Enabled) or
     (fmProveedores.cbProveedorDepartamento.Enabled) or
     (fmProveedores.cbProveedorMunicipio.Enabled) or
     (fmProveedores.mmDireccionProveedor.Enabled)
    then
    begin
      fmProveedores.cbProveedorPais.Color := clWindow;
       fmProveedores.cbProveedorDepartamento.Color := clWindow;
       fmProveedores.cbProveedorMunicipio.Color := clWindow;
       fmProveedores.mmDireccionProveedor.Color := clWindow;
    end
    else
    begin
       fmProveedores.cbProveedorPais.Color := cl3dLight;
       fmProveedores.cbProveedorDepartamento.Color := cl3dLight;
       fmProveedores.cbProveedorMunicipio.Color := cl3dLight;
       fmProveedores.mmDireccionProveedor.Color := cl3dLight;
    end;
  end;



edRutProveedor.Enabled := False;
edNombreProveedor.Enabled := True;
edProveedorContacto.Enabled := True;
edProveedorTelefono.Enabled := True;
mmDireccionProveedor.Enabled := True;
edProveedorCorreo.Enabled := True;
cbProveedorPais.Enabled := True;
cbProveedorDepartamento.Enabled := True;
cbProveedorMunicipio.Enabled := True;
cbEstadoProveedores.Enabled := True;

btBuscar.Enabled := False;
btAgregar.Enabled := False;
btModificar.Enabled := False;
btGuardar.Enabled := True;
btCancelar.Enabled := True;
btSalir.Enabled := False;

//Saco los nombres a partir de ID
//Pais
QueryFiltroUbicacion.Close;
QueryFiltroUbicacion.SQL.Text :=
'SELECT UBICACION ' +
'FROM "' + basePath + '\a2UbicacionGeo01.dat" a2UbicacionGeo01 ' +
'WHERE a2UbicacionGeo01.ID = :ID';
QueryFiltroUbicacion.ParamByName('ID').AsInteger := StrToIntDef(datos[5], 0);
QueryFiltroUbicacion.Open;
default := QueryFiltroUbicacion.FieldByName('UBICACION').AsString;

QueryUbicacion.Close;
QueryUbicacion.SQL.Text :=
      'SELECT * ' +
      'FROM "' + basePath + '\a2UbicacionGeo01.dat"';
QueryUbicacion.Open;
SetLength(pais,QueryUbicacion.RecordCount);
col := 0;
QueryUbicacion.First;
while not QueryUbicacion.EoF do
  begin
    pais[col] := QueryUbicacion.FieldByName('Ubicacion').AsString;
    Inc(col);
    QueryUbicacion.Next;
  end;
  cbProveedorPais.Items.Clear;
  for col := 0 to High(pais) do
  begin
    cbProveedorPais.Items.Add(pais[col]);
  end;
  index := cbProveedorPais.Items.IndexOf(default);
  cbProveedorPais.ItemIndex := index;

//Departamento
QueryFiltroUbicacion.Close;
QueryFiltroUbicacion.SQL.Text :=
'SELECT UBICACION ' +
'FROM "' + basePath + '\a2UbicacionGeo02.dat" a2UbicacionGeo02 ' +
'WHERE a2UbicacionGeo02.ID = :ID';
QueryFiltroUbicacion.ParamByName('ID').AsInteger := StrToIntDef(datos[6], 0);
QueryFiltroUbicacion.Open;
default := QueryFiltroUbicacion.FieldByName('UBICACION').AsString;

QueryUbicacion.Close;
QueryUbicacion.SQL.Text :=
      'SELECT * ' +
      'FROM "' + basePath + '\a2UbicacionGeo02.dat"';
QueryUbicacion.Open;
SetLength(departamento,QueryUbicacion.RecordCount);
col := 0;
QueryUbicacion.First;
while not QueryUbicacion.EoF do
  begin
    departamento[col] := QueryUbicacion.FieldByName('Ubicacion').AsString;
    Inc(col);
    QueryUbicacion.Next;
  end;
  cbProveedorDepartamento.Items.Clear;
  for col := 0 to High(departamento) do
  begin
    cbProveedorDepartamento.Items.Add(departamento[col]);
  end;
  index := cbProveedorDepartamento.Items.IndexOf(default);
  cbProveedorDepartamento.ItemIndex := index;

//Municipio
QueryFiltroUbicacion.Close;
QueryFiltroUbicacion.SQL.Text :=
'SELECT UBICACION ' +
'FROM "' + basePath + '\a2UbicacionGeo03.dat" a2UbicacionGeo03 ' +
'WHERE a2UbicacionGeo03.ID = :ID';
QueryFiltroUbicacion.ParamByName('ID').AsInteger := StrToIntDef(datos[7], 0);
QueryFiltroUbicacion.Open;
default := QueryFiltroUbicacion.FieldByName('UBICACION').AsString;

QueryUbicacion.Close;
QueryUbicacion.SQL.Text :=
      'SELECT * ' +
      'FROM "' + basePath + '\a2UbicacionGeo03.dat"';
QueryUbicacion.Open;
SetLength(municipio,QueryUbicacion.RecordCount);
col := 0;
QueryUbicacion.First;
while not QueryUbicacion.EoF do
  begin
    municipio[col] := QueryUbicacion.FieldByName('Ubicacion').AsString;
    Inc(col);
    QueryUbicacion.Next;
  end;
  cbProveedorMunicipio.Items.Clear;
  for col := 0 to High(municipio) do
  begin
    cbProveedorMunicipio.Items.Add(municipio[col]);
  end;
  index := cbProveedorMunicipio.Items.IndexOf(default);
  cbProveedorMunicipio.ItemIndex := index;
end;

procedure TfmProveedores.FormCreate(Sender: TObject);
var
  i, col, default: Integer;
  filterText, basePath: String;
  pais, departamento, municipio: array of string;
begin
  basePath := uData.moduloDatos.a2Database.Directory;
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
      with TComboBox(Components[i]) do
      if Enabled then
          Color := clWindow
        else
          Color := cl3dLight;
    end

    else if Components[i] is TCheckBox then
    begin
      with TCheckBox(Components[i]) do
      Enabled := False;
      if Enabled then
          Color := clWindow
        else
          Color := cl3dLight;
    end;
  end;
 //Componentes que se deshabilitan y no son necesarios al momento de abrir el formulario
  Menu.Items[1].Enabled := False;
  btCancelar.Enabled := False;
  btGuardar.Enabled := False ;

end;

procedure TfmProveedores.btAgregarClick(Sender: TObject);
var
  i, col, default: Integer;
  filterText, basePath: String;
  pais, departamento, municipio: array of string;
begin
  basePath := uData.moduloDatos.a2Database.Directory;
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
        Text := '';
      end;
    end

    else if Components[i] is TCheckBox then
    begin
      with TCheckBox(Components[i]) do
      begin
      Enabled := True;
      if Enabled then
          Color := clWindow
        else
          Color := cl3dLight;
      end;
    end;
    cbProveedorPais.Enabled := True;
    mmDireccionProveedor.Enabled := True;
    cbProveedorDepartamento.Enabled := True;
    cbProveedorMunicipio.Enabled := False;
    if
      //Cambio el color a los componentes ComboBox.
     (fmProveedores.cbProveedorPais.Enabled) or
     (fmProveedores.cbProveedorDepartamento.Enabled) or
     (fmProveedores.cbProveedorMunicipio.Enabled) or
     (fmProveedores.mmDireccionProveedor.Enabled)
    then
    begin
      fmProveedores.cbProveedorPais.Color := clWindow;
       fmProveedores.cbProveedorDepartamento.Color := clWindow;
       fmProveedores.cbProveedorMunicipio.Color := clWindow;
       fmProveedores.mmDireccionProveedor.Color := clWindow;
    end
    else
    begin
       fmProveedores.cbProveedorPais.Color := cl3dLight;
       fmProveedores.cbProveedorDepartamento.Color := cl3dLight;
       fmProveedores.cbProveedorMunicipio.Color := cl3dLight;
       fmProveedores.mmDireccionProveedor.Color := cl3dLight;
    end;
    Begin
      btCancelar.Enabled := True;

    End;
  end;

  edRutProveedor.SetFocus;
  btBuscar.Enabled := not btAgregar.Enabled;
  btModificar.Enabled := False;
  btGuardar.Enabled := True;
  btSalir.Enabled := False;

  //Me asigna valores a pais
  //Pais
  QueryUbicacion.Close;
  QueryUbicacion.SQL.Text :=
      'SELECT * ' +
      'FROM "' + basePath + '\a2UbicacionGeo01.dat"';
  QueryUbicacion.Open;
  SetLength(pais,QueryUbicacion.RecordCount);
  col := 0;
  QueryUbicacion.First;
  while not QueryUbicacion.EoF do
  begin
    pais[col] := QueryUbicacion.FieldByName('Ubicacion').AsString;
    Inc(col);
    QueryUbicacion.Next;
  end;
  cbProveedorPais.Items.Clear;
  for col := 0 to High(pais) do
  begin
    cbProveedorPais.Items.Add(pais[col]);
  end;

  default := cbProveedorPais.Items.IndexOf('Colombia');
  cbProveedorPais.ItemIndex := default;
  idPais := 42;
  idDepartamento := 0;
  idMunicipio := 0;

  QueryUbicacion.Close;
  QueryUbicacion.SQL.Text :=
      'SELECT * ' +
      'FROM "' + basePath + '\a2UbicacionGeo02.dat" a2UbicacionGeo02 ' +
      'WHERE a2UbicacionGeo02.PADRE = :ID';
  QueryUbicacion.ParamByName('ID').AsInteger := idPais;
  QueryUbicacion.Open;

  SetLength(departamento,QueryUbicacion.RecordCount);
  col := 0;
  QueryUbicacion.First;
  while not QueryUbicacion.EoF do
  begin
    departamento[col] := QueryUbicacion.FieldByName('Ubicacion').AsString;
    Inc(col);
    QueryUbicacion.Next;
  end;
  cbProveedorDepartamento.Items.Clear;
  for col := 0 to High(departamento) do
  begin
    cbProveedorDepartamento.Items.Add(departamento[col]);
  end;

end;

procedure TfmProveedores.btBuscarClick(Sender: TObject);
begin
fmBuscarProveedores :=  TfmBuscarProveedores.Create(Self);
fmBuscarProveedores.ShowModal;
end;

procedure TfmProveedores.btCancelarClick(Sender: TObject);
var
  i: Integer;
  control: TControl;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if (Components[i] is TEdit) or (Components[i] is TComboBox) or (Components[i] is TMemo) or (Components[i] is TCheckBox) then
    begin
      control := TControl(Components[i]);
      control.Enabled := False;
      if control is TCustomEdit then
        TCustomEdit(control).Text := '';
      if control is TMemo then
        TMemo(control).Lines.Clear;
      if edRutProveedor.Enabled or
         edNombreProveedor.Enabled or
         mmDireccionProveedor.Enabled or
         cbProveedorPais.Enabled or
         cbProveedorDepartamento.Enabled or
         cbProveedorMunicipio.Enabled or
         edProveedorCorreo.Enabled  or
         edProveedorTelefono.Enabled or
         cbEstadoProveedores.Enabled or
         edProveedorContacto.Enabled

         then
         Begin
         edRutProveedor.Color := clWindow ;
         edNombreProveedor.Color := clWindow;
         mmDireccionProveedor.Color := clWindow;
         cbProveedorPais.Color := clWindow;
         cbProveedorDepartamento.Color := clWindow;
         cbProveedorMunicipio.Color := clWindow;
         edProveedorCorreo.Color := clWindow;
         edProveedorTelefono.Color := clWindow;
         cbEstadoProveedores.Color := clWindow;
         edProveedorContacto.Color := ClWindow;
         end
      else
         begin
         edRutProveedor.Color := cl3dLight ;
         edNombreProveedor.Color := cl3dLight;
         mmDireccionProveedor.Color := cl3dLight;
         cbProveedorPais.Color := cl3dLight;
         cbProveedorDepartamento.Color := cl3dLight;
         cbProveedorMunicipio.Color := cl3dLight;
         edProveedorCorreo.Color := cl3dLight;
         edProveedorTelefono.Color := cl3dLight;
         cbEstadoProveedores.Color := cl3dLight;
         edProveedorContacto.Color := cl3dLight;
         end
    end;
  end;

  btBuscar.Enabled := True;
  btModificar.Enabled := True;
  btSalir.Enabled := True;
  btAgregar.Enabled := True;
  cbProveedorPais.Items.Clear;
  cbProveedorPais.Text := '';
  cbProveedorMunicipio.Items.Clear;
  cbProveedorMunicipio.Text := '';
  cbProveedorDepartamento.Items.Clear;
  cbProveedorDepartamento.Text := '';
  begin
  Menu.Items[1].Enabled := False;
  btCancelar.Enabled := False;
  btGuardar.Enabled := False ;
  end;
end;

procedure TfmProveedores.btGuardarClick(Sender: TObject);
var
filterText, basePath, rut, nombre, contacto, zona, celular, telefono, direccion, correo, pais, departamento, municipio : String;
status : Boolean;
respuesta : Integer;
begin
  basePath := uData.moduloDatos.a2Database.Directory;
  if (edRutProveedor.Text = '') or (mmDireccionProveedor.Text = '') or (cbProveedorPais.Text = '') or (cbProveedorMunicipio.Text = '') or (cbProveedorDepartamento.Text = '') then
  begin
    ShowMessage('Por favor, complete todos los campos antes de guardar.');
  end
  else
  begin
    // Aquí va el código para guardar los datos
    filterText := Trim(edRutProveedor.Text);
    QueryGuardado.Close;
    QueryGuardado.SQL.Text :=
      'SELECT COUNT(*) AS Existe ' +
      'FROM "' + basePath + '\Sproveedor.dat" Sproveedor ' +
      'WHERE Sproveedor.FP_CODIGO = ' + QuotedStr(filterText);
    QueryGuardado.Open;

    nombre := Trim(edNombreProveedor.Text);
    contacto := Trim(edProveedorContacto.Text);
    telefono := Trim(edProveedorTelefono.Text);
    direccion := Trim(mmDireccionProveedor.Text);
    correo := Trim(edProveedorCorreo.Text);
    pais := Trim(cbProveedorPais.Text);
    departamento := Trim(cbProveedorDepartamento.Text);
    municipio := Trim(cbProveedorMunicipio.Text);
    status := cbEstadoProveedores.Checked;
    contacto := Trim(edProveedorContacto.Text);

    //Saco las ids
    QueryFiltroUbicacion.Close;
    QueryFiltroUbicacion.SQL.Text :=
    'SELECT ID ' +
    'FROM "' + basePath + '\a2UbicacionGeo01.dat" a2UbicacionGeo01 ' +
    'WHERE a2UbicacionGeo01.UBICACION = ' + QuotedStr(pais);
    QueryFiltroUbicacion.Open;
    idPais := QueryFiltroUbicacion.FieldByName('ID').AsInteger;

    QueryFiltroUbicacion.Close;
    QueryFiltroUbicacion.SQL.Text :=
    'SELECT ID ' +
    'FROM "' + basePath + '\a2UbicacionGeo02.dat" a2UbicacionGeo02 ' +
    'WHERE a2UbicacionGeo02.UBICACION = ' + QuotedStr(departamento);
    QueryFiltroUbicacion.Open;
    idDepartamento := QueryFiltroUbicacion.FieldByName('ID').AsInteger;

    QueryFiltroUbicacion.Close;
    QueryFiltroUbicacion.SQL.Text :=
    'SELECT ID ' +
    'FROM "' + basePath + '\a2UbicacionGeo03.dat" a2UbicacionGeo03 ' +
    'WHERE a2UbicacionGeo03.UBICACION = ' + QuotedStr(municipio);
    QueryFiltroUbicacion.Open;
    idMunicipio := QueryFiltroUbicacion.FieldByName('ID').AsInteger;

    respuesta := QueryGuardado.FieldByName('Existe').AsInteger;
    uData.moduloDatos.Sclientes.Active := False;
    if respuesta > 0 then
    begin
      QueryGuardado.Close;
      QueryGuardado.SQL.Text :=
      'UPDATE "' + basePath + '\Sproveedor.dat" Sproveedor ' +
      'SET Sproveedor.FP_DESCRIPCION = ' + QuotedStr(nombre) + ', ' +
      'Sproveedor.FP_CONTACTO = ' + QuotedStr(contacto) + ', ' +
      'Sproveedor.FP_TELEFONO = ' + QuotedStr(telefono) + ', ' +
      'Sproveedor.FP_DIRECCION1 = ' + QuotedStr(direccion) + ', ' +
      'Sproveedor.FP_DIANPAIS = :idPais, ' +
      'Sproveedor.FP_DIANDEPARTAMENTO = :idDepartamento, ' +
      'Sproveedor.FP_DIANMUNICIPIO = :idMunicipio, ' +
      'Sproveedor.FP_EMAIL = ' + QuotedStr(correo) + ', ' +
      'Sproveedor.FP_STATUS = :status, ' +
      'Sproveedor.FP_CONTACTO = ' + QuotedStr(contacto) + ' ' +
      'WHERE Sproveedor.FP_CODIGO = ' + QuotedStr(filterText);
      QueryGuardado.ParamByName('status').AsBoolean := status;
      QueryGuardado.ParamByName('idPais').AsString := IntToStr(idPais);
      QueryGuardado.ParamByName('idDepartamento').AsString := IntToStr(idDepartamento);
      QueryGuardado.ParamByName('idMunicipio').AsString := IntToStr(idMunicipio);
      QueryGuardado.ExecSQL;
      ShowMessage('Datos Guardados Exitosamente');
    end
    else
    begin
      QueryGuardado.Close;
      QueryGuardado.SQL.Text :=
      'INSERT INTO "' + basePath + '\Sproveedor.dat" Sproveedor (Sproveedor.FP_CODIGO, Sproveedor.FP_DESCRIPCION, Sproveedor.FP_CONTACTO, Sproveedor.FP_TELEFONO, Sproveedor.FP_DIRECCION1, ' +
      'Sproveedor.FP_DIANPAIS, Sproveedor.FP_DIANDEPARTAMENTO, Sproveedor.FP_DIANMUNICIPIO, Sproveedor.FP_EMAIL, Sproveedor.FP_STATUS, Sproveedor.FP_CONTACTO)' +
      'VALUES ( ' + QuotedStr(filterText) + ', ' +
       QuotedStr(nombre) + ', ' +
       QuotedStr(contacto) + ', ' +
       QuotedStr(telefono) + ', ' +
       QuotedStr(direccion) + ', ' +
       ':idPais, ' +
       ':idDepartamento, ' +
       ':idMunicipio, ' +
       QuotedStr(correo) + ', ' +
       ':status, ' +
       QuotedStr(contacto) + ' )';
      QueryGuardado.ParamByName('status').AsBoolean := status;
      QueryGuardado.ParamByName('idPais').AsString := IntToStr(idPais);
      QueryGuardado.ParamByName('idDepartamento').AsString := IntToStr(idDepartamento);
      QueryGuardado.ParamByName('idMunicipio').AsString := IntToStr(idMunicipio);
      QueryGuardado.ExecSQL;
      ShowMessage('Datos Insertados Exitosamente');
    end;

  {end;}
  uData.moduloDatos.Sclientes.Active := True;
  btBuscar.Enabled := True;
  btModificar.Enabled :=True;
  btAgregar.Enabled := True;
  btCancelar.Enabled := False;
  BtGuardar.Enabled  := False;
  btSalir.Enabled := True;
  cbProveedorPais.Items.Clear;
  cbProveedorPais.Text := '';
  cbProveedorMunicipio.Items.Clear;
  cbProveedorMunicipio.Text := '';
  cbProveedorDepartamento.Items.Clear;
  cbProveedorDepartamento.Text := '';
end;
end;

procedure TfmProveedores.btModificarClick(Sender: TObject);
begin
fmModificarProveedores :=  TfmModificarProveedores.Create(Self);
fmModificarProveedores.SetParentForm(Self);
fmModificarProveedores.ShowModal;
end;

procedure TfmProveedores.btSalirClick(Sender: TObject);
begin
Close;
end;

procedure TfmProveedores.cbProveedorDepartamentoChange(Sender: TObject);
var
  i, col: Integer;
  filterText, basePath: String;
  municipio: array of string;
begin
basePath := uData.moduloDatos.a2Database.Directory;
filterText := cbProveedorDepartamento.Text;
//Municipio
  QueryFiltroUbicacion.Close;
  QueryFiltroUbicacion.SQL.Text :=
  'SELECT ID ' +
  'FROM "' + basePath + '\a2UbicacionGeo02.dat" a2UbicacionGeo02 ' +
  'WHERE a2UbicacionGeo02.UBICACION = ' + QuotedStr(filterText);
  QueryFiltroUbicacion.Open;
  idDepartamento := QueryFiltroUbicacion.FieldByName('ID').AsInteger;

  QueryUbicacion.Close;
  QueryUbicacion.SQL.Text :=
      'SELECT * ' +
      'FROM "' + basePath + '\a2UbicacionGeo03.dat" a2UbicacionGeo03 ' +
      'WHERE a2UbicacionGeo03.PADRE = :ID';
  QueryUbicacion.ParamByName('ID').AsInteger := idDepartamento;
  QueryUbicacion.Open;

  SetLength(municipio,QueryUbicacion.RecordCount);
  col := 0;
  QueryUbicacion.First;
  while not QueryUbicacion.EoF do
  begin
    municipio[col] := QueryUbicacion.FieldByName('Ubicacion').AsString;
    Inc(col);
    QueryUbicacion.Next;
  end;
  cbProveedorMunicipio.Items.Clear;
  for col := 0 to High(municipio) do
  begin
    cbProveedorMunicipio.Items.Add(municipio[col]);
  end;
  cbProveedorMunicipio.Enabled:= True;
  cbProveedorMunicipio.Color := clWindow;

end;

procedure TfmProveedores.cbProveedorMunicipioChange(Sender: TObject);
var
i, col: Integer;
filterText, basePath: String;
begin
  basePath := uData.moduloDatos.a2Database.Directory;
  filterText := cbProveedorMunicipio.Text;

  QueryFiltroUbicacion.Close;
  QueryFiltroUbicacion.SQL.Text :=
  'SELECT ID ' +
  'FROM "' + basePath + '\a2UbicacionGeo03.dat" a2UbicacionGeo03 ' +
  'WHERE a2UbicacionGeo03.UBICACION = ' + QuotedStr(filterText);
  QueryFiltroUbicacion.Open;
  idMunicipio := QueryFiltroUbicacion.FieldByName('ID').AsInteger;

end;

procedure TfmProveedores.cbProveedorPaisChange(Sender: TObject);
var
  i, col: Integer;
  filterText, basePath: String;
  departamento: array of string;
begin
  basePath := uData.moduloDatos.a2Database.Directory;
  filterText := cbProveedorPais.Text;
      //Departamento
  QueryFiltroUbicacion.Close;
  QueryFiltroUbicacion.SQL.Text :=
  'SELECT ID ' +
  'FROM "' + basePath + '\a2UbicacionGeo01.dat" a2UbicacionGeo01 ' +
  'WHERE a2UbicacionGeo01.UBICACION = ' + QuotedStr(filterText);
  QueryFiltroUbicacion.Open;
  idPais := QueryFiltroUbicacion.FieldByName('ID').AsInteger;

  QueryUbicacion.Close;
  QueryUbicacion.SQL.Text :=
      'SELECT * ' +
      'FROM "' + basePath + '\a2UbicacionGeo02.dat" a2UbicacionGeo02 ' +
      'WHERE a2UbicacionGeo02.PADRE = :ID';
  QueryUbicacion.ParamByName('ID').AsInteger := idPais;
  QueryUbicacion.Open;

  SetLength(departamento,QueryUbicacion.RecordCount);
  col := 0;
  QueryUbicacion.First;
  while not QueryUbicacion.EoF do
  begin
    departamento[col] := QueryUbicacion.FieldByName('Ubicacion').AsString;
    Inc(col);
    QueryUbicacion.Next;
  end;
  cbProveedorDepartamento.Items.Clear;
  for col := 0 to High(departamento) do
  begin
    cbProveedorDepartamento.Items.Add(departamento[col]);
  end;
end;

end.
