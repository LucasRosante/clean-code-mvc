unit CleanCodeMVC.Model.DAO.Interfaces;

interface

uses
  Data.DB;

type
  iEntityDAO<T> = interface
    ['{EFE523F2-1898-4D85-84D9-9338625C18FE}']
    function &End : T;
    function All(aDataSource : TDataSource) : iEntityDAO<T>;
    function Find(const GUUID : String) : iEntityDAO<T>;
    function FindBy(const aFieldName, aValue : String) : iEntityDAO<T>;
    function Insert : iEntityDAO<T>;
    function Update : iEntityDAO<T>;
    function Delete(const aGUUID : String) : iEntityDAO<T>;
  end;

implementation

end.
