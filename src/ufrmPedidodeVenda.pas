unit ufrmPedidodeVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.Mask, Vcl.DBCtrls, Datasnap.DBClient;

type
  TfrmPedidodeVenda = class(TForm)
    GridPedido: TDBGrid;
    GroupBox1: TGroupBox;
    EdCPF: TEdit;
    EdNome: TEdit;
    Label2: TLabel;
    Label1: TLabel;
    GroupBox2: TGroupBox;
    EdCodProd: TEdit;
    EdDescr: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    BtIncluir: TButton;
    BtNovo: TButton;
    BtGravar: TButton;
    Label5: TLabel;
    EdValor: TEdit;
    BtCancelar: TButton;
    EdTotal: TEdit;
    Label6: TLabel;
    LabNumpedido: TLabel;
    EdNumPedido: TEdit;
    EdQtd: TEdit;
    Label7: TLabel;
    BtnOk: TButton;
    BtnOk2: TButton;
    LabelAviso: TLabel;
    procedure Limpar;
    procedure Desativar;
    procedure Ativar;
    procedure BtIncluirClick(Sender: TObject);
    procedure BtNovoClick(Sender: TObject);
    procedure BtCancelarClick(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
    procedure BtnOk2Click(Sender: TObject);
    procedure BtGravarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPedidodeVenda: TfrmPedidodeVenda;
  Acao: string;
  ControleReg: string;
  CDS: TClientDataSet;
  DS : TDataSource;


implementation

uses UCliente, UCadastroCliente, URepositorioCliente, Uproduto, Ucadastroproduto, Urepositorioproduto,
     uPedidoCab,uPedidoIt,UCadastroPedidoCab,UCadastroPedidoIt, URepositorioPedidoCab, URepositorioPedidoIt, uSoliReceita,UCadastroSoliReceita,
     uDM;

{$R *.dfm}

procedure TfrmPedidodeVenda.Limpar;
begin
  EdNumPedido.Clear;
  EdCPF.Clear;
  EdNome.Clear;
  EdCodProd.Clear;
  EdDescr.Clear;
  EdValor.Clear;
  CDS.Close;
  EdTotal.Text:='0';
  LabelAviso.Visible:=false;
end;

procedure TfrmPedidodeVenda.BtNovoClick(Sender: TObject);
var repPedido : TRepositorioPedidoCab;
begin
 Limpar;
 Ativar;
 Acao:= 'Novo';

  repPedido := TRepositorioPedidoCab.Create;
  try
     EdNumPedido.Text := IntToStr(repPedido.getSequencia);
  finally
    FreeAndNil(repPedido);
  end;

  EdCPF.SetFocus;
  CDS.Open;

end;



procedure TfrmPedidodeVenda.Desativar;
begin
 EdCPF.Enabled:=false;
 EdQtd.Enabled:=false;
end;

procedure TfrmPedidodeVenda.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 CDS.Close;
 FreeAndNil(CDS);
 FreeAndNil(DS);
end;

procedure TfrmPedidodeVenda.FormCreate(Sender: TObject);
begin
 Desativar;

 //Cria ClientDataset

 CDS:= TClientDataSet.Create(Self);
 CDS.Close;
 CDS.FieldDefs.Clear;
 CDS.FieldDefs.add('Codigo',ftString,10);
 CDS.FieldDefs.add('Descricao',ftString,80);
 CDS.FieldDefs.add('Quantidade',ftFloat);
 CDS.FieldDefs.add('Valor',ftCurrency);
 CDS.FieldDefs.add('ControleReg',ftString,15);

 CDS.CreateDataSet;

 DS := TDataSource.Create(nil);
 DS.AutoEdit:= false;
 DS.DataSet := CDS;

 GridPedido.DataSource:= DS;



end;

procedure TfrmPedidodeVenda.BtGravarClick(Sender: TObject);
var Pedido: TPedidoCab;
    PedidoItem: TPedidoIt;
    PedidoCad: TCadastroPedidoCab;
    PedidoCadIt: TCadastroPedidoIt;
    SoliReceita: TSoliReceita;
    SoliReceitaCad:TCadastroSoliReceita;
    TemControlado: Boolean;

begin
  IF Acao= 'Novo' THEN
  begin
    Pedido:= TPedidoCab.Create;
    PedidoItem:= TPedidoIt.Create;
    PedidoCad:= TCadastroPedidoCab.Create;
    PedidoCadIt:= TCadastroPedidoIt.Create;
    SoliReceita:= TSoliReceita.Create;
    SoliReceitaCad:=TCadastroSoliReceita.Create;

    try

      Pedido.NUMPEDIDO:= StrToInt(EdNumPedido.Text);
      Pedido.CLIENTECPF:= EdCPF.Text;
      Pedido.DTEMISSAO:= FormatDateTime('dd.mm.yyyy', now);
      Pedido.PRECOTOTAL:=StrToFloat(EdTotal.Text);

      CDS.First;

      try
          DM.FDConnection.StartTransaction();

          while not CDS.Eof do
          begin
            PedidoItem.PRODUTO:=CDS.fieldbyname('Codigo').AsString;
            PedidoItem.NUMPEDIDO:= Pedido.NUMPEDIDO;
            PedidoItem.QTD:= CDS.FieldByName('Quantidade').AsFloat;
            PedidoItem.PRECOUNIT := CDS.FieldByName('Valor').AsFloat;

            PedidoCadIt.Insert(PedidoItem);

            //Se produto controlado, grava na tabela de solicita??o.
            if trim(CDS.FieldByName('ControleReg').AsString) <> '' then
            begin
             SoliReceita.NUMPEDIDO:= Pedido.NUMPEDIDO;
             SoliReceita.CODPRODUTO:= CDS.fieldbyname('Codigo').AsString;
             SoliReceita.STATUS:= 'A';  //"Aguardando Receita"
             SoliReceitaCad.Insert(SoliReceita);
             TemControlado:=true;
            end;

            CDS.Next;
          end;

          if TemControlado then
             Pedido.STATUS:= 'A' //Aguardando Receita
          else
             Pedido.STATUS:= 'C';//Conclu?do.

          PedidoCad.Insert(Pedido);

          DM.FDConnection.Commit();
      except
         on E: Exception do
         begin
            DM.FDConnection.Rollback();
            raise Exception.Create(E.Message);
         end;
      end;


    finally
      FreeAndNil(Pedido);
      FreeAndNil(PedidoItem);
      FreeAndNil(PedidoCad);
      FreeAndNil(PedidoCadIt);
      FreeAndNil(SoliReceita);
      FreeAndNil(SoliReceitaCad);

    end;


     Limpar;
     Desativar;
     Acao:='';
     ShowMessage('Gravado com Sucesso!');


  end;














end;

procedure TfrmPedidodeVenda.BtIncluirClick(Sender: TObject);
var Tot: double;

begin
 if  trim(EdDescr.Text)<>'' then
 begin

   CDS.Insert;
   CDS.fieldbyname('Codigo').AsString:= EdCodProd.Text;
   CDS.FieldByName('Descricao').AsString:= EdDescr.Text;
   CDS.FieldByName('Quantidade').AsFloat:= StrToFloat(EdQtd.Text);
   CDS.FieldByName('Valor').AsFloat:= (StrToFloat(EdQtd.Text)*StrToFloat(EdValor.Text));
   CDS.FieldByName('ControleReg').AsString:=ControleReg;


   EdCodProd.Clear;
   EdDescr.Clear;
   EdQtd.Clear;
   EdValor.Clear;
   EdCodProd.SetFocus;
   LabelAviso.Visible:=false;

   Tot:= StrToFloat(EdTotal.Text) +CDS.FieldByName('Valor').AsFloat;

   EdTotal.Text := FloatToStr(Tot);
 end;

end;

procedure TfrmPedidodeVenda.BtnOk2Click(Sender: TObject);
VAR Produto: TProduto;
    RepProduto: TRepositorioProduto;

begin
  if trim (EdCodProd.Text) <> ''then
  begin

    Produto:= TProduto.Create;
    RepProduto:= TRepositorioProduto.Create;

     try
        try
          Produto:= RepProduto.getProduto(EdCodProd.Text);
        except
          on E: Exception do
          begin
            raise Exception.Create(E.Message);
          end;
        end;

        EdCodProd.Text:= Produto.CODIGO;
        EdDescr.Text := Produto.DESCRICAO;
        EdValor.Text := FloatToStr(produto.PRECO);

        if trim(Produto.CONTROLE)<>'' then
        begin
          ControleReg:= Produto.CONTROLE;
          LabelAviso.Visible:=true;
        end
        else
        begin
          ControleReg:=' ';
          LabelAviso.Visible:=false;
        end;

     finally
      FreeAndNil(Produto);
      FreeAndNil(RepProduto);
     end;


    EdQtd.SetFocus;

  end;
end;

procedure TfrmPedidodeVenda.BtnOkClick(Sender: TObject);
var Cliente: TCliente;
    RepCliente : TRepositorioCliente;
begin
  if trim (EdCPF.Text) <> ''then
  begin

     Cliente:= TCliente.Create;
     RepCliente := TRepositorioCliente.Create;

     try
        try
          Cliente:= RepCliente.getCliente(EdCPF.Text);
        except
          on E: Exception do
          begin
            raise Exception.Create(E.Message);
          end;
        end;

        EdNome.Text:= Cliente.Nome;

     finally
      FreeAndNil(Cliente);
      FreeAndNil(RepCliente);
     end;

    EdCodProd.SetFocus;

  end;
end;

procedure TfrmPedidodeVenda.Ativar;
begin
 EdCPF.Enabled:=true;
 EdQtd.Enabled:=true;
end;

procedure TfrmPedidodeVenda.BtCancelarClick(Sender: TObject);
begin

 Limpar;
 Desativar;
 Acao:= '';

end;

end.
