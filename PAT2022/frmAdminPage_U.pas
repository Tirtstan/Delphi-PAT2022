unit frmAdminPage_U;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, dbPAT2022, Data.DB, Vcl.ExtCtrls,
  Vcl.DBCtrls, Vcl.Buttons, ADODB, Vcl.ComCtrls, Vcl.WinXCtrls,
  clsFormatCalculations;

type
  TfrmAdminPage = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    btnBack: TButton;
    btnStudents: TButton;
    btnUniversities: TButton;
    btnUniversityReviews: TButton;
    btnCourses: TButton;
    btnCourseReviews: TButton;
    Panel3: TPanel;
    lblTitle: TLabel;
    dbgDatabase: TDBGrid;
    Panel4: TPanel;
    srchDatabase: TSearchBox;
    cmbSearch: TComboBox;
    Panel5: TPanel;
    btnFirst: TButton;
    btnLast: TButton;
    Panel6: TPanel;
    btnPrior: TButton;
    btnNext: TButton;
    Panel7: TPanel;
    DBNavigator1: TDBNavigator;
    DBNavigator2: TDBNavigator;
    redSQL: TRichEdit;
    Label1: TLabel;
    Panel9: TPanel;
    btnSQLCustom: TButton;
    Panel10: TPanel;
    Panel11: TPanel;
    Panel12: TPanel;
    Panel13: TPanel;
    btnSQLPreset: TButton;
    lstSQL: TListBox;
    Panel8: TPanel;
    btnClearSQL: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure btnStudentsClick(Sender: TObject);
    procedure btnUniversitiesClick(Sender: TObject);
    procedure btnUniversityReviewsClick(Sender: TObject);
    procedure btnCoursesClick(Sender: TObject);
    procedure btnCourseReviewsClick(Sender: TObject);
    procedure cmbSearchChange(Sender: TObject);
    procedure cmbSearchClick(Sender: TObject);
    procedure srchDatabaseClick(Sender: TObject);
    procedure btnBackClick(Sender: TObject);
    procedure srchDatabaseChange(Sender: TObject);
    procedure btnFirstClick(Sender: TObject);
    procedure btnLastClick(Sender: TObject);
    procedure btnPriorClick(Sender: TObject);
    procedure btnNextClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnSQLCustomClick(Sender: TObject);
    procedure redSQLChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure lstSQLClick(Sender: TObject);
    procedure btnSQLPresetClick(Sender: TObject);
    procedure btnClearSQLClick(Sender: TObject);

  private
    { Private declarations }
    objFormatCalculations: TFormatCalculation;
    sTable, sSearch: string;

  public
    { Public declarations }
  end;

var
  frmAdminPage: TfrmAdminPage;
  sSQLPreset: string;

implementation

uses frmBrowserChooser_U, frmCustomise_U;

{$R *.dfm}

procedure TfrmAdminPage.btnCoursesClick(Sender: TObject);
begin
  lblTitle.Caption := btnCourses.Caption;
  srchDatabase.TextHint := 'Search ' + btnCourses.Caption + '...';
  srchDatabase.Clear;

  sTable := 'tblCourses';

  dbmPAT2022.tblCourses.Open;
  dbgDatabase.DataSource := dbmPAT2022.dsrCourses;
  dbmPAT2022.tblCourses.Sort := 'CourseID ASC';

  DBNavigator1.DataSource := dbmPAT2022.dsrCourses;
  DBNavigator2.DataSource := dbmPAT2022.dsrCourses;

  cmbSearch.Items.Clear;
  cmbSearch.Clear;
  cmbSearch.Items.Add('CourseID');
  cmbSearch.Items.Add('Course');
  cmbSearch.Items.Add('CourseLength');
  cmbSearch.Items.Add('Fee');
  cmbSearch.Items.Add('UniversityID');

  with dbgDatabase do
  begin
    Columns[0].Width := 100;
    Columns[1].Width := 200;
    Columns[2].Width := 150;
    Columns[3].Width := 250;
    Columns[4].Width := 100;
  end;

  if cmbSearch.ItemIndex = -1 then
  begin
    srchDatabase.Enabled := false;
  end
  else
  begin
    srchDatabase.Enabled := true;
  end;

end;

