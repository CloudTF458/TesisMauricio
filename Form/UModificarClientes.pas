unit UModificarClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, System.ImageList,
  Vcl.ImgList, Vcl.Grids, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ActnMan,
  Vcl.ActnCtrls, Vcl.ToolWin, Data.DB, Vcl.DBGrids, dbisamtb, uData, uClientesa2;
type
  TfmModificarClientes = class(TForm)
    ToolBar1: TToolBar;
    btOrdenarClientes: TToolButton;
    ToolButton2: TToolButton;
    ActionToolBar1: TActionToolBar;
    edModificarClientes: TEdit;
    lbModificarClientes: TLinkLabel;
    StatusBar1: TStatusBar;
    ImagModificarClientes: TImageList;
    MenuOrdenarLista: TPopupMenu;
    Nombre1: TMenuItem;
    Documento1: TMenuItem;
    Contacto1: TMenuItem;
    Ciudad1: TMenuItem;
    GridModificar: TDBGrid;
    dQueryModificarClientes: TDataSource;
    QueryModificarClientes: TDBISAMQuery;
    procedure ToolButton2Click(Sender: TObject);
    procedure Nombre1Click(Sender: TObject);
    procedure Documento1Click(Sender: TObject);
    procedure Contacto1Click(Sender: TObject);
    procedure Ciudad1Click(Sender: TObject);
    procedure edModificarClientesChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure GridModificarDblClick(Sender: TObject);

  private
    FParentForm: TfmClientesa2;
  public
    procedure SetParentForm(AParentForm: TfmClientesa2);

  end;

var
  fmModificarClientes: TfmModificarClientes;

implementation

{$R *.dfm}

procedure TfmModificarClientes.SetParentForm(AParentForm: TfmClientesa2);
begin
  FParentForm := AParentForm;
end;

procedure TfmModificarClientes.Ciudad1Click(Sender: TObject);
var
basePath: string;
begin
basePath := uData.moduloDatos.a2Database.Directory;
lbModificarClientes.Caption := 'Ciudad :';
edModificarClientes.Text := '';
edModificarClientes.SetFocus;
end;

procedure TfmModificarClientes.Contacto1Click(Sender: TObject);
var
basePath: string;
begin
basePath := uData.moduloDatos.a2Database.Directory;
lbModificarClientes.Caption := 'Contacto :';
edModificarClientes.Text := '';
edMOdificarClientes.SetFocus;

QueryModificarClientes.Close;
QueryModificarClientes.SQL.Text :=
      'SELECT ' +
      '  Sclientes.FC_CONTACTO AS Contacto, ' +
      '  Sclientes.FC_DESCRIPCION AS Descripcion, ' +
      '  Sclientes.FC_CODIGO AS RUT, ' +
      '  Sclientes.FC_TELEFONO AS Telefono, ' +
      '  Sclientes.FC_DIRECCION1 As Direccion, ' +
      '  Sclientes.FC_DIANPAIS AS Pais, ' +
      '  Sclientes.FC_DIANDEPARTAMENTO AS Departamento, ' +
      '  Sclientes.FC_DIANMUNICIPIO AS Municipio, ' +
      '  Sclientes.FC_EMAIL AS Correo, ' +
        '  Sclientes.FC_TELEFONO AS Telefono, ' +
      '  Sclientes.FC_CONTACTO AS Contacto, ' +
      ' Sclientes.FC_ZONA AS Zona ' +
      'FROM "' + basePath + '\Sclientes.dat" Sclientes ' +
      'ORDER BY Sclientes.FC_DESCRIPCION ASC';
QueryModificarClientes.Open;
end;

procedure TfmModificarClientes.Documento1Click(Sender: TObject);
var
basePath: string;
begin
basePath := uData.moduloDatos.a2Database.Directory;
lbModificarClientes.Caption := 'Rut :';
edModificarClientes.Text := '';
edMOdificarClientes.SetFocus;

