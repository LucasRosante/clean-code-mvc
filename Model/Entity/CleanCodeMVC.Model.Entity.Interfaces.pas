unit CleanCodeMVC.Model.Entity.Interfaces;

interface

uses
  Data.DB,
  CleanCodeMVC.Model.DAO.Interfaces;

type
  iEntityUser = interface
    ['{3E98ACF8-83AB-4D40-9F80-2CD302510090}']
    function DAO : iEntityDAO<iEntityUser>;
    function GUUID : String; overload;
    function GUUID(const aValue : String) : iEntityUser; overload;
    function UserName : String; overload;
    function UserName(const aValue : String) : iEntityUser; overload;
    function Email : String; overload;
    function Email(const aValue : String) : iEntityUser; overload;
    function Password : String; overload;
    function Password(const aValue : String) : iEntityUser; overload;
  end;

implementation

end.
