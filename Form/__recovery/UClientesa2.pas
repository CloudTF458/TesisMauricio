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
    ImagLista: TImageList;
    btAgregarClientes: TToolButton;
    btModificarClientes: TToolButton;
    btGuardarCliente: TToolButton;
    btCancelarClientes: TToolButton;
    btSalirClientes: TToolButton;
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
    lbZonaCliente: TLabel;
    edClienteZona: TEdit;
    lbContactoCliente: TLabel;
    edClienteContacto: TEdit;
    QueryGuardado: TDBISAMQuery;
    QueryUbicacion: TDBISAMQuery;
    QueryFiltroUbicacion: TDBISAMQuery;
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
    procedure cbClientePaisChange(Sender: TObject);
    procedure cbClienteDepartamentoChange(Sender: TObject);
    procedure cbClienteMunicipioChange(Sender: TObject);
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
var idPais, idDepartamento, idMunicipio: Integer;

procedure TfmClientesa2.RecibirDatos(datos: array of string; orden: String);
var
i, col, index : Integer;
basePath, filterText, default : String;
pais, departamento, municipio: array of string;
begin
basePath := uData.moduloDatos.a2Database.Directory;
if orden = 'Nombre :' then
begin
edNombreCliente.Text := datos[0];
edRutCliente.Text := datos[1];
edClienteContacto.Text := datos[2];
edClienteTelefono.Text := datos[3];
mmDireccionCliente.Text := datos[4];
edClienteCorreo.Text := datos[8];
edClienteTelefono.Text := datos[9];
edClienteContacto.Text := datos[10];
edClienteZona.Text := datos[11];
end;

if orden = 'Contacto :' then
begin
edClienteContacto.Text := datos[0];
edNombreCliente.Text := datos[1];
edRutCliente.Text := datos[2];
edClienteTelefono.Text := datos[3];
mmDireccionCliente.Text := datos[4];
edClienteCorreo.Text := datos[8];
edClienteTelefono.Text := datos[9];
edClienteContacto.Text := datos[10];
edClienteZona.Text := datos[11];
end;

if orden = 'Rut :' then
begin
edRutCliente.Text := datos[0];
edNombreCliente.Text := datos[1];
edClienteContacto.Text := datos[2];
edClienteTelefono.Text := datos[3];
mmDireccionCliente.Text := datos[4];
edClienteCorreo.Text := datos[8];
edClienteTelefono.Text := datos[9];
edClienteContacto.Text := datos[10];
edClienteZona.Text := datos[11];
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
edClienteZona.Enabled := True;

btBuscarClientes.Enabled := False;
btAgregarClientes.Enabled := False;
btModificarClientes.Enabled := False;
btGuardarCliente.Enabled := True;
btCancelarClientes.Enabled := True;
btSalirClientes.Enabled := False;

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
  cbClientePais.Items.Clear;
  for col := 0 to High(pais) do
  begin
    cbClientePais.Items.Add(pais[col]);
  end;
  index := cbClientePais.Items.IndexOf(default);
  cbClientePais.ItemIndex := index;

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
  cbClienteDepartamento.Items.Clear;
  for col := 0 to High(departamento) do
  begin
    cbClienteDepartamento.Items.Add(departamento[col]);
  end;
  index := cbClienteDepartamento.Items.IndexOf(default);
  cbClienteDepartamento.ItemIndex := index;

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
  cbClienteMunicipio.Items.Clear;
  for col := 0 to High(municipio) do
  begin
    cbClienteMunicipio.Items.Add(municipio[col]);
  end;
  index := cbClienteMunicipio.Items.IndexOf(default);
  cbClienteMunicipio.ItemIndex := index;
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

procedure TfmClientesa2.cbClienteDepartamentoChange(Sender: TObject);
var
  i, col: Integer;
  filterText, basePath: String;
  municipio: array of string;
