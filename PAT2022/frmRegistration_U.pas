unit frmRegistration_U;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, clsRegistration, DB,
  dbPAT2022, Vcl.StdCtrls, Vcl.Buttons, Vcl.ComCtrls;

type
  TfrmRegistration = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    btnBack: TButton;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    lstInfo: TListBox;
    Panel7: TPanel;
    bitConfirm: TBitBtn;
    Panel8: TPanel;
    Label1: TLabel;
    redBalance: TRichEdit;
    Panel9: TPanel;
    Label2: TLabel;
    redReceipt: TRichEdit;
    bitBack: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnBackClick(Sender: TObject);
    procedure lstInfoClick(Sender: TObject);
    procedure bitConfirmClick(Sender: TObject);
    procedure bitBackClick(Sender: TObject);
    procedure ReloadForm();
    function ToString(): String;
  private
    { Private declarations }
    objRegistration: TRegistration;
    iConUniversityID, iConCourseID, iConStudentID, iCurrent: integer;
    rFee, rSpent: real;
  public
    { Public declarations }
  end;

var
  frmRegistration: TfrmRegistration;

implementation

uses
  frmCustomise_U, frmBrowserChooser_U, frmLogin_U;
{$R *.dfm}

procedure TfrmRegistration.bitBackClick(Sender: TObject);
begin
  ReloadForm;
end;

procedure TfrmRegistration.bitConfirmClick(Sender: TObject);
begin
  if NOT(lstInfo.ItemIndex = -1) then
  begin
    iConStudentID := iStudentID;
    if iCurrent = 1 then
    begin
      iConUniversityID := lstInfo.ItemIndex + 1;
      inc(iCurrent);
      Panel3.Caption := 'Choose Course... (2/2)';
      bitBack.Enabled := true;
      bitConfirm.Caption := 'Confirm';

      // Display Courses

      lstInfo.Items.Clear;
      with dbmPAT2022 do
      begin
        tblCourses.Open;
        tblCourses.First;
        while NOT(tblCourses.Eof) do
        begin
          lstInfo.Items.add(tblCourses['Course']);
          tblCourses.Next;
        end;
      end;
      ShowMessage
        ('University Registered! Pick a course and then you''re done!');
    end
    else if iCurrent = 2 then
    begin
      iConCourseID := lstInfo.ItemIndex + 1;
      objRegistration := TRegistration.Create(iConStudentID, iConCourseID,
        iConUniversityID, now, 10000);
      with objRegistration do
      begin
        SetBalance(objRegistration.GetBalance - rFee);
        redBalance.Text := FloatToStrF(GetBalance, ffCurrency, 8, 2);
      end;
      bitBack.Enabled := false;
      bitConfirm.Enabled := false;

      // To String
      redReceipt.Text := ToString;

      ShowMessage('Course Registered! Relevant info on the right.');
    end;
  end
  else
  begin
    if iCurrent = 1 then
    begin
      ShowMessage('Pick a university.');
    end
    else if iCurrent = 2 then
    begin
      ShowMessage('Pick a course.');
    end;
    exit;
  end;

end;

procedure TfrmRegistration.btnBackClick(Sender: TObject);
begin
  frmRegistration.Hide;
  frmBrowserChooser.Show;
end;

procedure TfrmRegistration.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Application.Terminate;
end;

procedure TfrmRegistration.FormCreate(Sender: TObject);
begin
  frmRegistration.Position := poScreenCenter;
end;

procedure TfrmRegistration.FormShow(Sender: TObject);
begin

  // Colour Scheme stuff
  Panel1.Color := Primary;
  Panel2.Color := Secondary;
  Panel3.Color := Primary;
  Panel3.Font.Color := Secondary;
  Panel4.Color := Secondary;
  Panel5.Color := Primary;
  Panel5.Font.Color := Secondary;
  Panel6.Color := Primary;
  Panel7.Color := Secondary;
  Panel8.Color := Primary;
  Panel9.Color := Primary;

  Label1.Font.Color := Secondary;
  Label2.Font.Color := Secondary;

  redBalance.Color := PrimaryBrighter;
  redReceipt.Color := PrimaryBrighter;
  redBalance.Font.Color := Secondary;
  redReceipt.Font.Color := Secondary;

  lstInfo.Color := PrimaryBrighter;
  lstInfo.Font.Color := Secondary;

  // Other
  ReloadForm;
end;

procedure TfrmRegistration.lstInfoClick(Sender: TObject);
begin
  // Getting Fee
  if iCurrent = 2 then
  begin
    with dbmPAT2022 do
    begin
      tblCourses.First;
      while NOT(tblCourses.Eof) do
      begin
        if (tblCourses['CourseID']) = lstInfo.ItemIndex + 1 then
        begin
          rFee := (tblCourses['Fee']);
          break;
        end;
        tblCourses.Next;
      end;
    end;
    lstInfo.Hint := lstInfo.Items[lstInfo.ItemIndex] + ' ' +
      FloatToStrF(rFee, ffCurrency, 8, 2);
  end
  else
  begin
    lstInfo.Hint := lstInfo.Items[lstInfo.ItemIndex]
  end;

  // Hint

end;

procedure TfrmRegistration.ReloadForm;
begin
  iConStudentID := 0;
  iConCourseID := 0;
  iConUniversityID := 0;

  objRegistration := TRegistration.Create(iConStudentID, iConCourseID,
    iConUniversityID, now, 10000);

  redBalance.Text := FloatToStrF(objRegistration.GetBalance, ffCurrency, 8, 2);

  redReceipt.Clear;
  bitBack.Enabled := false;
  bitConfirm.Enabled := true;
  bitConfirm.Caption := 'Next';
  Panel3.Caption := 'Choose Univesity... (1/2)';
  iCurrent := 1;
  lstInfo.ShowHint := true;
  lstInfo.Items.Clear;
  with dbmPAT2022 do
  begin
    tblUniversities.Open;
    tblUniversities.First;
    while NOT(tblUniversities.Eof) do
    begin
      lstInfo.Items.add(tblUniversities['University']);
      tblUniversities.Next;
    end;
  end;
end;

function TfrmRegistration.ToString: String;
var
  sLine: string;
begin
  with objRegistration do
  begin

    with (dbmPAT2022) do
    begin
      tblStudents.Open;
      tblCourses.Open;
      tblUniversities.Open;
      tblStudents.First;
      tblCourses.First;
      tblUniversities.First;
      while NOT(tblStudents.Eof) do
      begin
        if tblStudents['StudentID'] = objRegistration.GetStudentID then
        begin
          sLine := 'Student: ' + tblStudents['StudentName'] + ' ' + tblStudents
            ['Surname'] + #13;
          break;
        end;
        tblStudents.Next;
      end;

      while NOT(tblCourses.Eof) do
      begin
        if tblCourses['CourseID'] = objRegistration.GetCourseID then
        begin
          sLine := sLine + 'Course: ' + tblCourses['Course'] + #13;
          break;
        end;
        tblCourses.Next;
      end;

      while NOT(tblUniversities.Eof) do
      begin
        if tblUniversities['UniversityID'] = objRegistration.GetUniversityID
        then
        begin
          sLine := sLine + 'University: ' + tblUniversities['University'] + #13;
          break;
        end;
        tblUniversities.Next;
      end;
      sLine := sLine + 'Spent: ' + FloatToStrF(objRegistration.CalculateSpent,
        ffCurrency, 8, 2);
    end;

    result := sLine;
  end;
end;

end.
