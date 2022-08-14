unit frmCourseInfo_U;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.ComCtrls, Vcl.Buttons, dbPAT2022, JPEG, clsFormatCalculations,
  Vcl.Samples.Spin, VCLTee.TeCanvas, Math, clsReviews;

type
  TfrmCourseInfo = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    btnBack: TButton;
    Panel3: TPanel;
    lblCourseTitle: TLabel;
    imgCourse: TImage;
    Panel4: TPanel;
    redDescription: TRichEdit;
    Label1: TLabel;
    Panel5: TPanel;
    Panel6: TPanel;
    Label2: TLabel;
    pnlButtons1: TPanel;
    pnlWriteReview: TPanel;
    redReview: TRichEdit;
    Label3: TLabel;
    Panel10: TPanel;
    Panel9: TPanel;
    pnlConfirmReview: TPanel;
    bitWriteReview: TBitBtn;
    bitDeleteReview: TBitBtn;
    bitConfirmReview: TBitBtn;
    lblMaxCharacters: TLabel;
    pnlButtons2: TPanel;
    Panel8: TPanel;
    Label4: TLabel;
    Panel11: TPanel;
    lblLength: TLabel;
    lblFee: TLabel;
    redFee: TRichEdit;
    Panel7: TPanel;
    bitCalculateFee: TBitBtn;
    spnWeeks: TSpinEdit;
    lblRatingVisual: TLabel;
    lblRating: TLabel;
    pnlUniTooltip: TPanel;
    Panel14: TPanel;
    Panel15: TPanel;
    Panel16: TPanel;
    imgUniTooltip: TImage;
    Panel17: TPanel;
    lblProvince: TLabel;
    lblPublic: TLabel;
    Panel18: TPanel;
    Panel19: TPanel;
    lblUniversity: TLabel;
    cmbSort: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnBackClick(Sender: TObject);
    procedure redReviewChange(Sender: TObject);
    procedure bitWriteReviewClick(Sender: TObject);
    procedure bitDeleteReviewClick(Sender: TObject);
    procedure bitConfirmReviewClick(Sender: TObject);
    procedure bitCalculateFeeClick(Sender: TObject);
    procedure lblUniversityMouseEnter(Sender: TObject);
    procedure lblUniversityMouseLeave(Sender: TObject);
    procedure lblUniversityClick(Sender: TObject);
    procedure lblUniversityMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure tmrUniTooltipTimer(Sender: TObject);
    procedure cmbSortChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    objFormatCalculations: TFormatCalculation;
    objReviews: TReviews;
    iCourseReviewID, iArrayLength: Integer;
    rRating: real;
    sCourseRating: string;
  public
    { Public declarations }
  end;

var
  frmCourseInfo: TfrmCourseInfo;

implementation

uses
  frmCourseBrowser_U, frmUniversityInfo_U, frmUniversityBrowser_U, frmLogin_U,
  frmProfile_U, frmCustomise_U;

{$R *.dfm}

procedure TfrmCourseInfo.bitCalculateFeeClick(Sender: TObject);
var
  rWeeks: real;
begin
  rWeeks := spnWeeks.Value;
  redFee.Text := FloatToStrF(objFormatCalculations.CalculateFee(rWeeks, lblFee),
    ffCurrency, 8, 2);
end;

procedure TfrmCourseInfo.bitConfirmReviewClick(Sender: TObject);
var
  dCurrentDate: TDateTime;
  sMessage: string;
