object frmCourseInfo: TfrmCourseInfo
  Left = 0
  Top = 0
  Caption = 'Course Info'
  ClientHeight = 718
  ClientWidth = 1109
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
    Width = 1109
    Height = 718
    Hint = 'Fee per week'
    Align = alClient
    BevelOuter = bvNone
    Color = 9128543
    ParentBackground = False
    TabOrder = 0
    object Panel2: TPanel
      Left = 24
      Top = 64
      Width = 361
      Height = 585
      BevelOuter = bvNone
      Color = 4822522
      ParentBackground = False
      TabOrder = 0
      object imgCourse: TImage
        Left = 8
        Top = 80
        Width = 345
        Height = 201
        Center = True
        Proportional = True
      end
      object Panel3: TPanel
        Left = 8
        Top = 8
        Width = 345
        Height = 57
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
        object lblCourseTitle: TLabel
          Left = 8
          Top = 13
          Width = 329
          Height = 30
          Alignment = taCenter
          AutoSize = False
          Caption = 'lblCourseTitle'
          Color = 4822522
          EllipsisPosition = epWordEllipsis
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 4822522
          Font.Height = -21
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
      end
      object Panel4: TPanel
        Left = 8
        Top = 296
        Width = 177
        Height = 201
        BevelOuter = bvNone
        Color = 9128543
        ParentBackground = False
        TabOrder = 1
        object Label1: TLabel
          Left = 8
          Top = 8
          Width = 92
          Height = 21
          Caption = 'Description:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 4822522
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold, fsUnderline]
          ParentFont = False
        end
        object redDescription: TRichEdit
          Left = 8
          Top = 35
          Width = 161
          Height = 158
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
            'Description Here')
          ParentFont = False
          ReadOnly = True
          ScrollBars = ssVertical
          TabOrder = 0
        end
      end
      object Panel11: TPanel
        Left = 191
        Top = 296
        Width = 162
        Height = 273
        BevelOuter = bvNone
        Color = 9128543
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 4822522
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 2
        object lblLength: TLabel
          Left = 8
          Top = 8
          Width = 73
          Height = 21
          Caption = 'lblLength'
        end
        object lblFee: TLabel
          Left = 8
          Top = 40
          Width = 46
          Height = 21
          Hint = 'Fee per week'
          Caption = 'lblFee'
          ParentShowHint = False
          ShowHint = True
        end
        object bitCalculateFee: TBitBtn
          Left = 8
          Top = 67
          Width = 145
          Height = 50
          Hint = 'Calculates the fee per week'
          Caption = 'Calculate Fee'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          Kind = bkRetry
          NumGlyphs = 2
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          OnClick = bitCalculateFeeClick
        end
        object spnWeeks: TSpinEdit
          Left = 8
          Top = 136
          Width = 145
          Height = 51
          Hint = 'Number of Weeks'
          AutoSelect = False
          AutoSize = False
          Color = 11759493
          Ctl3D = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 4822522
          Font.Height = -19
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          MaxValue = 1000
          MinValue = 1
          ParentCtl3D = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          StyleElements = [seFont, seClient]
          TabOrder = 1
          Value = 1
        end
        object redFee: TRichEdit
          Left = 8
          Top = 209
          Width = 145
          Height = 49
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
            'Fee')
          ParentFont = False
          ReadOnly = True
          ScrollBars = ssVertical
          TabOrder = 2
        end
      end
      object Panel18: TPanel
        Left = 8
        Top = 503
        Width = 177
        Height = 66
        BevelOuter = bvNone
        Color = 9128543
        ParentBackground = False
        TabOrder = 3
        object lblRating: TLabel
          Left = 8
          Top = 37
          Width = 70
          Height = 21
          Caption = 'lblRating'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 4822522
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblRatingVisual: TLabel
          Left = 8
          Top = 10
          Width = 117
          Height = 21
          Caption = 'lblRatingVisual'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 4822522
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
    end
    object btnBack: TButton
      Left = 8
      Top = 9
      Width = 105
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
    object Panel5: TPanel
      Left = 448
      Top = 64
      Width = 625
      Height = 585
      BevelOuter = bvNone
      Color = 4822522
      ParentBackground = False
      TabOrder = 2
      object Panel6: TPanel
        Left = 8
        Top = 8
        Width = 609
        Height = 57
        BevelOuter = bvNone
        Color = 9128543
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 4822522
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 0
        object Label2: TLabel
          Left = 8
          Top = 13
          Width = 593
          Height = 28
          Alignment = taCenter
          AutoSize = False
          Caption = 'Course Reviews'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 4822522
          Font.Height = -21
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object pnlButtons1: TPanel
        Left = 8
        Top = 351
        Width = 178
        Height = 153
        BevelOuter = bvNone
        Color = 9128543
        ParentBackground = False
        TabOrder = 1
        object Panel10: TPanel
          Left = 8
          Top = 80
          Width = 161
          Height = 63
          BevelOuter = bvNone
          Color = 4822522
          ParentBackground = False
          TabOrder = 0
          object bitDeleteReview: TBitBtn
            Left = 8
            Top = 8
            Width = 145
            Height = 49
            Caption = 'Delete Review'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            Kind = bkCancel
            NumGlyphs = 2
            ParentFont = False
            TabOrder = 0
            OnClick = bitDeleteReviewClick
          end
        end
        object Panel9: TPanel
          Left = 8
          Top = 8
          Width = 161
          Height = 66
          BevelOuter = bvNone
          Color = 4822522
          ParentBackground = False
          TabOrder = 1
          object bitWriteReview: TBitBtn
            Left = 8
            Top = 8
            Width = 145
            Height = 49
            Caption = 'Write a Review'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            Kind = bkAll
            NumGlyphs = 2
            ParentFont = False
            TabOrder = 0
            OnClick = bitWriteReviewClick
          end
        end
      end
      object pnlWriteReview: TPanel
        Left = 192
        Top = 351
        Width = 425
        Height = 218
        BevelOuter = bvNone
        Color = 9128543
        ParentBackground = False
        TabOrder = 2
        object Label3: TLabel
          Left = 8
          Top = 8
          Width = 118
          Height = 21
          Caption = 'Write a Review:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 4822522
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold, fsUnderline]
          ParentFont = False
        end
        object lblMaxCharacters: TLabel
          Left = 8
          Top = 191
          Width = 123
          Height = 17
          Caption = 'Max Characters: 255'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 4822522
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object redReview: TRichEdit
          Left = 8
          Top = 35
          Width = 409
          Height = 150
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
            'Your review here')
          ParentFont = False
          ScrollBars = ssVertical
          SpellChecking = True
          TabOrder = 0
          OnChange = redReviewChange
        end
      end
      object Panel8: TPanel
        Left = 192
        Top = 80
        Width = 425
        Height = 265
        BevelOuter = bvNone
        Color = 9128543
        ParentBackground = False
        TabOrder = 4
        object Label4: TLabel
          Left = 8
          Top = 8
          Width = 132
          Height = 21
          Caption = 'Course'#39's Reviews:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 4822522
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold, fsUnderline]
          ParentFont = False
        end
        object cmbSort: TComboBox
          Left = 256
          Top = 7
          Width = 162
          Height = 23
          AutoComplete = False
          TabOrder = 0
          TextHint = 'Sort By...'
          OnChange = cmbSortChange
          Items.Strings = (
            'Review Date (Latest)'
            'Review Date (Oldest)'
            'Rating (Highest)'
            'Rating (Lowest)')
        end
      end
      object pnlButtons2: TPanel
        Left = 8
        Top = 494
        Width = 178
        Height = 75
        BevelOuter = bvNone
        Color = 9128543
        ParentBackground = False
        TabOrder = 3
        object pnlConfirmReview: TPanel
          Left = 8
          Top = 10
          Width = 161
          Height = 55
          BevelOuter = bvNone
          Color = 4822522
          ParentBackground = False
          TabOrder = 0
          Visible = False
          object bitConfirmReview: TBitBtn
            Left = 8
            Top = 8
            Width = 145
            Height = 41
            Caption = 'Confirm Review'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            Kind = bkOK
            NumGlyphs = 2
            ParentFont = False
            TabOrder = 0
            OnClick = bitConfirmReviewClick
          end
        end
      end
      object pnlUniTooltip: TPanel
        Left = 8
        Top = 80
        Width = 178
        Height = 265
        BevelOuter = bvNone
        Color = 9128543
        ParentBackground = False
        TabOrder = 5
        object Panel14: TPanel
          Left = 8
          Top = 10
          Width = 161
          Height = 247
          BevelOuter = bvNone
          Color = 4822522
          ParentBackground = False
          TabOrder = 0
          object Panel15: TPanel
            Left = 8
            Top = 7
            Width = 145
            Height = 42
            BevelOuter = bvNone
            Color = 9128543
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 4822522
            Font.Height = -15
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentBackground = False
            ParentFont = False
            TabOrder = 0
            object lblUniversity: TLabel
              Left = 8
              Top = 10
              Width = 129
              Height = 23
              Alignment = taCenter
              AutoSize = False
              Caption = 'lblUniversity'
              EllipsisPosition = epWordEllipsis
              ParentShowHint = False
              ShowHint = True
              OnClick = lblUniversityClick
              OnMouseEnter = lblUniversityMouseEnter
              OnMouseLeave = lblUniversityMouseLeave
            end
          end
          object Panel16: TPanel
            Left = 8
            Top = 55
            Width = 145
            Height = 115
            BevelOuter = bvNone
            Color = 9128543
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 4822522
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentBackground = False
            ParentFont = False
            TabOrder = 1
            object imgUniTooltip: TImage
              Left = 8
              Top = 8
              Width = 129
              Height = 97
            end
          end
          object Panel17: TPanel
            Left = 8
            Top = 176
            Width = 145
            Height = 65
            BevelOuter = bvNone
            Color = 9128543
            ParentBackground = False
            TabOrder = 2
            object lblProvince: TLabel
              Left = 9
              Top = 8
              Width = 69
              Height = 17
              Caption = 'lblProvince'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 4822522
              Font.Height = -13
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lblPublic: TLabel
              Left = 9
              Top = 37
              Width = 54
              Height = 17
              Caption = 'lblPublic'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 4822522
              Font.Height = -13
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ParentFont = False
            end
          end
        end
      end
    end
  end
end
