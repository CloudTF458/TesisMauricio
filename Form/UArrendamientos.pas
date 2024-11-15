unit UArrendamientos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, System.ImageList,
  Vcl.ImgList, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ToolWin, Data.DB, dbisamtb, uData,
  Vcl.Grids, Vcl.DBGrids;

type
  TfmArrendamientos = class(TForm)
    cbDuracion: TComboBox;
    Label6: TLabel;
    Label1: TLabel;
    cbDeposito: TComboBox;
    Label2: TLabel;
    cbCliente: TComboBox;
    Label3: TLabel;
    cbTecnico: TComboBox;
    TablaBusqueda: TDBGrid;
    ToolBar1: TToolBar;
    btAgregar: TToolButton;
    btGuardar: TToolButton;
    btCancelar: TToolButton;
    btSalir: TToolButton;
    ImagLista: TImageList;
    btInventario: TButton;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    edDocumento: TEdit;
    edCosto: TEdit;
    Menu: TMainMenu;
    Menu1: TMenuItem;
    Agregar1: TMenuItem;
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
    StringGrid1: TStringGrid;
    QueryTabla: TDBISAMQuery;
    dtFecha: TDateTimePicker;
    dQueryTabla: TDataSource;
    QueryArrendamiento: TDBISAMQuery;
    procedure btSalirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btAgregarClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure btInventarioClick(Sender: TObject);
    procedure TablaBusquedaKeyPress(Sender: TObject; var Key: Char);
    procedure btGuardarClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure RecibirDatos(datos: array of string; orden: String);
  end;

var
  fmArrendamientos: TfmArrendamientos;

implementation

{$R *.dfm}

uses UModificarInventarios;

procedure TfmArrendamientos.RecibirDatos(datos: array of string; orden: String);
var
i, col, index, suma: Integer;
basePath, filterText, defaultCategoria, defaultDeposito, nombre, rut, precio: String;
valores, cantidades : array of string;
begin
basePath := uData.moduloDatos.a2Database.Directory;
if orden = 'Nombre :' then
begin
nombre := datos[0];
rut := datos[1];
defaultDeposito := datos[3];
precio := datos[5];
end;

if orden = 'Deposito :' then
begin
defaultDeposito := datos[0];
nombre := datos[1];
rut := datos[2];
precio := datos[5];
end;

if orden = 'Rut :' then
begin
rut := datos[0];
nombre := datos[1];
defaultDeposito:= datos[3];
precio := datos[5];
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
    end

    else if Components[i] is TDateTimePicker then
    begin
      with TDateTimePicker(Components[i]) do
      begin
        Enabled := True;
        // No puedes cambiar el color de un TComboBox directamente
      end;
    end;

    if
      //Cambio el color a los componentes ComboBox.
    (fmArrendamientos.cbCliente.Enabled) or
     (fmArrendamientos.cbDeposito.Enabled) or
     (fmArrendamientos.cbTecnico.Enabled) or
     (fmArrendamientos.cbDuracion.Enabled) or
     (fmArrendamientos.dtFecha.Enabled)
    then
    begin
       fmArrendamientos.cbCliente.Color := clWindow;
       fmArrendamientos.cbDeposito.Color := clWindow;
       fmArrendamientos.cbTecnico.Color := clWindow;
       fmArrendamientos.cbDuracion.Color := clWindow;
       fmArrendamientos.dtFecha.Color := clWindow;
    end
    else
    begin
       fmArrendamientos.cbCliente.Color := cl3dLight;
       fmArrendamientos.cbDeposito.Color := cl3dLight;
       fmArrendamientos.cbTecnico.Color := cl3dLight;
       fmArrendamientos.cbDuracion.Color := cl3dLight;
       fmArrendamientos.dtFecha.Color := cl3dLight;
    end;
  end;

cbDuracion.Enabled := True;
cbDeposito.Enabled := True;
cbCliente.Enabled := True;
cbTecnico.Enabled := True;
edDocumento.Enabled := True;
edCosto.Enabled := False;
dtFecha.Enabled := True;

