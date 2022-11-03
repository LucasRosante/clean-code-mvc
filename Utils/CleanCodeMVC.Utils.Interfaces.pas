unit CleanCodeMVC.Utils.Interfaces;

interface

uses
  Forms;

type
  iUtils = interface
    function GenerateGUUID : String;
    function ClearEdits(aForm : TForm) : iUtils;
  end;

implementation

end.
