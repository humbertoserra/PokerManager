unit pokermanager.services.utils;

interface

uses
  Winapi.Windows,
  System.UITypes,
  System.Types,
  System.SysUtils,
  System.Classes,
  FMX.Objects,
  FMX.Types,
  FMX.Layouts;

type
  TUtils = class
  private

  public
    class function IFF<T>(pCondition: boolean; pResultTrue, pResultFalse: T): T;
    class procedure ImageColor(Image: TImage; Color: TAlphaColor); overload;
    class procedure ImageColor(Image: TFMXObject; Color: TAlphaColor); overload;
    class procedure ResourceImage(Resource: String; Image: TImage); overload;
    class procedure ResourceImage(Resource: String; Image: TFMXObject);
      overload;
    class function getVersionArq: String;
    class procedure ResponsiveLayout(Value: TLayout; Count: Integer;
      Separator: Single = 0);
  end;

implementation

{ TUtils }

class function TUtils.getVersionArq: String;
var
  Size, Dummy: DWORD;
  Buffer: Pointer;
  VersionInfo: Pointer;
  VersionInfoSize: UINT;
  FixedFileInfo: PVSFixedFileInfo;
  Len: UINT;
begin
  Result := '';

  Size := GetFileVersionInfoSize(PChar(ParamStr(0)), Dummy);
  if Size = 0 then
    Exit;

  GetMem(Buffer, Size);
  try
    if not GetFileVersionInfo(PChar(ParamStr(0)), 0, Size, Buffer) then
      Exit;

    if VerQueryValue(Buffer, '\', VersionInfo, VersionInfoSize) then
    begin
      FixedFileInfo := VersionInfo;

      if VerQueryValue(Buffer, 'StringFileInfo\040904E4\FileVersion',
        VersionInfo, Len) then
        Result := PChar(VersionInfo);
    end;

  finally
    FreeMem(Buffer);
  end;
end;

class function TUtils.IFF<T>(pCondition: boolean;
  pResultTrue, pResultFalse: T): T;
begin
  case pCondition of
    True:
      Result := pResultTrue;
    False:
      Result := pResultFalse;
  end;
end;

class procedure TUtils.ImageColor(Image: TImage; Color: TAlphaColor);
begin
  Image.Bitmap.ReplaceOpaqueColor(Color);
end;

class procedure TUtils.ImageColor(Image: TFMXObject; Color: TAlphaColor);
begin
  TShape(Image).Fill.Bitmap.Bitmap.ReplaceOpaqueColor(Color);
end;

class procedure TUtils.ResourceImage(Resource: String; Image: TFMXObject);
begin
  var
  lResource := TResourceStream.Create(HInstance, Resource, RT_RCDATA);
  try
    TShape(Image).Fill.Bitmap.Bitmap.LoadFromStream(lResource);
  finally
    lResource.Free;
  end;
end;

class procedure TUtils.ResponsiveLayout(Value: TLayout; Count: Integer;
  Separator: Single = 0);
begin
  for var I := 0 to Pred(Value.ChildrenCount) do
    if Value.Children.Items[I] is TLayout then
      TLayout(Value.Children.Items[I]).Width := Round((Value.Width - Separator) / Count);
end;

class procedure TUtils.ResourceImage(Resource: String; Image: TImage);
begin
  var
  lResource := TResourceStream.Create(HInstance, Resource, RT_RCDATA);
  try
    Image.Bitmap.LoadFromStream(lResource);
  finally
    lResource.Free;
  end;
end;

end.
