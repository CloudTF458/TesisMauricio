unit UTecnicos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, System.ImageList,
  Vcl.ImgList, Vcl.ComCtrls, Vcl.ToolWin, Data.DB, dbisamtb, Vcl.StdCtrls, UBuscarTecnicos, uData;

type
  TfmTecnicos = class(TForm)
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
    QueryGuardado: TDBISAMQuery;
    QueryUbicacion: TDBISAMQuery;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    mmDireccion: TMemo;
    edNombre: TEdit;
    edRut: TEdit;
    edCorreo: TEdit;
    edTelefono: TEdit;
    cbEstado: TCheckBox;
    Label4: TLabel;
    edComision: TEdit;
    procedure btSalirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btBuscarClick(Sender: TObject);
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
  fmTecnicos: TfmTecnicos;

implementation

{$R *.dfm}

uses UModificarTecnicos;

procedure TfmTecnicos.RecibirDatos(datos: array of string; orden: String);
var
i, col, index : Integer;
basePath, filterText, default : String;
begin
basePath := uData.moduloDatos.a2Database.Directory;
if orden = 'Nombre :' then
begin
edNombre.Text := datos[0];
edRut.Text := datos[1];
edCorreo.Text := datos[2];
edTelefono.Text := datos[3];
edComision.Text := datos[4];
mmDireccion.Text := datos[6];
end;

if orden = 'Correo :' then
begin
edCorreo.Text := datos[0];
edNombre.Text := datos[1];
edRut.Text := datos[2];
edTelefono.Text := datos[3];
edComision.Text := datos[4];
mmDireccion.Text := datos[6];
end;

if orden = 'Rut :' then
begin
edRut.Text := datos[0];
edNombre.Text := datos[1];
edCorreo.Text := datos[2];
edTelefono.Text := datos[3];
edComision.Text := datos[4];
mmDireccion.Text := datos[6];
end;

if datos[5] = 'True' then
begin
cbEstado.Checked := True;
end
else
begin
cbEstado.Checked := False;
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
     (fmTecnicos.mmDireccion.Enabled)
    then
    begin
       fmTecnicos.mmDireccion.Color := clWindow;
    end
    else
    begin
       fmTecnicos.mmDireccion.Color := cl3dLight;
    end;
  end;



edRut.Enabled := False;
edNombre.Enabled := True;
edTelefono.Enabled := True;
mmDireccion.Enabled := True;
edCorreo.Enabled := True;
edComision.Enabled := True;
cbEstado.Enabled := True;

btBuscar.Enabled := False;
btAgregar.Enabled := False;
btModificar.Enabled := False;
btGuardar.Enabled := True;
btCancelar.Enabled := True;
btSalir.Enabled := False;
end;


procedure TfmTecnicos.btAgregarClick(Sender: TObject);
var
  i, col, default: Integer;
  filterText, basePath: String;
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

    mmDireccion.Enabled := True;
    if
      //Cambio el color a los componentes ComboBox.
     (fmTecnicos.mmDireccion.Enabled)
    then
    begin
       fmTecnicos.mmDireccion.Color := clWindow;
    end
    else
    begin
       fmTecnicos.mmDireccion.Color := cl3dLight;
    end;
    Begin
      btCancelar.Enabled := True;
    End;
  end;

  edRut.SetFocus;
  btBuscar.Enabled := not btAgregar.Enabled;
  btModificar.Enabled := False;
  btGuardar.Enabled := True;
  btSalir.Enabled := False;
end;

procedure TfmTecnicos.btBuscarClick(Sender: TObject);
begin
fmBuscarTecnicos :=  TfmBuscarTecnicos.Create(Self);
fmBuscarTecnicos.ShowModal;
end;

procedure TfmTecnicos.btCancelarClick(Sender: TObject);
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
      if edRut.Enabled or
         edNombre.Enabled or
         mmDireccion.Enabled or
         edComision.Enabled or
         edCorreo.Enabled  or
         edTelefono.Enabled or
         cbEstado.Enabled
         then
         begin
         edRut.Color := clWindow ;
         edNombre.Color := clWindow;
         mmDireccion.Color := clWindow;
         edComision.Color := ClWindow;
         edCorreo.Color := clWindow;
         edTelefono.Color := clWindow;
         cbEstado.Color := clWindow;
         end
      else
         begin
         edRut.Color := cl3dLight ;
         edNombre.Color := cl3dLight;
         mmDireccion.Color := cl3dLight;
         edComision.Color := cl3dLight;
         edCorreo.Color := cl3dLight;
         edTelefono.Color := cl3dLight;
         cbEstado.Color := cl3dLight;
         end
    end;
  end;

  btBuscar.Enabled := True;
  btModificar.Enabled := True;
  btSalir.Enabled := True;
  btAgregar.Enabled := True;

  begin
  Menu.Items[1].Enabled := False;
  btCancelar.Enabled := False;
  btGuardar.Enabled := False ;
  end;
