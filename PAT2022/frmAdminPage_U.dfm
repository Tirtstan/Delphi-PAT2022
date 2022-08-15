object frmAdminPage: TfrmAdminPage
  Left = 0
  Top = 0
  Caption = 'Admin Page'
  ClientHeight = 707
  ClientWidth = 1112
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
    Width = 1112
    Height = 707
    Align = alClient
    BevelOuter = bvNone
    Color = 9128543
    ParentBackground = False
    TabOrder = 1
    object Panel10: TPanel
      Left = 780
      Top = 80
      Width = 310
      Height = 609
      BevelOuter = bvNone
      Color = 4822522
      ParentBackground = False
      TabOrder = 0
      object Panel11: TPanel
        Left = 8
        Top = 8
        Width = 289
        Height = 41
        BevelOuter = bvNone
        Caption = 'Extra SQL Tools:'
        Color = 9128543
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 4822522
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 0
      end
      object Panel12: TPanel
        Left = 8
        Top = 55
        Width = 289
        Height = 546
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
        object Label1: TLabel
          Left = 8
          Top = 350
          Width = 216
          Height = 20
          Caption = 'Enter a custom SQL statement:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 4822522
          Font.Height = -15
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold, fsUnderline]
          ParentFont = False
        end
        object Panel13: TPanel
          Left = 8
          Top = 279
          Width = 273
          Height = 65
          BevelOuter = bvNone
          Color = 4822522
          ParentBackground = False
          TabOrder = 0
          object btnSQLPreset: TButton
            Left = 8
            Top = 8
            Width = 257
            Height = 49
            Caption = 'Execute'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 4822522
            Font.Height = -16
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            OnClick = btnSQLPresetClick
          end
        end
        object lstSQL: TListBox
          Left = 8
          Top = 11
          Width = 273
          Height = 258
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
          ItemHeight = 50
          Items.Strings = (
            'AVG For tblUniversityReviews'
            'MIN For tblCourseReviews'
            'How Many Uni'#39's Per Province'
            'AVG Rating Per Course')
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          OnClick = lstSQLClick
        end
        object redSQL: TRichEdit
          Left = 8
          Top = 376
          Width = 273
          Height = 89
          Hint = 'Enter a custom SQL statement here... (Enter key executes it)'
          BorderStyle = bsNone
          Color = 11759493
          EditMargins.Left = 3
          EditMargins.Right = 3
          Font.Charset = ANSI_CHARSET
          Font.Color = 4822522
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ScrollBars = ssVertical
          ShowHint = False
          TabOrder = 2
          OnChange = redSQLChange
        end
        object Panel8: TPanel
          Left = 8
          Top = 473
          Width = 273
          Height = 64
          BevelOuter = bvNone
          Color = 4822522
          ParentBackground = False
          TabOrder = 3
          object btnSQLCustom: TButton
            Left = 9
            Top = 8
            Width = 125
            Height = 49
            Caption = 'Execute'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            OnClick = btnSQLCustomClick
          end
          object btnClearSQL: TButton
            Left = 140
            Top = 8
            Width = 125
            Height = 49
            Caption = 'Clear'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 4822522
            Font.Height = -16
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            OnClick = btnClearSQLClick
          end
        end
      end
    end
  end
  object Panel2: TPanel
    Left = 151
    Top = 8
    Width = 938
    Height = 58
    BevelOuter = bvNone
    Color = 4822522
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 2
    object btnStudents: TButton
      Left = 8
      Top = 7
      Width = 180
      Height = 42
      Caption = 'tblStudents'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = btnStudentsClick
    end
    object btnUniversities: TButton
      Left = 194
      Top = 7
      Width = 180
      Height = 42
      Caption = 'tblUniveristies'
      TabOrder = 1
      OnClick = btnUniversitiesClick
    end
    object btnUniversityReviews: TButton
      Left = 380
      Top = 7
      Width = 180
      Height = 42
      Caption = 'tblUniversityReviews'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = btnUniversityReviewsClick
    end
    object btnCourses: TButton
      Left = 566
      Top = 7
      Width = 180
      Height = 42
      Caption = 'tblCourses'
      TabOrder = 3
      OnClick = btnCoursesClick
    end
    object btnCourseReviews: TButton
      Left = 752
      Top = 7
      Width = 180
      Height = 42
      Caption = 'tblCourseReviews'
      TabOrder = 4
      OnClick = btnCourseReviewsClick
    end
  end
  object btnBack: TButton
    Left = 27
    Top = 8
    Width = 110
    Height = 58
    Caption = 'Back'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnClick = btnBackClick
  end
  object Panel3: TPanel
    Left = 27
    Top = 80
    Width = 738
    Height = 441
    BevelOuter = bvNone
    Color = 4822522
    ParentBackground = False
    TabOrder = 3
    object Panel9: TPanel
      Left = 8
      Top = 8
      Width = 721
      Height = 425
      BevelOuter = bvNone
      Color = 9128543
      ParentBackground = False
      TabOrder = 0
      object lblTitle: TLabel
        Left = 8
        Top = 8
        Width = 247
        Height = 21
        Caption = 'Select a database to view above:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 4822522
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
      end
      object cmbSearch: TComboBox
        Left = 329
        Top = 10
        Width = 146
        Height = 23
        ParentShowHint = False
        ShowHint = False
        TabOrder = 0
        TextHint = 'Choose a field...'
        OnChange = cmbSearchChange
        OnClick = cmbSearchClick
      end
      object srchDatabase: TSearchBox
        Left = 481
        Top = 10
        Width = 233
        Height = 23
        TabOrder = 1
        TextHint = 'Search...'
        OnChange = srchDatabaseChange
        OnClick = srchDatabaseClick
      end
      object dbgDatabase: TDBGrid
        Left = 8
        Top = 39
        Width = 706
        Height = 378
        Color = 11759493
        FixedColor = 11759493
        GradientEndColor = 11759493
        GradientStartColor = 11759493
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clBlack
        TitleFont.Height = -16
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = [fsBold]
      end
    end
  end
  object Panel4: TPanel
    Left = 27
    Top = 536
    Width = 738
    Height = 153
    BevelOuter = bvNone
    Color = 4822522
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 4
    object Panel5: TPanel
      Left = 8
      Top = 8
      Width = 226
      Height = 137
      BevelOuter = bvNone
      Color = 9128543
      ParentBackground = False
      TabOrder = 0
      object btnFirst: TButton
        Left = 8
        Top = 8
        Width = 209
        Height = 58
        Caption = 'First'
        TabOrder = 0
        OnClick = btnFirstClick
      end
      object btnLast: TButton
        Left = 8
        Top = 72
        Width = 209
        Height = 57
        Caption = 'Last'
        TabOrder = 1
        OnClick = btnLastClick
      end
    end
    object Panel6: TPanel
      Left = 240
      Top = 8
      Width = 217
      Height = 137
      BevelOuter = bvNone
      Color = 9128543
      ParentBackground = False
      TabOrder = 1
      object btnPrior: TButton
        Left = 8
        Top = 8
        Width = 201
        Height = 57
        Caption = 'Prior'
        TabOrder = 0
        OnClick = btnPriorClick
      end
      object btnNext: TButton
        Left = 8
        Top = 71
        Width = 201
        Height = 57
        Caption = 'Next'
        TabOrder = 1
        OnClick = btnNextClick
      end
    end
    object Panel7: TPanel
      Left = 463
      Top = 8
      Width = 266
      Height = 137
      BevelOuter = bvNone
      Color = 9128543
      ParentBackground = False
      TabOrder = 2
      object DBNavigator1: TDBNavigator
        Left = 8
        Top = 8
        Width = 250
        Height = 57
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert]
        TabOrder = 0
      end
      object DBNavigator2: TDBNavigator
        Left = 8
        Top = 71
        Width = 250
        Height = 57
        VisibleButtons = [nbDelete, nbEdit, nbPost, nbCancel, nbRefresh]
        TabOrder = 1
      end
    end
  end
end
