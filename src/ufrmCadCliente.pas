unit ufrmCadCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons;

type
  TFrmCadClientes = class(TForm)
    EdCPF: TEdit;
    EdNome: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    BtNovo: TButton;
    BtGravar: TButton;
    BtCons: TButton;
    BtEditar: TButton;
    BtExcluir: TButton;
    PnlCons: TPanel;
    Label3: TLabel;
    EdConsCPF: TEdit;
    BtnOk: TButton;
    procedure BtNovoClick(Sender: TObject);
    procedure BtGravarClick(Sender: TObject);
    procedure BtEditarClick(Sender: TObject);
    procedure BtExcluirClick(Sender: TObject);
    procedure Limpar;
    procedure AtivaCampos;
    procedure DesativaCampos;
    procedure BtConsClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
    function f_ValidaCGCCPF(CGCCPF : String) : Boolean;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadClientes: TFrmCadClientes;
  Acao: string;



implementation

  uses UCliente, UCadastroCliente, URepositorioCliente ;

{$R *.dfm}

procedure TFrmCadClientes.AtivaCampos;
begin
 EdCPF.Enabled:=true;
 EdNome.Enabled:=true;
 EdCPF.SetFocus;
end;

procedure TFrmCadClientes.BitBtn1Click(Sender: TObject);
var Cliente: TCliente;
    RepCliente : TRepositorioCliente;
begin

  if trim (EdConsCPF.Text) <> ''then
  begin

     Cliente:= TCliente.Create;
     RepCliente := TRepositorioCliente.Create;

     try
        try
          Cliente:= RepCliente.getCliente(EdConsCPF.Text);
        except
          on E: Exception do
          begin
            raise Exception.Create(E.Message);
          end;
        end;

        EdCPF.Text:= Cliente.Documento;
        EdNome.Text:= Cliente.Nome;

     finally
      FreeAndNil(Cliente);
      FreeAndNil(RepCliente);
     end;


    DesativaCampos;
    Acao:= 'Consulta'
  end;







end;

procedure TFrmCadClientes.BtConsClick(Sender: TObject);
begin
  Limpar;
  PnlCons.Visible:= true;
  EdConsCPF.SetFocus;
end;

procedure TFrmCadClientes.BtExcluirClick(Sender: TObject);
var Cliente: TCliente;
    CadCliente : TCadastroCliente;
begin

  if Acao = 'Consulta' then
  begin
     If MessageDlg('Voc? tem certeza que deseja excluir este cliente?',mtConfirmation,[mbyes,mbno],0)=mryes then
     begin

           Cliente:= TCliente.Create;
           CadCliente:= TCadastroCliente.Create;
           try
             Cliente.Nome:= EdNome.Text;
             Cliente.Documento:= EdCPF.Text;

             try
             CadCliente.Delete(Cliente);
             except
              on E: Exception do
              begin
                 raise Exception.Create(E.Message);
              end;
            end;

           finally
              FreeAndNil(Cliente);
              FreeAndNil(CadCliente);
           end;

           ShowMessage('Cliente Exclu?do com Sucesso!');
           Limpar;
           DesativaCampos;
           Acao:= '';

     end;
  end;



end;

procedure TFrmCadClientes.BtGravarClick(Sender: TObject);
var Cliente: TCliente;
    CadCliente : TCadastroCliente;
begin
   if (Acao = 'Novo') or (Acao = 'Editar') then
   begin

       if not f_ValidaCGCCPF(EdCPF.Text) then
       begin
          ShowMessage('CPF inv?lido');
          EdCPF.SetFocus;
          Exit;
       end;

      if (trim(EdNome.text)='') then
       begin
          ShowMessage('Informe o Nome');
          EdCPF.SetFocus;
          Exit;
       end;

       Cliente:= TCliente.Create;
       CadCliente:= TCadastroCliente.Create;

       try
         Cliente.Nome:= EdNome.Text;
         Cliente.Documento:= EdCPF.Text;

         if Acao = 'Novo' then
           CadCliente.Insert(Cliente)
         else
         if Acao = 'Editar' then
         begin
           CadCliente.Update(Cliente);
         end;

       finally
        FreeAndNil(Cliente);
        FreeAndNil(CadCliente);
       end;

       Limpar;
       DesativaCampos;
       Acao:= '';

       ShowMessage('Gravado com Sucesso!');
   end;

end;

procedure TFrmCadClientes.BtNovoClick(Sender: TObject);
begin
 AtivaCampos;
 Limpar;
 Acao:='Novo';
end;



