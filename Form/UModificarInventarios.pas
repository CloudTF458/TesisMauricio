unit UModificarInventarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, System.ImageList,
  Vcl.ImgList, Vcl.Grids, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ActnMan,
  Vcl.ActnCtrls, Vcl.ToolWin, Data.DB, dbisamtb, Vcl.DBGrids, uData, UInventario, UArrendamientos;

type
  TfmModificarInventario = class(TForm)
    ToolBar1: TToolBar;
    btOrdenar: TToolButton;
    btSalirModificar: TToolButton;
    edModificar: TEdit;
    lbModificar: TLinkLabel;
    TablaBusqueda: TDBGrid;
    ImagBuscarLista: TImageList;
    QueryModificar: TDBISAMQuery;
    dQueryModificar: TDataSource;
    MenuOrdenar: TPopupMenu;
    Nombre1: TMenuItem;
    Documento1: TMenuItem;
    Deposito1: TMenuItem;
    procedure btSalirModificarInventarioClick(Sender: TObject);
    procedure Nombre1Click(Sender: TObject);
    procedure Documento1Click(Sender: TObject);
    procedure Deposito1Click(Sender: TObject);
    procedure TablaBusquedaDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edModificarChange(Sender: TObject);
    procedure btSalirModificarClick(Sender: TObject);
  private
    FParentForm: TfmInventario;
    FParentFormArrendamiento: TfmArrendamientos;
  public
    procedure SetParentForm(AParentForm: TfmInventario);
    procedure SetParentFormArrendamiento(AParentForm: TfmArrendamientos);
  end;

var
  fmModificarInventario: TfmModificarInventario;

implementation

{$R *.dfm}

procedure TfmModificarInventario.SetParentForm(AParentForm: TfmInventario);
begin
  FParentForm := AParentForm;
end;

procedure TfmModificarInventario.SetParentFormArrendamiento(AParentForm: TfmArrendamientos);
begin
  FParentFormArrendamiento := AParentForm;
end;

procedure TfmModificarInventario.TablaBusquedaDblClick(Sender: TObject);
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
begin
    FParentForm.RecibirDatos(datosFila,orden);
    Close
end
else if Assigned(FParentFormArrendamiento) then
begin
     FParentFormArrendamiento.RecibirDatos(datosFila,orden);
     Close;
end;
end;

procedure TfmModificarInventario.btSalirModificarClick(Sender: TObject);
begin
Close;
end;

procedure TfmModificarInventario.btSalirModificarInventarioClick(Sender: TObject);
begin
Close;
end;


procedure TfmModificarInventario.Deposito1Click(Sender: TObject);
var
basePath: string;
begin
basePath := uData.moduloDatos.a2Database.Directory;
QueryModificar.Close;
lbModificar.Caption := 'Deposito :';
edModificar.Text := '';
edModificar.SetFocus;

  QueryModificar.SQL.Text :=
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
        QueryModificar.Open;

end;

procedure TfmModificarInventario.Documento1Click(Sender: TObject);
var
basePath: string;
begin
basePath := uData.moduloDatos.a2Database.Directory;
QueryModificar.Close;
lbModificar.Caption := 'C�digo :';
edModificar.Text := '';
edModificar.SetFocus;

  QueryModificar.SQL.Text :=
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
        QueryModificar.Open;
end;


procedure TfmModificarInventario.edModificarChange(Sender: TObject);
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

    if lbModificar.Caption = 'Deposito :' then
    begin
      QueryModificar.SQL.Text :=
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

    if lbModificar.Caption = 'Rut :' then
    begin
      QueryModificar.SQL.Text :=
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
      if lbModificar.Caption = 'Nombre :' then
    begin
      QueryModificar.SQL.Text :=
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

    if lbModificar.Caption = 'Deposito :' then
    begin
      QueryModificar.SQL.Text :=
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

    if lbModificar.Caption = 'Rut :' then
    begin
      QueryModificar.SQL.Text :=
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
  QueryModificar.Open;

end;

procedure TfmModificarInventario.FormCreate(Sender: TObject);
var
basePath: string;
begin
  basePath := uData.moduloDatos.a2Database.Directory;
  QueryModificar.Close;
  QueryModificar.SQL.Text :=
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
QueryModificar.Open;
end;

procedure TfmModificarInventario.Nombre1Click(Sender: TObject);
var
basePath: string;
begin
basePath := uData.moduloDatos.a2Database.Directory;
QueryModificar.Close;
lbModificar.Caption := 'Nombre :';
edModificar.Text := '';
edModificar.SetFocus;

  QueryModificar.SQL.Text :=
    'SELECT ' +
        '  Sinventario.FI_DESCRIPCION AS Descripcion, ' +
        '  Sinventario.FI_CODIGO AS RUT, ' +
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
        QueryModificar.Open;
end;


end.
