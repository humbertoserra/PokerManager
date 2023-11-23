unit pokermanager.view.pages.blinds;

interface

uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  FMX.Types,
  FMX.Controls,
  FMX.Forms,
  FMX.Graphics,
  FMX.Dialogs,
  FMX.Objects,
  FMX.Controls.Presentation,
  FMX.StdCtrls,
  FMX.Layouts,
  Router4D.Interfaces, FMX.Effects;

type
  TPageBlind = class(TForm, iRouter4DComponent)
    lytContainer: TLayout;
    lytHeaderContents: TLayout;
    lblTitle: TLabel;
    lytImageIcon: TLayout;
    ImageIcon: TImage;
    lytContents: TLayout;
    lytProfile: TLayout;
    lytTable: TLayout;
    Line2: TLine;
    Layout1: TLayout;
    Rectangle1: TRectangle;
    ShadowEffect1: TShadowEffect;
    Layout2: TLayout;
    Layout3: TLayout;
    Line1: TLine;
    Rectangle2: TRectangle;
    ShadowEffect2: TShadowEffect;
    Layout4: TLayout;
    Layout5: TLayout;
    Line3: TLine;
    procedure FormCreate(Sender: TObject);
    procedure lytContentsResize(Sender: TObject);
  private
    procedure RenderHeader;
  public
    function Render: TFMXObject;
    procedure UnRender;
  end;

implementation

uses
  pokermanager.services.utils;

{$R *.fmx}

procedure TPageBlind.FormCreate(Sender: TObject);
begin
  RenderHeader;
end;

procedure TPageBlind.lytContentsResize(Sender: TObject);
begin
  TUtils.ResponsiveLayout(lytContents,2, 10);
end;

function TPageBlind.Render: TFMXObject;
begin
  Result := lytContainer;
end;

procedure TPageBlind.RenderHeader;
begin
  Tutils.ResourceImage('blinds', ImageIcon);
end;

procedure TPageBlind.UnRender;
begin

end;

end.