begin
basePath := uData.moduloDatos.a2Database.Directory;
filterText := cbClienteDepartamento.Text;
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
  cbClienteMunicipio.Items.Clear;
  for col := 0 to High(municipio) do
  begin
    cbClienteMunicipio.Items.Add(municipio[col]);
  end;
  cbClienteMunicipio.Enabled:= True;
  cbClienteMunicipio.Color := clWindow;
end;

procedure TfmClientesa2.cbClienteMunicipioChange(Sender: TObject);
var
i, col: Integer;
filterText, basePath: String;
begin
  basePath := uData.moduloDatos.a2Database.Directory;
  filterText := cbClienteMunicipio.Text;

  QueryFiltroUbicacion.Close;
  QueryFiltroUbicacion.SQL.Text :=
  'SELECT ID ' +
  'FROM "' + basePath + '\a2UbicacionGeo03.dat" a2UbicacionGeo03 ' +
  'WHERE a2UbicacionGeo03.UBICACION = ' + QuotedStr(filterText);
  QueryFiltroUbicacion.Open;
  idMunicipio := QueryFiltroUbicacion.FieldByName('ID').AsInteger;

end;

procedure TfmClientesa2.cbClientePaisChange(Sender: TObject);
var
  i, col: Integer;
  filterText, basePath: String;
  departamento: array of string;
begin
  basePath := uData.moduloDatos.a2Database.Directory;
  filterText := cbClientePais.Text;
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
  cbClienteDepartamento.Items.Clear;
  for col := 0 to High(departamento) do
  begin
    cbClienteDepartamento.Items.Add(departamento[col]);
  end;

end;

procedure TfmClientesa2.FormCreate(Sender: TObject);
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
    end;
  end;
 //Componentes que se deshabilitan y no son necesarios al momento de abrir el formulario
  Menu.Items[1].Enabled := False;
  btCancelarClientes.Enabled := False;
  btGuardarCliente.Enabled := False ;

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
    end;
    cbClientePais.Enabled := True;
    mmDireccionCliente.Enabled := True;
    cbClienteDepartamento.Enabled := True;
    cbClienteMunicipio.Enabled := False;
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
  btGuardarCliente.Enabled := True;
  btSalirClientes.Enabled := False;

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
  cbClientePais.Items.Clear;
  for col := 0 to High(pais) do
  begin
    cbClientePais.Items.Add(pais[col]);
  end;

  default := cbClientePais.Items.IndexOf('Colombia');
  cbClientePais.ItemIndex := default;
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
  cbClienteDepartamento.Items.Clear;
  for col := 0 to High(departamento) do
  begin
    cbClienteDepartamento.Items.Add(departamento[col]);
  end;


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
         edClienteZona.Color := cl3dLight;
         edClienteContacto.Color := cl3dLight;
         end
    end;
  end;

  btBuscarClientes.Enabled := True;
  btModificarClientes.Enabled := True;
  btSalirClientes.Enabled := True;
  btAgregarClientes.Enabled := True;
  cbClientePais.Items.Clear;
  cbClientePais.Text := '';
  cbClienteMunicipio.Items.Clear;
  cbClienteMunicipio.Text := '';
  cbClienteDepartamento.Items.Clear;
  cbClienteDepartamento.Text := '';
  begin
  Menu.Items[1].Enabled := False;
  btCancelarClientes.Enabled := False;
  btGuardarCliente.Enabled := False ;
  end;
end;


