unit CleanCodeMVC.Utils;

interface

uses
  CleanCodeMVC.Utils.Interfaces,
  Forms;

type
  TUtils = class(TInterfacedObject, iUtils)
  private
  public
    constructor Create;
    destructor Destroy; override;
    class function New : iUtils;
    function GenerateGUUID : String;
    function ClearEdits(aForm : TForm) : iUtils;
  end;

implementation

uses
  System.SysUtils,
  Vcl.StdCtrls,
  System.Classes;

{ TUtils }

constructor TUtils.Create;
begin
end;

destructor TUtils.Destroy;
begin
  inherited;
end;

class function TUtils.New : iUtils;
begin
  Result := Self.Create;
end;

function TUtils.GenerateGUUID: String;
begin
  Result := TGUID.NewGuid.ToString
              .Replace('{', '', [rfReplaceAll])
              .Replace('}', '', [rfReplaceAll]);
end;

function TUtils.ClearEdits(aForm : TForm) : iUtils;
var
  I : Integer;
begin
  Result := Self;

  for I := 0 to aForm.ComponentCount -1 do
    if aForm.Components[I] is TEdit then
      TEdit(aForm.Components[I]).Clear;
end;

end.
