unit pokermanager.view.pages.players;

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
  FMX.Objects,
  FMX.Controls.Presentation,
  FMX.StdCtrls,
  FMX.Layouts;

type
  TPagePlayers = class(TForm, iRouter4DComponent)
    lytContainer: TLayout;
    lytHeaderContents: TLayout;
    lblTitle: TLabel;
    lytImageIcon: TLayout;
    ImageIcon: TImage;
    lytContents: TLayout;
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

{ TPagePlayers }

procedure TPagePlayers.FormCreate(Sender: TObject);
begin
  RenderHeader;
end;

function TPagePlayers.Render: TFMXObject;
begin
  Render := lytContainer;
end;

procedure TPagePlayers.RenderHeader;
begin
  Tutils.ResourceImage('players', ImageIcon);
end;

procedure TPagePlayers.UnRender;
begin

end;

end.
