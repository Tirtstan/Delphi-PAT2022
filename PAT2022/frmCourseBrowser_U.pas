unit frmCourseBrowser_U;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.ComCtrls, DB, dbPAT2022, clsFormatCalculations;

type
  TfrmCourseBrowser = class(TForm)
    Panel1: TPanel;
    ScrollBox1: TScrollBox;
    btnBack: TButton;
    lblTitle: TLabel;
    pnlTitle: TPanel;
    pnlCourseInfo: TPanel;
    Panel2: TPanel;
    lblCourseInfo: TLabel;
    Panel3: TPanel;
    lblLength: TLabel;
    lblDescription: TLabel;
    redDescription: TRichEdit;
    lblUniversity: TLabel;
    imgCourse: TImage;
    pnlImg: TPanel;
    lblFee: TLabel;
    pnlMoreInfo: TPanel;
    btnMoreInfo: TButton;
    Panel4: TPanel;
    btnCloseCoursePanel: TButton;
    procedure btnBackClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnMoreInfoClick(Sender: TObject);
    procedure lblCourseClick(Sender: TObject);
    procedure lblCourseOnMouseEnter(Sender: TObject);
    procedure lblCourseOnMouseLeave(Sender: TObject);
    procedure btnCloseCoursePanelClick(Sender: TObject);
    procedure lblUniversityClick(Sender: TObject);
    procedure lblUniversityMouseEnter(Sender: TObject);
    procedure lblUniversityMouseLeave(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    objFormatCalculations: TFormatCalculation;
  public
    { Public declarations }
  end;

var
  frmCourseBrowser: TfrmCourseBrowser;
  arrCoursePictures: array [1 .. 18] of string = (
    '1.png',
    '2.png',
    '3.png',
    '4.png',
    '5.png',
    '6.png',
    '7.png',
    '8.png',
    '9.png',
    '10.png',
    '11.png',
    '12.jpg',
    '13.jpg',
    '14.jpg',
    '15.png',
    '16.jpg',
    '17.png',
    '18.jpg'
  );
  arrCourseLabels: array of TLabel;
  arrCoursePanels: array of TPanel;
  iUniversityID, iCourseID: Integer;
  sUniversity, sCourseName: string;

implementation

uses
  frmLogin_U, frmUniversityBrowser_U, frmBrowserChooser_U, frmCourseInfo_U,
  frmCustomise_U, frmUniversityInfo_U;

{$R *.dfm}

procedure TfrmCourseBrowser.btnBackClick(Sender: TObject);
begin
  frmCourseBrowser.Hide;
  frmBrowserChooser.Show;
end;

procedure TfrmCourseBrowser.btnCloseClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmCourseBrowser.btnCloseCoursePanelClick(Sender: TObject);
begin
  pnlCourseInfo.Visible := false;
end;

procedure TfrmCourseBrowser.btnMoreInfoClick(Sender: TObject);
begin
  frmCourseBrowser.Hide;
  frmCourseInfo.Show;
end;

procedure TfrmCourseBrowser.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Application.Terminate;
end;

procedure TfrmCourseBrowser.FormCreate(Sender: TObject);
var
  iTopPanel, I: Integer;
begin
  frmCourseBrowser.Position := poScreenCenter;

  iUniversityID := 0;
  iCourseID := 0;

  ScrollBox1.VertScrollBar.Range := ScrollBox1.VertScrollBar.Range + 100;
end;

procedure TfrmCourseBrowser.FormShow(Sender: TObject);
var
  bFlag: boolean;
  iTopPanel, I: Integer;
  Item1, Item2: TObject;
begin

  // Other

  ScrollBox1.VertScrollBar.Visible := True;
  ScrollBox1.VertScrollBar.Smooth := True;
  ScrollBox1.VertScrollBar.Tracking := True;
  ScrollBox1.VertScrollBar.Position := 0;

  // Dynamically creating the labels

  iTopPanel := 15;

  with dbmPAT2022 do
  begin

    tblCourses.Open;
    tblCourses.First;

    // Dynamic arrays always start at 0 (array positon 0 will be empty)

    SetLength(arrCourseLabels, tblCourses.RecordCount + 1);
    SetLength(arrCoursePanels, tblCourses.RecordCount + 1);

    // Deletes previous objects and reloads

    for I := 0 to tblCourses.RecordCount do
    begin
      arrCourseLabels[I].Free;
      arrCoursePanels[I].Free;
    end;

    for I := 1 to tblCourses.RecordCount do
    begin
      arrCoursePanels[I] := TPanel.Create(frmCourseBrowser);
      arrCourseLabels[I] := TLabel.Create(frmCourseBrowser);

      with arrCoursePanels[I] do
      begin
        Parent := ScrollBox1;
        ParentBackground := false;
        Tag := I;
        BevelOuter := bvNone;
        Color := Primary;
        Height := 80;
        Width := 700;
        Left := 10;
        Top := iTopPanel;
      end;
      inc(iTopPanel, 110);

      with arrCourseLabels[I] do
      begin
        Parent := arrCoursePanels[I];
        ParentBackground := false;
        Caption := tblCourses['Course'];
        Name := 'lblCourse' + IntToStr(I);
        Tag := I;
        Font.Color := Secondary;
        Font.Size := 16;
        AutoSize := True;
        Left := 10;
        Top := 27;

        onClick := lblCourseClick;
        OnMouseEnter := lblCourseOnMouseEnter;
        OnMouseLeave := lblCourseOnMouseLeave;

      end;
      tblCourses.Next;
    end;

  end;
  // Colour Scheme

  // Panels + Scrollbox

  Panel1.Color := Primary;
  Panel2.Color := Primary;
  Panel3.Color := Primary;
  Panel4.Color := Secondary;
  pnlTitle.Color := Primary;
  ScrollBox1.Color := Secondary;
  pnlCourseInfo.Color := Secondary;
  pnlImg.Color := Secondary;
  pnlMoreInfo.Color := Primary;

  // Labels

  lblTitle.Font.Color := Secondary;
  lblCourseInfo.Font.Color := Secondary;
  lblLength.Font.Color := Secondary;
  lblDescription.Font.Color := Secondary;
  lblUniversity.Font.Color := Secondary;
  lblFee.Font.Color := Secondary;

  redDescription.Font.Color := Secondary;
  redDescription.Color := PrimaryBrighter;

  // Other

  dbmPAT2022.tblUniversities.Open;
  dbmPAT2022.tblUniversities.First;

  pnlCourseInfo.Visible := false;

end;

procedure TfrmCourseBrowser.lblCourseClick(Sender: TObject);
begin
  // When a label is clicked on
  pnlCourseInfo.Visible := True;
  lblCourseInfo.Caption := (Sender AS TLabel).Caption;

  with objFormatCalculation do
  begin
    iCourseID := FindCourseID(Sender AS TLabel);
    redDescription.Text := FindCourseDescription;
    lblLength.Caption := FindCourseLength(Sender As TLabel);
    lblUniversity.Caption := FindCourseUni;
    lblFee.Caption := FloatToStrF(FindCourseFee(Sender AS TLabel),
      ffCurrency, 8, 2);
    imgCourse.Picture.LoadFromFile(arrCoursePictures[iCourseID]);
  end;

  { for i := 1 to dbmPAT2022.tblCourses.RecordCount do
    begin

    if arrCourses[i].Tag = (Sender AS TLabel).Tag then
    begin
    arrCourses[i].Font.Style := [FsBold, fsUnderline];
    end
    else
    begin
    arrCourses[i].Font.Style := [FsBold];
    end;

    end; }

end;

procedure TfrmCourseBrowser.lblCourseOnMouseEnter(Sender: TObject);
begin
  objFormatCalculations.MouseEnterLabel(Sender AS TLabel);
end;

procedure TfrmCourseBrowser.lblCourseOnMouseLeave(Sender: TObject);
var
  I: Integer;
begin
  objFormatCalculations.MouseLeaveLabel(Sender AS TLabel);
  (Sender AS TLabel).Font.Style := [FsBold];
end;

procedure TfrmCourseBrowser.lblUniversityClick(Sender: TObject);
begin
  with dbmPAT2022 do
  begin
    tblUniversities.Open;
    tblUniversities.Sort := 'UniversityID ASC';
    tblUniversities.First;

    while NOT(tblUniversities.Eof) do
    begin
      if tblUniversities['University'] = lblUniversity.Caption then
      begin
        sUniversityName := tblUniversities['University'];

        frmCourseInfo.Hide;
        frmUniversityInfo.Show;

        break;
      end;
      tblUniversities.Next;
    end;
  end;
end;

procedure TfrmCourseBrowser.lblUniversityMouseEnter(Sender: TObject);
begin

  lblUniversity.Hint := lblUniversity.Caption;
  objFormatCalculations.MouseEnterLabel(lblUniversity);
end;

procedure TfrmCourseBrowser.lblUniversityMouseLeave(Sender: TObject);
begin
  objFormatCalculations.MouseLeaveLabel(lblUniversity);
end;

end.
