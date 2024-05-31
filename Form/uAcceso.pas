unit uAcceso;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdDayTime, Vcl.ToolWin, Vcl.ActnMan,
  Vcl.ActnCtrls;

type
  Tfrmacceso = class(TForm)
    edtusuario: TEdit;
    edtcontraseña: TMaskEdit;
    Btnaceptar: TBitBtn;
    Btncancelar: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Image1: TImage;
    procedure BtncancelarClick(Sender: TObject);
    procedure edtusuarioKeyPress(Sender: TObject; var Key: Char);
    procedure edtcontraseñaKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmacceso: Tfrmacceso;


implementation

{$R *.dfm}

uses uPrincipal;
  {
            const _Cripto='9281711';
Function ValidarUsuario(Username,Password:String):boolean;
  Var L,I:Byte;
  S:String;
  Temp:String;
  Code:String;
    Var LoggedUser:Integer;
    begin
      if uData.modulodatosa2.Susuarios.Locate('NOMBRE',Username,[loCaseInsensitive])then begin
      Code := uData.modulodatosa2.Susuarios.FieldByName('Clave').AsString;
      S:=_Cripto;
      L := Length(Code);
      Temp := Code;
            begin
      while Length(S) < L do
      S:= S+S;

            end;
            begin
        for I := 1 to L do

      Temp[I] := chr(Ord(Temp[I]) - (Ord(S[I])-48));
      Code:=Temp;

        end;


      If(Password <> '') AND (Code = Password) Then
       begin
      LoggedUser := uData.modulodatosa2.Susuarios.FieldByName('CODE').AsInteger;
        result:=true;

      END


      else
      begin
      LoggedUser:= uData.modulodatosa2.Susuarios.FieldByName('CODE').AsInteger;

      result:=false;
      end;
      end;
    end;




               var intentos:Integer=0;
procedure Tfrmacceso.BtnaceptarClick(Sender: TObject);
  var b:String;
var c:String;
var d:Boolean;

      const maxtries:Integer=3;
begin
b:=uAcceso.frmacceso.edtusuario.Text;
c:=uAcceso.frmacceso.edtcontraseña.Text;
if (b='') OR (c='') then
                         begin
   ShowMessage('El nombre de usuario o contraseña es invalido');
     intentos:=intentos+1;

 END
else
begin
 d:=ValidarUsuario(b,c);
end;



 if d=true then
 begin

  frmPrincipal := TfrmPrincipal.Create(Application);

    frmPrincipal.showmodal;


end;

if d=false then
begin
 ShowMessage('La contraseña y/o usuario es incorrecto');
    intentos:=intentos+1;
    uAcceso.frmacceso.edtusuario.Text:='';
       uAcceso.frmacceso.edtcontraseña.Text:='';
end;
      if intentos > maxtries then
    begin
      ShowMessage('Has alcanzado la cantidad máxima de intentos. Por favor revisa tu usuario y contraseña y vuelve a intentarlo');
      close;
    end;
end;

      }

procedure Tfrmacceso.BtncancelarClick(Sender: TObject);
begin
close;
end;


procedure Tfrmacceso.edtcontraseñaKeyPress(Sender: TObject; var Key: Char);
begin
   if Key=Chr(VK_RETURN) then
begin
frmacceso.Btnaceptar.SetFocus;
end;
end;

procedure Tfrmacceso.edtusuarioKeyPress(Sender: TObject; var Key: Char);
begin
if Key=Chr(VK_RETURN) then
begin
frmacceso.edtcontraseña.SetFocus;
end;

end;

procedure Tfrmacceso.FormActivate(Sender: TObject);
begin
   if fileexists('sempresas.dat') then
    begin
    {
    uPrincipal.frmPrincipal.InicioConectar.Directory:=GetCurrentDir;
    uPrincipal.frmPrincipal.InicioConectar.DatabaseName:='Sistema';
    uPrincipal.frmPrincipal.sempresas.DatabaseName:='Sistema';
    uPrincipal.frmPrincipal.sempresas.TableName :='sempresas';
    uPrincipal.frmPrincipal.InicioConectar.Connected:=True;
    uPrincipal.frmPrincipal.sempresas.Active:=True;
    uData.modulodatosa2.dataConexion.Directory := uPrincipal.frmPrincipal.sempresas.FieldByName('FE_DIRDATOS').AsString;
    uData.modulodatosa2.dataConexion.Connected:=True;
    uData.modulodatosa2.soperacioninv.Active:=True;
    uData.modulodatosa2.Susuarios.Active:=True;
    uDirectorio.frmDirectorio.caption:=uPrincipal.frmPrincipal.sempresas.FieldByName('FE_DIRDATOS').AsString;
      }
    end

  else
   begin
    //ShowMessage('El directorio es incorrecto');
    //application.Terminate;
  end;
end;



procedure Tfrmacceso.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//application.Terminate;
end;

end.
