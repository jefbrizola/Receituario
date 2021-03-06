program Receituario;

uses
  Vcl.Forms,
  ufrmCadProduto in 'ufrmCadProduto.pas' {FrmCadProduto},
  uProduto in 'CLASSES\uProduto.pas',
  uTecAgricula in 'CLASSES\uTecAgricula.pas',
  uPedidoCab in 'CLASSES\uPedidoCab.pas',
  USoliReceita in 'CLASSES\USoliReceita.pas',
  uDM in 'uDM.pas' {DM: TDataModule},
  uFrmPrincipal in 'uFrmPrincipal.pas' {FrmPrincipal},
  uRepositorioTecAgricula in 'CLASSES\Persistencia\uRepositorioTecAgricula.pas',
  uRepositorioProduto in 'CLASSES\Persistencia\uRepositorioProduto.pas',
  uRepositorioPedidoCab in 'CLASSES\Persistencia\uRepositorioPedidoCab.pas',
  uPedidoIt in 'CLASSES\uPedidoIt.pas',
  uRepositorioPedidoIt in 'CLASSES\Persistencia\uRepositorioPedidoIt.pas',
  uRepositorioSoliReceita in 'CLASSES\Persistencia\uRepositorioSoliReceita.pas',
  UCadastroCliente in 'CLASSES\RegraNegocio\UCadastroCliente.pas',
  UCadastroPedidoCab in 'CLASSES\RegraNegocio\UCadastroPedidoCab.pas',
  UCadastroPedidoIt in 'CLASSES\RegraNegocio\UCadastroPedidoIt.pas',
  UCadastroProduto in 'CLASSES\RegraNegocio\UCadastroProduto.pas',
  UCadastroSoliReceita in 'CLASSES\RegraNegocio\UCadastroSoliReceita.pas',
  UCadastroTecAgricula in 'CLASSES\RegraNegocio\UCadastroTecAgricula.pas',
  URepositorioCliente in 'CLASSES\Persistencia\URepositorioCliente.pas',
  ufrmCadCliente in 'ufrmCadCliente.pas' {FrmCadClientes},
  ufrmPedidodeVenda in 'ufrmPedidodeVenda.pas' {frmPedidodeVenda},
  uCliente in 'CLASSES\uCliente.pas',
  ufrmLiberaSoli in 'ufrmLiberaSoli.pas' {frmLiberaSoli};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.Run;
end.