procedure TfrmAdminPage.btnSQLCustomClick(Sender: TObject);
begin
  dbgDatabase.DataSource := dbmPAT2022.dsSQL;

  with dbmPAT2022 do
  begin
    qrySQL.Close;
    qrySQL.SQL.Clear;
    qrySQL.SQL.Add(redSQL.Text);
    qrySQL.Open;
  end;
end;

procedure TfrmAdminPage.btnSQLPresetClick(Sender: TObject);
begin
  if NOT(sSQLPreset = '') then
  begin
    dbgDatabase.DataSource := dbmPAT2022.dsSQL;

    with dbmPAT2022 do
    begin
      qrySQL.Close;
      qrySQL.SQL.Clear;
      qrySQL.SQL.Add(sSQLPreset);
      qrySQL.Open;
    end;

    if lstSQL.ItemIndex = 3 then
    begin
      with dbgDatabase do
      begin
        Columns[0].Width := 250;
        Columns[1].Width := 100;
      end;
    end;
  end;

end;

procedure TfrmAdminPage.btnStudentsClick(Sender: TObject);
var
  I: integer;
begin
  lblTitle.Caption := btnStudents.Caption;

  // srchDatabase Fail Saving

  srchDatabase.TextHint := 'Search ' + btnStudents.Caption + '...';
  srchDatabase.Clear;

  sTable := 'tblStudents';

  DBNavigator1.DataSource := dbmPAT2022.dsrStudents;
  DBNavigator2.DataSource := dbmPAT2022.dsrStudents;

  dbmPAT2022.tblStudents.Open;
  dbgDatabase.DataSource := dbmPAT2022.dsrStudents;
  dbmPAT2022.tblStudents.Sort := 'StudentID ASC';

  cmbSearch.Items.Clear;
  cmbSearch.Clear;
  cmbSearch.Items.Add('StudentID');
  cmbSearch.Items.Add('StudentName');
  cmbSearch.Items.Add('Surname');
  cmbSearch.Items.Add('Email');
  cmbSearch.Items.Add('Password');
  cmbSearch.Items.Add('ID');
  cmbSearch.Items.Add('PhoneNumber');
  cmbSearch.Items.Add('Bio');
  cmbSearch.Items.Add('ProfilePicture');
  cmbSearch.Items.Add('Birthday');

  with dbgDatabase do
  begin
    Columns[0].Width := 100;
    Columns[1].Width := 100;
    Columns[2].Width := 100;
    Columns[3].Width := 250;
    Columns[4].Width := 150;
    Columns[5].Width := 150;
    Columns[6].Width := 150;
    Columns[7].Width := 200;
    Columns[8].Width := 100;
    Columns[9].Width := 150;
  end;

  if cmbSearch.ItemIndex = -1 then
  begin
    srchDatabase.Enabled := false;
  end
  else
  begin
    srchDatabase.Enabled := true;
  end;

end;

procedure TfrmAdminPage.btnUniversitiesClick(Sender: TObject);
begin
  lblTitle.Caption := btnUniversities.Caption;

  // srchDatabase Fail Saving

  srchDatabase.TextHint := 'Search ' + btnUniversities.Caption + '...';
  srchDatabase.Clear;

  sTable := 'tblUniversities';

  DBNavigator1.DataSource := dbmPAT2022.dsrUniversities;
  DBNavigator2.DataSource := dbmPAT2022.dsrUniversities;

  dbmPAT2022.tblUniversities.Open;
  dbgDatabase.DataSource := dbmPAT2022.dsrUniversities;
  dbmPAT2022.tblUniversities.Sort := 'UniversityID ASC';

  cmbSearch.Items.Clear;
  cmbSearch.Clear;
  cmbSearch.Items.Add('UniversityID');
  cmbSearch.Items.Add('University');
  cmbSearch.Items.Add('Description');
  cmbSearch.Items.Add('Province');
  cmbSearch.Items.Add('Public');

  with dbgDatabase do
  begin
    Columns[0].Width := 100;
    Columns[1].Width := 150;
    Columns[2].Width := 250;
    Columns[3].Width := 250;
    Columns[4].Width := 100;
  end;

  if cmbSearch.ItemIndex = -1 then
  begin
    srchDatabase.Enabled := false;
  end
  else
  begin
    srchDatabase.Enabled := true;
  end;

end;