end;

procedure TfmTecnicos.btGuardarClick(Sender: TObject);
var
filterText, basePath, rut, nombre, comision, celular, telefono, direccion, correo : String;
status : Boolean;
respuesta : Integer;
begin
  basePath := uData.moduloDatos.a2Database.Directory;
  if (edRut.Text = '') or (mmDireccion.Text = '') or (edNombre.Text = '') then
  begin
    ShowMessage('Por favor, complete todos los campos antes de guardar.');
  end
  else
  begin
    // Aqu� va el c�digo para guardar los datos
    filterText := Trim(edRut.Text);
    QueryGuardado.Close;
    QueryGuardado.SQL.Text :=
      'SELECT COUNT(*) AS Existe ' +
      'FROM "' + basePath + '\Svendedores.dat" Svendedores ' +
      'WHERE Svendedores.FV_CODIGO = ' + QuotedStr(filterText);
    QueryGuardado.Open;

    nombre := Trim(edNombre.Text);
    comision := Trim(edComision.Text);
    telefono := Trim(edTelefono.Text);
    direccion := Trim(mmDireccion.Text);
    correo := Trim(edCorreo.Text);
    status := cbEstado.Checked;

    respuesta := QueryGuardado.FieldByName('Existe').AsInteger;
    uData.moduloDatos.Sclientes.Active := False;
    if respuesta > 0 then
    begin
      QueryGuardado.Close;
      QueryGuardado.SQL.Text :=
      'UPDATE "' + basePath + '\Svendedores.dat" Svendedores ' +
      'SET Svendedores.FV_DESCRIPCION = ' + QuotedStr(nombre) + ', ' +
      'Svendedores.FV_COMISIONVTA1 = ' + QuotedStr(comision) + ', ' +
      'Svendedores.FV_TELEFONO = ' + QuotedStr(telefono) + ', ' +
      'Svendedores.FV_DIRECCION = ' + QuotedStr(direccion) + ', ' +
      'Svendedores.FV_EMAIL = ' + QuotedStr(correo) + ', ' +
      'Svendedores.FV_STATUS = :status ' +
      'WHERE Svendedores.FV_CODIGO = ' + QuotedStr(filterText);
      QueryGuardado.ParamByName('status').AsBoolean := status;
      QueryGuardado.ExecSQL;
      ShowMessage('Datos Guardados Exitosamente');
    end
    else
    begin
      QueryGuardado.Close;
      QueryGuardado.SQL.Text :=
      'INSERT INTO "' + basePath + '\Svendedores.dat" Svendedores (Svendedores.FV_CODIGO, Svendedores.FV_DESCRIPCION, Svendedores.FV_COMISIONVTA1, Svendedores.FV_TELEFONO, Svendedores.FV_DIRECCION, ' +
      'Svendedores.FV_EMAIL, Svendedores.FV_STATUS)' +
      'VALUES ( ' + QuotedStr(filterText) + ', ' +
       QuotedStr(nombre) + ', ' +
       QuotedStr(comision) + ', ' +
       QuotedStr(telefono) + ', ' +
       QuotedStr(direccion) + ', ' +
       QuotedStr(correo) + ', ' +
       ':status )';
      QueryGuardado.ParamByName('status').AsBoolean := status;
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
end;
end;

procedure TfmTecnicos.btModificarClick(Sender: TObject);
begin
fmModificarTecnicos :=  TfmModificarTecnicos.Create(Self);
fmModificarTecnicos.SetParentForm(Self);
fmModificarTecnicos.ShowModal;
end;

procedure TfmTecnicos.btSalirClick(Sender: TObject);
begin
Close;
end;

procedure TfmTecnicos.FormCreate(Sender: TObject);
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

end.
