unit pokermanager.view.styles.states;

interface

uses
  System.SysUtils,
  System.Generics.Collections;

type
  TStyleStates = class
  private
    FList: TDictionary<String, iInterface>;

    constructor Create;
    destructor Destroy; override;
  public
    class function New: TStyleStates;
    function RegisterStyle(StyleName: String; StyleInterface: iInterface): TStyleStates;
    function GetStgyhle(StyleName: String): iInterface;
  end;

var
  StyleStates: TStyleStates;

implementation

{ TStyleStates }

constructor TStyleStates.Create;
begin
  FList := TDictionary<String, iInterface>.Create;
end;

destructor TStyleStates.Destroy;
begin
  FList.Free;
  inherited;
end;

function TStyleStates.GetStgyhle(StyleName: String): iInterface;
begin
  if not FList.TryGetValue(StyleName, Result) then
    raise Exception.Create('Style not Register');
end;

class function TStyleStates.New: TStyleStates;
begin
  Result := Self.Create;
end;

function TStyleStates.RegisterStyle(StyleName: String;
  StyleInterface: iInterface): TStyleStates;
begin
  Result := Self;
  FList.Add(StyleName, StyleInterface);
end;

initialization
  StyleStates := TStyleStates.New;

finalization
  StyleStates.Free;


end.
