unit UModificarTecnicos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.ImageList, Vcl.ImgList, Vcl.Menus,
  Data.DB, dbisamtb, Vcl.ComCtrls, Vcl.ToolWin, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ActnMan, Vcl.ActnCtrls,uData, uTecnicos;


type
  TfmModificarTecnicos = class(TForm)
    TablaBusqueda: TDBGrid;
    edModificar: TEdit;
    lbModificar: TLinkLabel;
    ToolBar1: TToolBar;
    btOrdenar: TToolButton;
    btSalirModificar: TToolButton;
    ImagModificarLista: TImageList;
    MenuOrdenar: TPopupMenu;
    Nombre1: TMenuItem;
    Documento1: TMenuItem;
    Correo1: TMenuItem;
    QueryModificar: TDBISAMQuery;
    dQueryModificar: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure btSalirModificarClick(Sender: TObject);
    procedure edModificarChange(Sender: TObject);
    procedure Nombre1Click(Sender: TObject);
    procedure Documento1Click(Sender: TObject);
    procedure Correo1Click(Sender: TObject);
    procedure TablaBusquedaDblClick(Sender: TObject);
  private
    FParentForm: TfmTecnicos;
  public
    procedure SetParentForm(AParentForm: TfmTecnicos);
  end;

var
  fmModificarTecnicos: TfmModificarTecnicos;

implementation
{$R *.dfm}

procedure TfmModificarTecnicos.SetParentForm(AParentForm: TfmTecnicos);
begin
  FParentForm := AParentForm;
end;


procedure TfmModificarTecnicos.btSalirModificarClick(Sender: TObject);
begin
Close;
end;

procedure TfmModificarTecnicos.Nombre1Click(Sender: TObject);
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
        '  Svendedores.FV_DESCRIPCION AS Descripcion, ' +
        '  Svendedores.FV_CODIGO AS RUT, ' +
        '  Svendedores.FV_EMAIL AS Correo, ' +
        '  Svendedores.FV_TELEFONOS AS Telefono, ' +
        '  Svendedores.FV_COMISIONVTA1 As Comision, ' +
        '  Svendedores.FV_STATUS AS Activo, ' +
        '  Svendedores.FV_DIRECCION AS Direccion ' +
        'FROM "' + basePath + '\Svendedores.dat" Svendedores ' +
        'ORDER BY Svendedores.FV_DESCRIPCION ASC';
          QueryModificar.Open;
end;

procedure TfmModificarTecnicos.TablaBusquedaDblClick(Sender: TObject);
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

procedure TfmModificarTecnicos.Correo1Click(Sender: TObject);
var
basePath: string;
begin
  QueryModificar.Close;
basePath := uData.moduloDatos.a2Database.Directory;
lbModificar.Caption := 'Correo :';
edModificar.Text := '';
edModificar.SetFocus;

QueryModificar.SQL.Text :=
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
          QueryModificar.Open;

end;

procedure TfmModificarTecnicos.Documento1Click(Sender: TObject);
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
        '  Svendedores.FV_CODIGO AS RUT, ' +
        '  Svendedores.FV_DESCRIPCION AS Descripcion, ' +
        '  Svendedores.FV_EMAIL AS Correo, ' +
        '  Svendedores.FV_TELEFONOS AS Telefono, ' +
        '  Svendedores.FV_COMISIONVTA1 As Comision, ' +
        '  Svendedores.FV_STATUS AS Activo, ' +
        '  Svendedores.FV_DIRECCION AS Direccion ' +
        'FROM "' + basePath + '\Svendedores.dat" Svendedores ' +
        'ORDER BY Svendedores.FV_DESCRIPCION ASC';
          QueryModificar.Open;

end;

procedure TfmModificarTecnicos.edModificarChange(Sender: TObject);
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

    if lbModificar.Caption = 'Correo :' then
    begin
      QueryModificar.SQL.Text :=
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

    if lbModificar.Caption = 'Rut :' then
    begin
      QueryModificar.SQL.Text :=
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
      if lbModificar.Caption = 'Nombre :' then
    begin
      QueryModificar.SQL.Text :=
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

    if lbModificar.Caption = 'Correo :' then
    begin
      QueryModificar.SQL.Text :=
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

    if lbModificar.Caption = 'Rut :' then
    begin
      QueryModificar.SQL.Text :=
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
  QueryModificar.Open;
end;

procedure TfmModificarTecnicos.FormCreate(Sender: TObject);
var
basePath: string;
begin
  QueryModificar.Close;
basePath := uData.moduloDatos.a2Database.Directory;
 QueryModificar.SQL.Text :=
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
 QueryModificar.Open;
end;

end.
