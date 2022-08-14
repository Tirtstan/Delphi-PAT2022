unit clsStudent;

interface

uses
  Windows, Messages, Dialogs, SysUtils, Variants, Classes, Controls, Forms,
  ADODB, DB, dbPAT2022;

type
  TStudent = class(Tobject)
  private
    fStudentName, fSurname, fEmail, fPassword, fID, fPhoneNumber: String;
    fBirthday: TDateTime;
    fStudentID: integer;
  public
    constructor Create(iConStudentID: integer);
    function GetNameSurname(): string;
    function GetEmail(): string;
    function GetPassword(): string;
    function GetID(): string;
    function GetPhoneNumber(): string;
    function GetBirthday(): TDateTime;
    procedure SetName(sName: string);
    procedure SetSurname(sSurname: string);
    procedure SetEmail(sEmail: string);
    procedure SetPassword(sPassword: string);
    procedure SetPhoneNumber(sPhoneNumber: string);
    // can't change ID or birthday so no set-procedures
  end;

implementation

uses
  frmLogin_U;

{ TStudent }

constructor TStudent.Create(iConStudentID: integer);
begin
  with dbmPAT2022 do
  begin
    tblStudents.Open;
    tblStudents.First;

    while NOT(tblStudents.Eof) do
    begin
      if iConStudentID = tblStudents['StudentID'] then
      begin
        fStudentName := tblStudents['StudentName'];
        fSurname := tblStudents['Surname'];
        fEmail := tblStudents['Email'];
        fPassword := tblStudents['Password'];
        fID := tblStudents['ID'];
        fBirthday := tblStudents['Birthday'];
        fStudentID := iConStudentID;
        break;
      end;
      tblStudents.Next;
    end;

  end;

  ShowMessage('Object Instantiated!');
end;

function TStudent.GetBirthday: TDateTime;
begin
  result := fBirthday;
end;

function TStudent.GetEmail: string;
begin
  result := fEmail;
end;

function TStudent.GetID: string;
begin
  result := fID;
end;

function TStudent.GetNameSurname: string;
begin
  result := fStudentName + ' ' + fSurname;
end;

function TStudent.GetPassword: string;
begin
  result := fPassword;
end;

function TStudent.GetPhoneNumber: string;
begin
  result := fPhoneNumber;
end;

procedure TStudent.SetEmail(sEmail: string);
begin
  with dbmPAT2022 do
  begin
    tblStudents.Open;
    tblStudents.First;

    while NOT(tblStudents.Eof) do
    begin
      if tblStudents['StudentID'] = fStudentID then
      begin
        tblStudents.Edit;
        tblStudents['Email'] := sEmail;
        fEmail := sEmail;
        tblStudents.Post;
        tblStudents.Refresh;

        break;
      end;
      tblStudents.Next;
    end;
  end;
end;

procedure TStudent.SetName(sName: string);
begin
  with dbmPAT2022 do
  begin
    tblStudents.Open;
    tblStudents.First;

    while NOT(tblStudents.Eof) do
    begin
      if tblStudents['StudentID'] = fStudentID then
      begin
        tblStudents.Edit;
        tblStudents['StudentName'] := sName;
        fStudentName := sName;
        tblStudents.Post;
        tblStudents.Refresh;

        break;
      end;
      tblStudents.Next;
    end;
  end;
end;

procedure TStudent.SetPassword(sPassword: string);
begin
  with dbmPAT2022 do
  begin
    tblStudents.Open;
    tblStudents.First;

    while NOT(tblStudents.Eof) do
    begin
      if tblStudents['StudentID'] = fStudentID then
      begin
        tblStudents.Edit;
        tblStudents['Password'] := sPassword;
        fPassword := sPassword;
        tblStudents.Post;
        tblStudents.Refresh;

        break;
      end;
      tblStudents.Next;
    end;
  end;
end;

procedure TStudent.SetPhoneNumber(sPhoneNumber: string);
begin
  with dbmPAT2022 do
  begin
    tblStudents.Open;
    tblStudents.First;

    while NOT(tblStudents.Eof) do
    begin
      if tblStudents['StudentID'] = fStudentID then
      begin
        tblStudents.Edit;
        tblStudents['PhoneNumber'] := sPhoneNumber;
        fPhoneNumber := sPhoneNumber;
        tblStudents.Post;
        tblStudents.Refresh;

        break;
      end;
      tblStudents.Next;
    end;
  end;
end;

procedure TStudent.SetSurname(sSurname: string);
begin
  with dbmPAT2022 do
  begin
    tblStudents.Open;
    tblStudents.First;

    while NOT(tblStudents.Eof) do
    begin
      if tblStudents['StudentID'] = fStudentID then
      begin
        tblStudents.Edit;
        tblStudents['Surname'] := sSurname;
        fSurname := sSurname;
        tblStudents.Post;
        tblStudents.Refresh;

        break;
      end;
      tblStudents.Next;
    end;
  end;
end;

end.
