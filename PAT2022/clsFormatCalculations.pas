unit clsFormatCalculations;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.ComCtrls, Vcl.Buttons, DB, dbPAT2022;

type
  TFormatCalculation = class(TObject)
  private
    { private declarations }
  public
    procedure MouseEnterLabel(sample: TLabel);
    procedure MouseLeaveLabel(sample: TLabel);
    procedure MouseLeaveLabelUni(sample, selected: TLabel);
    procedure CourseBrowserInfo(course: TLabel);
    function FindCourseID(lblCourse: TLabel): integer;
    function FindCourseDescription(): string;
    function FindCourseLength(lblCourse: TLabel): string;
    function FindCourseFee(lblCourse: TLabel): real;
    function FindCourseUni(): string;
    function CalculateFee(rWeeks: real; lblFee: TLabel): real;
    procedure FormHideShow(frmHide, frmShow: TForm);
    procedure FormBack(); // Too basic, need more variables, maybe later
    function FindPrimary(var tFile: Textfile): TColor;
    function FindPrimaryBrighter(var tFile: Textfile): TColor;
    function FindSecondary(var tFile: Textfile): TColor;
    function FindSecondaryBrighter(var tFile: Textfile): TColor;
    function CountCourseReviewAmount(): integer;
    function CountUniReviewAmount(): integer;
    function CreateReviews(pnlParent: Tpanel; frmOwner: TForm;
      cmbSort: TComboBox): string;
    function CreateReviewsUni(pnlParent: Tpanel; frmOwner: TForm;
      cmbSort: TComboBox): string;
    procedure lblNameMouseEnter(Sender: TObject);
    procedure lblNameMouseLeave(Sender: TObject);
    procedure lblNameClick(Sender: TObject);
    procedure DeleteBtnClick(Sender: TObject);
    procedure DeleteBtnClickCourse(Sender: TObject);
    function AllowedEmailDatabase(sText: string): boolean;
    function AllowedIDDatabase(sText: string): boolean;
    function AllowedPhoneNoDatabase(sText: string): boolean;

  end;

var
  tBack: Textfile;
  frmPreviousShow, frmPreviousHide: TForm;
  iStudentIDTag: integer;
  redReview: TRichEdit;
  bitConfirm: TBitBtn;

implementation

uses frmCourseBrowser_U, frmUniversityBrowser_U, frmUniversityInfo_U,
  frmLogin_U, frmWelcome_U, frmCustomise_U, frmProfile_U;

{ TFormatCalculation }

function TFormatCalculation.CalculateFee(rWeeks: real; lblFee: TLabel): real;

var
  sFee: string;
begin
  sFee := copy(lblFee.Caption, 2);
  result := rWeeks * StrToFloat(sFee);
end;

function TFormatCalculation.CountCourseReviewAmount: integer;

var
  iCount: integer;
begin
  with dbmPAT2022 do
  begin
    tblCourseReviews.Open;
    tblCourseReviews.First;

    // Displaying all info for the courses
    iCount := 0;

    while NOT(tblCourseReviews.Eof) do
    begin
      if tblCourseReviews['CourseID'] = iCourseID then
      begin
        inc(iCount);
      end;
      tblCourseReviews.Next;
    end;
  end;
  result := iCount;
end;

function TFormatCalculation.CountUniReviewAmount: integer;

var
  iCount: integer;
begin
  with dbmPAT2022 do
  begin
    tblUniversityReviews.Open;
    tblUniversityReviews.First;

    // Dispalying all info for the courses
    iCount := 0;

    while NOT(tblUniversityReviews.Eof) do
    begin
      if tblUniversityReviews['UniversityID'] = iUniversityID then
      begin
        inc(iCount);
      end;
      tblUniversityReviews.Next;
    end;
  end;
  result := iCount;
end;

procedure TFormatCalculation.CourseBrowserInfo(course: TLabel);
begin
  with dbmPAT2022 do
  begin
    course.Caption := tblCourses['Course'];
    tblCourses.Next;
  end;
end;