btAgregar.Enabled := False;
btGuardar.Enabled := True;
btCancelar.Enabled := True;
btSalir.Enabled := False;

//Obtengo el ID del deposito
QueryTabla.Close;
QueryTabla.SQL.Clear;
QueryTabla.SQL.Text :=
'SELECT Sdepositos.FDP_CODIGO FROM "' + basePath + '\Sdepositos.dat" Sdepositos WHERE Sdepositos.FDP_DESCRIPCION = :defaultDeposito';
QueryTabla.ParamByName('defaultDeposito').AsString := defaultDeposito;
QueryTabla.Open;
defaultDeposito := QueryTabla.FieldByName('FDP_CODIGO').AsString;

//Agrego nueva fila a la tabla
QueryTabla.Close;
QueryTabla.SQL.Clear;
QueryTabla.SQL.Text :=
'INSERT INTO Arrendamiento (Codigo, Nombre, Cantidad, Deposito, Precio) VALUES (:rut, :nombre, :cantidad, :defaultDeposito, :precio)';
QueryTabla.ParamByName('rut').AsString := rut;
QueryTabla.ParamByName('nombre').AsString := nombre;
QueryTabla.ParamByName('cantidad').AsString := '1';
QueryTabla.ParamByName('defaultDeposito').AsString := defaultDeposito;
QueryTabla.ParamByName('precio').AsString := precio;
QueryTabla.ExecSQL;

QueryTabla.Close;
  QueryTabla.SQL.Text :=
      'SELECT * ' +
      'FROM Arrendamiento';
  QueryTabla.Open;
  SetLength(valores,QueryTabla.RecordCount);
  SetLength(cantidades,QueryTabla.RecordCount);
  col := 0;
  QueryTabla.First;
  while not QueryTabla.EoF do
  begin
    suma := QueryTabla.FieldByName('Precio').AsInteger * QueryTabla.FieldByName('Cantidad').AsInteger;
    Inc(col);
    QueryTabla.Next;
  end;
  edCosto.Text := suma.ToString;

 QueryTabla.Close;
 QueryTabla.SQL.Clear;
  QueryTabla.SQL.Text :=
  'SELECT Codigo, Nombre, Cantidad FROM Arrendamiento';
  QueryTabla.Open;

  QueryTabla.FieldByName('Codigo').ReadOnly := True;
  QueryTabla.FieldByName('Nombre').ReadOnly := True;
  QueryTabla.FieldByName('Cantidad').ReadOnly := False;

end;


procedure TfmArrendamientos.btAgregarClick(Sender: TObject);
var
  i, col, default: Integer;
  filterText, basePath: String;
  depositos, clientes, tecnicos: array of string;
