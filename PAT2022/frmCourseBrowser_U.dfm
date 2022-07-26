object frmCourseBrowser: TfrmCourseBrowser
  Left = 0
  Top = 0
  Caption = 'Course Browser'
  ClientHeight = 725
  ClientWidth = 1122
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
    Width = 1121
    Height = 737
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
    object ScrollBox1: TScrollBox
      Left = 111
      Top = 92
      Width = 737
      Height = 621
      HorzScrollBar.Range = 718
      VertScrollBar.Color = 9128543
      VertScrollBar.ParentColor = False
      VertScrollBar.Range = 1900
      VertScrollBar.Smooth = True
      VertScrollBar.Tracking = True
      AutoScroll = False
      BevelInner = bvNone
      BevelOuter = bvNone
      BorderStyle = bsNone
      Color = 4822522
      ParentColor = False
      TabOrder = 0
    end
    object btnBack: TButton
      Left = 8
      Top = 8
      Width = 97
      Height = 49
      Caption = 'Back'
      TabOrder = 1
      OnClick = btnBackClick
    end
    object btnClose: TButton
      Left = 1016
      Top = 8
      Width = 91
      Height = 49
      Caption = 'Close'
      TabOrder = 2
      OnClick = btnCloseClick
    end
    object pnlCourseInfo: TPanel
      Left = 864
      Top = 92
      Width = 243
      Height = 554
      BevelOuter = bvNone
      Color = 4822522
      ParentBackground = False
      TabOrder = 3
      object Panel2: TPanel
        Left = 8
        Top = 14
        Width = 225
        Height = 84
        BevelOuter = bvNone
        Color = 9128543
        ParentBackground = False
        TabOrder = 0
        object lblCourseInfo: TLabel
          Left = 8
          Top = 8
          Width = 209
          Height = 65
          AutoSize = False
          BiDiMode = bdLeftToRight
          Caption = 'lblCourseInfo'
          EllipsisPosition = epWordEllipsis
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 4822522
          Font.Height = -21
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold, fsUnderline]
          ParentBiDiMode = False
          ParentFont = False
          WordWrap = True
        end
      end
      object Panel3: TPanel
        Left = 8
        Top = 104
        Width = 225
        Height = 369
        BevelOuter = bvNone
        Color = 9128543
        ParentBackground = False
        TabOrder = 1
        object lblLength: TLabel
          Left = 8
          Top = 8
          Width = 130
          Height = 21
          AutoSize = False
          Caption = 'lblLength'
          EllipsisPosition = epWordEllipsis
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 4822522
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold, fsUnderline]
          ParentFont = False
        end
        object lblDescription: TLabel
          Left = 8
          Top = 91
          Width = 92
          Height = 21
          AutoSize = False
          Caption = 'Description:'
          EllipsisPosition = epWordEllipsis
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 4822522
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold, fsUnderline]
          ParentFont = False
        end
        object lblUniversity: TLabel
          Left = 8
          Top = 37
          Width = 130
          Height = 21
          AutoSize = False
          Caption = 'lblUniversity'
          EllipsisPosition = epWordEllipsis
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 4822522
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold, fsUnderline]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          OnClick = lblUniversityClick
          OnMouseEnter = lblUniversityMouseEnter
          OnMouseLeave = lblUniversityMouseLeave
        end
        object lblFee: TLabel
          Left = 8
          Top = 64
          Width = 46
          Height = 21
          Caption = 'lblFee'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 4822522
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold, fsUnderline]
          ParentFont = False
        end
        object redDescription: TRichEdit
          Left = 8
          Top = 118
          Width = 209
          Height = 243
          BorderStyle = bsNone
          Color = 11759493
          EditMargins.Left = 3
          EditMargins.Right = 3
          Font.Charset = ANSI_CHARSET
          Font.Color = 4822522
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          Lines.Strings = (
            'Description here')
          ParentFont = False
          ReadOnly = True
          ScrollBars = ssVertical
          TabOrder = 0
        end
        object pnlImg: TPanel
          Left = 144
          Top = 18
          Width = 73
          Height = 75
          BevelOuter = bvNone
          Color = 4822522
          ParentBackground = False
          TabOrder = 1
          object imgCourse: TImage
            Left = 0
            Top = 0
            Width = 73
            Height = 75
            Center = True
            Proportional = True
            Stretch = True
          end
        end
      end
      object pnlMoreInfo: TPanel
        Left = 8
        Top = 479
        Width = 225
        Height = 58
        BevelOuter = bvNone
        Color = 9128543
        ParentBackground = False
        TabOrder = 2
        object btnMoreInfo: TButton
          Left = 8
          Top = 8
          Width = 209
          Height = 41
          Caption = 'More Info'
          TabOrder = 0
          OnClick = btnMoreInfoClick
        end
      end
      object btnCloseCoursePanel: TButton
        Left = 209
        Top = -1
        Width = 35
        Height = 33
        Caption = 'X'
        TabOrder = 3
        StyleElements = [seFont, seClient]
        OnClick = btnCloseCoursePanelClick
      end
    end
    object Panel4: TPanel
      Left = 111
      Top = 8
      Width = 737
      Height = 78
      BevelOuter = bvNone
      Color = 4822522
      ParentBackground = False
      TabOrder = 4
      object pnlTitle: TPanel
        Left = 11
        Top = 9
        Width = 198
        Height = 59
        BevelOuter = bvNone
        Color = 9128543
        ParentBackground = False
        TabOrder = 0
        object lblTitle: TLabel
          Left = 8
          Top = 9
          Width = 179
          Height = 32
          Caption = 'Course Browser'
          Color = 4822522
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 4822522
          Font.Height = -24
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold, fsUnderline]
          ParentColor = False
          ParentFont = False
        end
      end
    end
  end
end