function TFormatCalculation.CreateReviews(pnlParent: Tpanel; frmOwner: TForm;
  cmbSort: TComboBox): string;
var
  i, iTopPanel, iArrayLength: integer;
  sReviewerName, sStudentPfp: string;
  rCount, rRatingTotal, rRating: real;
  arrReviewPanels: array of Tpanel;
  arrNameLabel, arrRatingDateLabel: array of TLabel;
  arrPfp: array of TImage;
  arrCReview: array of TRichEdit;
  arrDeleteBtn: array of TBitBtn;
  ScrollBox: TScrollbox;
begin
  // Creating (dynamically) all the reviews

  // Creating scrollbox

  ScrollBox := TScrollbox.Create(frmOwner);
  with ScrollBox do
  begin
    Parent := pnlParent;
    ParentBackground := false;
    VertScrollBar.Position := 0;
    Left := 8;
    height := pnlParent.height - 42;
    Width := 409;
    Top := 34;
    color := PrimaryBrighter;
    BevelOuter := bvNone;
    BevelKind := bKNone;
    BevelInner := bvNone;
    VertScrollBar.Tracking := true;
    VertScrollBar.Smooth := true;
    BorderStyle := bsNone;
  end;

  // Creating Reviews

  // Dynamically creating the reviews (with actual clickable UI :O)

  with dbmPAT2022 do
  begin
    tblCourseReviews.Open;

    // Giving the arrays lengths (start at 0)

    iArrayLength := 0;
    iArrayLength := CountCourseReviewAmount;

    SetLength(arrReviewPanels, iArrayLength + 1);
    SetLength(arrNameLabel, iArrayLength + 1);
    SetLength(arrRatingDateLabel, iArrayLength + 1);
    SetLength(arrCReview, iArrayLength + 1);
    SetLength(arrDeleteBtn, iArrayLength + 1);
    SetLength(arrPfp, iArrayLength + 1);

    // Freeing

    for i := 0 to iArrayLength do
    begin
      arrPfp[i] := nil;
      arrDeleteBtn[i] := nil;
      arrNameLabel[i] := nil;
      arrRatingDateLabel[i] := nil;
      arrCReview[i] := nil;
      arrReviewPanels[i] := nil;

      arrPfp[i].Free;
      arrDeleteBtn[i].Free;
      arrNameLabel[i].Free;
      arrRatingDateLabel[i].Free;
      arrCReview[i].Free;
      arrReviewPanels[i].Free;
    end;
    // Displaying all info for the courses

    // Creating Part

    iTopPanel := 15;
    i := 0;

    tblCourseReviews.First;
    case cmbSort.ItemIndex of
      - 1:
        tblCourseReviews.Sort := 'ReviewDate DESC';
      0:
        tblCourseReviews.Sort := 'ReviewDate DESC';
      1:
        tblCourseReviews.Sort := 'ReviewDate ASC';
      2:
        tblCourseReviews.Sort := 'Rating DESC';
      3:
        tblCourseReviews.Sort := 'Rating ASC';
    end;
    while NOT(tblCourseReviews.Eof) do
    begin
      if tblCourseReviews['CourseID'] = iCourseID then
      begin
        inc(i);
        rCount := rCount + 1;
        rRatingTotal := rRatingTotal + tblCourseReviews['Rating'];

        arrReviewPanels[i] := Tpanel.Create(frmOwner);
        arrNameLabel[i] := TLabel.Create(frmOwner);
        arrRatingDateLabel[i] := TLabel.Create(frmOwner);
        arrCReview[i] := TRichEdit.Create(frmOwner);
        arrDeleteBtn[i] := TBitBtn.Create(frmOwner);
        arrPfp[i] := TImage.Create(frmOwner);

        // Review Panel

        with arrReviewPanels[i] do
        begin
          Parent := ScrollBox;
          ParentBackground := false;
          color := Primary;
          Tag := i;
          BevelOuter := bvNone;
          height := 110;
          Width := 376;
          Left := 8;
          Top := iTopPanel;
        end;
        inc(iTopPanel, 130);

        // Name and Surname

        tblStudents.First;
        while NOT(tblStudents.Eof) do
        begin
          if tblStudents['StudentID'] = tblCourseReviews['StudentID'] then
          begin
            sReviewerName := tblStudents['StudentName'] + ' ' + tblStudents
              ['Surname'];
            sStudentPfp := tblStudents['ProfilePicture'];
            iStudentIDTag := tblStudents['StudentID'];
            if iStudentID = tblStudents['StudentID'] then
            begin
              sReviewerName := sReviewerName + ' (You)';
            end;
          end;
          tblStudents.Next;
        end;

        with arrNameLabel[i] do
        begin
          Parent := arrReviewPanels[i];
          Font.color := Secondary;
          Font.Style := [fsBold, fsUnderline];
          AutoSize := true;
          Caption := sReviewerName;
          Tag := iStudentIDTag;
          Font.Size := 12;
          Left := 55;
          Top := 2;

          OnClick := lblNameClick;
          OnMouseEnter := lblNameMouseEnter;
          OnMouseLeave := lblNameMouseLeave;

        end;

        // Rating and Date

        with arrRatingDateLabel[i] do
        begin
          Parent := arrReviewPanels[i];
          Font.color := Secondary;
          Font.Style := [fsBold];
          AutoSize := true;
          Caption := DateToStr(tblCourseReviews['ReviewDate']) + ' | ' +
            IntToStr(tblCourseReviews['Rating']) + '/5';
          Tag := i;
          Font.Size := 12;
          Left := 55;
          Top := 23;
        end;

        // Review

        with arrCReview[i] do
        begin
          Parent := arrReviewPanels[i];
          readOnly := true;
          Text := tblCourseReviews['Review'];
          color := PrimaryBrighter;
          Font.color := Secondary;
          Font.Style := [fsBold];
          Font.Size := 10;
          BorderStyle := bsNone;
          WordWrap := true;
          EditMargins.Left := 3;
          EditMargins.right := 3;
          height := 54;
          Width := 360;
          Left := 8;
          Top := 47;
          Tag := tblCourseReviews['CReviewID'];
        end;

        // Delete Button

        if iStudentID = 7 then
        begin
          with arrDeleteBtn[i] do
          begin
            Parent := arrReviewPanels[i];
            height := 36;
            Width := 120;
            Left := 250;
            Top := 6;
            Kind := bkCancel;
            Font.Size := 10;
            Caption := 'Delete Review';
            Tag := tblCourseReviews['CReviewID'];

            OnClick := DeleteBtnClickCourse;
          end;
        end;

        // Pfp

        with arrPfp[i] do
        begin
          Parent := arrReviewPanels[i];
          Proportional := true;
          Center := true;
          Picture.LoadFromFile(sStudentPfp);
          Left := 5;
          Top := 7;
          Width := 50;
          height := 35;
        end;
      end;
      tblCourseReviews.Next;
    end;
    result := FloatToStrF(rRatingTotal / rCount, ffFixed, 8, 1);
  end;

  ScrollBox.VertScrollBar.Range := iTopPanel + 30;