begin
  //Crea una tabla que es la que se usara para crear el arrendamiento
  QueryArrendamiento.Close;
  QueryArrendamiento.SQL.Clear;
  QueryArrendamiento.SQL.Text :=
  'CREATE TABLE Arrendamiento (Codigo VARCHAR(50), Nombre VARCHAR(100), Cantidad VARCHAR(100), Deposito VARCHAR(100), Precio VARCHAR(100))';
  QueryArrendamiento.ExecSQL;
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
    end

    else if Components[i] is TDateTimePicker then
    begin
      with TDateTimePicker(Components[i]) do
      begin
      Enabled := True;
      if Enabled then
          Color := clWindow
        else
          Color := cl3dLight;
      end;
    end;

    cbCliente.Enabled := True;
    cbDeposito.Enabled := True;
    cbTecnico.Enabled := True;
    cbDuracion.Enabled := True;
    dtFecha.Enabled := True;
    if
      //Cambio el color a los componentes ComboBox.
    (fmArrendamientos.cbCliente.Enabled) or
     (fmArrendamientos.cbDeposito.Enabled) or
     (fmArrendamientos.cbTecnico.Enabled) or
     (fmArrendamientos.cbDuracion.Enabled) or
     (fmArrendamientos.dtFecha.Enabled)
    then
    begin
       fmArrendamientos.cbCliente.Color := clWindow;
       fmArrendamientos.cbDeposito.Color := clWindow;
       fmArrendamientos.cbTecnico.Color := clWindow;
       fmArrendamientos.cbDuracion.Color := clWindow;
       fmArrendamientos.dtFecha.Color := clWindow;
    end
    else
    begin
       fmArrendamientos.cbCliente.Color := cl3dLight;
       fmArrendamientos.cbDeposito.Color := cl3dLight;
       fmArrendamientos.cbTecnico.Color := cl3dLight;
       fmArrendamientos.cbDuracion.Color := cl3dLight;
       fmArrendamientos.dtFecha.Color := cl3dLight;
    end;
    Begin
      btCancelar.Enabled := True;
    End;
  end;

  //Agrego valores a los ComboBox
  //Depositos
  QueryArrendamiento.Close;
  QueryArrendamiento.SQL.Text :=
      'SELECT * ' +
      'FROM "' + basePath + '\Sdepositos.dat"';
  QueryArrendamiento.Open;
  SetLength(depositos,QueryArrendamiento.RecordCount);
  col := 0;
  QueryArrendamiento.First;
  while not QueryArrendamiento.EoF do
  begin
    depositos[col] := QueryArrendamiento.FieldByName('FDP_DESCRIPCION').AsString;
    Inc(col);
    QueryArrendamiento.Next;
  end;
  cbDeposito.Items.Clear;
  for col := 0 to High(depositos) do
  begin
    cbDeposito.Items.Add(depositos[col]);
  end;
  cbDeposito.ItemIndex := 0;

  //Clientes
   QueryArrendamiento.Close;
  QueryArrendamiento.SQL.Text :=
      'SELECT * ' +
      'FROM "' + basePath + '\Sclientes.dat"';
  QueryArrendamiento.Open;
  SetLength(clientes,QueryArrendamiento.RecordCount);
  col := 0;
  QueryArrendamiento.First;
  while not QueryArrendamiento.EoF do
  begin
    clientes[col] := QueryArrendamiento.FieldByName('FC_DESCRIPCION').AsString;
    Inc(col);
    QueryArrendamiento.Next;
  end;
  cbCliente.Items.Clear;
  for col := 0 to High(clientes) do
  begin
    cbCliente.Items.Add(clientes[col]);
  end;
  cbCliente.ItemIndex := 0;

  //Tecnicos
   QueryArrendamiento.Close;
  QueryArrendamiento.SQL.Text :=
      'SELECT * ' +
      'FROM "' + basePath + '\Svendedores.dat"';
  QueryArrendamiento.Open;
  SetLength(tecnicos,QueryArrendamiento.RecordCount);
  col := 0;
  QueryArrendamiento.First;
  while not QueryArrendamiento.EoF do
  begin
    tecnicos[col] := QueryArrendamiento.FieldByName('FV_DESCRIPCION').AsString;
    Inc(col);
    QueryArrendamiento.Next;
  end;
  cbTecnico.Items.Clear;
  for col := 0 to High(tecnicos) do
  begin
    cbTecnico.Items.Add(tecnicos[col]);
  end;
  cbTecnico.ItemIndex := 0;

  QueryTabla.Close;
  QueryTabla.SQL.Text :=
  'SELECT Codigo, Nombre, Cantidad FROM Arrendamiento';
  QueryTabla.Open;

  btInventario.Enabled := btAgregar.Enabled;
  btGuardar.Enabled := True;
  btSalir.Enabled := False;
end;

