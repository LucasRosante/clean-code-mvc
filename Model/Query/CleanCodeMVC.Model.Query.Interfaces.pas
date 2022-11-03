unit CleanCodeMVC.Model.Query.Interfaces;

interface

uses
  Data.DB;

type
  iQuery = interface
    ['{E607C25E-4D1D-4835-9EED-D5AA0DC322FF}']
    function DataSet : TDataSet;
    function Open(const aSQL : String) : iQuery; overload;
    function Open(const aSQL : String; const aParams : array of Variant) : iQuery; overload;
    function ExecuteSQL(const aSQL : String) : iQuery; overload;
    function ExecuteSQL(const aSQL : String; const aParams : array of Variant) : iQuery; overload;
  end;

implementation

end.
