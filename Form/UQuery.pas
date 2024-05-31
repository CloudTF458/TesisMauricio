unit UQuery;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls,
  Data.DB, Vcl.Menus, Vcl.PlatformDefaultStyleActnCtrls,
  Vcl.ActnPopup, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    Button2: TButton;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    PopupActionBar1: TPopupActionBar;
    QuequieresHacer1: TMenuItem;
    Llamaatuasesor1: TMenuItem;
    ConpagarunhoraloSolucionas1: TMenuItem;
    procedure Llamaatuasesor1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Llamaatuasesor1Click(Sender: TObject);
begin
showmessage('Este es el Numero 0414-4313368');
end;

end.
