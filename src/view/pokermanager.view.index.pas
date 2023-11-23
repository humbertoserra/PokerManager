unit pokermanager.view.index;

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
  FMX.Objects,
  FMX.Controls.Presentation,
  FMX.StdCtrls,
  Router4D;

type
  TPageIndex = class(TForm)
    lytContainer: TLayout;
    lytHeader: TLayout;
    Background: TRectangle;
    lytLogout: TLayout;
    btnBackground: TRectangle;
    ImageLogout: TImage;
    btnLogout: TLayout;
    lytLogo: TLayout;
    ImageStamp: TImage;
    procedure btnLogoutClick(Sender: TObject);
    procedure btnLogoutMouseEnter(Sender: TObject);
    procedure btnLogoutMouseLeave(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    procedure UploadImages;
    procedure Animation(aLayout: TFMXObject);
  public
    { Public declarations }
  end;

var
  PageIndex: TPageIndex;

implementation

uses
  pokermanager.services.utils,
  pokermanager.view.layout;

{$R *.fmx}

procedure TPageIndex.Animation(aLayout: TFMXObject);
begin
  TLayout(aLayout).Opacity := 0;
  TLayout(aLayout).AnimateFloat('Opacity', 1, 0.9);
end;

procedure TPageIndex.btnLogoutClick(Sender: TObject);
begin
  Close;
end;

procedure TPageIndex.btnLogoutMouseEnter(Sender: TObject);
begin
  btnBackground.Fill.Color := $FFC42B1C;
end;

procedure TPageIndex.btnLogoutMouseLeave(Sender: TObject);
begin
  btnBackground.Fill.Color := $FF343A40;
  btnLogout.Cursor := crDefault;
end;

procedure TPageIndex.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := TCloseAction.caFree;
  PageIndex := nil;
end;

procedure TPageIndex.FormCreate(Sender: TObject);
begin
  UploadImages;
  TRouter4D.Render<TPageLayout>.SetElement(lytContainer, lytContainer);
  TRouter4D.Link.Animation(Animation);
end;

procedure TPageIndex.UploadImages;
begin
  TUtils.ResourceImage('logo', ImageStamp);
  TUtils.ResourceImage('logout', ImageLogout);
  TUtils.ImageColor(ImageLogout, $FFFFFFFF);
end;

end.
