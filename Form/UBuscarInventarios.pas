unit UBuscarInventarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.ComCtrls, Vcl.ToolWin,
  System.ImageList, Vcl.ImgList, Vcl.Menus, dbisamtb, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Grids, Vcl.DBGrids, uData;

type
  TfmBuscarInventario = class(TForm)
    ToolBar1: TToolBar;
    btOrdenar: TToolButton;
    btSalirBuscar: TToolButton;
    ImagBuscarLista: TImageList;
    MenuOrdenar: TPopupMenu;
    Nombre1: TMenuItem;
    Documento1: TMenuItem;
    Deposito1: TMenuItem;
    QueryBusqueda: TDBISAMQuery;
    dQueryBusqueda: TDataSource;
    edBuscar: TEdit;
    lbBuscarDescripcion: TLinkLabel;
    TablaBusqueda: TDBGrid;
    procedure Nombre1Click(Sender: TObject);
    procedure Documento1Click(Sender: TObject);
    procedure Deposito1Click(Sender: TObject);
    procedure btSalirBuscarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edBuscarChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmBuscarInventario: TfmBuscarInventario;

implementation

{$R *.dfm}

procedure TfmBuscarInventario.btSalirBuscarClick(Sender: TObject);
begin
Close;
end;

procedure TfmBuscarInventario.Deposito1Click(Sender: TObject);
var
basePath: string;
begin
  basePath := uData.moduloDatos.a2Database.Directory;
  QueryBusqueda.Close;
lbBuscarDescripcion.Caption := 'Deposito :';
edBuscar.Text := '';
edBuscar.SetFocus;

  QueryBusqueda.SQL.Text :=
    'SELECT ' +
        '  Sdepositos.FDP_DESCRIPCION AS Deposito, ' +
        '  Sinventario.FI_DESCRIPCION AS Descripcion, ' +
        '  Sinventario.FI_CODIGO AS RUT, ' +
        '  Scategoria.FD_DESCRIPCION AS Categoria, ' +
        '  Sinventario.FI_STATUS AS Activo, ' +
        '  Sinventario.FI_PESOPRODUCTO as Precio, ' +
        '  SinvDep.FT_EXISTENCIA AS Existencia ' +
        'FROM "' + basePath + '\Sinventario.dat" Sinventario ' +
        'INNER JOIN "' + basePath + '\SinvDep.dat" SinvDep ' +
        'ON Sinventario.FI_CODIGO = SinvDep.FT_CODIGOPRODUCTO ' +
        'INNER JOIN "' + basePath + '\Sdepositos.dat" Sdepositos ' +
        'ON SinvDep.FT_CODIGODEPOSITO = Sdepositos.FDP_CODIGO '+
        'INNER JOIN "' + basePath + '\Scategoria.dat" Scategoria ' +
        'ON Sinventario.FI_CATEGORIA = Scategoria.FD_CODIGO ' +
        'ORDER BY Sinventario.FI_DESCRIPCION ASC';
        QueryBusqueda.Open;
end;

procedure TfmBuscarInventario.Documento1Click(Sender: TObject);
var
basePath: string;
begin
basePath := uData.moduloDatos.a2Database.Directory;
QueryBusqueda.Close;
lbBuscarDescripcion.Caption := 'C�digo :';
edBuscar.Text := '';
edBuscar.SetFocus;

  QueryBusqueda.SQL.Text :=
    'SELECT ' +
        '  Sinventario.FI_CODIGO AS RUT, ' +
        '  Sinventario.FI_DESCRIPCION AS Descripcion, ' +
        '  Scategoria.FD_DESCRIPCION AS Categoria, ' +
        '  Sdepositos.FDP_DESCRIPCION AS Deposito, ' +
        '  Sinventario.FI_STATUS AS Activo, ' +
        '  Sinventario.FI_PESOPRODUCTO as Precio, ' +
        '  SinvDep.FT_EXISTENCIA AS Existencia ' +
        'FROM "' + basePath + '\Sinventario.dat" Sinventario ' +
        'INNER JOIN "' + basePath + '\SinvDep.dat" SinvDep ' +
        'ON Sinventario.FI_CODIGO = SinvDep.FT_CODIGOPRODUCTO ' +
        'INNER JOIN "' + basePath + '\Sdepositos.dat" Sdepositos ' +
        'ON SinvDep.FT_CODIGODEPOSITO = Sdepositos.FDP_CODIGO '+
        'INNER JOIN "' + basePath + '\Scategoria.dat" Scategoria ' +
        'ON Sinventario.FI_CATEGORIA = Scategoria.FD_CODIGO ' +
        'ORDER BY Sinventario.FI_DESCRIPCION ASC';
        QueryBusqueda.Open;
