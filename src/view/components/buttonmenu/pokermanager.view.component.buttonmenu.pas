unit pokermanager.view.component.buttonmenu;

interface

uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  System.Generics.Collections,
  FMX.Types,
  FMX.Graphics,
  FMX.Controls,
  FMX.Forms,
  FMX.Dialogs,
  FMX.StdCtrls,
  FMX.Controls.Presentation,
  FMX.Objects,
  FMX.Layouts;

type
  TComponentButtonMenu = class(TFrame)
    lytContainer: TLayout;
    lytMenu: TLayout;
    lytSubmenu: TLayout;
    lytDescription: TLayout;
    lytImageMenu: TLayout;
    ImageMenu: TImage;
    lblDescription: TLabel;
    MenuHover: TRectangle;
    lytButton: TLayout;
    lytImageIcon: TLayout;
    ImageIcon: TImage;
    ImageBrand: TCircle;
    procedure lytButtonClick(Sender: TObject);
    procedure lytButtonMouseEnter(Sender: TObject);
    procedure lytButtonMouseLeave(Sender: TObject);
    procedure lytButtonResize(Sender: TObject);
  private
    FHeight: Single;
    FComposite: Boolean;
    FBrand: Boolean;
    FProc: TProc<TObject>;

    procedure colorDefault(Value: TAlphaColor = $FFC2C7D0);
    procedure StyleMenu;
    procedure ReadSubMenu(Sender: TObject);

    constructor Create(AOwner: TComponent); override;
  public
    class function New(AOwner: TComponent): TComponentButtonMenu;
    function Alignment(Value: TAlignLayout): TComponentButtonMenu;
    function BrandButton: TComponentButtonMenu;
    function Click(Value: TProc<TObject>): TComponentButtonMenu;
    function ComponentName(Value: String): TComponentButtonMenu;
    function CompositeButton: TComponentButtonMenu;
    function Default: TComponentButtonMenu;
    function Description(Value: String): TComponentButtonMenu;
    function TextAlign(
  Value: TTextAlign): TComponentButtonMenu;
    function FontColor(Value: TAlphaColor): TComponentButtonMenu;
    function FontSize(Value: Single): TComponentButtonMenu;
    function Image(Value: String): TComponentButtonMenu;
    function SingleButton: TComponentButtonMenu;
    function Submenu(Value: TObjectList<TFMXObject>): TComponentButtonMenu;
    function Build: TFMXObject;
  end;

implementation

uses
  pokermanager.services.utils;

{$R *.fmx}

function TComponentButtonMenu.Alignment(
  Value: TAlignLayout): TComponentButtonMenu;
begin
  Result := Self;
  lytContainer.Align := TAlignLayout.None;
  lytContainer.Align := TAlignLayout.Top;
end;

function TComponentButtonMenu.BrandButton: TComponentButtonMenu;
begin
  Result := Self;
  FComposite := False;
  FBrand := True;
  ImageBrand.Visible := True;
end;

function TComponentButtonMenu.Build: TFMXObject;
begin
  Result := lytContainer;
end;

function TComponentButtonMenu.Click(
  Value: TProc<TObject>): TComponentButtonMenu;
begin
  Result := Self;
  FProc := Value;
end;

procedure TComponentButtonMenu.colorDefault(Value: TAlphaColor);
begin
  TUtils.ImageColor(ImageBrand, Value);
  TUtils.ImageColor(ImageIcon, Value);
  TUtils.ImageColor(ImageMenu, Value);
  lblDescription.TextSettings.FontColor := Value;
end;

function TComponentButtonMenu.ComponentName(
  Value: String): TComponentButtonMenu;
begin
  Result := Self;
  Self.Name := Value;
end;

function TComponentButtonMenu.CompositeButton: TComponentButtonMenu;
begin
  Result := Self;
  FComposite := True;
  FBrand := False;
  TUtils.ResourceImage('submenu', ImageMenu);
end;

constructor TComponentButtonMenu.Create(AOwner: TComponent);
begin
  inherited;

end;

function TComponentButtonMenu.Default: TComponentButtonMenu;
begin
  Result := Self;
  if FBrand then
  begin
    colorDefault($FFFFFFFF);
    lblDescription.TextSettings.Font.Size := 14;
  end
  else
  begin
    colorDefault();
    lblDescription.TextSettings.Font.Size := 13;
  end;