begin
  with dbmPAT2022 do
  begin

    dCurrentDate := now;
    tblCourseReviews.Open;
    tblCourseReviews.Sort := 'CReviewID ASC';

    tblCourseReviews.Last;
    iCourseReviewID := tblCourseReviews['CReviewID'];
    inc(iCourseReviewID);

    if bitWriteReview.Caption = 'Write a Review' then
    begin
      tblCourseReviews.Insert;
      tblCourseReviews.Append;
      sMessage := 'Review Posted!';
    end
    else if bitWriteReview.Caption = 'Edit Review' then
    begin
      tblCourseReviews.Edit;
      sMessage := 'Review Edited!';
    end;

    tblCourseReviews['CReviewID'] := iCourseReviewID;
    tblCourseReviews['Review'] := redReview.Text;
    tblCourseReviews['StudentID'] := iStudentID;
    tblCourseReviews['CourseID'] := iCourseID;
    tblCourseReviews['Rating'] := StrToInt(sCourseRating);
    tblCourseReviews['ReviewDate'] := DateToStr(dCurrentDate);
    tblCourseReviews.Post;
    tblCourseReviews.Refresh;

    ShowMessage('Review Posted!');

    // Reload here
    Panel8.Height := 497;

    objReviews := TReviews.Create(frmCourseInfo, Panel8, cmbSort,
      dbmPAT2022.tblCourseReviews, iCourseID);
    objReviews.CreateReviews;
    lblRating.Caption := objReviews.GetRating;

    Label4.Caption := 'Course''s Reviews: ' + ' (' +
      IntToStr(objReviews.CountReviewAmount) + ')';

    // Updating rating visual

    rRating := Round(StrToFloat(lblRating.Caption));

    if rRating = 1 then
    begin
      lblRatingVisual.Caption := '*';
    end
    else if rRating = 2 then
    begin
      lblRatingVisual.Caption := '**';
    end
    else if rRating = 3 then
    begin
      lblRatingVisual.Caption := '***';
    end
    else if rRating = 4 then
    begin
      lblRatingVisual.Caption := '****';
    end
    else if rRating = 5 then
    begin
      lblRatingVisual.Caption := '*****';
    end;

    lblRating.Caption := 'Rating: ' + lblRating.Caption;

    pnlButtons2.Visible := false;
    pnlWriteReview.Visible := false;
    bitWriteReview.Kind := bkRetry;
    bitWriteReview.Caption := 'Edit Review';
    bitWriteReview.Enabled := true;
    bitDeleteReview.Enabled := true;

  end;
end;

procedure TfrmCourseInfo.bitDeleteReviewClick(Sender: TObject);
var
  iYesOrNo: Integer;
begin
  with dbmPAT2022 do
  begin
    tblCourseReviews.Open;
    tblCourseReviews.First;
    iYesOrNo := MessageDlg('Are you sure you want to delete your review?',
      mtConfirmation, [mbYes, mbNo], 0, mbYes);

    if iYesOrNo = mrYes then
    begin

      while not(tblCourseReviews.Eof) do
      begin
        if (tblCourseReviews['StudentID'] = iStudentID) AND
          (tblCourseReviews['CourseID'] = iCourseID) then
        begin
          tblCourseReviews.Delete;
          tblCourseReviews.Refresh;
          break;
        end;
        tblCourseReviews.Next;
      end;

      bitWriteReview.Kind := bkAll;
      bitWriteReview.Caption := 'Write a Review';
      bitDeleteReview.Enabled := false;

      // Reloading reviews
      objReviews := TReviews.Create(frmCourseInfo, Panel8, cmbSort,
        dbmPAT2022.tblCourseReviews, iCourseID);
      objReviews.CreateReviews;
      lblRating.Caption := objReviews.GetRating;

      Label4.Caption := 'Course''s Reviews: ' + '(' +
        IntToStr(objReviews.CountReviewAmount) + ')';

      // Reloading visual

      rRating := Round(StrToFloat(lblRating.Caption));

      if rRating = 1 then
      begin
        lblRatingVisual.Caption := '*';
      end
      else if rRating = 2 then
      begin
        lblRatingVisual.Caption := '**';
      end
      else if rRating = 3 then
      begin
        lblRatingVisual.Caption := '***';
      end
      else if rRating = 4 then
      begin
        lblRatingVisual.Caption := '****';
      end
      else if rRating = 5 then
      begin
        lblRatingVisual.Caption := '*****';
      end;

      lblRating.Caption := 'Rating: ' + lblRating.Caption;

      ShowMessage('Review deleted!');
    end
    else if iYesOrNo = mrNo then
    begin
      bitWriteReview.Enabled := false;
      bitDeleteReview.Enabled := true;
    end;
  end;

