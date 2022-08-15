unit clsReviews;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.ComCtrls, Vcl.Buttons, DB, ADODB, dbPAT2022, clsFormatCalculations, JPEG;

type
  TReviews = class(TObject)
  private
    fOwner: TForm;
    fParent: TPanel;
    fSort: TComboBox;
    fTADOTable: TADOTable;
    fReviewID: integer;
    fRating: real;
    fFieldID, fID: string;
    objFormatCalculations: TFormatCalculation;
  public
    constructor Create(frmOwner: TForm; pnlParent: TPanel; cmbSort: TComboBox;
      tblTADOTable: TADOTable; iReviewID: integer);
    function CountReviewAmount: integer;
    procedure CreateReviews;
    function GetRating: string;
    procedure lblNameClick(Sender: TObject);
    procedure lblNameMouseEnter(Sender: TObject);
    procedure lblNameMouseLeave(Sender: TObject);
    procedure DeleteBtnClick(Sender: TObject);
  end;

implementation

uses
  frmCustomise_U, frmLogin_U, frmProfile_U;

{ TReviews }

function TReviews.CountReviewAmount: integer;
var
  iCount: integer;
begin
  with dbmPAT2022 do
  begin
    fTADOTable.Open;
    fTADOTable.First;

    // Counting Reviews
    iCount := 0;

    while NOT(fTADOTable.Eof) do
    begin
      if fTADOTable[fFieldID] = fReviewID then
      begin
        inc(iCount);
      end;
      fTADOTable.Next;
    end;
  end;
  result := iCount;
end;

constructor TReviews.Create(frmOwner: TForm; pnlParent: TPanel;
  cmbSort: TComboBox; tblTADOTable: TADOTable; iReviewID: integer);
begin
  fOwner := frmOwner;
  fParent := pnlParent;
  fSort := cmbSort;
  fTADOTable := tblTADOTable;
  fReviewID := iReviewID;

  with dbmPAT2022 do
  begin
    if fTADOTable = tblCourseReviews then
    // for table string requirements, reduces using an extra procedure
    begin
      fFieldID := 'CourseID';
      fID := 'CReviewID';
    end
    else if fTADOTable = tblUniversityReviews then
    begin
      fFieldID := 'UniversityID';
      fID := 'UReviewID';
    end
    else
    begin
      ShowMessage('Not acceptable table for this operation.');
      exit;
    end;
  end;

end;

procedure TReviews.CreateReviews;
var
  i, iTopPanel, iArrayLength, iStudentIDTag: integer;
  sReviewerName, sStudentPfp: string;
  rCount, rRatingTotal, rRating: real;
  arrReviewPanels: array of TPanel;
  arrNameLabel, arrRatingDateLabel: array of TLabel;
  arrPfp: array of TImage;
  arrReview: array of TRichEdit;
  arrDeleteBtn: array of TBitBtn;
  ScrollBox: TScrollbox;
  lblError: TLabel;
  imgConnor: TImage;