end;

procedure TfmBuscarInventario.edBuscarChange(Sender: TObject);
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
        '  Sinventario.FI_DESCRIPCION AS Descripcion, ' +
        '  Sinventario.FI_CODIGO AS RUT, ' +
        '  Scategoria.FD_DESCRIPCION AS Categoria, ' +
        '  Sdepositos.FDP_DESCRIPCION AS Deposito, ' +
        '  Sinventario.FI_STATUS AS Activo, ' +
        '  Sinventario.FI_PESOPRODUCTO AS Precio, ' +
        '  SinvDep.FT_EXISTENCIA AS Existencia ' +
        'FROM "' + basePath + '\Sinventario.dat" Sinventario ' +
        'INNER JOIN "' + basePath + '\SinvDep.dat" SinvDep ' +
        'ON Sinventario.FI_CODIGO = SinvDep.FT_CODIGOPRODUCTO ' +
        'INNER JOIN "' + basePath + '\Sdepositos.dat" Sdepositos ' +
        'ON SinvDep.FT_CODIGODEPOSITO = Sdepositos.FDP_CODIGO '+
        'INNER JOIN "' + basePath + '\Scategoria.dat" Scategoria ' +
        'ON Sinventario.FI_CATEGORIA = Scategoria.FD_CODIGO ' +
        'WHERE Sinventario.FI_DESCRIPCION LIKE ''%' + filterText + '%'' ' + // Filtrar por Nombre
        'ORDER BY Sinventario.FI_DESCRIPCION ASC';
    end;

    if lbBuscarDescripcion.Caption = 'Desposito :' then
    begin
      QueryBusqueda.SQL.Text :=
          'SELECT ' +
        '  Sdepositos.FDP_DESCRIPCION AS Deposito, ' +
        '  Sinventario.FI_DESCRIPCION AS Descripcion, ' +
        '  Sinventario.FI_CODIGO AS RUT, ' +
        '  Scategoria.FD_DESCRIPCION AS Categoria, ' +
        '  Sinventario.FI_STATUS AS Activo, ' +
        '  Sinventario.FI_PESOPRODUCTO AS Precio, ' +
        '  SinvDep.FT_EXISTENCIA AS Existencia ' +
        'FROM "' + basePath + '\Sinventario.dat" Sinventario ' +
        'INNER JOIN "' + basePath + '\SinvDep.dat" SinvDep ' +
        'ON Sinventario.FI_CODIGO = SinvDep.FT_CODIGOPRODUCTO ' +
        'INNER JOIN "' + basePath + '\Sdepositos.dat" Sdepositos ' +
        'ON SinvDep.FT_CODIGODEPOSITO = Sdepositos.FDP_CODIGO '+
        'INNER JOIN "' + basePath + '\Scategoria.dat" Scategoria ' +
        'ON Sinventario.FI_CATEGORIA = Scategoria.FD_CODIGO ' +
        'WHERE Sdepositos.FDP_DESCRIPCION LIKE ''%' + filterText + '%'' ' + // Filtrar por Nombre
        'ORDER BY Sinventario.FI_DESCRIPCION ASC';
    end;

    if lbBuscarDescripcion.Caption = 'Rut :' then
    begin
      QueryBusqueda.SQL.Text :=
        'SELECT ' +
        '  Sinventario.FI_CODIGO AS RUT, ' +
        '  Sinventario.FI_DESCRIPCION AS Descripcion, ' +
        '  Scategoria.FD_DESCRIPCION AS Categoria, ' +
        '  Sdepositos.FDP_DESCRIPCION AS Deposito, ' +
        '  Sinventario.FI_STATUS AS Activo, ' +
        '  Sinventario.FI_PESOPRODUCTO AS Precio, ' +
        '  SinvDep.FT_EXISTENCIA AS Existencia ' +
        'FROM "' + basePath + '\Sinventario.dat" Sinventario ' +
        'INNER JOIN "' + basePath + '\SinvDep.dat" SinvDep ' +
        'ON Sinventario.FI_CODIGO = SinvDep.FT_CODIGOPRODUCTO ' +
        'INNER JOIN "' + basePath + '\Sdepositos.dat" Sdepositos ' +
        'ON SinvDep.FT_CODIGODEPOSITO = Sdepositos.FDP_CODIGO '+
        'INNER JOIN "' + basePath + '\Scategoria.dat" Scategoria ' +
        'ON Sinventario.FI_CATEGORIA = Scategoria.FD_CODIGO ' +
        'WHERE Sinventario.FI_CODIGO LIKE ''%' + filterText + '%'' ' + // Filtrar por Nombre
        'ORDER BY Sinventario.FI_DESCRIPCION ASC';
    end;
  end else
  begin
      if lbBuscarDescripcion.Caption = 'Nombre :' then
    begin
      QueryBusqueda.SQL.Text :=
      'SELECT ' +
        '  Sinventario.FI_DESCRIPCION AS Descripcion, ' +
        '  Sinventario.FI_CODIGO AS RUT, ' +
        '  Scategoria.FD_DESCRIPCION AS Categoria, ' +
        '  Sdepositos.FDP_DESCRIPCION AS Deposito, ' +
        '  Sinventario.FI_STATUS AS Activo, ' +
        '  Sinventario.FI_PESOPRODUCTO AS Precio, ' +
        '  SinvDep.FT_EXISTENCIA AS Existencia ' +
        'FROM "' + basePath + '\Sinventario.dat" Sinventario ' +
        'INNER JOIN "' + basePath + '\SinvDep.dat" SinvDep ' +
        'ON Sinventario.FI_CODIGO = SinvDep.FT_CODIGOPRODUCTO ' +
        'INNER JOIN "' + basePath + '\Sdepositos.dat" Sdepositos ' +
        'ON SinvDep.FT_CODIGODEPOSITO = Sdepositos.FDP_CODIGO '+
        'INNER JOIN "' + basePath + '\Scategoria.dat" Scategoria ' +
        'ON Sinventario.FI_CATEGORIA = Scategoria.FD_CODIGO ' +
        'ORDER BY Sinventario.FI_DESCRIPCION ASC';
    end;

    if lbBuscarDescripcion.Caption = 'Deposito :' then
    begin
      QueryBusqueda.SQL.Text :=
    'SELECT ' +
        '  Sdepositos.FDP_DESCRIPCION AS Deposito, ' +
        '  Sinventario.FI_DESCRIPCION AS Descripcion, ' +
        '  Sinventario.FI_CODIGO AS RUT, ' +
        '  Scategoria.FD_DESCRIPCION AS Categoria, ' +
        '  Sinventario.FI_STATUS AS Activo, ' +
        '  Sinventario.FI_PESOPRODUCTO as Precio, ' +
        '  SinvDep.FT_EXISTENCIA AS Existencia ' +
        'FROM "' + basePath + '\Sinventario.dat" Sinventario ' +
        'INNER JOIN "' + basePath + '\SinvDep.dat" SinvDep ' +
        'ON Sinventario.FI_CODIGO = SinvDep.FT_CODIGOPRODUCTO ' +
        'INNER JOIN "' + basePath + '\Sdepositos.dat" Sdepositos ' +
        'ON SinvDep.FT_CODIGODEPOSITO = Sdepositos.FDP_CODIGO '+
        'INNER JOIN "' + basePath + '\Scategoria.dat" Scategoria ' +
        'ON Sinventario.FI_CATEGORIA = Scategoria.FD_CODIGO ' +
        'ORDER BY Sinventario.FI_DESCRIPCION ASC';
    end;

    if lbBuscarDescripcion.Caption = 'Rut :' then
    begin
      QueryBusqueda.SQL.Text :=
          'SELECT ' +
        '  Sinventario.FI_CODIGO AS RUT, ' +
        '  Sinventario.FI_DESCRIPCION AS Descripcion, ' +
        '  Scategoria.FD_DESCRIPCION AS Categoria, ' +
        '  Sdepositos.FDP_DESCRIPCION AS Deposito, ' +
        '  Sinventario.FI_STATUS AS Activo, ' +
        '  Sinventario.FI_PESOPRODUCTO as Precio, ' +
        '  SinvDep.FT_EXISTENCIA AS Existencia ' +
        'FROM "' + basePath + '\Sinventario.dat" Sinventario ' +
        'INNER JOIN "' + basePath + '\SinvDep.dat" SinvDep ' +
        'ON Sinventario.FI_CODIGO = SinvDep.FT_CODIGOPRODUCTO ' +
        'INNER JOIN "' + basePath + '\Sdepositos.dat" Sdepositos ' +
        'ON SinvDep.FT_CODIGODEPOSITO = Sdepositos.FDP_CODIGO '+
        'INNER JOIN "' + basePath + '\Scategoria.dat" Scategoria ' +
        'ON Sinventario.FI_CATEGORIA = Scategoria.FD_CODIGO ' +
        'ORDER BY Sinventario.FI_DESCRIPCION ASC';
    end;
  end;
  QueryBusqueda.Open;

