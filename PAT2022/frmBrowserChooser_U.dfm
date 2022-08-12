object frmBrowserChooser: TfrmBrowserChooser
  Left = 0
  Top = 0
  Caption = 'Browser Chooser'
  ClientHeight = 720
  ClientWidth = 1119
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
  object pnlChoose: TPanel
    Left = 0
    Top = 0
    Width = 1119
    Height = 720
    Align = alClient
    BevelOuter = bvNone
    Color = 9128543
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 4822522
    Font.Height = -21
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 0
    ExplicitWidth = 1121
    ExplicitHeight = 721
    object Label1: TLabel
      Left = 456
      Top = 40
      Width = 223
      Height = 71
      Alignment = taCenter
      Caption = 'Browse...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4822522
      Font.Height = -53
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblUser: TLabel
      Left = 119
      Top = 14
      Width = 874
      Height = 30
      Alignment = taCenter
      AutoSize = False
      Caption = 'Currently Logged In As'
    end
    object pnlUniversities: TPanel
      Left = 136
      Top = 162
      Width = 369
      Height = 431
      BevelOuter = bvNone
      Color = 4822522
      ParentBackground = False
      TabOrder = 0
      object imgUni: TImage
        Left = 16
        Top = 96
        Width = 337
        Height = 233
        Center = True
      end
      object Panel2: TPanel
        Left = 16
        Top = 12
        Width = 337
        Height = 69
        BevelOuter = bvNone
        Color = 9128543
        ParentBackground = False
        TabOrder = 0
        object Label2: TLabel
          Left = 96
          Top = 16
          Width = 133
          Height = 32
          Alignment = taCenter
          Caption = 'Universities'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 4822522
          Font.Height = -24
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object Panel4: TPanel
        Left = 16
        Top = 343
        Width = 337
        Height = 74
        BevelOuter = bvNone
        Color = 9128543
        ParentBackground = False
        TabOrder = 1
        object btnUni: TButton
          Left = 8
          Top = 8
          Width = 321
          Height = 57
          Caption = 'Universities'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 4822522
          Font.Height = -21
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          OnClick = btnUniClick
        end
      end
    end
    object btnBack: TButton
      Left = 8
      Top = 8
      Width = 105
      Height = 49
      Caption = 'Back'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4822522
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = btnBackClick
    end
    object btnProfile: TButton
      Left = 1008
      Top = 656
      Width = 99
      Height = 49
      Caption = 'Profile'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4822522
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = btnProfileClick
    end
    object pnlCourses: TPanel
      Left = 600
      Top = 162
      Width = 369
      Height = 431
      BevelOuter = bvNone
      Color = 4822522
      ParentBackground = False
      TabOrder = 3
      object imgCourse: TImage
        Left = 16
        Top = 92
        Width = 337
        Height = 233
        Center = True
      end
      object Panel3: TPanel
        Left = 16
        Top = 12
        Width = 337
        Height = 69
        BevelOuter = bvNone
        Color = 9128543
        ParentBackground = False
        TabOrder = 0
        object Label3: TLabel
          Left = 128
          Top = 16
          Width = 90
          Height = 32
          Alignment = taCenter
          Caption = 'Courses'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 4822522
          Font.Height = -24
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object Panel1: TPanel
        Left = 16
        Top = 344
        Width = 337
        Height = 73
        BevelOuter = bvNone
        Color = 9128543
        ParentBackground = False
        TabOrder = 1
        object btnCourses: TButton
          Left = 8
          Top = 8
          Width = 321
          Height = 57
          Caption = 'Courses'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -21
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          OnClick = btnCoursesClick
        end
      end
    end
    object btnAdmin: TButton
      Left = 8
      Top = 656
      Width = 105
      Height = 49
      Caption = 'Admin Page'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4822522
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      OnClick = btnAdminClick
    end
  end
end