begin
  // Creating (dynamically) all the reviews

  // Creating scrollbox

  ScrollBox := TScrollbox.Create(fOwner);
  with ScrollBox do
  begin
    Parent := fParent;
    ParentBackground := false;
    VertScrollBar.Position := 0;
    Left := 8;
    height := fParent.height - 42;
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

  if CountReviewAmount < 1 then
  begin
    imgConnor := TImage.Create(fOwner);
    with imgConnor do
    begin
      Parent := ScrollBox;
      Proportional := true;
      Center := true;
      Picture.LoadFromFile('conconsad.jpg');
      height := ScrollBox.height;
      Width := ScrollBox.Width;
    end;

    lblError := TLabel.Create(fOwner);
    with lblError do
    begin
      Parent := ScrollBox;
      Alignment := taCenter;
      color := PrimaryBrighter;
      Font.color := Secondary;
      AutoSize := true;
      Left := 20;
      Top := (ScrollBox.height div 2) - 20;
      Font.Size := 12;
      Font.Style := [fsBold];
      color := Primary;
      Transparent := false;
      Caption := 'No reviews to load :( Be the first to post one!';
    end;
  end;
  // Creating Reviews

  // Dynamically creating the reviews (with actual clickable UI :O, no richedit only :O!!)
  if CountReviewAmount >= 1 then
  begin
    with dbmPAT2022 do
    begin
      fTADOTable.Open;

      // Giving the arrays lengths (start at 0)

      iArrayLength := 0;
      iArrayLength := CountReviewAmount; // getting review amount

      SetLength(arrReviewPanels, iArrayLength + 1);
      SetLength(arrNameLabel, iArrayLength + 1);
      SetLength(arrRatingDateLabel, iArrayLength + 1);
      SetLength(arrReview, iArrayLength + 1);
      SetLength(arrDeleteBtn, iArrayLength + 1);
      SetLength(arrPfp, iArrayLength + 1);

      // Freeing

      for i := 0 to iArrayLength do
      begin
        arrPfp[i].Free;
        arrDeleteBtn[i].Free;
        arrNameLabel[i].Free;
        arrRatingDateLabel[i].Free;
        arrReview[i].Free;
        arrReviewPanels[i].Free;
      end;
      // Displaying all info for the courses

      // Creating Part

      iTopPanel := 15;
      i := 0;
      iStudentIDTag := 0;

      fTADOTable.First;
      case fSort.ItemIndex of
        - 1:
          fTADOTable.Sort := 'ReviewDate DESC';
        0:
          fTADOTable.Sort := 'ReviewDate DESC';
        1:
          fTADOTable.Sort := 'ReviewDate ASC';
        2:
          fTADOTable.Sort := 'Rating DESC';
        3:
          fTADOTable.Sort := 'Rating ASC';
      end;

      while NOT(fTADOTable.Eof) do
      begin
        if fTADOTable[fFieldID] = fReviewID then
        begin
          inc(i);
          rCount := rCount + 1;
          rRatingTotal := rRatingTotal + fTADOTable['Rating'];

          arrReviewPanels[i] := TPanel.Create(fOwner);
          arrNameLabel[i] := TLabel.Create(fOwner);
          arrRatingDateLabel[i] := TLabel.Create(fOwner);
          arrReview[i] := TRichEdit.Create(fOwner);
          arrDeleteBtn[i] := TBitBtn.Create(fOwner);
          arrPfp[i] := TImage.Create(fOwner);

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
            if tblStudents['StudentID'] = fTADOTable['StudentID'] then
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
            Caption := DateToStr(fTADOTable['ReviewDate']) + ' | ' +
              IntToStr(fTADOTable['Rating']) + '/5';
            Tag := i;
            Font.Size := 12;
            Left := 55;
            Top := 23;
          end;

          // Review

          with arrReview[i] do
          begin
            Parent := arrReviewPanels[i];
            ReadOnly := true;
            Text := fTADOTable['Review'];
            ScrollBars := ssVertical;
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
              Tag := fTADOTable[fID];

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
        fTADOTable.Next;
      end;
    end;
    fRating := rRatingTotal / rCount;

    ScrollBox.VertScrollBar.Range := iTopPanel + 30;
  end;
end;

procedure TReviews.DeleteBtnClick(Sender: TObject);
var
  iYesOrNo: integer;
begin
  iYesOrNo := MessageDlg('Are you sure you want to delete this review?',
    mtConfirmation, [mbYes, mbNo], 0, mbYes);

  if iYesOrNo = mrYes then
  begin
    with dbmPAT2022 do
    begin
      fTADOTable.First;

      while NOT(fTADOTable.Eof) do
      begin
        if (Sender AS TBitBtn).Tag = fTADOTable[fID] then
        begin
          fTADOTable.Delete;
          fTADOTable.Refresh;

          ShowMessage('Review Deleted! Refresh form to see changes.');
          break;
        end;
        fTADOTable.Next;
      end;
    end;
  end
  else
  begin
    exit;
  end;

end;

function TReviews.GetRating: string;
begin
  result := FloatToStrf(fRating, ffFixed, 8, 1);
end;

procedure TReviews.lblNameClick(Sender: TObject);
begin
  // Displays clicked on user profile
  iStudentProfileID := (Sender AS TLabel).Tag;
  frmProfile.Show;
end;

procedure TReviews.lblNameMouseEnter(Sender: TObject);
begin
  // highlighting text
  objFormatCalculations.MouseEnterLabel(Sender AS TLabel);
end;

procedure TReviews.lblNameMouseLeave(Sender: TObject);
begin
  objFormatCalculations.MouseLeaveLabel(Sender AS TLabel);
end;

end.
