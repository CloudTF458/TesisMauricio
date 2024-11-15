unit UInventario;

interface

uses
 Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, System.ImageList,
  Vcl.ImgList, Vcl.ComCtrls, Vcl.ToolWin, Data.DB, dbisamtb, Vcl.StdCtrls, UBuscarInventarios, uData;

type
  TfmInventario = class(TForm)
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
    Label2: TLabel;
    edRut: TEdit;
    Label1: TLabel;
    edNombre: TEdit;
    Label10: TLabel;
    cbEstado: TCheckBox;
    Label6: TLabel;
    cbCategoria: TComboBox;
    Label3: TLabel;
    cbDeposito: TComboBox;
    Label4: TLabel;
    edExistencia: TEdit;
    edPrecio: TEdit;
    Label5: TLabel;
    procedure btSalirClick(Sender: TObject);
    procedure btBuscarClick(Sender: TObject);
    procedure btAgregarClick(Sender: TObject);
    procedure btModificarClick(Sender: TObject);
    procedure btGuardarClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    procedure RecibirDatos(datos: array of string; orden: String);
  end;

var
  fmInventario: TfmInventario;

implementation

{$R *.dfm}

uses UModificarInventarios;

procedure TfmInventario.RecibirDatos(datos: array of string; orden: String);
var
i, col, index : Integer;
basePath, filterText, defaultCategoria, defaultDeposito : String;
depositos, categorias: array of string;
begin
basePath := uData.moduloDatos.a2Database.Directory;
if orden = 'Nombre :' then
begin
edNombre.Text := datos[0];
edRut.Text := datos[1];
defaultCategoria := datos[2];
defaultDeposito := datos[3];
edPrecio.Text := datos[5];
edExistencia.Text := datos[6];
end;

if orden = 'Deposito :' then
begin
defaultDeposito := datos[0];
edNombre.Text := datos[1];
edRut.Text := datos[2];
defaultCategoria := datos[3];
edPrecio.Text := datos[5];
edExistencia.Text := datos[6];
end;

if orden = 'Rut :' then
begin
edRut.Text := datos[0];
edNombre.Text := datos[1];
defaultCategoria := datos[2];
defaultDeposito:= datos[3];
edPrecio.Text := datos[5];
edExistencia.Text := datos[6];
end;

if datos[4] = 'True' then
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
     (fmInventario.cbCategoria.Enabled) or
     (fmInventario.cbDeposito.Enabled)
    then
    begin
       fmInventario.cbCategoria.Color := clWindow;
       fmInventario.cbDeposito.Color := clWindow;
    end
    else
    begin
       fmInventario.cbCategoria.Color := cl3dLight;
       fmInventario.cbDeposito.Color := cl3dLight;
    end;
  end;


  //Agrego valores a los ComboBox
  //Depositos
  QueryGuardado.Close;
  QueryGuardado.SQL.Text :=
      'SELECT * ' +
      'FROM "' + basePath + '\Sdepositos.dat"';
  QueryGuardado.Open;
  SetLength(depositos,QueryGuardado.RecordCount);
  col := 0;
  QueryGuardado.First;
  while not QueryGuardado.EoF do
  begin
    depositos[col] := QueryGuardado.FieldByName('FDP_DESCRIPCION').AsString;
    Inc(col);
    QueryGuardado.Next;
  end;
  cbDeposito.Items.Clear;
  for col := 0 to High(depositos) do
  begin
    cbDeposito.Items.Add(depositos[col]);
  end;
  index := cbDeposito.Items.IndexOf(defaultDeposito);
  cbDeposito.ItemIndex := index;

  //Categorias
  QueryGuardado.Close;
  QueryGuardado.SQL.Text :=
      'SELECT * ' +
      'FROM "' + basePath + '\Scategoria.dat"';
  QueryGuardado.Open;
  SetLength(categorias,QueryGuardado.RecordCount);
  col := 0;
  QueryGuardado.First;
  while not QueryGuardado.EoF do
  begin
    categorias[col] := QueryGuardado.FieldByName('FD_DESCRIPCION').AsString;
    Inc(col);
    QueryGuardado.Next;
  end;
  cbCategoria.Items.Clear;
  for col := 0 to High(categorias) do
  begin
    cbCategoria.Items.Add(categorias[col]);
  end;
  index := cbCategoria.Items.IndexOf(defaultCategoria);
  cbCategoria.ItemIndex := index;

edRut.Enabled := False;
edNombre.Enabled := True;
cbCategoria.Enabled := True;
cbDeposito.Enabled := True;
edPrecio.Enabled := True;
edExistencia.Enabled := False;
cbEstado.Enabled := True;

