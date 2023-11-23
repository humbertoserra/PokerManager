unit pokermanager.view.component.sidebar;

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
  FMX.Layouts,
  FMX.Objects,
  Router4D;

type
  TComponentSidebar = class(TFrame)
    lytContainer: TLayout;
    recBackground: TRectangle;
    lytMenu: TLayout;
    lytBrand: TLayout;
    Line1: TLine;
  private
    procedure CreateBrand;
    procedure CreateMenu;
    function CreateSubmenuConfig: TObjectList<TFMXObject>;
  public
    class function New(AOwner: TComponent): TComponentSidebar;
    function Build: TFMXObject;
  end;

implementation

{$R *.fmx}

uses
  pokermanager.view.component.buttonmenu;

{ TComponentSidebar }

function TComponentSidebar.Build: TFMXObject;
begin
  CreateBrand;
  CreateMenu;
  Result := lytContainer;
end;

procedure TComponentSidebar.CreateBrand;
begin
  lytBrand.AddObject(
    TComponentButtonMenu.New(Self)
      .ComponentName('brand')
      .BrandButton
      .Description('MONTEIRO POKER CLUB')
      .TextAlign(TTextAlign.Center)
      .Image('stamp')
      .Alignment(TAlignLayout.Center)
      .Default
    .Build);
end;

procedure TComponentSidebar.CreateMenu;
begin
  lytMenu.AddObject(
    TComponentButtonMenu.New(Self)
      .ComponentName('dashboard')
      .SingleButton
      .Image('dashboard')
      .Description('Dashboard')
      .Default
      .Click(procedure (Sender: TObject)
        begin
          TRouter4D.Link.&To('Home')
        end)
      .Alignment(TAlignLayout.Top)
    .Build);

  lytMenu.AddObject(
    TComponentButtonMenu.New(Self)
      .ComponentName('users')
      .SingleButton
      .Image('user')
      .Description('Usuários')
      .Default
      .Alignment(TAlignLayout.Top)
    .Build);

  lytMenu.AddObject(
    TComponentButtonMenu.New(Self)
      .ComponentName('config')
      .CompositeButton
      .Image('config')
      .Description('Configurações')
      .Default
      .Submenu(CreateSubmenuConfig)
      .Alignment(TAlignLayout.Top)
    .Build);

  lytMenu.AddObject(
    TComponentButtonMenu.New(Self)
      .ComponentName('players')
      .SingleButton
      .Image('players')
      .Description('Players')
      .Default
      .Click(procedure (Sender: TObject)
        begin
          TRouter4D.Link.&To('Players')
        end)
      .Alignment(TAlignLayout.Top)
    .Build);

  lytMenu.AddObject(
    TComponentButtonMenu.New(Self)
      .ComponentName('lobby')
      .SingleButton
      .Image('lobby')
      .Description('Lobby')
      .Default
//      .Click(procedure (Sender: TObject)
//        begin
//          TRouter4D.Link.&To('Players')
//        end)
      .Alignment(TAlignLayout.Top)
    .Build);

{
  lytMenu.AddObject(
    TComponentButtonMenu.New(Self)
      .ComponentName('config')
      .CompositeButton
      .Image('config')
      .Description('Configurações')
      .Default
      .Submenu(CreateSubmenuConfig)
      .Alignment(TAlignLayout.Top)
    .Build);

  lytMenu.AddObject(
    TComponentButtonMenu.New(Self)
      .ComponentName('users')
      .SingleButton
      .Image('user')
      .Description('Usuários')
      .Default
      .Alignment(TAlignLayout.Top)
    .Build);
}
end;

function TComponentSidebar.CreateSubmenuConfig: TObjectList<TFMXObject>;
begin
  var lLista := TObjectList<TFmxObject>.Create;

  lLista.Add(
    TComponentButtonMenu.New(Self)
      .ComponentName('blind')
      .SingleButton
      .Image('blinds')
      .Description('Estrutura de Blinds')
      .Default
      .Click(procedure (Sender: TObject)
        begin
          TRouter4D.Link.&To('Blinds')
        end)
      .Alignment(TAlignLayout.Top)
    .Build);

  lLista.Add(
    TComponentButtonMenu.New(Self)
      .ComponentName('structure')
      .SingleButton
      .Image('structure')
      .Description('Estrutura de Torneio')
      .Default
      .Click(procedure (Sender: TObject)
        begin
          TRouter4D.Link.&To('Tourney')
        end)
      .Alignment(TAlignLayout.Top)
    .Build);

  lLista.Add(
    TComponentButtonMenu.New(Self)
      .ComponentName('club')
      .SingleButton
      .Image('poker')
      .Description('Dados do Clube')
      .Default
      .Alignment(TAlignLayout.Top)
    .Build);

  Result := lLista;
end;

class function TComponentSidebar.New(AOwner: TComponent): TComponentSidebar;
begin
  Result := Self.Create(AOwner);
end;

end.