end;

function TFormatCalculation.CreateReviewsUni(pnlParent: Tpanel; frmOwner: TForm;
  cmbSort: TComboBox): string;
var
  i, iTopPanel, iArrayLength: integer;
  sReviewerName, sStudentPfp: string;
  rCount, rRatingTotal, rRating: real;
  arrReviewPanels: array of Tpanel;
  arrNameLabel: array of TLabel;
  arrRatingDateLabel: array of TLabel;
  arrPfp: array of TImage;
  arrUReview: array of TRichEdit;
  arrDeleteBtn: array of TBitBtn;
  ScrollBox: TScrollbox;
begin



  // Creating (dynamically) all the reviews

  // Creating scrollbox
  ScrollBox := TScrollbox.Create(frmOwner);
  with ScrollBox do
  begin
    Parent := pnlParent;
    ParentBackground := false;
    VertScrollBar.Position := 0;
    Left := 8;
    height := pnlParent.height - 42;
    Width := 409;
    Top := 34;
    color := PrimaryBrighter;
    BevelOuter := bvNone;
    BevelKind := bKNone;
    BevelInner := bvNone;
    VertScrollBar.Tracking := true;
    VertScrollBar.Smooth := true;
    BorderStyle := bsNone;
  end;

  // Creating Reviews

  // Dynamically creating the reviews (with actual clickable UI :O)

  with dbmPAT2022 do
  begin
    tblUniversityReviews.Open;

    // Giving the arrays lengths (start at 0)

    iArrayLength := 0;
    iArrayLength := CountUniReviewAmount;

    SetLength(arrReviewPanels, iArrayLength + 1);
    SetLength(arrNameLabel, iArrayLength + 1);
    SetLength(arrRatingDateLabel, iArrayLength + 1);
    SetLength(arrUReview, iArrayLength + 1);
    SetLength(arrDeleteBtn, iArrayLength + 1);
    SetLength(arrPfp, iArrayLength + 1);

    // Freeing

    for i := 0 to iArrayLength do
    begin
      arrPfp[i] := nil;
      arrDeleteBtn[i] := nil;
      arrNameLabel[i] := nil;
      arrRatingDateLabel[i] := nil;
      arrUReview[i] := nil;
      arrReviewPanels[i] := nil;

      arrPfp[i].Free;
      arrDeleteBtn[i].Free;
      arrNameLabel[i].Free;
      arrRatingDateLabel[i].Free;
      arrUReview[i].Free;
      arrReviewPanels[i].Free;
    end;

    // Displaying all info for the courses

    // Creating Part

    iTopPanel := 15;
    i := 0;

    tblUniversityReviews.First;

    // Combo Box sorting stuff

    case cmbSort.ItemIndex of
      - 1:
        tblUniversityReviews.Sort := 'ReviewDate DESC';
      0:
        tblUniversityReviews.Sort := 'ReviewDate DESC';
      1:
        tblUniversityReviews.Sort := 'ReviewDate ASC';
      2:
        tblUniversityReviews.Sort := 'Rating DESC';
      3:
        tblUniversityReviews.Sort := 'Rating ASC';
    end;

    while NOT(tblUniversityReviews.Eof) do
    begin
      if tblUniversityReviews['UniversityID'] = iUniversityID then
      begin
        inc(i);
        rCount := rCount + 1;
        rRatingTotal := rRatingTotal + tblUniversityReviews['Rating'];

        arrReviewPanels[i] := Tpanel.Create(frmOwner);
        arrNameLabel[i] := TLabel.Create(frmOwner);
        arrRatingDateLabel[i] := TLabel.Create(frmOwner);
        arrUReview[i] := TRichEdit.Create(frmOwner);
        arrDeleteBtn[i] := TBitBtn.Create(frmOwner);
        arrPfp[i] := TImage.Create(frmOwner);

        // Review Panel

        with arrReviewPanels[i] do
        begin
          Parent := ScrollBox;
          ParentBackground := false;
          color := Primary;
          Tag := i;
          BevelOuter := bvNone;
          height := 110;
          Width := 376;
          Left := 8;
          Top := iTopPanel;
        end;
        inc(iTopPanel, 130);

        // Review

        with arrUReview[i] do
        begin
          Parent := arrReviewPanels[i];
          readOnly := true;
          Text := tblUniversityReviews['Review'];
          color := PrimaryBrighter;
          Font.color := Secondary;
          Font.Style := [fsBold];
          Font.Size := 10;
          BorderStyle := bsNone;
          WordWrap := true;
          EditMargins.Left := 3;
          EditMargins.right := 3;
          height := 54;
          Width := 360;
          Left := 8;
          Top := 47;
          Tag := tblUniversityReviews['UReviewID'];
        end;

        // Name and Surname

        tblStudents.First;
        while NOT(tblStudents.Eof) do
        begin
          if tblStudents['StudentID'] = tblUniversityReviews['StudentID'] then
          begin
            sReviewerName := tblStudents['StudentName'] + ' ' + tblStudents
              ['Surname'];
            sStudentPfp := tblStudents['ProfilePicture'];
            iStudentIDTag := tblStudents['StudentID'];
            if iStudentID = tblStudents['StudentID'] then
            begin
              sReviewerName := sReviewerName + ' (You)';
            end;
          end;
          tblStudents.Next;
        end;

        with arrNameLabel[i] do
        begin
          Parent := arrReviewPanels[i];
          Font.color := Secondary;
          Font.Style := [fsBold, fsUnderline];
          AutoSize := true;
          Caption := sReviewerName;
          Tag := iStudentIDTag;
          Font.Size := 12;
          Left := 55;
          Top := 2;

          OnClick := lblNameClick;
          OnMouseEnter := lblNameMouseEnter;
          OnMouseLeave := lblNameMouseLeave;
        end;

        // Rating and Date

        with arrRatingDateLabel[i] do
        begin
          Parent := arrReviewPanels[i];
          Font.color := Secondary;
          Font.Style := [fsBold];
          AutoSize := true;
          Caption := DateToStr(tblUniversityReviews['ReviewDate']) + ' | ' +
            IntToStr(tblUniversityReviews['Rating']) + '/5';
          Tag := i;
          Font.Size := 12;
          Left := 55;
          Top := 23;
        end;

        // Delete Button

        if iStudentID = 7 then
        begin
          with arrDeleteBtn[i] do
          begin
            Parent := arrReviewPanels[i];
            height := 36;
            Width := 120;
            Left := 250;
            Top := 6;
            Kind := bkCancel;
            Font.Size := 10;
            Caption := 'Delete Review';
            Tag := tblUniversityReviews['UReviewID'];

            OnClick := DeleteBtnClick;
          end;
        end;

        // Pfp

        with arrPfp[i] do
        begin
          Parent := arrReviewPanels[i];
          Proportional := true;
          Center := true;
          Picture.LoadFromFile(sStudentPfp);
          Left := 5;
          Top := 7;
          Width := 50;
          height := 35;
        end;
      end;
      tblUniversityReviews.Next;
    end;
    result := FloatToStrF(rRatingTotal / rCount, ffFixed, 8, 1);
  end;

  ScrollBox.VertScrollBar.Range := iTopPanel + 30;
