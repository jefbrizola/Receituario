unit UfrmCadProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TFrmCadProduto = class(TForm)
    EdCodigo: TEdit;
    EdDescr: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    BtNovo: TButton;
    BtGravar: TButton;
    BtCons: TButton;
    Label3: TLabel;
    EdValor: TEdit;
    CheckBoxContrl: TCheckBox;
    BtEditar: TButton;
    BtExcluir: TButton;
    PnlCons: TPanel;
    Label4: TLabel;
    EdConsProd: TEdit;
    EdTecA: TEdit;
    Label5: TLabel;
    BtnOk: TButton;
    procedure Limpar;
    procedure AtivaCampos;
    procedure DesativaCampos;
    procedure BtNovoClick(Sender: TObject);
    procedure BtConsClick(Sender: TObject);
    procedure BtExcluirClick(Sender: TObject);
    procedure BtEditarClick(Sender: TObject);
    procedure BtGravarClick(Sender: TObject);
    procedure CheckBoxContrlClick(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadProduto: TFrmCadProduto;
  Acao: string;

implementation

 uses    Uproduto, Ucadastroproduto, Urepositorioproduto;

{$R *.dfm}

procedure TFrmCadProduto.AtivaCampos;
begin
  if Acao <> 'Editar'  then
   EdCodigo.Enabled:=true
  else
   EdCodigo.Enabled:=false;

  EdDescr.Enabled:=true;
  EdValor.Enabled:=true ;
  EdTecA.Enabled:= true;

end;

procedure TFrmCadProduto.BtConsClick(Sender: TObject);
begin
  Limpar;
  PnlCons.Visible:= true;
  EdConsProd.SetFocus;
end;

procedure TFrmCadProduto.BtEditarClick(Sender: TObject);
begin
  if Acao = 'Consulta' then
  begin
    Acao:='Editar';
    AtivaCampos;
    EdDescr.SetFocus;
  end;
end;

procedure TFrmCadProduto.BtExcluirClick(Sender: TObject);
var Produto: Tproduto;
    CadProduto : TCadastroProduto;
begin
  if Acao = 'Consulta' then
  begin
     If MessageDlg('Você tem certeza que deseja excluir este Produto?',mtConfirmation,[mbyes,mbno],0)=mryes then
     begin

           Produto:= Tproduto.Create;
           CadProduto:= TCadastroProduto.Create;
           try
             Produto.CODIGO:= EdCodigo.Text;

             try
             CadProduto.Delete(Produto);
             except
              on E: Exception do
              begin
                 raise Exception.Create(E.Message);
              end;
            end;

           finally
              FreeAndNil(Produto);
              FreeAndNil(CadProduto);
           end;

           ShowMessage('Produto Excluído com Sucesso!');
           Limpar;
           DesativaCampos;

     end;
  end;
end;

procedure TFrmCadProduto.BtGravarClick(Sender: TObject);
var Produto: TProduto ;
    CadProduto : TCadastroProduto;
begin
   if (Acao = 'Novo') or (Acao = 'Editar') then
   begin


       if (CheckBoxContrl.Checked)and (trim(EdTecA.Text)= '') then
       begin
           ShowMessage('Informe o registro do Técnico agrícula!');
           EdTecA.SetFocus;
           Exit;
       end;

       if (trim(EdCodigo.Text)='') or (trim(EdDescr.text)='') or (trim(EdValor.text)='') then
       begin
          ShowMessage('Informe o código do produto, Descrição e valor!');
          EdCodigo.SetFocus;
          Exit;
       end;

       Produto:= TProduto.Create;
       CadProduto:= TCadastroProduto.Create;


       try
          Produto.CODIGO:= EdCodigo.Text;
          Produto.DESCRICAO:= EdDescr.Text;
          produto.PRECO:= StrToFloat(EdValor.Text);
          if CheckBoxContrl.Checked then
                Produto.CONTROLE:= EdTecA.Text;

         if Acao = 'Novo' then
           CadProduto.Insert(Produto)
         else
         if Acao = 'Editar' then
         begin
           CadProduto.Update(Produto);
         end;

       finally
        FreeAndNil(CadProduto);
        FreeAndNil(CadProduto);
       end;

       Limpar;
       DesativaCampos;
       Acao:= '';
       ShowMessage('Gravado com Sucesso!');
   end;

end;

procedure TFrmCadProduto.BtnOkClick(Sender: TObject);
var Produto: TProduto ;
    RepProduto : TRepositorioProduto;
begin

  if trim (EdConsProd.Text) <> ''then
  begin

    Produto:= TProduto.Create;
    RepProduto:= TRepositorioProduto.Create;

     try
        try
          Produto:= RepProduto.getProduto(EdConsProd.Text);
        except
          on E: Exception do
          begin
            raise Exception.Create(E.Message);
          end;
        end;

        EdCodigo.Text:= Produto.CODIGO;
        EdDescr.Text := Produto.DESCRICAO;
        EdValor.Text := FloatToStr(produto.PRECO);
        EdTecA.Text  := Produto.CONTROLE;
        if  trim(EdTecA.Text) <> '' then
           CheckBoxContrl.Checked:=true;

     finally
      FreeAndNil(Produto);
      FreeAndNil(RepProduto);
     end;


    DesativaCampos;
    Acao:= 'Consulta'
  end;

end;

procedure TFrmCadProduto.BtNovoClick(Sender: TObject);
begin
 DesativaCampos;
 AtivaCampos;
 Limpar;
 EdCodigo.SetFocus;
 Acao:='Novo';

end;

procedure TFrmCadProduto.CheckBoxContrlClick(Sender: TObject);
begin
  if CheckBoxContrl.Checked then
  begin
     EdTecA.Enabled:= true;
     EdTecA.SetFocus;
  end
  else
  begin
     EdTecA.Enabled:= false;
     EdTecA.Clear;
  end;

end;

procedure TFrmCadProduto.DesativaCampos;
begin
  EdCodigo.Enabled:=false;
  EdDescr.Enabled:=false;
  EdValor.Enabled:=false ;
  PnlCons.Visible:= false;
  EdTecA.Enabled:= false;
end;

procedure TFrmCadProduto.FormCreate(Sender: TObject);
begin
    DesativaCampos;
end;

procedure TFrmCadProduto.Limpar;
begin
  EdCodigo.Clear;
  EdDescr.Clear;
  EdValor.Clear;
  EdConsProd.Clear;
  CheckBoxContrl.Checked:=false;
  EdTecA.Clear;
end;

end.