btBuscar.Enabled := False;
btAgregar.Enabled := False;
btModificar.Enabled := False;
btGuardar.Enabled := True;
btCancelar.Enabled := True;
btSalir.Enabled := False;
end;



procedure TfmInventario.btAgregarClick(Sender: TObject);
var
  i, col, default: Integer;
  filterText, basePath: String;
  depositos, categorias: array of string;
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

    cbCategoria.Enabled := True;
    cbDeposito.Enabled := True;
    if
      //Cambio el color a los componentes ComboBox.
    (fmInventario.cbCategoria.Enabled) or
     (fmInventario.cbDeposito.Enabled)
    then
    begin
       fmInventario.cbCategoria.Color := clWindow;
       fmInventario.cbDeposito.Color := clWindow;
    end
    else
    begin
       fmInventario.cbCategoria.Color := cl3dLight;
       fmInventario.cbDeposito.Color := cl3dLight;
    end;
    Begin
      btCancelar.Enabled := True;
    End;
  end;

  //Agrego valores a los ComboBox
  //Depositos
  QueryGuardado.Close;
  QueryGuardado.SQL.Text :=
      'SELECT * ' +
      'FROM "' + basePath + '\Sdepositos.dat"';
  QueryGuardado.Open;
  SetLength(depositos,QueryGuardado.RecordCount);
  col := 0;
  QueryGuardado.First;
  while not QueryGuardado.EoF do
  begin
    depositos[col] := QueryGuardado.FieldByName('FDP_DESCRIPCION').AsString;
    Inc(col);
    QueryGuardado.Next;
  end;
  cbDeposito.Items.Clear;
  for col := 0 to High(depositos) do
  begin
    cbDeposito.Items.Add(depositos[col]);
  end;
  cbDeposito.ItemIndex := 0;

  //Categorias
  QueryGuardado.Close;
  QueryGuardado.SQL.Text :=
      'SELECT * ' +
      'FROM "' + basePath + '\Scategoria.dat"';
  QueryGuardado.Open;
  SetLength(categorias,QueryGuardado.RecordCount);
  col := 0;
  QueryGuardado.First;
  while not QueryGuardado.EoF do
  begin
    categorias[col] := QueryGuardado.FieldByName('FD_DESCRIPCION').AsString;
    Inc(col);
    QueryGuardado.Next;
  end;
  cbCategoria.Items.Clear;
  for col := 0 to High(categorias) do
  begin
    cbCategoria.Items.Add(categorias[col]);
  end;
  cbCategoria.ItemIndex := 0;

  edRut.SetFocus;
  btBuscar.Enabled := not btAgregar.Enabled;
  btModificar.Enabled := False;
  btGuardar.Enabled := True;
  btSalir.Enabled := False;
end;

procedure TfmInventario.btBuscarClick(Sender: TObject);
begin
fmBuscarInventario :=  TfmBuscarInventario.Create(Self);
fmBuscarInventario.ShowModal;
end;

procedure TfmInventario.btCancelarClick(Sender: TObject);
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
         cbCategoria.Enabled or
         cbDeposito.Enabled or
         edPrecio.Enabled  or
         edExistencia.Enabled or
         cbEstado.Enabled
         then
         begin
         edRut.Color := clWindow ;
         edNombre.Color := clWindow;
         cbCategoria.Color := clWindow;
         cbDeposito.Color := ClWindow;
         edPrecio.Color := clWindow;
         edExistencia.Color := clWindow;
         cbEstado.Color := clWindow;
         end
      else
         begin
         edRut.Color := cl3dLight ;
         edNombre.Color := cl3dLight;
         cbCategoria.Color := cl3dLight;
         cbDeposito.Color := cl3dLight;
         edPrecio.Color := cl3dLight;
         edExistencia.Color := cl3dLight;
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

