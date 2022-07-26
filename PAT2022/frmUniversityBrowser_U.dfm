object frmUniversityBrowser: TfrmUniversityBrowser
  Left = 0
  Top = 0
  Caption = 'University Browser'
  ClientHeight = 721
  ClientWidth = 1115
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1127
    Height = 729
    BevelOuter = bvNone
    Color = 9128543
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 0
    object btnClose: TButton
      Left = 1016
      Top = 8
      Width = 97
      Height = 49
      Caption = 'Close'
      TabOrder = 0
      OnClick = btnCloseClick
    end
    object Panel4: TPanel
      Left = 117
      Top = 8
      Width = 893
      Height = 90
      BevelOuter = bvNone
      Color = 4822522
      ParentBackground = False
      TabOrder = 2
    end
    object Panel2: TPanel
      Left = 131
      Top = 24
      Width = 214
      Height = 57
      BevelOuter = bvNone
      Color = 9128543
      ParentBackground = False
      TabOrder = 1
      object Label1: TLabel
        Left = 16
        Top = 12
        Width = 183
        Height = 30
        Caption = 'University Browser'
        Color = 4822522
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 4822522
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold, fsUnderline]
        ParentColor = False
        ParentFont = False
      end
    end
    object btnBack: TButton
      Left = 8
      Top = 8
      Width = 97
      Height = 49
      Caption = 'Back'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnClick = btnBackClick
    end
  end
end
