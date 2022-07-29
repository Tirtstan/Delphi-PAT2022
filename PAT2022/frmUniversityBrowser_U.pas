unit frmUniversityBrowser_U;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.jpeg, Vcl.ComCtrls, clsValidation, dbPAT2022,
  clsFormatCalculations;

type
  TfrmUniversityBrowser = class(TForm)
    Panel1: TPanel;
    btnBack: TButton;
    Panel2: TPanel;
    Label1: TLabel;
    Panel4: TPanel;
    procedure btnCloseClick(Sender: TObject);
    procedure btnBackClick(Sender: TObject);
    procedure btnCoursesClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure lblUniClick(Sender: TObject);
    procedure lblUniMouseEnter(Sender: TObject);
    procedure lblUniMouseLeave(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  private
    { Private declarations }
    objFormatCalculations: TFormatCalculation;
    arrUniPanels, arrInfoPanels, arrLblPanels, arrRedPanels: array of TPanel;
    arrPublic, arrUni, arrProvince: array of TLabel;
    arrDescription: array of TRichEdit;
    arrUniPic: array of TImage;
    ScrollBox: TScrollbox;
  public
    { Public declarations }
  end;

var
  frmUniversityBrowser: TfrmUniversityBrowser;
  sUniversityName: string;

implementation

uses frmLogin_U, frmCourseBrowser_U, frmBrowserChooser_U, frmUniversityInfo_U,
  frmCustomise_U;

{$R *.dfm}

procedure TfrmUniversityBrowser.btnBackClick(Sender: TObject);
begin
  frmUniversityBrowser.Hide;
  frmBrowserChooser.Show;
end;

procedure TfrmUniversityBrowser.btnCloseClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmUniversityBrowser.btnCoursesClick(Sender: TObject);
begin
  frmUniversityBrowser.Hide;
  frmCourseBrowser.Show;
end;

procedure TfrmUniversityBrowser.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Application.Terminate;
end;

procedure TfrmUniversityBrowser.FormCreate(Sender: TObject);
begin
  frmUniversityBrowser.Position := poScreenCenter;
end;

procedure TfrmUniversityBrowser.FormShow(Sender: TObject);
var
  iTopPanel: integer;
  I: integer;
  sPublic: string;
begin

  // Creating the gui

  ScrollBox := TScrollbox.Create(frmUniversityBrowser);
  with ScrollBox do
  begin
    Parent := Panel1;
    ParentBackground := false;
    VertScrollBar.Position := 0;
    Left := 117;
    Height := 601;
    Width := 893;
    Top := 104;
    Color := Secondary;
    BevelOuter := bvNone;
    BevelKind := bKNone;
    BevelInner := bvNone;
    VertScrollBar.Tracking := true;
    VertScrollBar.Smooth := true;
    BorderStyle := bsNone;
  end;

  with dbmPAT2022 do
  begin
    tblUniversities.Open;
    tblUniversities.First;

    // Freeing and length set

    // Dynamic arrays always start at 0 (array positon 0 will be empty)

    SetLength(arrUniPic, tblUniversities.RecordCount + 1);
    SetLength(arrDescription, tblUniversities.RecordCount + 1);
    SetLength(arrProvince, tblUniversities.RecordCount + 1);
    SetLength(arrPublic, tblUniversities.RecordCount + 1);
    SetLength(arrUni, tblUniversities.RecordCount + 1);
    SetLength(arrUniPanels, tblUniversities.RecordCount + 1);
    SetLength(arrLblPanels, tblUniversities.RecordCount + 1);
    SetLength(arrRedPanels, tblUniversities.RecordCount + 1);
    SetLength(arrInfoPanels, tblUniversities.RecordCount + 1);

    // Deletes previous objects and reloads

    for I := 0 to tblUniversities.RecordCount do
    begin
      arrUniPic[I].Free;
      arrDescription[I].Free;
      arrProvince[I].Free;
      arrPublic[I].Free;
      arrUni[I].Free;
      arrLblPanels[I].Free;
      arrRedPanels[I].Free;
      arrInfoPanels[I].Free;
      arrUniPanels[I].Free;
    end;

    // Displaying all uni's

    // Creating Part

    iTopPanel := 15;
    I := 0;

    tblUniversities.First;
    while NOT(tblUniversities.Eof) do
    begin
      inc(I);

      arrUniPanels[I] := TPanel.Create(frmUniversityBrowser);
      arrLblPanels[I] := TPanel.Create(frmUniversityBrowser);
      arrRedPanels[I] := TPanel.Create(frmUniversityBrowser);
      arrInfoPanels[I] := TPanel.Create(frmUniversityBrowser);
      arrUni[I] := TLabel.Create(frmUniversityBrowser);
      arrPublic[I] := TLabel.Create(frmUniversityBrowser);
      arrProvince[I] := TLabel.Create(frmUniversityBrowser);
      arrDescription[I] := TRichEdit.Create(frmUniversityBrowser);
      arrUniPic[I] := TImage.Create(frmUniversityBrowser);

      // Review Panel

      with arrUniPanels[I] do
      begin
        Parent := ScrollBox;
        ParentBackground := false;
        Color := Primary;
        Tag := I;
        BevelOuter := bvNone;
        Height := 300;
        Width := 860;
        Left := 10;
        Top := iTopPanel;
      end;
      inc(iTopPanel, 330);

      with arrUni[I] do
      begin
        Parent := arrUniPanels[I];
        Font.Color := Secondary;
        Font.Style := [fsBold, fsUnderline];
        AutoSize := true;
        Caption := tblUniversities['University'];
        Tag := tblUniversities['UniversityID'];
        Font.Size := 16;
        Left := 8;
        Top := 2;
        OnClick := lblUniClick;
        OnMouseEnter := lblUniMouseEnter;
        OnMouseLeave := lblUniMouseLeave;
      end;

      // Info Panel

      with arrInfoPanels[I] do
      begin
        Parent := arrUniPanels[I];
        ParentBackground := false;
        Color := Secondary;
        Tag := I;
        BevelOuter := bvNone;
        Height := 284;
        Width := 382;
        Left := 470;
        Top := 8;
      end;

      // Label Panel

      with arrLblPanels[I] do
      begin
        Parent := arrInfoPanels[I];
        ParentBackground := false;
        Color := Primary;
        Tag := I;
        BevelOuter := bvNone;
        Height := 60;
        Width := 366;
        Left := 8;
        Top := 8;
      end;

      with arrRedPanels[I] do
      begin
        Parent := arrInfoPanels[I];
        ParentBackground := false;
        Color := Primary;
        Tag := I;
        BevelOuter := bvNone;
        Height := 198;
        Width := 366;
        Left := 8;
        Top := arrLblPanels[I].Height + 16;
      end;

      // Public

      with arrPublic[I] do
      begin
        Parent := arrLblPanels[I];
        Font.Color := Secondary;
        Font.Style := [fsBold];
        AutoSize := true;
        if BoolToStr(tblUniversities['Public']) = '-1' then
        begin
          sPublic := 'Public';
        end
        else if BoolToStr(tblUniversities['Public']) = '0' then
        begin
          sPublic := 'Private'
        end;
        Caption := 'Type: ' + sPublic;
        Tag := I;
        Font.Size := 12;
        Left := 8;
        Top := 6;
      end;

      // Province

      with arrProvince[I] do
      begin
        Parent := arrLblPanels[I];
        Font.Color := Secondary;
        Font.Style := [fsBold];
        AutoSize := true;
        Caption := 'Province: ' + tblUniversities['Province'];
        Tag := I;
        Font.Size := 12;
        Left := 8;
        Top := 28;
      end;

      // Description

      with arrDescription[I] do
      begin
        Parent := arrRedPanels[I];
        readOnly := true;
        Text := tblUniversities['Description'];
        Color := PrimaryBrighter;
        Font.Color := Secondary;
        Font.Style := [fsBold];
        Font.Size := 12;
        BorderStyle := bsNone;
        WordWrap := true;
        EditMargins.Left := 3;
        EditMargins.right := 3;
        Height := 182;
        Width := 350;
        Left := 8;
        Top := 8;
      end;

      // Uni Pic

      with arrUniPic[I] do
      begin
        Parent := arrUniPanels[I];
        Proportional := true;
        Center := true;
        Picture.LoadFromFile('Uni' + IntToStr(I) + '.jpg');
        Left := 8;
        Top := 35;
        Width := 450;
        Height := 255;
      end;
      ScrollBox.VertScrollBar.Range := iTopPanel;
      tblUniversities.Next;
    end;
  end;
  ScrollBox.VertScrollBar.Range := ScrollBox.VertScrollBar.Range + 30;

  // Colour Scheme

  // Panels

  Panel1.Color := Primary;
  Panel2.Color := Primary;
  Panel4.Color := Secondary;

  // Labels

  Label1.Font.Color := Secondary;
end;

procedure TfrmUniversityBrowser.lblUniClick(Sender: TObject);
begin
  // Finding the university's ID

  iUniversityID := (Sender AS TLabel).Tag;
  sUniversityName := (Sender AS TLabel).Caption;
  frmUniversityBrowser.Hide;
  frmUniversityInfo.Show;

end;

procedure TfrmUniversityBrowser.lblUniMouseEnter(Sender: TObject);
begin
  objFormatCalculations.MouseEnterLabel(Sender AS TLabel);
end;

procedure TfrmUniversityBrowser.lblUniMouseLeave(Sender: TObject);
begin
  objFormatCalculations.MouseLeaveLabel(Sender AS TLabel);
end;

end.