QueryModificarClientes.Close;
QueryModificarClientes.SQL.Text :=
      'SELECT ' +
      '  Sclientes.FC_CODIGO AS RUT, ' +
      '  Sclientes.FC_CONTACTO AS Contacto, ' +
      '  Sclientes.FC_DESCRIPCION AS Descripcion, ' +
      '  Sclientes.FC_TELEFONO AS Telefono, ' +
      '  Sclientes.FC_DIRECCION1 As Direccion, ' +
      '  Sclientes.FC_DIANPAIS AS Pais, ' +
      '  Sclientes.FC_DIANDEPARTAMENTO AS Departamento, ' +
      '  Sclientes.FC_DIANMUNICIPIO AS Municipio, ' +
      '  Sclientes.FC_EMAIL AS Correo, ' +
        '  Sclientes.FC_TELEFONO AS Telefono, ' +
      '  Sclientes.FC_CONTACTO AS Contacto, ' +
      ' Sclientes.FC_ZONA AS Zona ' +
      'FROM "' + basePath + '\Sclientes.dat" Sclientes ' +
      'ORDER BY Sclientes.FC_DESCRIPCION ASC';
QueryModificarClientes.Open;
end;

procedure TfmModificarClientes.Nombre1Click(Sender: TObject);
var
basePath: string;
begin
basePath := uData.moduloDatos.a2Database.Directory;
lbModificarClientes.Caption := 'Nombre :';
edModificarClientes.Text := '';
edMOdificarClientes.SetFocus;

QueryModificarClientes.Close;
QueryModificarClientes.SQL.Text :=
       'SELECT ' +
        '  Sclientes.FC_DESCRIPCION AS Descripcion, ' +
        '  Sclientes.FC_CODIGO AS RUT, ' +
        '  Sclientes.FC_CONTACTO AS Contacto, ' +
        '  Sclientes.FC_TELEFONO AS Telefono, ' +
        '  Sclientes.FC_DIRECCION1 As Direccion, ' +
      '  Sclientes.FC_DIANPAIS AS Pais, ' +
      '  Sclientes.FC_DIANDEPARTAMENTO AS Departamento, ' +
      '  Sclientes.FC_DIANMUNICIPIO AS Municipio, ' +
       '  Sclientes.FC_EMAIL AS Correo, ' +
       '  Sclientes.FC_TELEFONO AS Telefono, ' +
      '  Sclientes.FC_CONTACTO AS Contacto, ' +
      ' Sclientes.FC_ZONA AS Zona ' +
        'FROM "' + basePath + '\Sclientes.dat" Sclientes ' +
        'ORDER BY Sclientes.FC_DESCRIPCION ASC';
QueryModificarClientes.Open;
end;


procedure TfmModificarClientes.edModificarClientesChange(Sender: TObject);
var
  basePath, filterText: string;