procedure TfrmAdminPage.btnUniversityReviewsClick(Sender: TObject);
begin
  lblTitle.Caption := btnUniversityReviews.Caption;
  srchDatabase.TextHint := 'Search ' + btnUniversityReviews.Caption + '...';
  srchDatabase.Clear;

  sTable := 'tblUniversityReviews';

  DBNavigator1.DataSource := dbmPAT2022.dsrUniversityReviews;
  DBNavigator2.DataSource := dbmPAT2022.dsrUniversityReviews;

  dbmPAT2022.tblUniversityReviews.Open;
  dbgDatabase.DataSource := dbmPAT2022.dsrUniversityReviews;
  dbmPAT2022.tblUniversityReviews.Sort := 'UReviewID ASC';

  cmbSearch.Items.Clear;
  cmbSearch.Clear;
  cmbSearch.Items.Add('UReviewID');
  cmbSearch.Items.Add('Review');
  cmbSearch.Items.Add('Rating');
  cmbSearch.Items.Add('ReviewDate');
  cmbSearch.Items.Add('UniversityID');
  cmbSearch.Items.Add('StudentID');

  with dbgDatabase do
  begin
    Columns[0].Width := 100;
    Columns[1].Width := 300;
    Columns[2].Width := 60;
    Columns[3].Width := 100;
    Columns[4].Width := 100;
    Columns[5].Width := 100;
  end;

  if cmbSearch.ItemIndex = -1 then
  begin
    srchDatabase.Enabled := false;
  end
  else
  begin
    srchDatabase.Enabled := true;
  end;

end;

procedure TfrmAdminPage.Button1Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmAdminPage.btnFirstClick(Sender: TObject);
begin

  with dbmPAT2022 do
  begin
    if sTable = 'tblCourses' then
    begin
      tblCourses.First;
    end
    else if sTable = 'tblCourseReviews' then
    begin
      tblCourseReviews.First;
    end
    else if sTable = 'tblUniversities' then
    begin
      tblUniversities.First;
    end
    else if sTable = 'tblUniversityReviews' then
    begin
      tblUniversityReviews.First;
    end
    else if sTable = 'tblStudents' then
    begin
      tblStudents.First;
    end;
  end;
end;

procedure TfrmAdminPage.btnLastClick(Sender: TObject);
begin

  with dbmPAT2022 do
  begin
    if sTable = 'tblCourses' then
    begin
      tblCourses.last;
    end
    else if sTable = 'tblCourseReviews' then
    begin
      tblCourseReviews.last;
    end
    else if sTable = 'tblUniversities' then
    begin
      tblUniversities.last;
    end
    else if sTable = 'tblUniversityReviews' then
    begin
      tblUniversityReviews.last;
    end
    else if sTable = 'tblStudents' then
    begin
      tblStudents.last;
    end;
  end;

end;

procedure TfrmAdminPage.btnNextClick(Sender: TObject);
begin

  with dbmPAT2022 do
  begin
    if sTable = 'tblCourses' then
    begin
      tblCourses.Next;
    end
    else if sTable = 'tblCourseReviews' then
    begin
      tblCourseReviews.Next;
    end
    else if sTable = 'tblUniversities' then
    begin
      tblUniversities.Next;
    end
    else if sTable = 'tblUniversityReviews' then
    begin
      tblUniversityReviews.Next;
    end
    else if sTable = 'tblStudents' then
    begin
      tblStudents.Next;
    end;
  end;

end;

procedure TfrmAdminPage.btnPriorClick(Sender: TObject);
begin
  with dbmPAT2022 do
  begin
    if sTable = 'tblCourses' then
    begin
      tblCourses.Prior;
    end
    else if sTable = 'tblCourseReviews' then
    begin
      tblCourseReviews.Prior;
    end
    else if sTable = 'tblUniversities' then
    begin
      tblUniversities.Prior;
    end
    else if sTable = 'tblUniversityReviews' then
    begin
      tblUniversityReviews.Prior;
    end
    else if sTable = 'tblStudents' then
    begin
      tblStudents.Prior;
    end;
  end;
end;

procedure TfrmAdminPage.cmbSearchChange(Sender: TObject);
begin
  if cmbSearch.ItemIndex = -1 then
  begin
    srchDatabase.Enabled := false;
    srchDatabase.Clear;
  end
  else
  begin
    srchDatabase.Enabled := true;
  end;
end;

procedure TfrmAdminPage.cmbSearchClick(Sender: TObject);
begin
  if cmbSearch.ItemIndex = -1 then
  begin
    srchDatabase.Enabled := false;
    srchDatabase.Clear;
  end
  else
  begin
    srchDatabase.Enabled := true;
  end;
