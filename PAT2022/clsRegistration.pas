unit clsRegistration;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.ComCtrls, dbPAT2022;

Type
  TRegistration = class(TObject)
  private
    fStudentID, fCourseID, fUniversityID: integer;
    fDateRegistered: TDateTime;
    fBalance: Real;
  public
    constructor Create(iConStudentID, iConCourseID, iConUniversityID: integer;
      dDateRegistered: TDateTime; rBalance: Real);
    procedure SetBalance(rBalance: Real);
    function GetStudentID(): integer;
    function GetCourseID(): integer;
    function GetUniversityID(): integer;
    function GetDateRegistered(): TDateTime;
    function GetBalance(): Real;
    function CalculateSpent(): Real;
  end;

implementation

{ TRegistration }

function TRegistration.CalculateSpent: Real;
begin
  result := 10000 - fBalance;
end;

constructor TRegistration.Create(iConStudentID, iConCourseID, iConUniversityID
  : integer; dDateRegistered: TDateTime; rBalance: Real);
begin
  fStudentID := iConStudentID;
  fCourseID := iConCourseID;
  fUniversityID := iConUniversityID;
  fDateRegistered := dDateRegistered;
  fBalance := rBalance;
end;

function TRegistration.GetBalance: Real;
begin
  result := fBalance;
end;

function TRegistration.GetCourseID: integer;
begin
  result := fCourseID;
end;

function TRegistration.GetDateRegistered: TDateTime;
begin
  result := fDateRegistered;
end;

function TRegistration.GetStudentID: integer;
begin
  result := fStudentID;
end;

function TRegistration.GetUniversityID: integer;
begin
  result := fUniversityID;
end;

procedure TRegistration.SetBalance(rBalance: Real);
begin
  fBalance := rBalance;
end;

end.
