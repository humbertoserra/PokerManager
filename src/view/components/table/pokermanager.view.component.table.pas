unit pokermanager.view.component.table;

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
  FMX.Objects,
  FMX.Controls.Presentation,
  FMX.Layouts,
  FMX.Effects;

type
  TTransfer = record
    ColumnTitle: String;
    ColumnName: String;
    ColumnValue: Variant;
  end;

  TComponentTable = class(TFrame)
    lytContainer: TLayout;
    Background: TRectangle;
    ShadowEffect1: TShadowEffect;
    lytHeader: TLayout;
    lytTable: TLayout;
    lytTableHeader: TLayout;
    VertScrollBox: TVertScrollBox;
    Layout1: TLayout;
    lytFixedItem: TLayout;
    lytFixedAction: TLayout;
    lytColumns: TLayout;
    lytSearch: TLayout;
    lblTable: TLabel;
    Line1: TLine;
    lytHeaderContents: TLayout;
    Line2: TLine;
    Layout2: TLayout;
    lytImageIcon: TLayout;
    ImageIcon: TImage;
    lblPage: TLabel;
    Layout3: TLayout;
    BackgroundButton: TRectangle;
    Layout4: TLayout;
    lytImageButton: TLayout;
    lblButtonCaption: TLabel;
    ImageButton: TImage;
    Layout5: TLayout;
    Layout6: TLayout;
    lblRegister: TLabel;
    lblItem: TLabel;
    lblAction: TLabel;
    lytButton: TLayout;
    procedure lytButtonClick(Sender: TObject);
    procedure lytButtonMouseEnter(Sender: TObject);
    procedure lytButtonMouseLeave(Sender: TObject);
  private
    FList: TDictionary<String, TTransfer>;
    FProc: TProc<TObject>;

  public
    class function New(AOwner: TComponent): TComponentTable;
    function Nome(Value: String): TComponentTable;
    function Page(Value: String): TComponentTable;
    function table(Value: String): TComponentTable;
    function ImagePage(Value: String): TComponentTable;
    function ImageButtons(Value: String): TComponentTable;
    function StyleButton(Value: String): TComponentTable;
    function Click(Value: TProc<TObject>): TComponentTable;
    function Build(Value: TDictionary<String, TTransfer>): TFMXObject;
  end;

implementation

{$R *.fmx}

uses
  pokermanager.services.utils,
  pokermanager.view.styles;


function TComponentTable.Build(Value: TDictionary<String, TTransfer>)
  : TFMXObject;
begin
  { for var I := 0 to Pred(Value.Count) do
    VertScrollBox1.AddObject(
    TComponentListaTable.New(Self)
    .Nome(Value[I].Nome)
    .Item(Value[I].Item)
    .Descricao(Value[I].Descricao)
    .Desde(Value[I].Desde)
    .Cargo(Value[I].Cargo)
    .Salario(Value[I].Salario)
    .Alinhamento(TAlignLayout.Top)
    .Build); }

  Result := lytContainer;
end;

function TComponentTable.Click(Value: TProc<TObject>): TComponentTable;
begin
  Result := Self;
  FProc := Value;
end;

function TComponentTable.Nome(Value: String): TComponentTable;
begin
  Result := Self;
  Self.Name := Value;
end;

function TComponentTable.ImageButtons(Value: String): TComponentTable;
begin
  Result := Self;
  TUtils.ResourceImage(Value, ImageButton);
end;

function TComponentTable.ImagePage(Value: String): TComponentTable;
begin
  Result := Self;
  TUtils.ResourceImage(Value, ImageIcon);
end;

procedure TComponentTable.lytButtonClick(Sender: TObject);
begin
  if Assigned(FProc) then
    FProc(Sender);
end;

procedure TComponentTable.lytButtonMouseEnter(Sender: TObject);
begin
  lytButton.Cursor := crHandPoint;
end;

procedure TComponentTable.lytButtonMouseLeave(Sender: TObject);
begin
  lytButton.Cursor := crDefault;
end;

class function TComponentTable.New(AOwner: TComponent): TComponentTable;
begin
  Result := Self.Create(AOwner);
end;

function TComponentTable.Page(Value: String): TComponentTable;
begin
  Result := Self;
  lblPage.Text := Value;
end;

function TComponentTable.StyleButton(Value: String): TComponentTable;
begin
  Result := Self;
end;

function TComponentTable.table(Value: String): TComponentTable;
begin
  Result := Self;
  lblTable.Text := Value;
end;

end.
