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
    function FindPrimary(var tFile: Textfile): TColor;
    function FindPrimaryBrighter(var tFile: Textfile): TColor;
    function FindSecondary(var tFile: Textfile): TColor;
    function FindSecondaryBrighter(var tFile: Textfile): TColor;
    procedure DeleteBtnClick(Sender: TObject);
    procedure DeleteBtnClickCourse(Sender: TObject);
    function AllowedEmailDatabase(sText: string): boolean;
    function AllowedIDDatabase(sText: string): boolean;
    function AllowedPhoneNoDatabase(sText: string): boolean;
  end;

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

procedure TFormatCalculation.CourseBrowserInfo(course: TLabel);
begin
  with dbmPAT2022 do
  begin
    course.Caption := tblCourses['Course'];
    tblCourses.Next;
  end;
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
begin
  // Finding CourseID

  with dbmPAT2022 do
  begin
    tblCourses.First;
    while NOT(tblCourses.Eof) do
    begin
      if (tblCourses['CourseID']) = StrToInt(copy(lblCourse.Name, 10)) then
      begin
        result := tblCourses['Fee'];
        break;
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
