unit UBuscarTecnicos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.ComCtrls, Vcl.ToolWin,
  System.ImageList, Vcl.ImgList, Vcl.Menus, dbisamtb, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Grids, Vcl.DBGrids, uData;

type
  TfmBuscarTecnicos = class(TForm)
    QueryBusqueda: TDBISAMQuery;
    MenuOrdenar: TPopupMenu;
    Nombre1: TMenuItem;
    Documento1: TMenuItem;
    Correo1: TMenuItem;
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
    procedure Correo1Click(Sender: TObject);
    procedure Documento1Click(Sender: TObject);
    procedure Nombre1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmBuscarTecnicos: TfmBuscarTecnicos;

implementation

{$R *.dfm}


procedure TfmBuscarTecnicos.btSalirBuscarClick(Sender: TObject);
begin
Close;
end;

procedure TfmBuscarTecnicos.Correo1Click(Sender: TObject);
var
basePath: string;
begin
  QueryBusqueda.Close;
basePath := uData.moduloDatos.a2Database.Directory;
lbBuscarDescripcion.Caption := 'Correo :';
edBuscar.Text := '';
edBuscar.SetFocus;

    QueryBusqueda.SQL.Text :=
    'SELECT ' +
        '  Svendedores.FV_EMAIL AS Correo, ' +
        '  Svendedores.FV_DESCRIPCION AS Descripcion, ' +
        '  Svendedores.FV_CODIGO AS RUT, ' +
        '  Svendedores.FV_TELEFONOS AS Telefono, ' +
        '  Svendedores.FV_COMISIONVTA1 As Comision, ' +
        '  Svendedores.FV_STATUS AS Activo, ' +
        '  Svendedores.FV_DIRECCION AS Direccion ' +
        'FROM "' + basePath + '\Svendedores.dat" Svendedores ' +
        'ORDER BY Svendedores.FV_DESCRIPCION ASC';
        QueryBusqueda.Open;
end;

procedure TfmBuscarTecnicos.Documento1Click(Sender: TObject);
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
        '  Svendedores.FV_CODIGO AS RUT, ' +
        '  Svendedores.FV_DESCRIPCION AS Descripcion, ' +
        '  Svendedores.FV_EMAIL AS Correo, ' +
        '  Svendedores.FV_TELEFONOS AS Telefono, ' +
        '  Svendedores.FV_COMISIONVTA1 As Comision, ' +
        '  Svendedores.FV_STATUS AS Activo, ' +
        '  Svendedores.FV_DIRECCION AS Direccion ' +
        'FROM "' + basePath + '\Svendedores.dat" Svendedores ' +
        'ORDER BY Svendedores.FV_DESCRIPCION ASC';
        QueryBusqueda.Open;
end;

