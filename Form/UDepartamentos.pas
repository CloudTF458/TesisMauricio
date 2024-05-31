unit UDepartamentos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls,
  Data.DB, Vcl.Menus, Vcl.ExtCtrls;

type
  TfmDepartamentos = class(TForm)
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmDepartamentos: TfmDepartamentos;

implementation

{$R *.dfm}

procedure TfmDepartamentos.Button3Click(Sender: TObject);
begin
close;
end;

end.
