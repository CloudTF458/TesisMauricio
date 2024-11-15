unit uData;

interface

uses
  System.SysUtils, System.Classes, Data.DB, dbisamtb, Datasnap.Provider;

type
  TmoduloDatos = class(TDataModule)
    a2Database: TDBISAMDatabase;
    Sclientes: TDBISAMTable;
    Sistema: TDBISAMDatabase;
    dsempresas: TDataSource;
    sempresas: TDBISAMTable;
    Susuarios: TDBISAMTable;
    dSusuarios: TDataSource;
    a2UbicacionGeo03: TDBISAMTable;
    da2UbicacionGeo03: TDataSource;
    dSclientes: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  moduloDatos: TmoduloDatos;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
