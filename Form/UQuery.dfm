object Form1: TForm1
  Left = 132
  Top = 95
  Caption = 'Form1'
  ClientHeight = 468
  ClientWidth = 917
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 0
    Height = 468
    ExplicitLeft = 688
    ExplicitTop = 112
    ExplicitHeight = 100
  end
  object Splitter2: TSplitter
    Left = 3
    Top = 0
    Height = 468
    ExplicitLeft = 640
    ExplicitTop = 376
    ExplicitHeight = 100
  end
  object Button1: TButton
    Left = 543
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 0
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 8
    Width = 529
    Height = 121
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object DBGrid2: TDBGrid
    Left = 8
    Top = 160
    Width = 769
    Height = 177
    PopupMenu = PopupActionBar1
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object Button2: TButton
    Left = 783
    Top = 192
    Width = 75
    Height = 25
    Caption = 'Button2'
    TabOrder = 3
  end
  object PopupActionBar1: TPopupActionBar
    Left = 584
    Top = 96
    object QuequieresHacer1: TMenuItem
      Caption = 'Que quieres Hacer'
    end
    object Llamaatuasesor1: TMenuItem
      Caption = 'Llama a tu asesor '
      OnClick = Llamaatuasesor1Click
    end
    object ConpagarunhoraloSolucionas1: TMenuItem
      Caption = 'Con pagar un hora lo Solucionas'
    end
  end
end