end;

procedure TfrmCourseInfo.bitWriteReviewClick(Sender: TObject);
begin
  if bitWriteReview.Caption = 'Write a Review' then
  begin
    redReview.Clear;
    sCourseRating := InputBox('Student rating of the course',
      'Enter a number from 1 to 5', '');
    if (sCourseRating = '1') or (sCourseRating = '2') or (sCourseRating = '3')
      or (sCourseRating = '4') or (sCourseRating = '5') then
    begin
      pnlWriteReview.Visible := true;
      pnlButtons1.Visible := true;
      pnlButtons2.Visible := true;
      pnlConfirmReview.Visible := true;

      bitWriteReview.Enabled := false;
      bitConfirmReview.Visible := true;
      Panel8.Height := 265;
    end
    else if sCourseRating = '' then
    begin
      exit;
    end
    else
    begin
      ShowMessage('Value doesn''t fall from ''1 to 5''');
      exit;
    end;
  end
  else if bitWriteReview.Caption = 'Edit Review' then
  begin
    redReview.Clear;
    sCourseRating := InputBox('Student rating of the course',
      'Enter a number from 1 to 5', '');
    if (sCourseRating = '1') or (sCourseRating = '2') or (sCourseRating = '3')
      or (sCourseRating = '4') or (sCourseRating = '5') then
    begin
      // Copying review to redReview

      redReview.Clear;
      with dbmPAT2022 do
      begin
        tblCourseReviews.First;
        while NOT(tblCourseReviews.Eof) do
        begin
          if iStudentID = tblCourseReviews['StudentID'] then
          begin
            redReview.Text := tblCourseReviews['Review'];
            break;
          end;
          tblCourseReviews.Next;
        end;
      end;

      // Button Stuff

      pnlWriteReview.Visible := true;
      pnlButtons1.Visible := true;
      pnlButtons2.Visible := true;
      pnlConfirmReview.Visible := true;

      bitWriteReview.Enabled := false;
      bitConfirmReview.Visible := true;
      Panel8.Height := 265;
    end
    else if sCourseRating = '' then
    begin
      exit;
    end
    else
    begin
      ShowMessage('Value doesn''t fall from ''1 to 5''');
      exit;
    end;
  end;

end;

procedure TfrmCourseInfo.btnBackClick(Sender: TObject);
begin
  frmCourseInfo.Hide;
  frmCourseBrowser.Show;

end;

procedure TfrmCourseInfo.btnCloseClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmCourseInfo.cmbSortChange(Sender: TObject);
begin
  objReviews := TReviews.Create(frmCourseInfo, Panel8, cmbSort,
    dbmPAT2022.tblCourseReviews, iCourseID);
  objReviews.CreateReviews;
  lblRating.Caption := objReviews.GetRating;

  Label4.Caption := 'Course''s Reviews: ' + '(' +
    IntToStr(objReviews.CountReviewAmount) + ')';
end;

procedure TfrmCourseInfo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Application.Terminate;
end;

procedure TfrmCourseInfo.FormCreate(Sender: TObject);
begin
  frmCourseInfo.Position := poScreenCenter;
  iCourseReviewID := 0;

  pnlButtons2.Visible := false;

  Panel8.Height := 497;
end;

procedure TfrmCourseInfo.FormShow(Sender: TObject);
var
  bFlag: boolean;
  I, iTopPanel: Integer;
  sReviewerName, sStudentPfp: string;
  rCount: real;
  rRatingTotal: real;
