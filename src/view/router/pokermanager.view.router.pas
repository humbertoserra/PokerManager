unit pokermanager.view.router;

interface

uses
  Router4D;

type
  TRouter = class
  private
    constructor Create;
    destructor Destroy; override;
  public
    class function New: TRouter;
  end;

var
  router: TRouter;

implementation

{ TRouter }

uses
  pokermanager.view.layout,
  pokermanager.view.pages.home,
  pokermanager.view.pages.players,
  pokermanager.view.pages.tourney,
  pokermanager.view.pages.blinds;

constructor TRouter.Create;
begin
  TRouter4D.Switch
    .router('Layout', TPageLayout)
    .router('Home', TPageHome)
    .router('Players', TPagePlayers)
    .router('Tourney', TPageTourney)
    .router('Blinds', TPageBlind);
end;

destructor TRouter.Destroy;
begin

  inherited;
end;

class function TRouter.New: TRouter;
begin
  Result := Self.Create;
end;

initialization

router := TRouter.New;

finalization

router.DisposeOf;

end.