end;

procedure TfmBuscarInventario.FormCreate(Sender: TObject);
var
basePath: string;
begin
  basePath := uData.moduloDatos.a2Database.Directory;
  QueryBusqueda.Close;
  QueryBusqueda.SQL.Text :=
    'SELECT ' +
        '  Sinventario.FI_DESCRIPCION AS Descripcion, ' +
        '  Sinventario.FI_CODIGO AS RUT, ' +
        '  Scategoria.FD_DESCRIPCION AS Categoria, ' +
        '  Sdepositos.FDP_DESCRIPCION AS Deposito, ' +
        '  Sinventario.FI_STATUS AS Activo, ' +
        '  Sinventario.FI_PESOPRODUCTO AS Precio, ' +
        '  SinvDep.FT_EXISTENCIA AS Existencia ' +
        'FROM "' + basePath + '\Sinventario.dat" Sinventario ' +
        'INNER JOIN "' + basePath + '\SinvDep.dat" SinvDep ' +
        'ON Sinventario.FI_CODIGO = SinvDep.FT_CODIGOPRODUCTO ' +
        'INNER JOIN "' + basePath + '\Sdepositos.dat" Sdepositos ' +
        'ON SinvDep.FT_CODIGODEPOSITO = Sdepositos.FDP_CODIGO '+
        'INNER JOIN "' + basePath + '\Scategoria.dat" Scategoria ' +
        'ON Sinventario.FI_CATEGORIA = Scategoria.FD_CODIGO ' +
        'ORDER BY Sinventario.FI_DESCRIPCION ASC';