begin
  // Other

  bitWriteReview.Kind := bkAll;
  bitWriteReview.Caption := 'Write a Review';
  pnlWriteReview.Visible := false;
  pnlConfirmReview.Visible := false;

  // Function for creating the reviews
  cmbSort.ItemIndex := 0;

  // lblRating.Caption := objFormatCalculations.CreateReviews(Panel8,
  // frmCourseInfo, cmbSort);

  objReviews := TReviews.Create(frmCourseInfo, Panel8, cmbSort,
    dbmPAT2022.tblCourseReviews, iCourseID);
  objReviews.CreateReviews;
  lblRating.Caption := objReviews.GetRating;

  Label4.Caption := 'Course''s Reviews: ' + '(' +
    IntToStr(objReviews.CountReviewAmount) + ')';

  // Label4.Caption := 'Course''s Reviews: ' + ' (' +
  // IntToStr(objFormatCalculations.CountCourseReviewAmount) + ')';



  // Colour Scheme

  // Panels

  Panel1.color := Primary;
  Panel2.color := Secondary;
  Panel3.color := Primary;
  Panel4.color := Primary;
  Panel5.color := Secondary;
  Panel6.color := Primary;
  Panel7.color := Secondary;
  Panel8.color := Primary;
  Panel9.color := Secondary;
  Panel10.color := Secondary;
  Panel11.color := Primary;
  pnlButtons1.color := Primary;
  pnlButtons2.color := Primary;
  pnlConfirmReview.color := Secondary;
  pnlWriteReview.color := Primary;
  pnlUniTooltip.color := Primary;
  Panel14.color := Secondary;
  Panel15.color := Primary;
  Panel15.Font.color := Secondary;
  Panel16.color := Primary;
  Panel17.color := Primary;
  Panel18.color := Primary;
  Panel19.color := Primary;

  // Labels

  lblCourseTitle.Font.color := Secondary;
  lblMaxCharacters.Font.color := Secondary;
  lblLength.Font.color := Secondary;
  lblUniversity.Font.color := Secondary;
  lblRating.Font.color := Secondary;
  lblRatingVisual.Font.color := Secondary;
  lblFee.Font.color := Secondary;
  Label1.Font.color := Secondary;
  Label2.Font.color := Secondary;
  Label3.Font.color := Secondary;
  Label4.Font.color := Secondary;
  lblProvince.Font.color := Secondary;
  lblPublic.Font.color := Secondary;

  // Other colour stuff

  redDescription.color := PrimaryBrighter;
  redDescription.Font.color := Secondary;
  redReview.color := PrimaryBrighter;
  redReview.Font.color := Secondary;
  redFee.color := PrimaryBrighter;
  redFee.Font.color := Secondary;

  spnWeeks.color := PrimaryBrighter;
  spnWeeks.Font.color := Secondary;

  // Other

  spnWeeks.Value := 1;
  redFee.Clear;
  redReview.MaxLength := 240;
  bitWriteReview.Enabled := true;
  bitDeleteReview.Enabled := false;


  // Load all of the course's length, fee and image

  bFlag := true;

  with dbmPAT2022 do
  begin
    tblCourses.Open;
    tblCourses.First;
    while NOT(tblCourses.Eof) OR (bFlag = true) do
    begin
      if iCourseID = tblCourses['CourseID'] then
      begin
        lblCourseTitle.Caption := tblCourses['Course'];
        imgCourse.Picture.LoadFromFile(arrCoursePictures[iCourseID]);
        lblLength.Caption := tblCourses['CourseLength'];
        lblFee.Caption := 'R' + FloatToStrF(tblCourses['Fee'], ffFixed, 8, 2);
        bFlag := false;
      end;
      tblCourses.Next;
    end;
  end;

  // Description
  redDescription.Clear;
  redDescription.Text := objFormatCalculations.FindCourseDescription();

  // University, public/private and province
  imgUniTooltip.Proportional := true;
  imgUniTooltip.Center := true;

  lblUniversity.Caption := objFormatCalculations.FindCourseUni();

  with dbmPAT2022 do
  begin
    tblCourses.First;
    while NOT(tblCourses.Eof) do
    begin
      if tblCourses['CourseID'] = iCourseID then
      begin

        tblUniversities.First;
        while NOT(tblUniversities.Eof) do
        begin
          if tblUniversities['UniversityID'] = tblCourses['UniversityID'] then
          begin
            lblUniversity.Hint := tblUniversities['University'];
            lblProvince.Caption := tblUniversities['Province'];
            lblPublic.Caption := BoolToStr(tblUniversities['Public']);

            if lblPublic.Caption = '-1' then
            begin
              lblPublic.Caption := 'Public';
            end
            else
            begin
              lblPublic.Caption := 'Private';
            end;

            imgUniTooltip.Picture.LoadFromFile
              ('Uni' + IntToStr(tblUniversities['UniversityID']) + '.jpg');
          end;
          tblUniversities.Next;
        end;
      end;
      tblCourses.Next;
    end;
  end;

  // Rating Visual

  rRating := Round(StrToFloat(lblRating.Caption));

  if rRating = 1 then
  begin
    lblRatingVisual.Caption := '*';
  end
  else if rRating = 2 then
  begin
    lblRatingVisual.Caption := '**';
  end
  else if rRating = 3 then
  begin
    lblRatingVisual.Caption := '***';
  end
  else if rRating = 4 then
  begin
    lblRatingVisual.Caption := '****';
  end
  else if rRating = 5 then
  begin
    lblRatingVisual.Caption := '*****';
  end;

  lblRating.Caption := 'Rating: ' + lblRating.Caption;

  // Checking eligibility for deletion or creation of a review

  bFlag := true;
  with dbmPAT2022 do
  begin
    tblCourseReviews.First;
    while NOT(tblCourseReviews.Eof) do
    begin
      if tblCourseReviews['CourseID'] = iCourseID then
      begin
        if (tblCourseReviews['StudentID'] = iStudentID) then
        begin
          // bitWriteReview.Enabled := false;
          bitWriteReview.Kind := bkRetry;
          bitWriteReview.Caption := 'Edit Review';
          bitDeleteReview.Enabled := true;
          break;
        end;
      end;
      tblCourseReviews.Next;
    end;
  end;
  // Scary ^ DON'T TOUCH

  if iStudentID = 7 then
  begin
    bitWriteReview.Enabled := false;
    bitDeleteReview.Enabled := false;
  end;
