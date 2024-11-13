unit UBuscarProveedores;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.ComCtrls, Vcl.ToolWin,
  System.ImageList, Vcl.ImgList, Vcl.Menus, dbisamtb, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Grids, Vcl.DBGrids, uData;

type
  TfmBuscarProveedores = class(TForm)
    QueryBusqueda: TDBISAMQuery;
    MenuOrdenar: TPopupMenu;
    Nombre1: TMenuItem;
    Documento1: TMenuItem;
    Contacto1: TMenuItem;
    ImagBuscarLista: TImageList;
    dQueryBusqueda: TDataSource;
    lbBuscarDescripcion: TLinkLabel;
    edBuscar: TEdit;
    TablaBusqueda: TDBGrid;
    ToolBar1: TToolBar;
    btOrdenar: TToolButton;
    btSalirBuscar: TToolButton;
    procedure FormCreate(Sender: TObject);
    procedure btSalirBuscarClick(Sender: TObject);
    procedure edBuscarChange(Sender: TObject);
    procedure Contacto1Click(Sender: TObject);
    procedure Documento1Click(Sender: TObject);
    procedure Nombre1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmBuscarProveedores: TfmBuscarProveedores;

implementation

{$R *.dfm}


procedure TfmBuscarProveedores.btSalirBuscarClick(Sender: TObject);
begin
Close;
end;

procedure TfmBuscarProveedores.Contacto1Click(Sender: TObject);
var
basePath: string;
begin
  QueryBusqueda.Close;
basePath := uData.moduloDatos.a2Database.Directory;
lbBuscarDescripcion.Caption := 'Contacto :';
edBuscar.Text := '';
edBuscar.SetFocus;

    QueryBusqueda.SQL.Text :=
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

procedure TfmBuscarProveedores.Documento1Click(Sender: TObject);
var
basePath: string;
begin
  QueryBusqueda.Close;
basePath := uData.moduloDatos.a2Database.Directory;
lbBuscarDescripcion.Caption := 'Rut :';
edBuscar.Text := '';
edBuscar.SetFocus;

    QueryBusqueda.SQL.Text :=
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
        QueryBusqueda.Open;
end;

procedure TfmBuscarProveedores.edBuscarChange(Sender: TObject);
var
  basePath, filterText: string;
begin
  basePath := uData.moduloDatos.a2Database.Directory;
  filterText := Trim(edBuscar.Text); // Elimina espacios en blanco

  QueryBusqueda.Close;

  // Verifica que haya texto para filtrar
  if filterText <> '' then
  begin
    if lbBuscarDescripcion.Caption = 'Nombre :' then
    begin
      QueryBusqueda.SQL.Text :=
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

    if lbBuscarDescripcion.Caption = 'Contacto :' then
    begin
      QueryBusqueda.SQL.Text :=
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

    if lbBuscarDescripcion.Caption = 'Rut :' then
    begin
      QueryBusqueda.SQL.Text :=
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
      if lbBuscarDescripcion.Caption = 'Nombre :' then
    begin
      QueryBusqueda.SQL.Text :=
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

    if lbBuscarDescripcion.Caption = 'Contacto :' then
    begin
      QueryBusqueda.SQL.Text :=
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

    if lbBuscarDescripcion.Caption = 'Rut :' then
    begin
      QueryBusqueda.SQL.Text :=
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
  QueryBusqueda.Open;

end;

procedure TfmBuscarProveedores.FormCreate(Sender: TObject);
var
basePath: string;
begin
  QueryBusqueda.Close;
basePath := uData.moduloDatos.a2Database.Directory;
 QueryBusqueda.SQL.Text :=
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
 QueryBusqueda.Open;
end;

procedure TfmBuscarProveedores.Nombre1Click(Sender: TObject);
var
basePath: string;
begin
  QueryBusqueda.Close;
basePath := uData.moduloDatos.a2Database.Directory;
lbBuscarDescripcion.Caption := 'Nombre :';
edBuscar.Text := '';
edBuscar.SetFocus;

QueryBusqueda.SQL.Text :=
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
          QueryBusqueda.Open;

end;

end.