end;

procedure TFormatCalculation.DeleteBtnClick(Sender: TObject);
begin
  with dbmPAT2022 do
  begin
    tblUniversityReviews.First;

    while NOT(tblUniversityReviews.Eof) do
    begin
      if (Sender AS TBitBtn).Tag = tblUniversityReviews['UReviewID'] then
      begin
        tblUniversityReviews.Delete;
        tblUniversityReviews.Refresh;

        ShowMessage('Review Deleted! Refresh form to see changes.');
        break;
      end;
      tblUniversityReviews.Next;
    end;
  end;
end;

procedure TFormatCalculation.DeleteBtnClickCourse(Sender: TObject);
begin
  with dbmPAT2022 do
  begin
    tblCourseReviews.First;

    while NOT(tblCourseReviews.Eof) do
    begin
      if (Sender AS TBitBtn).Tag = tblCourseReviews['CReviewID'] then
      begin
        tblCourseReviews.Delete;
        tblCourseReviews.Refresh;

        ShowMessage('Review Deleted! Refresh form to see changes.');
        break;
      end;
      tblCourseReviews.Next;
    end;
  end;
end;

function TFormatCalculation.FindCourseDescription(): string;
var
  tCourseDescriptions: Textfile;
  sCourseID, sLine: string;
  iPos: integer;
  bFlag: boolean;
