unit UModificarProveedores;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.ImageList, Vcl.ImgList, Vcl.Menus,
  Data.DB, dbisamtb, Vcl.ComCtrls, Vcl.ToolWin, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ActnMan, Vcl.ActnCtrls,uData, uProveedores;

type
  TfmModificarProveedores = class(TForm)
    ImagModificarLista: TImageList;
    MenuOrdenar: TPopupMenu;
    Nombre1: TMenuItem;
    Documento1: TMenuItem;
    Contacto1: TMenuItem;
    TablaBusqueda: TDBGrid;
    lbModificar: TLinkLabel;
    edModificar: TEdit;
    dQueryModificar: TDataSource;
    ToolBar1: TToolBar;
    btOrdenar: TToolButton;
    btSalirModificar: TToolButton;
    QueryModificar: TDBISAMQuery;
    procedure FormCreate(Sender: TObject);
    procedure btSalirModificarClick(Sender: TObject);
    procedure edModificarChange(Sender: TObject);
    procedure Nombre1Click(Sender: TObject);
    procedure Documento1Click(Sender: TObject);
    procedure Contacto1Click(Sender: TObject);
    procedure TablaBusquedaDblClick(Sender: TObject);
  private
     FParentForm: TfmProveedores;
  public
    procedure SetParentForm(AParentForm: TfmProveedores);
  end;

var
  fmModificarProveedores: TfmModificarProveedores;

implementation
{$R *.dfm}

procedure TfmModificarProveedores.SetParentForm(AParentForm: TfmProveedores);
begin
  FParentForm := AParentForm;
end;


procedure TfmModificarProveedores.btSalirModificarClick(Sender: TObject);
begin
Close;
end;


procedure TfmModificarProveedores.Nombre1Click(Sender: TObject);
var
basePath: string;
begin
  QueryModificar.Close;
basePath := uData.moduloDatos.a2Database.Directory;
lbModificar.Caption := 'Nombre :';
edModificar.Text := '';
edModificar.SetFocus;

QueryModificar.SQL.Text :=
'SELECT ' +
        '  Sproveedor.FP_DESCRIPCION AS Descripcion, ' +
        '  Sproveedor.FP_CODIGO AS RUT, ' +
        '  Sproveedor.FP_CONTACTO AS Contacto, ' +
        '  Sproveedor.FP_TELEFONO AS Telefono, ' +
        '  Sproveedor.FP_DIRECCION1 As Direccion, ' +
        '  Sproveedor.FP_DIANPAIS AS Pais, ' +
        '  Sproveedor.FP_DIANDEPARTAMENTO AS Departamento, ' +
        '  Sproveedor.FP_DIANMUNICIPIO AS Municipio, ' +
        '  Sproveedor.FP_EMAIL AS Correo, ' +
        '  Sproveedor.FP_TELEFONO AS Telefono, ' +
      '  Sproveedor.FP_CONTACTO AS Contacto, ' +
      ' Sproveedor.FP_STATUS AS Estado ' +
        'FROM "' + basePath + '\Sproveedor.dat" Sproveedor ' +
        'ORDER BY Sproveedor.FP_DESCRIPCION ASC';
          QueryModificar.Open;
end;

procedure TfmModificarProveedores.TablaBusquedaDblClick(Sender: TObject);
var
datosFila: array of string;
col: Integer;
orden: String;
begin
SetLength(datosFila, TablaBusqueda.Columns.Count);
orden := lbModificar.Caption;
for col := 0 to TablaBusqueda.Columns.Count-1 do
begin
  datosFila[col] := TablaBusqueda.Columns[col].Field.AsString;
end;

if Assigned(FParentForm) then
    FParentForm.RecibirDatos(datosFila,orden);
    Close;
end;

procedure TfmModificarProveedores.Contacto1Click(Sender: TObject);
var
basePath: string;
begin
  QueryModificar.Close;
basePath := uData.moduloDatos.a2Database.Directory;
lbModificar.Caption := 'Contacto :';
edModificar.Text := '';
edModificar.SetFocus;