end;

procedure TfrmCourseInfo.lblUniversityClick(Sender: TObject);
var
  bFlag: boolean;
begin
  bFlag := true;
  with dbmPAT2022 do
  begin
    tblUniversities.Open;
    tblUniversities.Sort := 'UniversityID ASC';
    tblUniversities.First;

    while NOT(tblUniversities.Eof) OR (bFlag = true) do
    begin
      if tblUniversities['University'] = lblUniversity.Caption then
      begin
        iUniversityID := tblUniversities['UniversityID'];
        sUniversityName := tblUniversities['University'];
        { frmCourseInfo.close;
          frmUniversityInfo.Show; }

        objFormatCalculations.FormHideShow(frmCourseInfo, frmUniversityInfo);
        bFlag := false;
      end;
      tblUniversities.Next;
    end;
  end;

end;

procedure TfrmCourseInfo.lblUniversityMouseEnter(Sender: TObject);
begin
  objFormatCalculations.MouseEnterLabel(lblUniversity);
end;

procedure TfrmCourseInfo.lblUniversityMouseLeave(Sender: TObject);
begin
  lblUniversity.Font.color := Secondary;
  lblUniversity.Font.Style := [fsBold];
end;

procedure TfrmCourseInfo.lblUniversityMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
var
  CursorPos: tPoint;
begin
  { CursorPos := Mouse.CursorPos;
    pnlUniTooltip.Top := (CursorPos.Y - 165);
    pnlUniTooltip.Left := (CursorPos.X - 400); }
end;

procedure TfrmCourseInfo.redReviewChange(Sender: TObject);
var
  iCharactersLeft: Integer;
begin
  iCharactersLeft := 240 - (length(redReview.Text));
  lblMaxCharacters.Caption := 'Characters Left: ' + IntToStr(iCharactersLeft);
end;

procedure TfrmCourseInfo.tmrUniTooltipTimer(Sender: TObject);
begin
  pnlUniTooltip.Visible := true;
end;

end.
