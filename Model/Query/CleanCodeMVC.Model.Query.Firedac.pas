unit CleanCodeMVC.Model.Query.Firedac;

interface

uses
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  FireDAC.VCLUI.Wait,
  FireDAC.Comp.UI,
  CleanCodeMVC.Model.Query.Interfaces,
  CleanCodeMVC.Model.Connection.Interfaces,
  Data.DB;

type
  TModelQueryFiredac = class(TInterfacedObject, iQuery)
  private
    class var FConnection : iConnection;
    FQuery : TFDQuery;
  public
    constructor Create;
    destructor Destroy; override;
    class function New : iQuery;
    function DataSet : TDataSet;
    function Open(const aSQL : String) : iQuery; overload;
    function Open(const aSQL : String; const aParams : array of Variant) : iQuery; overload;
    function ExecuteSQL(const aSQL : String) : iQuery; overload;
    function ExecuteSQL(const aSQL : String; const aParams : array of Variant) : iQuery; overload;
  end;

implementation

uses
  System.SysUtils,
  CleanCodeMVC.Controller.Factory;

constructor TModelQueryFiredac.Create;
begin
  if not (Assigned(TModelQueryFiredac.FConnection)) then
    TModelQueryFiredac.FConnection := TControllerFactory.New.Connection;

  FQuery := TFDQuery.Create(nil);

  FQuery.Connection := TFDConnection(TModelQueryFiredac.FConnection.Connection);
end;

destructor TModelQueryFiredac.Destroy;
begin
  FreeAndNil(FQuery);
  inherited;
end;

class function TModelQueryFiredac.New : iQuery;
begin
  Result := Self.Create;
end;

function TModelQueryFiredac.DataSet: TDataSet;
begin
  Result := FQuery;
end;

function TModelQueryFiredac.Open(const aSQL: String): iQuery;
begin
  Result := Self;
  FQuery.Open(aSQL);
end;

function TModelQueryFiredac.Open(const aSQL: String; const aParams: array of Variant): iQuery;
begin
  Result := Self;
  FQuery.Open(aSQL, aParams);
end;

function TModelQueryFiredac.ExecuteSQL(const aSQL: String): iQuery;
begin
  FQuery.ExecSQL(aSQL);
end;

function TModelQueryFiredac.ExecuteSQL(const aSQL: String; const aParams: array of Variant): iQuery;
begin
  FQuery.ExecSQL(aSQL, aParams);
end;

end.