begin
basePath := uData.moduloDatos.a2Database.Directory;
  filterText := Trim(edModificarClientes.Text); // Elimina espacios en blanco

  QueryModificarClientes.Close;

  // Verifica que haya texto para filtrar
  if filterText <> '' then
  begin
    if lbModificarClientes.Caption = 'Nombre :' then
    begin
      QueryModificarClientes.SQL.Text :=
        'SELECT ' +
        '  Sclientes.FC_DESCRIPCION AS Descripcion, ' +
        '  Sclientes.FC_CODIGO AS RUT, ' +
        '  Sclientes.FC_CONTACTO AS Contacto, ' +
        '  Sclientes.FC_TELEFONO AS Telefono, ' +
        '  Sclientes.FC_DIRECCION1 As Direccion, ' +
        '  Sclientes.FC_DIANPAIS AS Pais, ' +
        '  Sclientes.FC_DIANDEPARTAMENTO AS Departamento, ' +
        '  Sclientes.FC_DIANMUNICIPIO AS Municipio, ' +
        '  Sclientes.FC_EMAIL AS Correo, ' +
        '  Sclientes.FC_TELEFONO AS Telefono, ' +
      '  Sclientes.FC_CONTACTO AS Contacto, ' +
      ' Sclientes.FC_ZONA AS Zona ' +
        'FROM "' + basePath + '\Sclientes.dat" Sclientes ' +
        'WHERE Sclientes.FC_DESCRIPCION LIKE ''%' + filterText + '%'' ' + // Filtrar por Nombre
        'ORDER BY Sclientes.FC_DESCRIPCION ASC';
    end;

    if lbModificarClientes.Caption = 'Contacto :' then
    begin
      QueryModificarClientes.SQL.Text :=
        'SELECT ' +
        '  Sclientes.FC_CONTACTO AS Contacto, ' +
        '  Sclientes.FC_DESCRIPCION AS Descripcion, ' +
        '  Sclientes.FC_CODIGO AS RUT, ' +
        '  Sclientes.FC_TELEFONO AS Telefono, ' +
        '  Sclientes.FC_DIRECCION1 As Direccion, ' +
      '  Sclientes.FC_DIANPAIS AS Pais, ' +
      '  Sclientes.FC_DIANDEPARTAMENTO AS Departamento, ' +
      '  Sclientes.FC_DIANMUNICIPIO AS Municipio, ' +
        '  Sclientes.FC_EMAIL AS Correo, ' +
        '  Sclientes.FC_TELEFONO AS Telefono, ' +
      '  Sclientes.FC_CONTACTO AS Contacto, ' +
      ' Sclientes.FC_ZONA AS Zona ' +
        'FROM "' + basePath + '\Sclientes.dat" Sclientes ' +
        'WHERE Sclientes.FC_CONTACTO LIKE ''%' + filterText + '%'' ' + // Filtrar por Contacto
        'ORDER BY Sclientes.FC_DESCRIPCION ASC';
    end;

    if lbModificarClientes.Caption = 'Rut :' then
    begin
      QueryModificarClientes.SQL.Text :=
        'SELECT ' +
        '  Sclientes.FC_CODIGO AS RUT, ' +
        '  Sclientes.FC_DESCRIPCION AS Descripcion, ' +
        '  Sclientes.FC_CONTACTO AS Contacto, ' +
        '  Sclientes.FC_TELEFONO AS Telefono, ' +
        '  Sclientes.FC_DIRECCION1 As Direccion, ' +
      '  Sclientes.FC_DIANPAIS AS Pais, ' +
      '  Sclientes.FC_DIANDEPARTAMENTO AS Departamento, ' +
      '  Sclientes.FC_DIANMUNICIPIO AS Municipio, ' +
        '  Sclientes.FC_EMAIL AS Correo, ' +
        '  Sclientes.FC_TELEFONO AS Telefono, ' +
      '  Sclientes.FC_CONTACTO AS Contacto, ' +
      ' Sclientes.FC_ZONA AS Zona ' +
        'FROM "' + basePath + '\Sclientes.dat" Sclientes ' +
        'WHERE Sclientes.FC_CODIGO LIKE ''%' + filterText + '%'' ' + // Filtrar por Rut
        'ORDER BY Sclientes.FC_DESCRIPCION ASC';
    end;
  end else
  begin
      if lbModificarClientes.Caption = 'Nombre :' then
    begin
      QueryModificarClientes.SQL.Text :=
        'SELECT ' +
        '  Sclientes.FC_DESCRIPCION AS Descripcion, ' +
        '  Sclientes.FC_CODIGO AS RUT, ' +
        '  Sclientes.FC_CONTACTO AS Contacto, ' +
        '  Sclientes.FC_TELEFONO AS Telefono, ' +
        '  Sclientes.FC_DIRECCION1 As Direccion, ' +
      '  Sclientes.FC_DIANPAIS AS Pais, ' +
      '  Sclientes.FC_DIANDEPARTAMENTO AS Departamento, ' +
      '  Sclientes.FC_DIANMUNICIPIO AS Municipio, ' +
        '  Sclientes.FC_EMAIL AS Correo, ' +
        '  Sclientes.FC_TELEFONO AS Telefono, ' +
      '  Sclientes.FC_CONTACTO AS Contacto, ' +
      ' Sclientes.FC_ZONA AS Zona ' +
        'FROM "' + basePath + '\Sclientes.dat" Sclientes ' +
        'ORDER BY Sclientes.FC_DESCRIPCION ASC';
    end;

    if lbModificarClientes.Caption = 'Contacto :' then
    begin
      QueryModificarClientes.SQL.Text :=
        'SELECT ' +
        '  Sclientes.FC_CONTACTO AS Contacto, ' +
        '  Sclientes.FC_DESCRIPCION AS Descripcion, ' +
        '  Sclientes.FC_CODIGO AS RUT, ' +
        '  Sclientes.FC_TELEFONO AS Telefono, ' +
        '  Sclientes.FC_DIRECCION1 As Direccion, ' +
      '  Sclientes.FC_DIANPAIS AS Pais, ' +
      '  Sclientes.FC_DIANDEPARTAMENTO AS Departamento, ' +
      '  Sclientes.FC_DIANMUNICIPIO AS Municipio, ' +
        '  Sclientes.FC_EMAIL AS Correo, ' +
        '  Sclientes.FC_TELEFONO AS Telefono, ' +
      '  Sclientes.FC_CONTACTO AS Contacto, ' +
      ' Sclientes.FC_ZONA AS Zona ' +
        'FROM "' + basePath + '\Sclientes.dat" Sclientes ' +
        'ORDER BY Sclientes.FC_DESCRIPCION ASC';
    end;

    if lbModificarClientes.Caption = 'Rut :' then
    begin
      QueryModificarClientes.SQL.Text :=
        'SELECT ' +
        '  Sclientes.FC_CODIGO AS RUT, ' +
        '  Sclientes.FC_DESCRIPCION AS Descripcion, ' +
        '  Sclientes.FC_CONTACTO AS Contacto, ' +
        '  Sclientes.FC_TELEFONO AS Telefono, ' +
        '  Sclientes.FC_DIRECCION1 As Direccion, ' +
        '  Sclientes.FC_DIANPAIS AS Pais, ' +
        '  Sclientes.FC_DIANDEPARTAMENTO AS Departamento, ' +
        '  Sclientes.FC_DIANMUNICIPIO AS Municipio, ' +
        '  Sclientes.FC_EMAIL AS Correo, ' +
        '  Sclientes.FC_TELEFONO AS Telefono, ' +
      '  Sclientes.FC_CONTACTO AS Contacto, ' +
      ' Sclientes.FC_ZONA AS Zona ' +
        'FROM "' + basePath + '\Sclientes.dat" Sclientes ' +
        'ORDER BY Sclientes.FC_DESCRIPCION ASC';
    end;
  end;
  QueryModificarClientes.Open;