procedure TfmClientesa2.btGuardarClienteClick(Sender: TObject);
var
filterText, basePath, rut, nombre, contacto, zona, celular, telefono, direccion, correo, pais, departamento, municipio : String;
respuesta : Integer;
begin
  basePath := uData.moduloDatos.a2Database.Directory;
  if (edRutCliente.Text = '') or (mmDireccionCliente.Text = '') or (cbClientePais.Text = '') or (cbClienteMunicipio.Text = '') or (cbClienteDepartamento.Text = '') then
  begin
    ShowMessage('Por favor, complete todos los campos antes de guardar.');
  end
  else
  begin
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
    pais := Trim(cbClientePais.Text);
    departamento := Trim(cbClienteDepartamento.Text);
    municipio := Trim(cbClienteMunicipio.Text);
    zona := Trim(edClienteZona.Text);
    contacto := Trim(edClienteContacto.Text);

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
      'UPDATE "' + basePath + '\Sclientes.dat" Sclientes ' +
      'SET Sclientes.FC_DESCRIPCION = ' + QuotedStr(nombre) + ', ' +
      'Sclientes.FC_CONTACTO = ' + QuotedStr(contacto) + ', ' +
      'Sclientes.FC_TELEFONO = ' + QuotedStr(telefono) + ', ' +
      'Sclientes.FC_DIRECCION1 = ' + QuotedStr(direccion) + ', ' +
      'Sclientes.FC_DIANPAIS = :idPais, ' +
      'Sclientes.FC_DIANDEPARTAMENTO = :idDepartamento, ' +
      'Sclientes.FC_DIANMUNICIPIO = :idMunicipio, ' +
      'Sclientes.FC_EMAIL = ' + QuotedStr(correo) + ', ' +
      'Sclientes.FC_ZONA = ' + QuotedStr(zona) + ', ' +
      'Sclientes.FC_CONTACTO = ' + QuotedStr(contacto) + ' ' +
      'WHERE Sclientes.FC_CODIGO = ' + QuotedStr(filterText);
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
      'INSERT INTO "' + basePath + '\Sclientes.dat" Sclientes (Sclientes.FC_CODIGO, Sclientes.FC_DESCRIPCION, Sclientes.FC_CONTACTO, Sclientes.FC_TELEFONO, Sclientes.FC_DIRECCION1, ' +
      'Sclientes.FC_DIANPAIS, Sclientes.FC_DIANDEPARTAMENTO, Sclientes.FC_DIANMUNICIPIO, Sclientes.FC_EMAIL, Sclientes.FC_ZONA, Sclientes.FC_CONTACTO)' +
      'VALUES ( ' + QuotedStr(filterText) + ', ' +
       QuotedStr(nombre) + ', ' +
       QuotedStr(contacto) + ', ' +
       QuotedStr(telefono) + ', ' +
       QuotedStr(direccion) + ', ' +
       ':idPais, ' +
       ':idDepartamento, ' +
       ':idMunicipio, ' +
       QuotedStr(correo) + ', ' +
       QuotedStr(zona) + ', ' +
       QuotedStr(contacto) + ' )';
      QueryGuardado.ParamByName('idPais').AsString := IntToStr(idPais);
      QueryGuardado.ParamByName('idDepartamento').AsString := IntToStr(idDepartamento);
      QueryGuardado.ParamByName('idMunicipio').AsString := IntToStr(idMunicipio);
      QueryGuardado.ExecSQL;
      ShowMessage('Datos Insertados Exitosamente');
    end;

  {end;}
  uData.moduloDatos.Sclientes.Active := True;
  btBuscarClientes.Enabled := True;
  btModificarClientes.Enabled :=True;
  btAgregarClientes.Enabled := True;
  btCancelarClientes.Enabled := False;
  BtGuardarCliente.Enabled  := False;
  btSalirClientes.Enabled := True;
  cbClientePais.Items.Clear;
  cbClientePais.Text := '';
  cbClienteMunicipio.Items.Clear;
  cbClienteMunicipio.Text := '';
  cbClienteDepartamento.Items.Clear;
  cbClienteDepartamento.Text := '';
end;
end;

procedure TfmClientesa2.btSalirClientesClick(Sender: TObject);

Begin
btBuscarClientes.Enabled := True;
btModificarClientes.Enabled :=True;
btAgregarClientes.Enabled := True;
btCancelarClientes.Enabled := False;
BtGuardarCliente.Enabled  := False;
Close;
end;

end.
