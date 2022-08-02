object frmProfile: TfrmProfile
  Left = 0
  Top = 0
  Caption = 'Profile'
  ClientHeight = 664
  ClientWidth = 518
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
    Width = 545
    Height = 737
    BevelOuter = bvNone
    Color = 9128543
    ParentBackground = False
    TabOrder = 0
    object Panel2: TPanel
      Left = 288
      Top = 20
      Width = 217
      Height = 265
      BevelOuter = bvNone
      Color = 4822522
      ParentBackground = False
      TabOrder = 0
      object Panel4: TPanel
        Left = 8
        Top = 9
        Width = 201
        Height = 48
        BevelOuter = bvNone
        Color = 9128543
        ParentBackground = False
        TabOrder = 0
        object lblName: TLabel
          Left = 8
          Top = 8
          Width = 185
          Height = 30
          Alignment = taCenter
          AutoSize = False
          Caption = 'lblName'
          EllipsisPosition = epWordEllipsis
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 4822522
          Font.Height = -21
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
        end
      end
      object Panel17: TPanel
        Left = 8
        Top = 63
        Width = 201
        Height = 194
        BevelOuter = bvNone
        Color = 9128543
        ParentBackground = False
        TabOrder = 1
        object imgPfp: TImage
          Left = 8
          Top = 11
          Width = 185
          Height = 174
          Center = True
          Proportional = True
        end
      end
    end
    object Panel3: TPanel
      Left = 16
      Top = 20
      Width = 249
      Height = 560
      BevelOuter = bvNone
      Color = 4822522
      ParentBackground = False
      TabOrder = 1
      object Panel5: TPanel
        Left = 6
        Top = 12
        Width = 129
        Height = 41
        BevelOuter = bvNone
        Color = 9128543
        ParentBackground = False
        TabOrder = 0
        object lblEmail: TLabel
          Left = 44
          Top = 8
          Width = 42
          Height = 20
          Alignment = taCenter
          Caption = 'Email:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 4822522
          Font.Height = -15
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object Panel6: TPanel
        Left = 6
        Top = 284
        Width = 129
        Height = 41
        BevelOuter = bvNone
        Color = 9128543
        ParentBackground = False
        TabOrder = 1
        object lblPassword: TLabel
          Left = 28
          Top = 8
          Width = 71
          Height = 20
          Caption = 'Password:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 4822522
          Font.Height = -15
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object Panel7: TPanel
        Left = 6
        Top = 147
        Width = 129
        Height = 41
        BevelOuter = bvNone
        Color = 9128543
        ParentBackground = False
        TabOrder = 2
        object lblPhoneNumber: TLabel
          Left = 8
          Top = 8
          Width = 111
          Height = 20
          Alignment = taCenter
          Caption = 'Phone Number:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 4822522
          Font.Height = -15
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object Panel8: TPanel
        Left = 5
        Top = 419
        Width = 235
        Height = 41
        BevelOuter = bvNone
        Color = 9128543
        ParentBackground = False
        TabOrder = 3
        object lblIDtitle: TLabel
          Left = 109
          Top = 8
          Width = 20
          Height = 20
          Caption = 'ID:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 4822522
          Font.Height = -15
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object Panel12: TPanel
        Left = 6
        Top = 194
        Width = 233
        Height = 82
        BevelOuter = bvNone
        Color = 9128543
        ParentBackground = False
        TabOrder = 4
        object redPhoneNumber: TRichEdit
          Left = 8
          Top = 8
          Width = 217
          Height = 65
          BevelInner = bvNone
          BorderStyle = bsNone
          Color = 11759493
          EditMargins.Left = 3
          EditMargins.Right = 3
          Font.Charset = ANSI_CHARSET
          Font.Color = 4822522
          Font.Height = -21
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
        end
      end
      object Panel13: TPanel
        Left = 6
        Top = 59
        Width = 233
        Height = 82
        BevelOuter = bvNone
        Color = 9128543
        ParentBackground = False
        TabOrder = 5
        object redEmail: TRichEdit
          Left = 8
          Top = 8
          Width = 217
          Height = 65
          BevelInner = bvNone
          BorderStyle = bsNone
          Color = 11759493
          EditMargins.Left = 3
          EditMargins.Right = 3
          Font.Charset = ANSI_CHARSET
          Font.Color = 4822522
          Font.Height = -21
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
        end
      end
      object Panel14: TPanel
        Left = 6
        Top = 331
        Width = 233
        Height = 66
        BevelOuter = bvNone
        Color = 9128543
        ParentBackground = False
        TabOrder = 6
        object edtPassword: TEdit
          Left = 8
          Top = 10
          Width = 218
          Height = 48
          AutoSelect = False
          AutoSize = False
          BevelInner = bvNone
          BevelOuter = bvNone
          BorderStyle = bsNone
          Color = 11759493
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 4822522
          Font.Height = -19
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
        end
      end
      object Panel15: TPanel
        Left = 5
        Top = 466
        Width = 235
        Height = 66
        BevelOuter = bvNone
        Color = 9128543
        ParentBackground = False
        TabOrder = 7
        object edtID: TEdit
          Left = 8
          Top = 10
          Width = 218
          Height = 48
          AutoSelect = False
          AutoSize = False
          BevelInner = bvNone
          BevelOuter = bvNone
          BorderStyle = bsNone
          Color = 11759493
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 4822522
          Font.Height = -19
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
        end
      end
      object chkPassword: TCheckBox
        Left = 6
        Top = 397
        Width = 119
        Height = 17
        Caption = 'Show Password'
        Color = 9128543
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        TabOrder = 8
        OnClick = chkPasswordClick
      end
      object chkID: TCheckBox
        Left = 6
        Top = 532
        Width = 76
        Height = 17
        Caption = 'Show ID'
        Color = 9128543
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        TabOrder = 9
        OnClick = chkIDClick
      end
      object bitChangeEmail: TBitBtn
        Left = 141
        Top = 12
        Width = 100
        Height = 41
        Caption = 'Change'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        Kind = bkRetry
        NumGlyphs = 2
        ParentFont = False
        TabOrder = 10
        OnClick = bitChangeEmailClick
      end
      object bitChangePhoneNumber: TBitBtn
        Left = 141
        Top = 147
        Width = 100
        Height = 41
        Caption = 'Change'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        Kind = bkRetry
        NumGlyphs = 2
        ParentFont = False
        TabOrder = 11
        OnClick = bitChangePhoneNumberClick
      end
      object bitChangePassword: TBitBtn
        Left = 141
        Top = 284
        Width = 100
        Height = 41
        Caption = 'Change'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        Kind = bkRetry
        NumGlyphs = 2
        ParentFont = False
        TabOrder = 12
        OnClick = bitChangePasswordClick
      end
    end
    object Panel10: TPanel
      Left = 288
      Top = 291
      Width = 217
      Height = 289
      BevelOuter = bvNone
      Color = 4822522
      ParentBackground = False
      TabOrder = 2
      object Panel9: TPanel
        Left = 8
        Top = 8
        Width = 89
        Height = 50
        BevelOuter = bvNone
        Color = 9128543
        ParentBackground = False
        TabOrder = 0
        object lblBio: TLabel
          Left = 24
          Top = 8
          Width = 38
          Height = 30
          Alignment = taCenter
          Caption = 'Bio:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 4822522
          Font.Height = -21
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object Panel11: TPanel
        Left = 8
        Top = 64
        Width = 201
        Height = 161
        BevelOuter = bvNone
        Color = 9128543
        ParentBackground = False
        TabOrder = 1
        object lblMaxCharacters: TLabel
          Left = 8
          Top = 135
          Width = 106
          Height = 17
          Caption = 'lblMaxCharacters'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 4822522
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object redBio: TRichEdit
          Left = 8
          Top = 8
          Width = 185
          Height = 145
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
          ReadOnly = True
          ScrollBars = ssVertical
          TabOrder = 0
          OnChange = redBioChange
        end
      end
      object bitChangeBio: TBitBtn
        Left = 103
        Top = 8
        Width = 106
        Height = 50
        Caption = 'Change'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        Kind = bkRetry
        NumGlyphs = 2
        ParentFont = False
        TabOrder = 2
        OnClick = bitChangeBioClick
      end
      object Panel18: TPanel
        Left = 8
        Top = 231
        Width = 201
        Height = 50
        BevelOuter = bvNone
        Color = 9128543
        ParentBackground = False
        TabOrder = 3
        object dpkBirthday: TDatePicker
          Left = 8
          Top = 8
          Width = 185
          Date = 44775.000000000000000000
          DateFormat = 'dd/mmm/yyyy'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          TabOrder = 0
        end
      end
    end
    object Panel16: TPanel
      Left = 173
      Top = 594
      Width = 185
      Height = 58
      BevelOuter = bvNone
      Color = 4822522
      ParentBackground = False
      TabOrder = 3
      object bitConfirmChanges: TBitBtn
        Left = 8
        Top = 8
        Width = 169
        Height = 41
        Caption = 'Confirm Changes'
        Kind = bkOK
        NumGlyphs = 2
        TabOrder = 0
        OnClick = bitConfirmChangesClick
      end
    end
  end
end