QueryBusqueda.Open;
end;

procedure TfmBuscarInventario.Nombre1Click(Sender: TObject);
var
basePath: string;
begin
basePath := uData.moduloDatos.a2Database.Directory;
QueryBusqueda.Close;
lbBuscarDescripcion.Caption := 'Nombre :';
edBuscar.Text := '' ;
edBuscar.SetFocus;

  QueryBusqueda.SQL.Text :=
    'SELECT ' +
        '  Sinventario.FI_DESCRIPCION AS Descripcion, ' +
        '  Sinventario.FI_CODIGO AS RUT, ' +
        '  Scategoria.FD_DESCRIPCION AS Categoria, ' +
        '  Sdepositos.FDP_DESCRIPCION AS Deposito, ' +
        '  Sinventario.FI_STATUS AS Activo, ' +
        '  Sinventario.FI_PESOPRODUCTO AS Precio, ' +
        '  SinvDep.FT_EXISTENCIA AS Existencia ' +
        'FROM "' + basePath + '\Sinventario.dat" Sinventario ' +
        'INNER JOIN "' + basePath + '\SinvDep.dat" SinvDep ' +
        'ON Sinventario.FI_CODIGO = SinvDep.FT_CODIGOPRODUCTO ' +
        'INNER JOIN "' + basePath + '\Sdepositos.dat" Sdepositos ' +
        'ON SinvDep.FT_CODIGODEPOSITO = Sdepositos.FDP_CODIGO '+
        'INNER JOIN "' + basePath + '\Scategoria.dat" Scategoria ' +
        'ON Sinventario.FI_CATEGORIA = Scategoria.FD_CODIGO ' +
        'ORDER BY Sinventario.FI_DESCRIPCION ASC';
QueryBusqueda.Open;

end;

end.