QueryModificar.SQL.Text :=
    'SELECT ' +
        '  Sproveedor.FP_CONTACTO AS Contacto, ' +
        '  Sproveedor.FP_DESCRIPCION AS Descripcion, ' +
        '  Sproveedor.FP_CODIGO AS RUT, ' +
        '  Sproveedor.FP_TELEFONO AS Telefono, ' +
        '  Sproveedor.FP_DIRECCION1 As Direccion, ' +
        '  Sproveedor.FP_DIANPAIS AS Pais, ' +
        '  Sproveedor.FP_DIANDEPARTAMENTO AS Departamento, ' +
        '  Sproveedor.FP_DIANMUNICIPIO AS Municipio, ' +
        '  Sproveedor.FP_EMAIL AS Correo, ' +
        '  Sproveedor.FP_TELEFONO AS Telefono, ' +
      '  Sproveedor.FP_CONTACTO AS Contacto, ' +
      ' Sproveedor.FP_STATUS AS Estado ' +
        'FROM "' + basePath + '\Sproveedor.dat" Sproveedor ' +
        'ORDER BY Sproveedor.FP_DESCRIPCION ASC';
          QueryModificar.Open;

end;

procedure TfmModificarProveedores.Documento1Click(Sender: TObject);
var
basePath: string;
begin
  QueryModificar.Close;
basePath := uData.moduloDatos.a2Database.Directory;
lbModificar.Caption := 'Rut :';
edModificar.Text := '';
edModificar.SetFocus;

QueryModificar.SQL.Text :=
'SELECT ' +
        '  Sproveedor.FP_CODIGO AS RUT, ' +
        '  Sproveedor.FP_DESCRIPCION AS Descripcion, ' +
        '  Sproveedor.FP_CONTACTO AS Contacto, ' +
        '  Sproveedor.FP_TELEFONO AS Telefono, ' +
        '  Sproveedor.FP_DIRECCION1 As Direccion, ' +
        '  Sproveedor.FP_DIANPAIS AS Pais, ' +
        '  Sproveedor.FP_DIANDEPARTAMENTO AS Departamento, ' +
        '  Sproveedor.FP_DIANMUNICIPIO AS Municipio, ' +
        '  Sproveedor.FP_EMAIL AS Correo, ' +
        '  Sproveedor.FP_TELEFONO AS Telefono, ' +
      '  Sproveedor.FP_CONTACTO AS Contacto, ' +
      ' Sproveedor.FP_STATUS AS Estado ' +
        'FROM "' + basePath + '\Sproveedor.dat" Sproveedor ' +
        'ORDER BY Sproveedor.FP_DESCRIPCION ASC';
          QueryModificar.Open;

end;

procedure TfmModificarProveedores.edModificarChange(Sender: TObject);
var
  basePath, filterText: string;