end;

procedure TfrmAdminPage.btnBackClick(Sender: TObject);
begin
  frmAdminPage.Hide;
  frmBrowserChooser.Show;
end;

procedure TfrmAdminPage.btnClearSQLClick(Sender: TObject);
begin
  redSQL.Clear;
end;

procedure TfrmAdminPage.btnCourseReviewsClick(Sender: TObject);
begin
  lblTitle.Caption := btnCourseReviews.Caption;
  srchDatabase.TextHint := 'Search ' + btnCourseReviews.Caption + '...';
  srchDatabase.Clear;

  sTable := 'tblCourseReviews';

  DBNavigator1.DataSource := dbmPAT2022.dsrCourseReviews;
  DBNavigator2.DataSource := dbmPAT2022.dsrCourseReviews;

  dbmPAT2022.tblCourseReviews.Open;
  dbgDatabase.DataSource := dbmPAT2022.dsrCourseReviews;
  dbmPAT2022.tblCourseReviews.Sort := 'CReviewID ASC';

  with dbgDatabase do
  begin
    Columns[0].Width := 100;
    Columns[1].Width := 250;
    Columns[2].Width := 60;
    Columns[3].Width := 100;
    Columns[4].Width := 100;
    Columns[5].Width := 100;
  end;

  cmbSearch.Items.Clear;
  cmbSearch.Clear;
  cmbSearch.Items.Add('CReviewID');
  cmbSearch.Items.Add('Review');
  cmbSearch.Items.Add('Rating');
  cmbSearch.Items.Add('ReviewDate');
  cmbSearch.Items.Add('CourseID');
  cmbSearch.Items.Add('StudentID');

  if cmbSearch.ItemIndex = -1 then
  begin
    srchDatabase.Enabled := false;
  end
  else
  begin
    srchDatabase.Enabled := true;
  end;

end;

procedure TfrmAdminPage.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Application.Terminate;
end;

procedure TfrmAdminPage.FormCreate(Sender: TObject);
begin
  frmAdminPage.Position := poScreenCenter;

  sTable := '';

  if cmbSearch.ItemIndex = -1 then
  begin
    srchDatabase.Enabled := false;
  end
  else
  begin
    srchDatabase.Enabled := true;
  end;

  redSQL.Clear;
end;

procedure TfrmAdminPage.FormShow(Sender: TObject);
begin

  // Colour Scheme
  Panel1.Color := Primary;
  Panel2.Color := Secondary;
  Panel3.Color := Secondary;
  Panel4.Color := Secondary;
  Panel5.Color := Primary;
  Panel6.Color := Primary;
  Panel7.Color := Primary;
  Panel8.Color := Secondary;
  Panel9.Color := Primary;
  Panel10.Color := Secondary;
  Panel11.Color := Primary;
  Panel11.Font.Color := Secondary;
  Panel12.Color := Primary;
  Panel13.Color := Secondary;

  redSQL.Color := PrimaryBrighter;
  redSQL.Font.Color := Secondary;

  lblTitle.Font.Color := Secondary;
  Label1.Font.Color := Secondary;

  lstSQL.Color := PrimaryBrighter;
  lstSQL.Font.Color := Secondary;

  // Other

  if redSQL.Text = '' then
  begin
    btnSQLCustom.Enabled := false;
  end
  else
  begin
    btnSQLCustom.Enabled := true;
  end;

  if lstSQL.ItemIndex = -1 then
  begin
    btnSQLPreset.Enabled := false;
  end
  else
  begin
    btnSQLPreset.Enabled := true;
  end;

  dbmPAT2022.tblCourses.Open;
  dbgDatabase.DataSource := dbmPAT2022.dsrCourses;
  DBNavigator1.DataSource := dbmPAT2022.dsrCourses;
  DBNavigator2.DataSource := dbmPAT2022.dsrCourses;
  sTable := 'tblCourses';

  with dbgDatabase do
  begin
    Columns[0].Width := 50;
    Columns[1].Width := 200;
    Columns[2].Width := 150;
    Columns[3].Width := 50;
    Columns[4].Width := 100;
  end;
end;