end;


procedure TfmModificarClientes.FormCreate(Sender: TObject);
var
basePath: string;
begin
  QueryModificarClientes.Close;
basePath := uData.moduloDatos.a2Database.Directory;
 QueryModificarClientes.SQL.Text :=
 'SELECT ' +
        '  Sclientes.FC_DESCRIPCION AS Descripcion, ' +
        '  Sclientes.FC_CODIGO AS RUT, ' +
        '  Sclientes.FC_CONTACTO AS Contacto, ' +
        '  Sclientes.FC_TELEFONO AS Telefono, ' +
        '  Sclientes.FC_DIRECCION1 As Direccion, ' +
      '  Sclientes.FC_DIANPAIS AS Pais, ' +
      '  Sclientes.FC_DIANDEPARTAMENTO AS Departamento, ' +
      '  Sclientes.FC_DIANMUNICIPIO AS Municipio, ' +
        '  Sclientes.FC_EMAIL AS Correo, ' +
        '  Sclientes.FC_TELEFONO AS Telefono, ' +
      '  Sclientes.FC_CONTACTO AS Contacto, ' +
      ' Sclientes.FC_ZONA AS Zona ' +
        'FROM "' + basePath + '\Sclientes.dat" Sclientes ' +
        'ORDER BY Sclientes.FC_DESCRIPCION ASC';
 QueryModificarClientes.Open;

end;


procedure TfmModificarClientes.GridModificarDblClick(Sender: TObject);
var
datosFila: array of string;
col: Integer;
orden: String;
begin
SetLength(datosFila, GridModificar.Columns.Count);
orden := lbModificarClientes.Caption;
for col := 0 to GridModificar.Columns.Count-1 do
begin
  datosFila[col] := GridModificar.Columns[col].Field.AsString;
end;

if Assigned(FParentForm) then
    FParentForm.RecibirDatos(datosFila,orden);
    Close;

end;

procedure TfmModificarClientes.ToolButton2Click(Sender: TObject);
begin
Close;
end;

end.
