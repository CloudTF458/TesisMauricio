unit UBuscarClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.ImageList, Vcl.ImgList,
  Vcl.ToolWin, Vcl.ComCtrls, Vcl.Menus, Vcl.ActnMan, Vcl.ActnCtrls, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.JumpList, Vcl.Grids, Data.DB, dbisamtb, Vcl.DBGrids, uData;

type
  TfmBuscarClientes = class(TForm)
    ImagBuscarClientesLista: TImageList;
    ToolBar1: TToolBar;
    btOrdenarClientes: TToolButton;
    MenuOrdenarClientes: TPopupMenu;
    Nombre1: TMenuItem;
    Documento1: TMenuItem;
    Contacto1: TMenuItem;
    btSalirBuscarClientes: TToolButton;
    ActionToolBar1: TActionToolBar;
    edBuscarCliente: TEdit;
    lbBuscarDescripcion: TLinkLabel;
    StatusBar1: TStatusBar;
    QueryBusquedaClientes: TDBISAMQuery;
    TablaBusqueda: TDBGrid;
    dQueryBusquedaClientes: TDataSource;
    procedure btSalirBuscarClientesClick(Sender: TObject);
    procedure Nombre1Click(Sender: TObject);
    procedure Documento1Click(Sender: TObject);
    procedure Contacto1Click(Sender: TObject);
    procedure StringGrid1Click(Sender: TObject);
    procedure edBuscarClienteChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmBuscarClientes: TfmBuscarClientes;

implementation

{$R *.dfm}


procedure TfmBuscarClientes.Contacto1Click(Sender: TObject);
var
basePath: string;
begin
  QueryBusquedaClientes.Close;
basePath := uData.moduloDatos.a2Database.Directory;
lbBuscarDescripcion.Caption := 'Contacto :';
edBuscarCliente.Text := '';
edBuscarCliente.SetFocus;

    QueryBusquedaClientes.SQL.Text :=
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
        QueryBusquedaClientes.Open;
end;

procedure TfmBuscarClientes.Documento1Click(Sender: TObject);
var
basePath: string;
begin
  QueryBusquedaClientes.Close;
basePath := uData.moduloDatos.a2Database.Directory;
lbBuscarDescripcion.Caption := 'Rut :';
edBuscarCliente.Text := '';
edBuscarCliente.SetFocus;

    QueryBusquedaClientes.SQL.Text :=
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
        QueryBusquedaClientes.Open;
end;

procedure TfmBuscarClientes.Nombre1Click(Sender: TObject);
var
basePath: string;
begin
  QueryBusquedaClientes.Close;
basePath := uData.moduloDatos.a2Database.Directory;
lbBuscarDescripcion.Caption := 'Nombre :';
edBuscarCliente.Text := '';
edBuscarCliente.SetFocus;

QueryBusquedaClientes.SQL.Text :=
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
          QueryBusquedaClientes.Open;

end;

procedure TfmBuscarClientes.edBuscarClienteChange(Sender: TObject);
var
  basePath, filterText: string;
begin
  basePath := uData.moduloDatos.a2Database.Directory;
  filterText := Trim(edBuscarCliente.Text); // Elimina espacios en blanco

  QueryBusquedaClientes.Close;

  // Verifica que haya texto para filtrar
  if filterText <> '' then
  begin
    if lbBuscarDescripcion.Caption = 'Nombre :' then
    begin
      QueryBusquedaClientes.SQL.Text :=
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

    if lbBuscarDescripcion.Caption = 'Contacto :' then
    begin
      QueryBusquedaClientes.SQL.Text :=
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

    if lbBuscarDescripcion.Caption = 'Rut :' then
    begin
      QueryBusquedaClientes.SQL.Text :=
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
      if lbBuscarDescripcion.Caption = 'Nombre :' then
    begin
      QueryBusquedaClientes.SQL.Text :=
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

    if lbBuscarDescripcion.Caption = 'Contacto :' then
    begin
      QueryBusquedaClientes.SQL.Text :=
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

    if lbBuscarDescripcion.Caption = 'Rut :' then
    begin
      QueryBusquedaClientes.SQL.Text :=
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
  QueryBusquedaClientes.Open;
end;

procedure TfmBuscarClientes.FormCreate(Sender: TObject);
var
basePath: string;
begin
  QueryBusquedaClientes.Close;
basePath := uData.moduloDatos.a2Database.Directory;
 QueryBusquedaClientes.SQL.Text :=
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
 QueryBusquedaClientes.Open;
end;



procedure TfmBuscarClientes.StringGrid1Click(Sender: TObject);
begin
btInformeClientes.Enabled := True;
end;

procedure TfmBuscarClientes.btSalirBuscarClientesClick(Sender: TObject);
begin
Close;
end;

end.