procedure TfrmAdminPage.lstSQLClick(Sender: TObject);
begin

  if lstSQL.ItemIndex = -1 then
  begin
    btnSQLPreset.Enabled := false;
  end
  else
  begin
    btnSQLPreset.Enabled := true;
  end;

  case lstSQL.ItemIndex of
    0:
      begin
        sSQLPreset :=
          'SELECT AVG(Rating) AS [Average Rating For tblUniversityReviews] FROM tblUniversityReviews';
      end;
    1:
      begin
        sSQLPreset :=
          'SELECT MIN(Rating) AS [Lowest Rating For tblCourseReviews] FROM tblCourseReviews';
      end;
    2:
      begin
        sSQLPreset :=
          'SELECT COUNT(UniversityID) AS [No Of Universities], Province  ' +
          'FROM tblUniversities ' + 'GROUP BY Province ' +
          'HAVING COUNT(UniversityID) >= 2';
      end;
    3:
      begin
        sSQLPreset := 'SELECT Course, ROUND(AVG(Rating), 2) AS [Average Rating]'
          + 'FROM tblCourses, tblCourseReviews ' +
          'WHERE tblCourses.CourseID = tblCourseReviews.CourseID ' +
          'GROUP BY tblCourses.Course';

      end;
  end;
end;

procedure TfrmAdminPage.redSQLChange(Sender: TObject);
begin
  if NOT(redSQL.Text = '') then
  begin
    btnSQLCustom.Enabled := true;
  end
  else
  begin
    btnSQLCustom.Enabled := false;
  end;
end;

procedure TfrmAdminPage.srchDatabaseChange(Sender: TObject);
begin
  // SQL searching
  sSearch := srchDatabase.Text;
  dbgDatabase.DataSource := dbmPAT2022.dsSQL;
  if NOT(sTable = '') then
  begin
    with dbmPAT2022 do
    begin
      if (sSearch = '') then
      begin
        qrySQL.Close;
        qrySQL.SQL.Clear;
        qrySQL.SQL.Add('SELECT * FROM ' + sTable);
        qrySQL.Open;
      end
      else
      begin
        qrySQL.Close;
        qrySQL.SQL.Clear;
        qrySQL.SQL.Add('SELECT * FROM ' + sTable + ' WHERE ' + cmbSearch.Items
          [cmbSearch.ItemIndex] + ' LIKE "%' + sSearch + '%"');
        qrySQL.Open;
      end;

    end;

    if sTable = 'tblCourses' then
    begin
      with dbgDatabase do
      begin
        Columns[0].Width := 100;
        Columns[1].Width := 200;
        Columns[2].Width := 150;
        Columns[3].Width := 250;
        Columns[4].Width := 100;
      end;
    end
    else if sTable = 'tblCourseReviews' then
    begin
      with dbgDatabase do
      begin
        Columns[0].Width := 100;
        Columns[1].Width := 250;
        Columns[2].Width := 60;
        Columns[3].Width := 100;
        Columns[4].Width := 100;
        Columns[5].Width := 100;
      end;
    end
    else if sTable = 'tblUniversities' then
    begin
      with dbgDatabase do
      begin
        Columns[0].Width := 100;
        Columns[1].Width := 150;
        Columns[2].Width := 250;
        Columns[3].Width := 250;
        Columns[4].Width := 100;
      end;
    end
    else if sTable = 'tblUniversityReviews' then
    begin
      with dbgDatabase do
      begin
        Columns[0].Width := 100;
        Columns[1].Width := 300;
        Columns[2].Width := 60;
        Columns[3].Width := 100;
        Columns[4].Width := 100;
        Columns[5].Width := 100;
      end;
    end
    else if sTable = 'tblStudents' then
    begin
      with dbgDatabase do
      begin
        Columns[0].Width := 100;
        Columns[1].Width := 100;
        Columns[2].Width := 100;
        Columns[3].Width := 250;
        Columns[4].Width := 150;
        Columns[5].Width := 150;
        Columns[6].Width := 150;
        Columns[7].Width := 200;
        Columns[8].Width := 100;
        Columns[9].Width := 150;
      end;
    end;
  end;

end;

procedure TfrmAdminPage.srchDatabaseClick(Sender: TObject);
begin

  // Fail safe for searching without a column chosen
  if cmbSearch.ItemIndex = -1 then
  begin
    srchDatabase.Enabled := false;
    srchDatabase.Clear;
  end
  else
  begin
    srchDatabase.Enabled := true;
  end;
end;

end.
