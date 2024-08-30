unit UModificarInventarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, System.ImageList,
  Vcl.ImgList, Vcl.Grids, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ActnMan,
  Vcl.ActnCtrls, Vcl.ToolWin;

type
  TfmModificarInventarios = class(TForm)
    ToolBar1: TToolBar;
    btOrdenarInventarios: TToolButton;
    btSalirModificarInventario: TToolButton;
    ActionToolBar1: TActionToolBar;
    edModificarInventario: TEdit;
    lbModificarInventario: TLinkLabel;
    StatusBar1: TStatusBar;
    StringGrid1: TStringGrid;
    ImagModificarInventario: TImageList;
    MenuOrdenarLista: TPopupMenu;
    Nombre1: TMenuItem;
    Documento1: TMenuItem;
    Contacto1: TMenuItem;
    Ciudad1: TMenuItem;
    Marca1: TMenuItem;
    Departamento1: TMenuItem;
    procedure btSalirModificarInventarioClick(Sender: TObject);
    procedure Nombre1Click(Sender: TObject);
    procedure Documento1Click(Sender: TObject);
    procedure Contacto1Click(Sender: TObject);
    procedure Departamento1Click(Sender: TObject);
    procedure Ciudad1Click(Sender: TObject);
    procedure Marca1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmModificarInventarios: TfmModificarInventarios;

implementation

{$R *.dfm}

procedure TfmModificarInventarios.btSalirModificarInventarioClick(
  Sender: TObject);
begin
Close;
end;

procedure TfmModificarInventarios.Ciudad1Click(Sender: TObject);
begin
lbModificarInventario.Caption := 'Modelo :';
edModificarInventario.Text := '';
edModificarInventario.SetFocus ;
end;

procedure TfmModificarInventarios.Contacto1Click(Sender: TObject);
begin
lbModificarInventario.Caption := 'Referencia :';
edModificarInventario.Text := '';
edModificarInventario.SetFocus ;
end;

procedure TfmModificarInventarios.Departamento1Click(Sender: TObject);
begin
lbModificarInventario.Caption := 'Departamento :';
edModificarInventario.Text := '';
edModificarInventario.SetFocus ;
end;

procedure TfmModificarInventarios.Documento1Click(Sender: TObject);
begin
lbModificarInventario.Caption := 'Descripci�n :';
edModificarInventario.Text := '';
edModificarInventario.SetFocus ;
end;

procedure TfmModificarInventarios.Marca1Click(Sender: TObject);
begin
lbModificarInventario.Caption := 'Marca :';
edModificarInventario.Text := '';
edModificarInventario.SetFocus ;
end;

procedure TfmModificarInventarios.Nombre1Click(Sender: TObject);
begin
lbModificarInventario.Caption := 'C�digo :';
edModificarInventario.Text := '';
edModificarInventario.SetFocus ;
end;

end.
