unit uFrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus;

type
  TFrmPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    Cadastrodecliente1: TMenuItem;
    CadastrodeProdutos1: TMenuItem;
    PedidodeVenda1: TMenuItem;
    Solicitaodereceita1: TMenuItem;
    procedure Cadastrodecliente1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CadastrodeProdutos1Click(Sender: TObject);
    procedure PedidodeVenda1Click(Sender: TObject);
    procedure Solicitaodereceita1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

{$R *.dfm}

uses UfrmCadCliente, uDM, uFrmCadProduto, ufrmPedidodeVenda, ufrmLiberaSoli ;

procedure TFrmPrincipal.Cadastrodecliente1Click(Sender: TObject);
begin
  try
    FrmCadClientes:= TFrmCadClientes.Create(Self);
    FrmCadClientes.ShowModal;
  finally
     FreeAndNil(FrmCadClientes);
  end;
end;

procedure TFrmPrincipal.CadastrodeProdutos1Click(Sender: TObject);
begin
  try
    FrmCadProduto:= TFrmCadproduto.Create(Self);
    FrmCadProduto.ShowModal;
  finally
     FreeAndNil(FrmCadProduto);
  end;

end;

procedure TFrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DM.FDConnection.Connected:= false;
  FreeAndNil(DM);
end;

procedure TFrmPrincipal.FormCreate(Sender: TObject);
begin
  DM := TDM.Create(nil);
  DM.FDConnection.Connected:= True;
end;

procedure TFrmPrincipal.PedidodeVenda1Click(Sender: TObject);
begin
  try
    frmPedidodeVenda:= TfrmPedidodeVenda.Create(Self);
    frmPedidodeVenda.ShowModal;
  finally
     FreeAndNil(frmPedidodeVenda);
  end;

end;

procedure TFrmPrincipal.Solicitaodereceita1Click(Sender: TObject);
begin
  try
    frmLiberaSoli:= TfrmLiberaSoli.Create(Self);
    frmLiberaSoli.ShowModal;
  finally
     FreeAndNil(frmLiberaSoli);
  end;

end;

end.