procedure TfmArrendamientos.btCancelarClick(Sender: TObject);
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
      if cbDuracion.Enabled or
         cbDeposito.Enabled or
         cbCliente.Enabled or
         cbTecnico.Enabled or
         edDocumento.Enabled  or
         dtFecha.Enabled or
         edCosto.Enabled
         then
         begin
         cbDuracion.Color := clWindow ;
         cbDeposito.Color := clWindow;
         cbCliente.Color := clWindow;
         cbTecnico.Color := ClWindow;
         edDocumento.Color := clWindow;
         dtFecha.Color := clWindow;
         edCosto.Color := clWindow;
         end
      else
         begin
         cbDuracion.Color := cl3dLight ;
         cbDeposito.Color := cl3dLight;
         cbCliente.Color := cl3dLight;
         cbTecnico.Color := cl3dLight;
         edDocumento.Color := cl3dLight;
         dtFecha.Color := cl3dLight;
         edCosto.Color := cl3dLight;
         end
    end;
  end;

  btInventario.Enabled := False;
  btSalir.Enabled := True;
  btAgregar.Enabled := True;

  begin
  Menu.Items[1].Enabled := False;
  btCancelar.Enabled := False;
  btGuardar.Enabled := False ;
  end;

  QueryTabla.Close;
  QueryTabla.SQL.Clear;
  QueryTabla.SQL.Text :=
  'DROP TABLE Arrendamiento';
  QueryTabla.ExecSQL;
  QueryTabla.Close;

end;

procedure TfmArrendamientos.btGuardarClick(Sender: TObject);
var
codigo, nombre, cantidad, deposito, precio: array of string;
col, totalItems, totalCosto, depositoSource : Integer;
basePath, descripcion: String;
begin
basePath := uData.moduloDatos.a2Database.Directory;

QueryArrendamiento.Close;
QueryArrendamiento.SQL.Text :=
'SELECT Sdepositos.FDP_CODIGO FROM "' + basePath + '\Sdepositos.dat" Sdepositos WHERE Sdepositos.FDP_DESCRIPCION = :deposito';
QueryArrendamiento.ParamByName('deposito').AsString := cbDeposito.Text;
QueryArrendamiento.Open;
depositoSource := QueryArrendamiento.FieldByName('FDP_CODIGO').AsInteger;

QueryArrendamiento.Close;
  QueryArrendamiento.SQL.Text :=
      'SELECT * ' +
      'FROM Arrendamiento';
  QueryArrendamiento.Open;
  SetLength(codigo, QueryArrendamiento.RecordCount);
  SetLength(nombre, QueryArrendamiento.RecordCount);
  SetLength(cantidad, QueryArrendamiento.RecordCount);
  SetLength(deposito, QueryArrendamiento.RecordCount);
  SetLength(precio, QueryArrendamiento.RecordCount);
  col := 0;
  QueryArrendamiento.First;
  while not QueryArrendamiento.EoF do
  begin
    codigo[col] := QueryArrendamiento.FieldByName('Codigo').AsString;
    nombre[col] := QueryArrendamiento.FieldByName('Nombre').AsString;
    cantidad[col] := QueryArrendamiento.FieldByName('Cantidad').AsString;
    deposito[col] := QueryArrendamiento.FieldByName('Deposito').AsString;
    precio[col] := QueryArrendamiento.FieldByName('Precio').AsString;
    Inc(col);
    QueryArrendamiento.Next;
  end;

  descripcion := '';
  totalItems := 0;
  totalCosto := 0;
  for col := 0 to High(codigo) do
  begin
    descripcion := descripcion + 'Codigo: ' + codigo[col]
    + ' Nombre: ' + nombre[col] + ' Cantidad: ' + cantidad[col] + ' Deposito: ' + deposito[col]
    + ' Precio: ' + precio[col] + #13#10;
    totalItems := totalItems + cantidad[col].ToInteger;
    totalCosto := totalCosto + precio[col].ToInteger;
  end;

  descripcion := descripcion + 'Cliente: ' + cbCliente.Text;
  QueryArrendamiento.Close;
  QueryArrendamiento.SQL.Text :=
  'INSERT INTO "' + basePath + '\SOperacionInv.dat" SOperacionInv (SOperacionInv.FTI_DOCUMENTO, ' +
  'SOperacionInv.FTI_TIPO, SOperacionInv.FTI_STATUS, SOperacionInv.FTI_FECHAEMISION, SOperacionInv.FTI_DEPOSITOSOURCE, SOperacionInv.FTI_TOTALITEMS, SOperacionInv.FTI_TOTALCOSTO, '+
  'SOperacionInv.FTI_VENDEDORASIGNADO, SOperacionInv.FTI_DETALLE, SOperacionInv.FTI_PROPOSITO) ' +
  'VALUES (:documento, :tipo, :status, :fecha, :deposito, :cantidad, :costo, :tecnico, :detalle, :proposito)';
  QueryArrendamiento.ParamByName('documento').AsString := edDocumento.Text;
  QueryArrendamiento.ParamByName('tipo').AsInteger := 11;
  QueryArrendamiento.ParamByName('status').AsInteger := 4;
  QueryArrendamiento.ParamByName('fecha').AsDateTime := dtFecha.DateTime;
  QueryArrendamiento.ParamByName('deposito').AsInteger := depositoSource;
  QueryArrendamiento.ParamByName('cantidad').AsInteger := totalItems;
  QueryArrendamiento.ParamByName('costo').AsInteger := totalCosto;
  QueryArrendamiento.ParamByName('tecnico').AsString := cbTecnico.Text;
  QueryArrendamiento.ParamByName('detalle').AsMemo := descripcion;
  QueryArrendamiento.ParamByName('proposito').AsString := 'Contrado de Arrendamiento';
  QueryArrendamiento.ExecSQL;

  QueryTabla.Close;
  btAgregar.Enabled := True;
  btInventario.Enabled := False;
  btCancelar.Enabled := False;
  BtGuardar.Enabled  := False;
  btSalir.Enabled := True;
