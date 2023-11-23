unit pokermanager.view.pages.home;

interface

uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  Router4d.Interfaces,
  FMX.Types,
  FMX.Controls,
  FMX.Forms,
  FMX.Graphics,
  FMX.Dialogs,
  FMX.Layouts,
  FMX.Controls.Presentation,
  FMX.StdCtrls,
  FMX.Objects;

type
  TPageHome = class(TForm, iRouter4DComponent)
    lytContainer: TLayout;
    lytHeaderContents: TLayout;
    lblTitle: TLabel;
    lytContents: TLayout;
    lytImageIcon: TLayout;
    ImageIcon: TImage;
    procedure FormCreate(Sender: TObject);
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

{ TPageHome }

procedure TPageHome.FormCreate(Sender: TObject);
begin
  RenderHeader;
end;

function TPageHome.Render: TFMXObject;
begin
  Result := lytContainer;
end;

procedure TPageHome.RenderHeader;
begin
  Tutils.ResourceImage('dashboard', ImageIcon);
end;

procedure TPageHome.UnRender;
begin

end;

end.
