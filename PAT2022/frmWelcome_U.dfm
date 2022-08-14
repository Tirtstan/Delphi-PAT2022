object frmWelcome: TfrmWelcome
  Left = 0
  Top = 0
  Caption = 'Welcome'
  ClientHeight = 745
  ClientWidth = 1100
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
  object pnlWelcome: TPanel
    Left = 0
    Top = 0
    Width = 1100
    Height = 745
    Align = alClient
    BevelOuter = bvNone
    Color = 9128543
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMoneyGreen
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 0
    object Label1: TLabel
      Left = 416
      Top = 170
      Width = 279
      Height = 86
      Align = alCustom
      Alignment = taCenter
      Anchors = []
      Caption = 'Welcome'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4822522
      Font.Height = -64
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 392
      Top = 317
      Width = 343
      Height = 65
      Align = alCustom
      Alignment = taCenter
      Anchors = []
      Caption = 'Student Helper'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4822522
      Font.Height = -48
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 528
      Top = 254
      Width = 53
      Height = 65
      Align = alCustom
      Alignment = taCenter
      Anchors = []
      Caption = 'To'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4822522
      Font.Height = -48
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Panel1: TPanel
      Left = 437
      Top = 399
      Width = 249
      Height = 186
      Align = alCustom
      Anchors = []
      BevelOuter = bvNone
      BorderWidth = 1
      Color = 4822522
      ParentBackground = False
      TabOrder = 0
      object Panel3: TPanel
        AlignWithMargins = True
        Left = 9
        Top = 9
        Width = 231
        Height = 168
        Margins.Left = 8
        Margins.Top = 8
        Margins.Right = 8
        Margins.Bottom = 8
        Align = alClient
        BevelOuter = bvNone
        Color = 9128543
        ParentBackground = False
        TabOrder = 0
        object btnLogin1: TButton
          Left = 13
          Top = 16
          Width = 204
          Height = 60
          Align = alCustom
          Anchors = [akLeft, akRight]
          Cancel = True
          Caption = 'Login'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 9128543
          Font.Height = -21
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          OnClick = btnLogin1Click
        end
        object btnRegister1: TButton
          Left = 13
          Top = 93
          Width = 204
          Height = 60
          Align = alCustom
          Anchors = [akLeft, akRight]
          Cancel = True
          Caption = 'Register'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 9128543
          Font.Height = -21
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          OnClick = btnRegister1Click
        end
      end
    end
    object Panel5: TPanel
      AlignWithMargins = True
      Left = 971
      Top = 672
      Width = 121
      Height = 64
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alCustom
      Alignment = taRightJustify
      Anchors = []
      BevelOuter = bvNone
      Color = 4822522
      ParentBackground = False
      TabOrder = 1
      object Button1: TButton
        Left = 8
        Top = 8
        Width = 105
        Height = 49
        Align = alCustom
        Caption = 'Customise'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = Button1Click
      end
    end
  end
  object Panel7: TPanel
    Left = 8
    Top = 8
    Width = 328
    Height = 272
    Align = alCustom
    Alignment = taLeftJustify
    Anchors = []
    BevelOuter = bvNone
    Color = 9128543
    ParentBackground = False
    TabOrder = 1
    object Panel6: TPanel
      Left = 8
      Top = 11
      Width = 121
      Height = 65
      Align = alCustom
      Alignment = taLeftJustify
      Anchors = []
      BevelOuter = bvNone
      Color = 4822522
      ParentBackground = False
      TabOrder = 0
      object btnHelp: TButton
        Left = 9
        Top = 9
        Width = 104
        Height = 48
        Align = alCustom
        Anchors = [akLeft, akTop, akRight, akBottom]
        Caption = 'Help'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMoneyGreen
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = btnHelpClick
      end
    end
    object Panel2: TPanel
      Left = 9
      Top = 82
      Width = 296
      Height = 177
      Margins.Left = 100
      Margins.Top = 100
      Margins.Right = 100
      Margins.Bottom = 100
      Align = alCustom
      Alignment = taLeftJustify
      Anchors = []
      BevelOuter = bvNone
      Color = 4822522
      ParentBackground = False
      TabOrder = 1
      VerticalAlignment = taAlignBottom
      object Panel4: TPanel
        Left = 8
        Top = 7
        Width = 281
        Height = 162
        BevelOuter = bvNone
        Color = 9128543
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 4822522
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 0
        object redHelp: TRichEdit
          Left = 6
          Top = 8
          Width = 267
          Height = 145
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
          ParentFont = False
          ScrollBars = ssVertical
          TabOrder = 0
        end
      end
    end
  end
end