procedure TfmInventario.btGuardarClick(Sender: TObject);
var
filterText, basePath, rut, nombre, categoria, deposito : String;
status : Boolean;
respuesta, idDeposito, idCategoria: Integer;
precio, existencia : Currency;
begin
  basePath := uData.moduloDatos.a2Database.Directory;
  if (edRut.Text = '') or (edExistencia.Text = '') or (edNombre.Text = '') then
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
      'FROM "' + basePath + '\Sinventario.dat" Sinventario ' +
      'WHERE Sinventario.FI_CODIGO = ' + QuotedStr(filterText);
    QueryGuardado.Open;

    nombre := Trim(edNombre.Text);
    categoria := Trim(cbCategoria.Text);
    deposito := Trim(cbDeposito.Text);
    precio := StrToCurr(Trim(edPrecio.Text));
    existencia := StrToCurr(Trim(edExistencia.Text));
    status := cbEstado.Checked;

    respuesta := QueryGuardado.FieldByName('Existe').AsInteger;
    uData.moduloDatos.Sclientes.Active := False;

    QueryGuardado.Close;
    QueryGuardado.SQL.Text := 'SELECT Sdepositos.FDP_CODIGO ' +
    'FROM "' + basePath + '\Sdepositos.dat" Sdepositos ' +
    'WHERE Sdepositos.FDP_DESCRIPCION = ' + QuotedStr(deposito);
    QueryGuardado.Open;
    idDeposito := QueryGuardado.FieldByName('FDP_CODIGO').AsInteger;

    QueryGuardado.Close;
    QueryGuardado.SQL.Text := 'SELECT Scategoria.FD_CODIGO ' +
    'FROM "' + basePath + '\Scategoria.dat" Scategoria ' +
    'WHERE Scategoria.FD_DESCRIPCION = ' + QuotedStr(categoria);
    QueryGuardado.Open;
    idCategoria := QueryGuardado.FieldByName('FD_CODIGO').AsInteger;


    if respuesta > 0 then
    begin
      QueryGuardado.Close;
      QueryGuardado.SQL.Text :=
      'UPDATE "' + basePath + '\Sinventario.dat" Sinventario ' +
      'SET Sinventario.FI_DESCRIPCION = ' + QuotedStr(nombre) + ', ' +
      'Sinventario.FI_CATEGORIA = :idCategoria, ' +
      'Sinventario.FI_STATUS = :status, ' +
      'Sinventario.FI_PESOPRODUCTO = :precio ' +
      'WHERE Sinventario.FI_CODIGO = ' + QuotedStr(filterText);
      QueryGuardado.ParamByName('idCategoria').AsInteger := idCategoria;
      QueryGuardado.ParamByName('precio').AsCurrency := precio;
      QueryGuardado.ParamByName('status').AsBoolean := status;
      QueryGuardado.ExecSQL;

      QueryGuardado.Close;
      QueryGuardado.SQL.Text := 'INSERT INTO "' + basePath + '\SinvDep.dat" SinvDep (SinvDep.FT_TIPO, SinvDep.FT_CODIGOPRODUCTO, SinvDep.FT_CODIGODEPOSITO, SinvDep.FT_EXISTENCIA) ' +
      'VALUES (4,  :id, :idDeposito, :existencia )';
      QueryGuardado.ParamByName('id').AsString := filterText;
      QueryGuardado.ParamByName('idDeposito').AsInteger := idDeposito;
      QueryGuardado.ParamByName('existencia').AsCurrency := existencia;
      ShowMessage('Datos Guardados Exitosamente');

    end
    else
    begin
      QueryGuardado.Close;
      QueryGuardado.SQL.Text :=
      'INSERT INTO "' + basePath + '\Sinventario.dat" Sinventario (Sinventario.FI_CODIGO, Sinventario.FI_DESCRIPCION, Sinventario.FI_CATEGORIA, Sinventario.FI_STATUS, Sinventario.FI_PESOPRODUCTO) ' +
      'VALUES ( ' + QuotedStr(filterText) + ', ' +
       QuotedStr(nombre) + ', ' +
       ':idCategoria , ' +
       ':status, ' +
       ':precio ) ';
      QueryGuardado.ParamByName('idCategoria').AsInteger := idCategoria;
      QueryGuardado.ParamByName('precio').AsCurrency := precio;
      QueryGuardado.ParamByName('status').AsBoolean := status;
      QueryGuardado.ExecSQL;

      QueryGuardado.Close;
      QueryGuardado.SQL.Text := 'INSERT INTO "' + basePath + '\SinvDep.dat" SinvDep (SinvDep.FT_TIPO, SinvDep.FT_CODIGOPRODUCTO, SinvDep.FT_CODIGODEPOSITO, SinvDep.FT_EXISTENCIA) ' +
      'VALUES (4,  :id, :idDeposito, :existencia )';
      QueryGuardado.ParamByName('id').AsString := filterText;
      QueryGuardado.ParamByName('idDeposito').AsInteger := idDeposito;
      QueryGuardado.ParamByName('existencia').AsCurrency := existencia;
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

procedure TfmInventario.btModificarClick(Sender: TObject);
begin
fmModificarInventario :=  TfmModificarInventario.Create(Self);
fmModificarInventario.SetParentForm(Self);
fmModificarInventario.ShowModal;
end;

procedure TfmInventario.btSalirClick(Sender: TObject);
begin
Close;
end;

procedure TfmInventario.FormCreate(Sender: TObject);
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
