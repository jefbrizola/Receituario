unit uFachada;

interface

uses
  uCliente, uctrlCliente, DBClient;

type
  TFachada = class
  private
    FCtrlCliente : TCtrlCliente;
  public
    function ConsultaCliente(Id : integer): TCliente; overload;
    function ConsultaCliente(nome : string): TClientDataSet; overload;
    procedure SalvarCliente(Cliente:TCliente);
    procedure AtualizarCliente(Cliente:TCliente);
    procedure ExcluirCliente(Cliente:TCliente);
    constructor Create;
    destructor Destroy; override;
  end;

implementation



function TFachada.ConsultaCliente(Id : integer): TCliente;
begin
  Result := FCtrlCliente.ConsultaCliente(id);
end;

procedure TFachada.SalvarCliente(Cliente:TCliente);
begin
  FCtrlCliente.SalvarCliente(Cliente);
end;

procedure TFachada.AtualizarCliente(Cliente:TCliente);
begin
  FCtrlCliente.AtualizarCliente(Cliente);
end;

procedure TFachada.ExcluirCliente(Cliente:TCliente);
begin
  FCtrlCliente.ExcluirCliente(Cliente);
end;


function TFachada.ConsultaCliente(nome: string): TClientDataSet;
begin
  Result :=  FCtrlCliente.ConsultaCliente(nome);
end;

constructor TFachada.Create;
begin
	inherited Create;
  FCtrlCliente := TCtrlCliente.Create;
end;

destructor TFachada.Destroy;
begin
  FCtrlCliente.Free;
	inherited Destroy;
end;

end.