end;

procedure TfmArrendamientos.btInventarioClick(Sender: TObject);
begin
fmModificarInventario :=  TfmModificarInventario.Create(Self);
fmModificarInventario.SetParentFormArrendamiento(Self);
fmModificarInventario.ShowModal;
end;

procedure TfmArrendamientos.btSalirClick(Sender: TObject);
begin
Close;
end;

procedure TfmArrendamientos.FormCreate(Sender: TObject);
var
  i, col, default: Integer;
  filterText, basePath: String;
  pais, departamento, municipio: array of string;
begin
 QueryTabla.Close;
  QueryTabla.SQL.Clear;
  QueryTabla.SQL.Text :=
  'DROP TABLE Arrendamiento';
  QueryTabla.ExecSQL;
  QueryTabla.Close;
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
    end

    else if Components[i] is TDateTimePicker then
    begin
      with TDateTimePicker(Components[i]) do
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

procedure TfmArrendamientos.TablaBusquedaKeyPress(Sender: TObject;
  var Key: Char);
var
id, cantidad: String;
suma, i, col: Integer;
valores, cantidades : array of string;
begin

if Key = #13 then
begin

cantidad := QueryTabla.FieldByName('Cantidad').AsString;
id := QueryTabla.FieldByName('Codigo').AsString;

QueryTabla.Close;
QueryTabla.SQL.Text :=
'UPDATE Arrendamiento SET Cantidad = :cantidad WHERE Codigo = :rut';
QueryTabla.ParamByName('rut').AsString := id;
QueryTabla.ParamByName('cantidad').AsString := cantidad;
QueryTabla.ExecSQL;

QueryTabla.Close;
  QueryTabla.SQL.Text :=
      'SELECT * ' +
      'FROM Arrendamiento';
  QueryTabla.Open;
  SetLength(valores,QueryTabla.RecordCount);
  SetLength(cantidades,QueryTabla.RecordCount);
  col := 0;
  QueryTabla.First;
  while not QueryTabla.EoF do
  begin
    suma := QueryTabla.FieldByName('Precio').AsInteger * QueryTabla.FieldByName('Cantidad').AsInteger;
    Inc(col);
    QueryTabla.Next;
  end;
  edCosto.Text := suma.ToString;

 QueryTabla.Close;
  QueryTabla.SQL.Text :=
  'SELECT Codigo, Nombre, Cantidad FROM Arrendamiento';
  QueryTabla.Open;
  QueryTabla.FieldByName('Codigo').ReadOnly := True;
  QueryTabla.FieldByName('Nombre').ReadOnly := True;
  QueryTabla.FieldByName('Cantidad').ReadOnly := False;
end;
end;
end.