begin
  if FileExists('CourseDescriptions.txt') then
  begin
    assignfile(tCourseDescriptions, 'CourseDescriptions.txt');
    Reset(tCourseDescriptions);
    while NOT(Eof(tCourseDescriptions)) do
    begin
      readln(tCourseDescriptions, sLine);
      iPos := pos('|', sLine);
      sCourseID := copy(sLine, 1, iPos - 1);
      if sCourseID = IntToStr(iCourseID) then
      begin

        Delete(sLine, 1, iPos);
        iPos := pos('/', sLine);
        result := copy(sLine, 1, iPos - 1);
        break;
      end;

    end;
    closeFile(tCourseDescriptions);
  end
  else
  begin
    ShowMessage
      ('"CourseDescriptions.txt" file for a course''s info is missing.');
    closeFile(tCourseDescriptions);
    exit;
  end;
end;

function TFormatCalculation.FindCourseFee(lblCourse: TLabel): real;

var
  bFlag: boolean;
begin
  // Finding CourseID
  bFlag := true;

  with dbmPAT2022 do
  begin
    tblCourses.First;
    while NOT(tblCourses.Eof) OR (bFlag = true) do
    begin
      if (tblCourses['CourseID']) = StrToInt(copy(lblCourse.Name, 10)) then
      begin
        result := tblCourses['Fee'];
        bFlag := false;
      end;
      tblCourses.Next;
    end;
  end;

