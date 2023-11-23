unit pokermanager.view.pages.tourney;

interface

uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  System.Generics.Collections,
  FMX.Types,
  FMX.Controls,
  FMX.Forms,
  FMX.Graphics,
  FMX.Dialogs,
  FMX.Objects,
  FMX.Controls.Presentation,
  FMX.StdCtrls,
  FMX.Layouts,
  Router4D,
  Router4D.Interfaces;

type
  TPageTourney = class(TForm, iRouter4DComponent)
    lytContainer: TLayout;
    procedure FormCreate(Sender: TObject);
  private
//    procedure RenderHeader;
  public
    function Render: TFMXObject;
    procedure UnRender;
  end;

implementation

uses
  pokermanager.services.utils,
  pokermanager.view.component.table;

{$R *.fmx}

{ TPageTourney }

procedure TPageTourney.FormCreate(Sender: TObject);
begin
//  RenderHeader;
end;

function TPageTourney.Render: TFMXObject;
begin
  var lLista := TDictionary<String, TTransfer>.Create;
//  for var I := 0 to 10 do
//  begin
//    var lTransfer: TTransfer;
//    lTransfer.Nome := 'Frame' + I.ToString;
//    lTransfer.Item := I.ToString;
//    lTransfer.Descricao := 'Colaborador '+I.ToString;
//    lTransfer.Cargo := 'Cargo ' + I.ToString;
//    lTransfer.Salario := Round(I);
//    lLista.Add(lTransfer);
//  end;

  lytContainer.AddObject(
    TComponentTable.New(Self)
      .Nome('tourney')
      .Page('Criar Torneio')
      .table('Lista de Torneios')
      .ImagePage('structure')
      .ImageButtons('edit')
      .Click(procedure (Sender: TObject)
      begin
        TRouter4D.Link.&To('Home');
      end)
    .Build(lLista));

  Result := lytContainer;
end;

//procedure TPageTourney.RenderHeader;
//begin
//  Tutils.ResourceImage('structure', ImageIcon);
//end;

procedure TPageTourney.UnRender;
begin

end;

end.
