unit pokermanager.view.layout;

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
  FMX.Layouts,
  FMX.Controls.Presentation,
  FMX.MultiView,
  FMX.StdCtrls,
  FMX.Objects,
  Router4D,
  Router4D.Interfaces;

type
  TPageLayout = class(TForm, iRouter4DComponent)
    lytContainer: TLayout;
    lytContents: TLayout;
    MultiView: TMultiView;
    lytSidebar: TLayout;
    lytHeader: TLayout;
    Line3: TLine;
    lytNavbar: TLayout;
    lytButtonMenu: TLayout;
    ImageMenu: TImage;
    btnMenu: TLayout;
    lytFooter: TLayout;
    recBackgroundFooter: TRectangle;
    Line1: TLine;
    lytFooterContents: TLayout;
    lytCopyright: TLayout;
    lblCopyright: TLabel;
    lblCredits: TLabel;
    lblCreditsManager: TLabel;
    lblReserved: TLabel;
    lytVersion: TLayout;
    lblVersion: TLabel;
    lblVersionLabel: TLabel;
    lytContent: TLayout;
    Background: TRectangle;
    procedure lytContentMouseEnter(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure MultiViewResize(Sender: TObject);
    procedure btnMenuClick(Sender: TObject);
    procedure btnMenuMouseEnter(Sender: TObject);
    procedure btnMenuMouseLeave(Sender: TObject);
  private
    procedure RenderSidebar;
  public
    function Render: TFMXObject;
    procedure UnRender;
  end;

implementation

uses
  pokermanager.services.utils,
  pokermanager.view.pages.home,
  pokermanager.view.component.sidebar;

{$R *.fmx}

procedure TPageLayout.btnMenuClick(Sender: TObject);
begin
  lytContents.Margins.Left :=
    TUtils.IFF<Single>(MultiView.Width > 60, 60, 250);

  MultiView.Width :=
    TUtils.IFF<Single>(MultiView.Width > 60, 60, 250);
end;

procedure TPageLayout.btnMenuMouseEnter(Sender: TObject);
begin
  btnMenu.Cursor := crHandPoint;
end;

procedure TPageLayout.btnMenuMouseLeave(Sender: TObject);
begin
  btnMenu.Cursor := crDefault;
end;

procedure TPageLayout.FormCreate(Sender: TObject);
begin
  TUtils.ResourceImage('menu', ImageMenu);
  lblVersion.Text := TUtils.getVersionArq;
end;

procedure TPageLayout.lytContentMouseEnter(Sender: TObject);
begin
  btnMenu.Cursor := crDefault;
end;

procedure TPageLayout.MultiViewResize(Sender: TObject);
begin
  lytContents.Margins.Left :=
    TUtils.IFF<Single>(MultiView.Width > 60, 250, 60);

  MultiView.Width :=
    TUtils.IFF<Single>(MultiView.Width > 60, 250, 60);
end;

function TPageLayout.Render: TFMXObject;
begin
  RenderSidebar;
  Result := lytContainer;
  TRouter4D.Render<TPageHome>.SetElement(lytContent);
end;

procedure TPageLayout.RenderSidebar;
begin
  lytSidebar.AddObject(TComponentSidebar.New(Self).Build);
end;

procedure TPageLayout.UnRender;
begin

end;

end.
