unit frmBrowserChooser_U;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, JPEG,
  clsFormatCalculations, dbPAT2022;

type
  TfrmBrowserChooser = class(TForm)
    pnlChoose: TPanel;
    Label1: TLabel;
    pnlUniversities: TPanel;
    pnlCourses: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Panel4: TPanel;
    btnUni: TButton;
    Panel1: TPanel;
    btnCourses: TButton;
    imgUni: TImage;
    imgCourse: TImage;
    btnBack: TButton;
    btnProfile: TButton;
    btnAdmin: TButton;
    lblUser: TLabel;
    procedure btnUniClick(Sender: TObject);
    procedure btnCoursesClick(Sender: TObject);
    procedure btnBackClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnProfileClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnAdminClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    objFormatCalculations: TFormatCalculation;
  public
    { Public declarations }
  end;

var
  frmBrowserChooser: TfrmBrowserChooser;

implementation

uses
  frmCourseBrowser_U, frmUniversityBrowser_U, frmLogin_U, frmProfile_U,
  frmWelcome_U, frmCustomise_U, frmAdminPage_U;

{$R *.dfm}

procedure TfrmBrowserChooser.btnAdminClick(Sender: TObject);
begin
  frmBrowserChooser.Hide;
  frmAdminPage.Show;
end;

procedure TfrmBrowserChooser.btnBackClick(Sender: TObject);
begin
  frmBrowserChooser.Hide;
  frmLogin.Show;
end;

procedure TfrmBrowserChooser.btnCoursesClick(Sender: TObject);
begin
  frmBrowserChooser.Hide;
  frmCourseBrowser.Show;
end;

procedure TfrmBrowserChooser.btnProfileClick(Sender: TObject);
begin
  iStudentProfileID := iStudentID;
  frmProfile.Show;
end;

procedure TfrmBrowserChooser.btnUniClick(Sender: TObject);
begin
  frmBrowserChooser.Hide;
  frmUniversityBrowser.Show;
end;

procedure TfrmBrowserChooser.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Application.Terminate;
end;

procedure TfrmBrowserChooser.FormCreate(Sender: TObject);
begin
  frmBrowserChooser.Position := poScreenCenter;
  imgUni.Proportional := true;
  imgCourse.Proportional := true;
  imgUni.Picture.LoadFromFile('Uni.png');
  imgCourse.Picture.LoadFromFile('Course.png');
end;

procedure TfrmBrowserChooser.FormShow(Sender: TObject);
begin

  // Other

  btnAdmin.Visible := false;
  with dbmPAT2022 do
  begin
    tblStudents.first;
    while NOT(tblStudents.Eof) do
    begin
      if iStudentID = tblStudents['StudentID'] then
      begin
        lblUser.Caption := 'Currently Logged In As ' + tblStudents
          ['StudentName'];
        break;
      end;
      tblStudents.Next;
    end;
  end;


  // Colour Scheme

  // Panels

  pnlChoose.Color := Primary;
  pnlUniversities.Color := Secondary;
  pnlCourses.Color := Secondary;
  Panel1.Color := Primary;
  Panel2.Color := Primary;
  Panel3.Color := Primary;
  Panel4.Color := Primary;

  // Labels

  Label1.Font.Color := Secondary;
  Label2.Font.Color := Secondary;
  Label3.Font.Color := Secondary;
  lblUser.Font.Color := Secondary;

  // Admin Button

  if iStudentID = 7 then
  begin
    btnAdmin.Visible := true;
  end
  else
  begin
    btnAdmin.Visible := false;
  end;

end;

end.