begin
basePath := uData.moduloDatos.a2Database.Directory;
  filterText := Trim(edModificar.Text); // Elimina espacios en blanco

  QueryModificar.Close;
  if filterText <> '' then
  begin
    if lbModificar.Caption = 'Nombre :' then
    begin
      QueryModificar.SQL.Text :=
      'SELECT ' +
        '  Sproveedor.FP_DESCRIPCION AS Descripcion, ' +
        '  Sproveedor.FP_CODIGO AS RUT, ' +
        '  Sproveedor.FP_CONTACTO AS Contacto, ' +
        '  Sproveedor.FP_TELEFONO AS Telefono, ' +
        '  Sproveedor.FP_DIRECCION1 As Direccion, ' +
        '  Sproveedor.FP_DIANPAIS AS Pais, ' +
        '  Sproveedor.FP_DIANDEPARTAMENTO AS Departamento, ' +
        '  Sproveedor.FP_DIANMUNICIPIO AS Municipio, ' +
        '  Sproveedor.FP_EMAIL AS Correo, ' +
        '  Sproveedor.FP_TELEFONO AS Telefono, ' +
      '  Sproveedor.FP_CONTACTO AS Contacto, ' +
      ' Sproveedor.FP_STATUS AS Estado ' +
        'FROM "' + basePath + '\Sproveedor.dat" Sproveedor ' +
        'WHERE Sproveedor.FP_DESCRIPCION LIKE ''%' + filterText + '%'' ' + // Filtrar por Nombre
        'ORDER BY Sproveedor.FP_DESCRIPCION ASC';
    end;

    if lbModificar.Caption = 'Contacto :' then
    begin
      QueryModificar.SQL.Text :=
      'SELECT ' +
        '  Sproveedor.FP_CONTACTO AS Contacto, ' +
        '  Sproveedor.FP_DESCRIPCION AS Descripcion, ' +
        '  Sproveedor.FP_CODIGO AS RUT, ' +
        '  Sproveedor.FP_TELEFONO AS Telefono, ' +
        '  Sproveedor.FP_DIRECCION1 As Direccion, ' +
        '  Sproveedor.FP_DIANPAIS AS Pais, ' +
        '  Sproveedor.FP_DIANDEPARTAMENTO AS Departamento, ' +
        '  Sproveedor.FP_DIANMUNICIPIO AS Municipio, ' +
        '  Sproveedor.FP_EMAIL AS Correo, ' +
        '  Sproveedor.FP_TELEFONO AS Telefono, ' +
      '  Sproveedor.FP_CONTACTO AS Contacto, ' +
      ' Sproveedor.FP_STATUS AS Estado ' +
        'FROM "' + basePath + '\Sproveedor.dat" Sproveedor ' +
        'WHERE Sproveedor.FP_CONTACTO LIKE ''%' + filterText + '%'' ' + // Filtrar por Nombre
        'ORDER BY Sproveedor.FP_DESCRIPCION ASC';
    end;

    if lbModificar.Caption = 'Rut :' then
    begin
      QueryModificar.SQL.Text :=
      'SELECT ' +
        '  Sproveedor.FP_CODIGO AS RUT, ' +
        '  Sproveedor.FP_DESCRIPCION AS Descripcion, ' +
        '  Sproveedor.FP_CONTACTO AS Contacto, ' +
        '  Sproveedor.FP_TELEFONO AS Telefono, ' +
        '  Sproveedor.FP_DIRECCION1 As Direccion, ' +
        '  Sproveedor.FP_DIANPAIS AS Pais, ' +
        '  Sproveedor.FP_DIANDEPARTAMENTO AS Departamento, ' +
        '  Sproveedor.FP_DIANMUNICIPIO AS Municipio, ' +
        '  Sproveedor.FP_EMAIL AS Correo, ' +
        '  Sproveedor.FP_TELEFONO AS Telefono, ' +
      '  Sproveedor.FP_CONTACTO AS Contacto, ' +
      ' Sproveedor.FP_STATUS AS Estado ' +
        'FROM "' + basePath + '\Sproveedor.dat" Sproveedor ' +
        'WHERE Sproveedor.FP_CODIGO LIKE ''%' + filterText + '%'' ' + // Filtrar por Nombre
        'ORDER BY Sproveedor.FP_DESCRIPCION ASC';
    end;
  end else
  begin
      if lbModificar.Caption = 'Nombre :' then
    begin
      QueryModificar.SQL.Text :=
      'SELECT ' +
        '  Sproveedor.FP_DESCRIPCION AS Descripcion, ' +
        '  Sproveedor.FP_CODIGO AS RUT, ' +
        '  Sproveedor.FP_CONTACTO AS Contacto, ' +
        '  Sproveedor.FP_TELEFONO AS Telefono, ' +
        '  Sproveedor.FP_DIRECCION1 As Direccion, ' +
        '  Sproveedor.FP_DIANPAIS AS Pais, ' +
        '  Sproveedor.FP_DIANDEPARTAMENTO AS Departamento, ' +
        '  Sproveedor.FP_DIANMUNICIPIO AS Municipio, ' +
        '  Sproveedor.FP_EMAIL AS Correo, ' +
        '  Sproveedor.FP_TELEFONO AS Telefono, ' +
      '  Sproveedor.FP_CONTACTO AS Contacto, ' +
      ' Sproveedor.FP_STATUS AS Estado ' +
        'FROM "' + basePath + '\Sproveedor.dat" Sproveedor ' +
        'ORDER BY Sproveedor.FP_DESCRIPCION ASC';
    end;

    if lbModificar.Caption = 'Contacto :' then
    begin
      QueryModificar.SQL.Text :=
        'SELECT ' +
        '  Sproveedor.FP_CONTACTO AS Contacto, ' +
        '  Sproveedor.FP_DESCRIPCION AS Descripcion, ' +
        '  Sproveedor.FP_CODIGO AS RUT, ' +
        '  Sproveedor.FP_TELEFONO AS Telefono, ' +
        '  Sproveedor.FP_DIRECCION1 As Direccion, ' +
        '  Sproveedor.FP_DIANPAIS AS Pais, ' +
        '  Sproveedor.FP_DIANDEPARTAMENTO AS Departamento, ' +
        '  Sproveedor.FP_DIANMUNICIPIO AS Municipio, ' +
        '  Sproveedor.FP_EMAIL AS Correo, ' +
        '  Sproveedor.FP_TELEFONO AS Telefono, ' +
      '  Sproveedor.FP_CONTACTO AS Contacto, ' +
      ' Sproveedor.FP_STATUS AS Estado ' +
        'FROM "' + basePath + '\Sproveedor.dat" Sproveedor ' +
        'ORDER BY Sproveedor.FP_DESCRIPCION ASC';
    end;

    if lbModificar.Caption = 'Rut :' then
    begin
      QueryModificar.SQL.Text :=
        'SELECT ' +
        '  Sproveedor.FP_CODIGO AS RUT, ' +
        '  Sproveedor.FP_DESCRIPCION AS Descripcion, ' +
        '  Sproveedor.FP_CONTACTO AS Contacto, ' +
        '  Sproveedor.FP_TELEFONO AS Telefono, ' +
        '  Sproveedor.FP_DIRECCION1 As Direccion, ' +
        '  Sproveedor.FP_DIANPAIS AS Pais, ' +
        '  Sproveedor.FP_DIANDEPARTAMENTO AS Departamento, ' +
        '  Sproveedor.FP_DIANMUNICIPIO AS Municipio, ' +
        '  Sproveedor.FP_EMAIL AS Correo, ' +
        '  Sproveedor.FP_TELEFONO AS Telefono, ' +
      '  Sproveedor.FP_CONTACTO AS Contacto, ' +
      ' Sproveedor.FP_STATUS AS Estado ' +
        'FROM "' + basePath + '\Sproveedor.dat" Sproveedor ' +
        'ORDER BY Sproveedor.FP_DESCRIPCION ASC';
    end;
  end;
  QueryModificar.Open;
