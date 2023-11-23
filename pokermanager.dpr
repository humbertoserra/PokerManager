program pokermanager;

{$R *.dres}

uses
  System.StartUpCopy,
  FMX.Forms,
  pokermanager.view.index in 'src\view\pokermanager.view.index.pas' {PageIndex},
  pokermanager.services.utils in 'src\services\pokermanager.services.utils.pas',
  pokermanager.view.router in 'src\view\router\pokermanager.view.router.pas',
  pokermanager.view.layout in 'src\view\layout\pokermanager.view.layout.pas' {PageLayout},
  pokermanager.view.pages.home in 'src\view\pages\home\pokermanager.view.pages.home.pas' {PageHome},
  pokermanager.view.component.sidebar in 'src\view\components\sidebar\pokermanager.view.component.sidebar.pas' {ComponentSidebar: TFrame},
  pokermanager.view.component.buttonmenu in 'src\view\components\buttonmenu\pokermanager.view.component.buttonmenu.pas' {ComponentButtonMenu: TFrame},
  pokermanager.view.pages.players in 'src\view\pages\players\pokermanager.view.pages.players.pas' {PagePlayers},
  pokermanager.view.pages.tourney in 'src\view\pages\tourney\pokermanager.view.pages.tourney.pas' {PageTourney},
  pokermanager.view.pages.blinds in 'src\view\pages\blinds\pokermanager.view.pages.blinds.pas' {PageBlind},
  pokermanager.view.styles in 'src\view\styles\pokermanager.view.styles.pas',
  pokermanager.view.styles.states in 'src\view\styles\pokermanager.view.styles.states.pas',
  pokermanager.view.component.table in 'src\view\components\table\pokermanager.view.component.table.pas' {ComponentTable: TFrame};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TPageIndex, PageIndex);
  Application.Run;
end.