end;

function TComponentButtonMenu.Description(Value: String): TComponentButtonMenu;
begin
  Result := Self;
  lblDescription.Text := Value;
end;

function TComponentButtonMenu.FontColor(
  Value: TAlphaColor): TComponentButtonMenu;
begin
  Result := Self;
  lblDescription.TextSettings.FontColor := Value;
end;

function TComponentButtonMenu.FontSize(Value: Single): TComponentButtonMenu;
begin
  Result := Self;
  lblDescription.TextSettings.Font.Size := Value;
end;

function TComponentButtonMenu.Image(Value: String): TComponentButtonMenu;
begin
  Result := Self;

  if FBrand then
    TUtils.ResourceImage(Value, ImageBrand)
  else
    TUtils.ResourceImage(Value, ImageIcon);
end;

procedure TComponentButtonMenu.lytButtonClick(Sender: TObject);
begin
  if not FBrand then
    ReadSubMenu(Sender);
end;

procedure TComponentButtonMenu.lytButtonMouseEnter(Sender: TObject);
begin
  if not FBrand then
  begin
    MenuHover.Fill.Color := $FF494E53;
    lblDescription.TextSettings.FontColor := $FFFFFFFF;
    TUtils.ImageColor(ImageIcon, $FFFC9A03);
    TUtils.ImageColor(ImageMenu, $FFFC9A03);
    lytButton.Cursor := crHandPoint;
  end;
end;

procedure TComponentButtonMenu.lytButtonMouseLeave(Sender: TObject);
begin
  if not FBrand then
  begin
    MenuHover.Fill.Color := TAlphaColorRec.Null;
    lblDescription.TextSettings.FontColor := $FFC2C7D0;
    TUtils.ImageColor(ImageIcon, $FFC2C7D0);
    TUtils.ImageColor(ImageMenu, $FFC2C7D0);
    lytButton.Cursor := crDefault;
  end;
end;

procedure TComponentButtonMenu.lytButtonResize(Sender: TObject);
begin
  StyleMenu;
end;

class function TComponentButtonMenu.New(
  AOwner: TComponent): TComponentButtonMenu;
begin
  Result := Self.Create(AOwner);
end;

procedure TComponentButtonMenu.ReadSubMenu(Sender: TObject);
begin
  if not FComposite then
  begin

    if Assigned(FProc) then
      FProc(Sender);

    exit;
  end;

  lytSubmenu.Visible := not lytSubmenu.Visible;

  if not lytSubmenu.Visible then
  begin
    lytContainer.AnimateFloat('Height', 40, 0.2, TAnimationType.&In,
      TInterpolationType.Linear);

    ImageMenu.AnimateFloat('RotationAngle', 0, 0.2, TAnimationType.&In,
      TInterpolationType.Linear);

    exit;
  end;

  lytContainer.AnimateFloat('Height', (lytContainer.Height + FHeight), 0.2,
    TAnimationType.&In, TInterpolationType.Linear);

  ImageMenu.AnimateFloat('RotationAngle', -90, 0.2, TAnimationType.&In,
    TInterpolationType.Linear);
end;

function TComponentButtonMenu.SingleButton: TComponentButtonMenu;
begin
  Result := Self;
  FComposite := False;
  FBrand := False;
end;

procedure TComponentButtonMenu.StyleMenu;
begin
  lytButton.ShowHint := not (lytContainer.Width > 60);

  if not (lytContainer.Width > 60) then
  begin
    lytDescription.Visible := False;
//    lytImageMenu.Visible := False;
    exit;
  end;

  lytDescription.Visible := True;

//  if FComposite then
//    lytDescription.Visible := True;
//    lytImageMenu.Visible := True;
end;

function TComponentButtonMenu.Submenu(
  Value: TObjectList<TFMXObject>): TComponentButtonMenu;
begin
  Result := Self;
  for var I in Value do
    begin
      FHeight := FHeight + TLayout(I).Height;
      lytSubmenu.AddObject(I);
    end;
end;

function TComponentButtonMenu.TextAlign(
  Value: TTextAlign): TComponentButtonMenu;
begin
  Result := Self;
  lblDescription.TextSettings.HorzAlign := Value;
end;

end.