procedure TFrmCadClientes.BtnOkClick(Sender: TObject);
var Cliente: TCliente;
    RepCliente : TRepositorioCliente;
begin
if trim (EdConsCPF.Text) <> ''then
  begin

     Cliente:= TCliente.Create;
     RepCliente := TRepositorioCliente.Create;

     try
        try
          Cliente:= RepCliente.getCliente(EdConsCPF.Text);
        except
          on E: Exception do
          begin
            raise Exception.Create(E.Message);
          end;
        end;

        EdCPF.Text:= Cliente.Documento;
        EdNome.Text:= Cliente.Nome;

     finally
      FreeAndNil(Cliente);
      FreeAndNil(RepCliente);
     end;


    DesativaCampos;
    Acao:= 'Consulta'
  end;
end;

procedure TFrmCadClientes.BtEditarClick(Sender: TObject);
begin
  if Acao = 'Consulta' then
  begin
    EdNome.Enabled:=true;
    EdNome.SetFocus;
    Acao:='Editar';
  end;


end;

procedure TFrmCadClientes.DesativaCampos;
begin
 EdCPF.Enabled:=false;
 EdNome.Enabled:=false;
 PnlCons.Visible:= False;
end;

Function TFrmCadClientes.f_ValidaCGCCPF(CGCCPF : String) : Boolean;
var
  V_CGCCPF, resultado : string;
  Total : real;
  auxCont, contador,auxiliar : integer;
  //
  function RetiraCaracteresIndesejaveis(CGCCPF : String) : String;
  var
     i: Integer;
     V_CGCCPF : string;
  begin
     i := 1;
     V_CGCCPF := CGCCPF;
     while i <= length(trim(V_CGCCPF))
     do begin
       if (copy(V_CGCCPF, i, 1) <> '0') and
          (copy(V_CGCCPF, i, 1) <> '1') and
          (copy(V_CGCCPF, i, 1) <> '2') and
          (copy(V_CGCCPF, i, 1) <> '3') and
          (copy(V_CGCCPF, i, 1) <> '4') and
          (copy(V_CGCCPF, i, 1) <> '5') and
          (copy(V_CGCCPF, i, 1) <> '6') and
          (copy(V_CGCCPF, i, 1) <> '7') and
          (copy(V_CGCCPF, i, 1) <> '8') and
          (copy(V_CGCCPF, i, 1) <> '9')
       then begin
          V_CGCCPF := copy(V_CGCCPF, 1, i - 1) + copy(V_CGCCPF, i + 1, length(trim(V_CGCCPF)) - 1);
          dec(i);
       end;
       inc(i);
     end;
     result := V_CGCCPF;
  end;

  function f_TudoIgual(pCgcCpf: string) : boolean;
  var
    j, cont: integer;
    caracter: string;
  begin
    cont := 1;

    caracter := copy(pCgcCpf, 1 , 1);

    for j:= 1 to length(pCgcCpf) do
      if copy(pCgcCpf, j+1, 1) = caracter then
        cont := cont + 1;

    if cont = length(pCgcCpf) then
      result := true
    else
      result := false;
  end;

begin
  result := False;
  V_CGCCPF := RetiraCaracteresIndesejaveis(CGCCPF);
  if f_TudoIgual(V_CGCCPF) then
    exit;
  if (length(V_CGCCPF) < 11) or ((length(V_CGCCPF) > 11) and (length(V_CGCCPF) <> 14))
     then exit;
  resultado := copy(V_CGCCPF, 1, length(V_CGCCPF) - 2); // 12
  AuxCont   := 0;
  contador  := length(V_CGCCPF) - 2;
  auxiliar  := 2;
  total     := 0;
  while (AuxCont <= 1)
  do begin
    contador := contador + AuxCont;
    while (contador >= 1)
    do begin
      total := total + (StrToInt(resultado[contador]) * auxiliar);
      dec(contador);
      inc(auxiliar);
      if (auxiliar = 10) and (length(V_CGCCPF) = 14)
         then auxiliar := 2;
    end;
    total := StrToFloat(copy(FloatToStr(1000 - (int(Total * 10 / 11))), length(floattostr(1000 - (int(Total * 10 / 11)))),1));
    resultado := resultado + FloatToStr(total);
    AuxCont := Auxcont + 1;
    contador := length(V_CGCCPF) - 2;
    auxiliar := 2;
    total := 0;
  end;
  if (V_CGCCPF = resultado)
     then result := True;
end;

procedure TFrmCadClientes.Limpar;
begin
 EdCPF.Clear;
 EdNome.Clear;
 EdConsCPF.Clear ;
 PnlCons.Visible:= false;

end;

end.
