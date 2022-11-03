unit CleanCodeMVC.Controller.Exceptions;

interface

uses
  CleanCodeMVC.Controller.Interfaces,
  System.SysUtils,
  Vcl.Forms;

type
  TControllerExceptions = class(TInterfacedObject, iControllerExceptions)
  private
    FForm : TForm;
    procedure Exceptions(aSender : TObject; aException : Exception);
  public
    constructor Create(aForm : TForm);
    destructor Destroy; override;
    class function New(aForm : TForm) : iControllerExceptions;
  end;

implementation

uses
  Vcl.StdCtrls,
  Vcl.Dialogs,
  CleanCodeMVC.Model.Exceptions.ValidateFieldForm,
  System.UITypes;

{ TControllerExceptions }

constructor TControllerExceptions.Create(aForm : TForm);
begin
  FForm := aForm;
  Application.OnException := Exceptions;
end;

destructor TControllerExceptions.Destroy;
begin
  inherited;
end;

class function TControllerExceptions.New(aForm : TForm) : iControllerExceptions;
begin
  Result := Self.Create(aForm);
end;

procedure TControllerExceptions.Exceptions(aSender: TObject; aException: Exception);
begin
  if aException is TValidateFieldsForm then begin
    TEdit(FForm.FindComponent('edt' + TValidateFieldsForm(aException).Field)).SetFocus;
    MessageDlg(TValidateFieldsForm(aException).MessageError, mtError, [mbOK], 0);
  end else
    MessageDlg(aException.Message, mtError, [mbOK], 0);
end;

end.