procedure TfmBuscarTecnicos.edBuscarChange(Sender: TObject);
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
        '  Svendedores.FV_DESCRIPCION AS Descripcion, ' +
        '  Svendedores.FV_CODIGO AS RUT, ' +
        '  Svendedores.FV_EMAIL AS Correo, ' +
        '  Svendedores.FV_TELEFONOS AS Telefono, ' +
        '  Svendedores.FV_COMISIONVTA1 As Comision, ' +
        '  Svendedores.FV_STATUS AS Activo, ' +
        '  Svendedores.FV_DIRECCION AS Direccion ' +
        'FROM "' + basePath + '\Svendedores.dat" Svendedores ' +
        'WHERE Svendedores.FV_DESCRIPCION LIKE ''%' + filterText + '%'' ' + // Filtrar por Nombre
        'ORDER BY Svendedores.FV_DESCRIPCION ASC';
    end;

    if lbBuscarDescripcion.Caption = 'Correo :' then
    begin
      QueryBusqueda.SQL.Text :=
    'SELECT ' +
        '  Svendedores.FV_EMAIL AS Correo, ' +
        '  Svendedores.FV_DESCRIPCION AS Descripcion, ' +
        '  Svendedores.FV_CODIGO AS RUT, ' +
        '  Svendedores.FV_TELEFONOS AS Telefono, ' +
        '  Svendedores.FV_COMISIONVTA1 As Comision, ' +
        '  Svendedores.FV_STATUS AS Activo, ' +
        '  Svendedores.FV_DIRECCION AS Direccion ' +
        'FROM "' + basePath + '\Svendedores.dat" Svendedores ' +
        'WHERE Svendedores.FV_EMAIL LIKE ''%' + filterText + '%'' ' + // Filtrar por Email
        'ORDER BY Svendedores.FV_DESCRIPCION ASC';
    end;

    if lbBuscarDescripcion.Caption = 'Rut :' then
    begin
      QueryBusqueda.SQL.Text :=
      'SELECT ' +
        '  Svendedores.FV_CODIGO AS RUT, ' +
        '  Svendedores.FV_DESCRIPCION AS Descripcion, ' +
        '  Svendedores.FV_EMAIL AS Correo, ' +
        '  Svendedores.FV_TELEFONOS AS Telefono, ' +
        '  Svendedores.FV_COMISIONVTA1 As Comision, ' +
        '  Svendedores.FV_STATUS AS Activo, ' +
        '  Svendedores.FV_DIRECCION AS Direccion ' +
        'FROM "' + basePath + '\Svendedores.dat" Svendedores ' +
        'WHERE Svendedores.FV_CODIGO LIKE ''%' + filterText + '%'' ' + // Filtrar por Rut
        'ORDER BY Svendedores.FV_DESCRIPCION ASC';
    end;
  end else
  begin
      if lbBuscarDescripcion.Caption = 'Nombre :' then
    begin
      QueryBusqueda.SQL.Text :=
      'SELECT ' +
        '  Svendedores.FV_DESCRIPCION AS Descripcion, ' +
        '  Svendedores.FV_CODIGO AS RUT, ' +
        '  Svendedores.FV_EMAIL AS Correo, ' +
        '  Svendedores.FV_TELEFONOS AS Telefono, ' +
        '  Svendedores.FV_COMISIONVTA1 As Comision, ' +
        '  Svendedores.FV_STATUS AS Activo, ' +
        '  Svendedores.FV_DIRECCION AS Direccion ' +
        'FROM "' + basePath + '\Svendedores.dat" Svendedores ' +
        'ORDER BY Svendedores.FV_DESCRIPCION ASC';
    end;

    if lbBuscarDescripcion.Caption = 'Correo :' then
    begin
      QueryBusqueda.SQL.Text :=
    'SELECT ' +
        '  Svendedores.FV_EMAIL AS Correo, ' +
        '  Svendedores.FV_DESCRIPCION AS Descripcion, ' +
        '  Svendedores.FV_CODIGO AS RUT, ' +
        '  Svendedores.FV_TELEFONOS AS Telefono, ' +
        '  Svendedores.FV_COMISIONVTA1 As Comision, ' +
        '  Svendedores.FV_STATUS AS Activo, ' +
        '  Svendedores.FV_DIRECCION AS Direccion ' +
        'FROM "' + basePath + '\Svendedores.dat" Svendedores ' +
        'ORDER BY Svendedores.FV_DESCRIPCION ASC';
    end;

    if lbBuscarDescripcion.Caption = 'Rut :' then
    begin
      QueryBusqueda.SQL.Text :=
      'SELECT ' +
        '  Svendedores.FV_CODIGO AS RUT, ' +
        '  Svendedores.FV_DESCRIPCION AS Descripcion, ' +
        '  Svendedores.FV_EMAIL AS Correo, ' +
        '  Svendedores.FV_TELEFONOS AS Telefono, ' +
        '  Svendedores.FV_COMISIONVTA1 As Comision, ' +
        '  Svendedores.FV_STATUS AS Activo, ' +
        '  Svendedores.FV_DIRECCION AS Direccion ' +
        'FROM "' + basePath + '\Svendedores.dat" Svendedores ' +
        'ORDER BY Svendedores.FV_DESCRIPCION ASC';
    end;
  end;
  QueryBusqueda.Open;

end;

procedure TfmBuscarTecnicos.FormCreate(Sender: TObject);
var
basePath: string;
begin
QueryBusqueda.Close;
basePath := uData.moduloDatos.a2Database.Directory;
 QueryBusqueda.SQL.Text :=
      'SELECT ' +
        '  Svendedores.FV_DESCRIPCION AS Descripcion, ' +
        '  Svendedores.FV_CODIGO AS RUT, ' +
        '  Svendedores.FV_EMAIL AS Correo, ' +
        '  Svendedores.FV_TELEFONOS AS Telefono, ' +
        '  Svendedores.FV_COMISIONVTA1 As Comision, ' +
        '  Svendedores.FV_STATUS AS Activo, ' +
        '  Svendedores.FV_DIRECCION AS Direccion ' +
        'FROM "' + basePath + '\Svendedores.dat" Svendedores ' +
        'ORDER BY Svendedores.FV_DESCRIPCION ASC';
 QueryBusqueda.Open;
end;

procedure TfmBuscarTecnicos.Nombre1Click(Sender: TObject);
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
        '  Svendedores.FV_DESCRIPCION AS Descripcion, ' +
        '  Svendedores.FV_CODIGO AS RUT, ' +
        '  Svendedores.FV_EMAIL AS Correo, ' +
        '  Svendedores.FV_TELEFONOS AS Telefono, ' +
        '  Svendedores.FV_COMISIONVTA1 As Comision, ' +
        '  Svendedores.FV_STATUS AS Activo, ' +
        '  Svendedores.FV_DIRECCION AS Direccion, ' +
        'FROM "' + basePath + '\Svendedores.dat" Svendedores ' +
        'ORDER BY Svendedores.FV_DESCRIPCION ASC';
          QueryBusqueda.Open;

end;

end.
