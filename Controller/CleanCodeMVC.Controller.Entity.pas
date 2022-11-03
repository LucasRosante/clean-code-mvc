unit CleanCodeMVC.Controller.Entity;

interface

uses
  CleanCodeMVC.Controller.Interfaces,
  CleanCodeMVC.Model.Entity.Interfaces, Vcl.Forms;

type
  TControllerEntity = class(TInterfacedObject, iControllerEntity)
  private
    FEntityUser : iEntityUser;
    FException : iControllerExceptions;
  public
    constructor Create(aForm : TForm);
    destructor Destroy; override;
    class function New(aForm : TForm) : iControllerEntity;
    function USER : iEntityUser;
  end;

implementation

{ TControllerEntity }

uses
  CleanCodeMVC.Model.Entity.User,
  CleanCodeMVC.Controller.Exceptions;

constructor TControllerEntity.Create(aForm : TForm);
begin
  FException := TControllerExceptions.New(aForm);
end;

destructor TControllerEntity.Destroy;
begin
  inherited;
end;

class function TControllerEntity.New(aForm : TForm) : iControllerEntity;
begin
  Result := Self.Create(aForm);
end;

function TControllerEntity.USER: iEntityUser;
begin
  if not Assigned(FEntityUser) then
    FEntityUser := TModelEntityUser.New;

  Result := FEntityUser;
end;

end.