end;

function TFormatCalculation.FindCourseID(lblCourse: TLabel): integer;
begin
  with dbmPAT2022 do
  begin
    tblCourses.First;
    while NOT(tblCourses.Eof) do
    begin
      if (tblCourses['CourseID']) = lblCourse.Tag then
      begin
        result := tblCourses['CourseID'];
        break;
      end;
      tblCourses.Next;
    end;
  end;
end;

function TFormatCalculation.FindCourseLength(lblCourse: TLabel): string;

var
  bFlag: boolean;
begin
  // Finding length
  bFlag := true;

  with dbmPAT2022 do
  begin
    tblCourses.First;
    while NOT(tblCourses.Eof) OR (bFlag = true) do
    begin
      if (tblCourses['CourseID']) = lblCourse.Tag then
      begin
        result := tblCourses['CourseLength'];
        bFlag := false;
      end;
      tblCourses.Next;
    end;
  end;
end;

function TFormatCalculation.FindCourseUni: string;
begin
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
            result := tblUniversities['University'];
          end;
          tblUniversities.Next;
        end;
      end;
      tblCourses.Next;
    end;
  end;
end;

function TFormatCalculation.FindPrimary(var tFile: Textfile): TColor;

var
  sPrimary, sLine, sP: string;
  iPos: integer;
begin

  // Primary

  Reset(tFile);
  while NOT(Eof(tFile)) do
  begin
    readln(tFile, sLine);
    iPos := pos('|', sLine);
    sP := (copy(sLine, 1, iPos - 1));
    if sP = '1' then
    begin
      Delete(sLine, 1, iPos);
      iPos := pos('/', sLine);
      sPrimary := (copy(sLine, 1, iPos - 1));
      result := StringToColor(sPrimary);
      break;
    end;
  end;
end;

function TFormatCalculation.FindPrimaryBrighter(var tFile: Textfile): TColor;

var
  sPrimaryBrighter, sPB, sLine: string;
  iPos: integer;
begin

  // Primary Brighter

  Reset(tFile);
  while NOT(Eof(tFile)) do
  begin
    readln(tFile, sLine);
    iPos := pos('|', sLine);
    sPB := (copy(sLine, 1, iPos - 1));
    if sPB = '2' then
    begin
      Delete(sLine, 1, iPos);
      iPos := pos('/', sLine);
      sPrimaryBrighter := (copy(sLine, 1, iPos - 1));
      result := StringToColor(sPrimaryBrighter);
      break;
    end;
  end;
end;

function TFormatCalculation.FindSecondary(var tFile: Textfile): TColor;

var
  sLine, sSecondary, sS: string;
  iPos: integer;
begin

  // Secondary

  Reset(tFile);
  while NOT(Eof(tFile)) do
  begin
    readln(tFile, sLine);
    iPos := pos('|', sLine);
    sS := (copy(sLine, 1, iPos - 1));
    if sS = '3' then
    begin
      Delete(sLine, 1, iPos);
      iPos := pos('/', sLine);
      sSecondary := (copy(sLine, 1, iPos - 1));
      result := StringToColor(sSecondary);
      break;
    end;
  end;
end;

function TFormatCalculation.FindSecondaryBrighter(var tFile: Textfile): TColor;

