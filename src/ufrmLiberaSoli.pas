unit ufrmLiberaSoli;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Datasnap.DBClient, Vcl.Mask;

type
  TfrmLiberaSoli = class(TForm)
    GridSoli: TDBGrid;
    BtConsultar: TButton;
    BtAssinar: TButton;
    Label1: TLabel;
    EdNumPed: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtConsultarClick(Sender: TObject);
    procedure BtAssinarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLiberaSoli: TfrmLiberaSoli;
  CDS: TClientDataSet;
  DS : TDataSource;

implementation

uses uSoliReceita, uRepositorioSoliReceita, uRepositorioTecAgricula, UCadastroSoliReceita, uPedidoCab,
     UCadastroPedidoCab, URepositorioPedidoCab, Udm;

{$R *.dfm}

procedure TfrmLiberaSoli.BtAssinarClick(Sender: TObject);
var Soli   : TSoliReceita;
    Solicad: TCadastroSoliReceita;
    Pedido: TPedidoCab;
    PedidoCad: TCadastroPedidoCab;
    RepPedido: TRepositorioPedidoCab;

begin

    if CDS.IsEmpty then
      exit;

    Soli   := TSoliReceita.Create;
    Solicad:= TCadastroSoliReceita.Create;
    Pedido:= TPedidoCab.Create;
    RepPedido :=  TRepositorioPedidoCab.Create;


    //Grava STATUS Conclu?do na SOLI_RECEITA e na Pedido_CAB
    try

      DM.FDConnection.StartTransaction();
      try

        Soli.STATUS:= 'C';
        Soli.NUMPEDIDO:= CDS.fieldbyname('Pedido').AsInteger;
        Soli.CODPRODUTO:= CDS.fieldbyname('Codigo').AsString;

        Solicad.Update(Soli);

        Pedido.STATUS:= 'C';
        Pedido.NUMPEDIDO:= CDS.fieldbyname('Pedido').AsInteger;

        RepPedido.MudaStatus(Pedido);

        DM.FDConnection.Commit();

      Except
         on E: Exception do
         begin
            DM.FDConnection.Rollback();
            raise Exception.Create(E.Message);
         end;

      end;

    finally
       FreeAndNil(Soli);
       FreeAndNil(Solicad);
       FreeAndNil(Pedido);
       FreeAndNil(RepPedido);
     end;

     ShowMessage('Opera??o conclu?da com sucesso!');
     EdNumPed.Clear;
     CDS.Close;

end;

procedure TfrmLiberaSoli.BtConsultarClick(Sender: TObject);
var RepSoli: TRepositorioSoliReceita;
begin
   CDS.Close;
   RepSoli:= TRepositorioSoliReceita.Create;
   try
       try
           if trim(EdNumPed.Text)<>'' then
              RepSoli.getSoliReceita(CDS , StrToInt(EdNumPed.Text))
           else
              RepSoli.getSoliReceita(CDS);
       except
         on E: Exception do
         begin
           raise Exception.Create(E.Message);
         end;
       end;

   finally
     FreeAndNil(RepSoli);
   end;


end;

procedure TfrmLiberaSoli.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 CDS.Close;
 FreeAndNil(CDS);
 FreeAndNil(DS);
end;

procedure TfrmLiberaSoli.FormCreate(Sender: TObject);
begin
 //Cria ClientDataset

 CDS:= TClientDataSet.Create(Self);
 CDS.Close;
 CDS.FieldDefs.Clear;
 CDS.FieldDefs.add('Codigo',ftString,10);
 CDS.FieldDefs.add('Descricao',ftString,80);
 CDS.FieldDefs.add('Pedido',ftString,15);
 CDS.FieldDefs.add('Nome',ftString,15);


 CDS.CreateDataSet;

 DS := TDataSource.Create(nil);
 DS.AutoEdit:= false;
 DS.DataSet := CDS;

 GridSoli.DataSource:= DS;

end;

end.