end;

procedure TfmModificarProveedores.FormCreate(Sender: TObject);
var
basePath: string;
begin
  QueryModificar.Close;
basePath := uData.moduloDatos.a2Database.Directory;
 QueryModificar.SQL.Text :=
 'SELECT ' +
        '  Sproveedor.FP_DESCRIPCION AS Descripcion, ' +
        '  Sproveedor.FP_CODIGO AS RUT, ' +
        '  Sproveedor.FP_CONTACTO AS Contacto, ' +
        '  Sproveedor.FP_TELEFONO AS Telefono, ' +
        '  Sproveedor.FP_DIRECCION1 As Direccion, ' +
        '  Sproveedor.FP_DIANPAIS AS Pais, ' +
        '  Sproveedor.FP_DIANDEPARTAMENTO AS Departamento, ' +
        '  Sproveedor.FP_DIANMUNICIPIO AS Municipio, ' +
        '  Sproveedor.FP_EMAIL AS Correo, ' +
        '  Sproveedor.FP_TELEFONO AS Telefono, ' +
      '  Sproveedor.FP_CONTACTO AS Contacto, ' +
      ' Sproveedor.FP_STATUS AS Estado ' +
        'FROM "' + basePath + '\Sproveedor.dat" Sproveedor ' +
        'ORDER BY Sproveedor.FP_DESCRIPCION ASC';
 QueryModificar.Open;
end;


end.