var
  sLine, sSecondaryBrighter, sSB: string;
  iPos: integer;
begin

  // Secondary Brighter
  Reset(tFile);
  while NOT(Eof(tFile)) do
  begin
    readln(tFile, sLine);
    iPos := pos('|', sLine);
    sSB := (copy(sLine, 1, iPos - 1));
    if sSB = '4' then
    begin
      Delete(sLine, 1, iPos);
      iPos := pos('/', sLine);
      sSecondaryBrighter := (copy(sLine, 1, iPos - 1));
      result := StringToColor(sSecondaryBrighter);
      break;
    end;
  end;
end;

procedure TFormatCalculation.FormBack;
begin
  frmPreviousShow.close;
  frmPreviousHide.Show;
end;

procedure TFormatCalculation.FormHideShow(frmHide, frmShow: TForm);
begin
  frmHide.Hide;
  frmShow.Show;

  frmPreviousHide := frmHide;
  frmPreviousShow := frmShow;
end;

function TFormatCalculation.AllowedEmailDatabase(sText: string): boolean;
begin
  // Email database

  with dbmPAT2022 do
  begin
    tblStudents.Open;
    tblStudents.Sort := 'StudentID ASC';
    tblStudents.First;
    while NOT(tblStudents.Eof) do
    begin
      if NOT(lowercase(sText) = lowercase(tblStudents['Email'])) then
      begin
        // isn't in database (allowed to use that info)
        result := true;
      end
      else
      begin
        // is in database (not allowed to use that info)
        result := false;
        break;
      end;
      tblStudents.Next;
    end;
  end;
end;

function TFormatCalculation.AllowedIDDatabase(sText: string): boolean;
begin
  // ID database

  with dbmPAT2022 do
  begin
    tblStudents.Open;
    tblStudents.Sort := 'StudentID ASC';
    tblStudents.First;
    while NOT(tblStudents.Eof) do
    begin
      if NOT((sText) = (tblStudents['ID'])) then
      begin
        // isn't in database (allowed to use that info)
        result := true;
      end
      else
      begin
        // is in database (not allowed to use that info)
        result := false;
        break;
      end;
      tblStudents.Next;
    end;
  end;
end;

function TFormatCalculation.AllowedPhoneNoDatabase(sText: string): boolean;
begin
  // Phone Number database

  with dbmPAT2022 do
  begin
    tblStudents.Open;
    tblStudents.Sort := 'StudentID ASC';
    tblStudents.First;
    while NOT(tblStudents.Eof) do
    begin
      if NOT((sText) = (tblStudents['PhoneNumber'])) then
      begin
        // isn't in database (allowed to use that info)
        result := true;
      end
      else
      begin
        // is in database (not allowed to use that info)
        result := false;
        break;
      end;
      tblStudents.Next;
    end;
  end;
end;

procedure TFormatCalculation.lblNameClick(Sender: TObject);
begin
  // Displays clicked on user profile

  iStudentProfileID := (Sender AS TLabel).Tag;
  frmProfile.Show;
end;

procedure TFormatCalculation.lblNameMouseEnter(Sender: TObject);
begin
  MouseEnterLabel(Sender AS TLabel);
end;

procedure TFormatCalculation.lblNameMouseLeave(Sender: TObject);
begin
  MouseLeaveLabel(Sender AS TLabel);
end;

procedure TFormatCalculation.MouseEnterLabel(sample: TLabel);
begin
  sample.Font.color := SecondaryBrighter;
  sample.Font.Style := [fsBold, fsUnderline];
  sample.Cursor := crHandPoint;
end;

procedure TFormatCalculation.MouseLeaveLabel(sample: TLabel);
begin
  sample.Font.color := Secondary;
end;

procedure TFormatCalculation.MouseLeaveLabelUni(sample, selected: TLabel);
begin
  sample.Font.color := Secondary;
  sample.Font.Style := [fsBold];

  if sample.Caption = selected.Caption then
  begin
    sample.Font.Style := [fsBold, fsUnderline];
  end
  else
  begin
    sample.Font.Style := [fsBold];
  end;
end;

end.
