object fmInventario: TfmInventario
  Left = 396
  Top = 29
  Caption = 'Inventario a2'
  ClientHeight = 429
  ClientWidth = 725
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object DBLookupComboBoxDpto: TDBLookupComboBox
    Left = 16
    Top = 88
    Width = 145
    Height = 21
    KeyField = 'FD_CODIGO'
    ListField = 'FD_DESCRIPCION'
    ListSource = DsDpto
    TabOrder = 0
    OnClick = DBLookupComboBoxDptoClick
  end
  object DBGrid1: TDBGrid
    Left = 20
    Top = 168
    Width = 697
    Height = 241
    DataSource = DsSinventario
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        ButtonStyle = cbsEllipsis
        Expanded = False
        FieldName = 'FI_CODIGO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FI_DESCRIPCION'
        Title.Caption = 'Descripcion de Productos / Servicios'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FI_CAPACIDAD'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FI_DESCRIPCIONDETALLADA'
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 729
    Height = 33
    TabOrder = 2
    object Button1: TButton
      Left = 630
      Top = 2
      Width = 75
      Height = 31
      Caption = 'Salir'
      TabOrder = 0
      OnClick = Button1Click
    end
  end
  object DbiTabDpto: TDBISAMTable
    Active = True
    DatabaseName = 'a2Data'
    EngineVersion = '4.31 Build 3'
    TableName = 'Scategoria'
    Left = 16
    Top = 112
  end
  object DsDpto: TDataSource
    DataSet = DbiTabDpto
    Left = 64
    Top = 112
  end
  object DbiTabSinventario: TDBISAMTable
    Active = True
    DatabaseName = 'a2Data'
    EngineVersion = '4.31 Build 3'
    TableName = 'Sinventario'
    Left = 48
    Top = 336
  end
  object DsSinventario: TDataSource
    DataSet = DbiTabSinventario
    Left = 120
    Top = 336
  end
end
