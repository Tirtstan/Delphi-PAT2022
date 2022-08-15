object frmRegistration: TfrmRegistration
  Left = 0
  Top = 0
  Caption = 'Registration'
  ClientHeight = 513
  ClientWidth = 649
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 649
    Height = 513
    Align = alClient
    BevelOuter = bvNone
    Color = 9128543
    ParentBackground = False
    TabOrder = 0
    object Panel2: TPanel
      Left = 32
      Top = 72
      Width = 273
      Height = 417
      BevelOuter = bvNone
      Color = 4822522
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 9128543
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 0
      object Panel3: TPanel
        Left = 8
        Top = 8
        Width = 257
        Height = 41
        BevelOuter = bvNone
        Caption = 'Choose... (1/2)'
        Color = 9128543
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 4822522
        Font.Height = -19
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 0
      end
      object Panel6: TPanel
        Left = 8
        Top = 55
        Width = 257
        Height = 354
        BevelOuter = bvNone
        Color = 9128543
        ParentBackground = False
        TabOrder = 1
        object lstInfo: TListBox
          Left = 8
          Top = 9
          Width = 241
          Height = 264
          Style = lbOwnerDrawFixed
          AutoComplete = False
          BevelInner = bvNone
          BevelOuter = bvNone
          BorderStyle = bsNone
          Color = 11759493
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 4822522
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ItemHeight = 35
          Items.Strings = (
            'One'
            'Two'
            'Three'
            'Four')
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          OnClick = lstInfoClick
        end
        object Panel7: TPanel
          Left = 8
          Top = 279
          Width = 241
          Height = 66
          BevelOuter = bvNone
          Color = 4822522
          ParentBackground = False
          TabOrder = 1
          object bitConfirm: TBitBtn
            Left = 124
            Top = 8
            Width = 109
            Height = 49
            Caption = 'Next'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            Kind = bkOK
            NumGlyphs = 2
            ParentFont = False
            TabOrder = 0
            WordWrap = True
            OnClick = bitConfirmClick
          end
          object bitBack: TBitBtn
            Left = 8
            Top = 8
            Width = 109
            Height = 49
            Caption = 'Back'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            Kind = bkCancel
            NumGlyphs = 2
            ParentFont = False
            TabOrder = 1
            OnClick = bitBackClick
          end
        end
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
      TabOrder = 1
      OnClick = btnBackClick
    end
    object Panel4: TPanel
      Left = 344
      Top = 72
      Width = 273
      Height = 417
      BevelOuter = bvNone
      Color = 4822522
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 9128543
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 2
      object Panel5: TPanel
        Left = 8
        Top = 8
        Width = 257
        Height = 41
        BevelOuter = bvNone
        Caption = 'Info:'
        Color = 9128543
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 4822522
        Font.Height = -19
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 0
      end
      object Panel8: TPanel
        Left = 8
        Top = 55
        Width = 257
        Height = 114
        BevelOuter = bvNone
        Color = 9128543
        ParentBackground = False
        TabOrder = 1
        object Label1: TLabel
          Left = 8
          Top = 4
          Width = 64
          Height = 21
          Caption = 'Balance:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 4822522
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold, fsUnderline]
          ParentFont = False
        end
        object redBalance: TRichEdit
          Left = 8
          Top = 32
          Width = 241
          Height = 73
          BevelInner = bvNone
          BevelOuter = bvNone
          BorderStyle = bsNone
          Color = 11759493
          EditMargins.Left = 3
          EditMargins.Right = 3
          Font.Charset = ANSI_CHARSET
          Font.Color = 4822522
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          Lines.Strings = (
            'R0,00')
          ParentFont = False
          ReadOnly = True
          ScrollBars = ssHorizontal
          TabOrder = 0
        end
      end
      object Panel9: TPanel
        Left = 8
        Top = 175
        Width = 257
        Height = 234
        BevelOuter = bvNone
        Color = 9128543
        ParentBackground = False
        TabOrder = 2
        object Label2: TLabel
          Left = 8
          Top = 4
          Width = 61
          Height = 21
          Caption = 'Receipt:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 4822522
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold, fsUnderline]
          ParentFont = False
        end
        object redReceipt: TRichEdit
          Left = 8
          Top = 31
          Width = 241
          Height = 194
          BevelInner = bvNone
          BevelOuter = bvNone
          BorderStyle = bsNone
          Color = 11759493
          EditMargins.Left = 3
          EditMargins.Right = 3
          Font.Charset = ANSI_CHARSET
          Font.Color = 4822522
          Font.Height = -15
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          Lines.Strings = (
            'Receipt here')
          ParentFont = False
          ReadOnly = True
          ScrollBars = ssHorizontal
          TabOrder = 0
        end
      end
    end
  end
end
