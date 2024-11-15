unit uAcceso;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdDayTime, Vcl.ToolWin, Vcl.ActnMan,
  uData, Data.DB, dbisamtb, Datasnap.DBClient,     System.ImageList,
  Vcl.ActnCtrls, Vcl.ImgList;

type
  TfmAcceso = class(TForm)
    edtusuario: TEdit;
    edtcontrase�a: TMaskEdit;
    Btnaceptar: TBitBtn;
    Btncancelar: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Image1: TImage;
    procedure BtncancelarClick(Sender: TObject);
    procedure edtusuarioKeyPress(Sender: TObject; var Key: Char);
    procedure edtcontrase�aKeyPress(Sender: TObject; var Key: Char);
    procedure BtnaceptarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmAcceso: TfmAcceso;

implementation

{$R *.dfm}

uses uPrincipal;

var
  fmPrincipal:TfmPrincipal;

const
  _Cripto = '9281711';

Function ValidarUsuario(Username,Password:String):boolean;
  Var
  L, I: Byte;
  S, Temp, Code: String;
begin
  Udata.moduloDatos.Susuarios.Open;
  if Udata.moduloDatos.Susuarios.Locate('NOMBRE', Username, [loCaseInsensitive]) then
  begin
    Code := Udata.moduloDatos.Susuarios.FieldByName('Clave').AsString;
    S := _Cripto;
    L := Length(Code);
    Temp := Code;
    while Length(S) < L do
      S := S + S;
    for I := 1 to L do
      Temp[I] := Chr(Ord(Temp[I]) - (Ord(S[I]) - 48));
    Code := Temp;
    if (Password <> '') and (Code = Password) then
    begin
      Result := True;
    end
    else
    begin
      Result := False;
    end;
  end
  else
    Result := False;
end;

var
  intentos: Integer = 0;

procedure TfmAcceso.BtnaceptarClick(Sender: TObject);
var
  b, c: String;
  d: Boolean;
  e: Boolean;
begin
  d := False; // Inicializar d como falso
  e := True;

  while not d do
  begin
    b := edtusuario.Text;
    c := edtcontrase�a.Text;

    if (b = '') then
    begin
      MessageDlg('Introduzca nombre del Usuario', mtWarning, [mbOK], 0);
      edtusuario.SetFocus;
      e := False;
      break;
    end;

    if (c = '') then
    begin
      MessageDlg('Introduzca la contrase�a del usuario', mtWarning, [mbOK], 0);
      edtcontrase�a.SetFocus;
      e := False;
      Break;
    end;

    if not Udata.moduloDatos.Susuarios.Locate('NOMBRE', b, [loCaseInsensitive]) then
    begin
      MessageDlg('El usuario no se encuentra', mtWarning, [mbOK], 0);
      edtusuario.SetFocus;
      e := False;
       Break;
    end;

    if e = True then
    begin
     d := ValidarUsuario(b, c);
     if d = True then
     begin
      Hide;
      fmPrincipal := TfmPrincipal.Create(Self); // Crear el formulario fmPrincipal
      fmPrincipal.ShowModal;
      fmPrincipal.Free;
     end
     else
      begin
      MessageDlg('Contrase�a Incorrecta', mtWarning, [mbOK], 0);
      edtcontrase�a.SetFocus;
      e:= True;
      Break;
      end;
    end
    else
    begin
        e := True;
         Break;
    end;
end;
end;



procedure TfmAcceso.BtncancelarClick(Sender: TObject);
begin
Application.Terminate;
end;


procedure TfmAcceso.edtcontrase�aKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = Chr(VK_RETURN) then
    fmacceso.Btnaceptar.SetFocus;
end;

procedure TfmAcceso.edtusuarioKeyPress(Sender: TObject; var Key: Char);
begin
if Key = Chr(VK_RETURN) then
    fmacceso.edtcontrase�a.SetFocus;
end;

procedure TfmAcceso.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//application.Terminate;
end;

procedure TfmAcceso.FormCreate(Sender: TObject);
var
a2raiz, dirArchivo: string;
begin
   a2raiz := 'D:\Cloud-PC\Apps\a2app\a2HAC\a2Softway\';
   dirArchivo := a2raiz + 'sempresas.dat';
   if fileexists(dirArchivo) then
    begin
    //Conecto con la base de datos
    uData.moduloDatos.Sistema.Directory := a2raiz;
    uData.moduloDatos.Sistema.DatabaseName := 'Sistema';
    uData.moduloDatos.sempresas.DatabaseName := 'Sistema';
    uData.moduloDatos.sempresas.TableName := 'sempresas';
    uData.moduloDatos.Sistema.Connected := True;
    uData.moduloDatos.sempresas.Active := True;

    uData.moduloDatos.a2Database.Directory := a2raiz + uData.moduloDatos.sempresas.FieldByName('FE_DIRDATOS').AsString;
    uData.moduloDatos.a2Database.Connected := True;
    uData.moduloDatos.Sclientes.DatabaseName := 'a2Database';
    uData.moduloDatos.Sclientes.TableName := 'Sclientes';
    uData.moduloDatos.Sclientes.Active:=True;
    uData.moduloDatos.Susuarios.DatabaseName := 'a2Database';
    uData.moduloDatos.Susuarios.TableName := 'Susuarios';
    uData.moduloDatos.Susuarios.active:=True;
    uData.moduloDatos.a2UbicacionGeo03.DatabaseName := 'a2Database';
    uData.moduloDatos.a2UbicacionGeo03.TableName := 'a2UbicacionGeo03';
    uData.moduloDatos.a2UbicacionGeo03.active:=True;
    end

  else
   begin
    ShowMessage('El directorio es incorrecto');
    application.Terminate;
  end;
end;

end.
