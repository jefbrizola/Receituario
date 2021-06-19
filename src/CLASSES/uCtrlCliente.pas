unit uCtrlCliente;

interface

uses
  uCliente, uRepCliente, DBClient;

type
  TCtrlCliente = class
  public
    function ConsultaCliente(Id : integer): TCliente; overload;
    function ConsultaCliente(nome : string): TClientDataSet; overload;
    procedure SalvarCliente(Cliente:TCliente);
    procedure AtualizarCliente(Cliente:TCliente);
    procedure ExcluirCliente(Cliente:TCliente);
    constructor Create;
    destructor Destroy; override;

  strict private var
    FRepCliente:TRepCliente;
  end;

implementation

function TCtrlCliente.ConsultaCliente(Id : integer): TCliente;
begin
  Result := FRepCliente.ConsultaCliente(Id);
end;

procedure TCtrlCliente.SalvarCliente(Cliente:TCliente);
begin
  FRepCliente.SalvarCliente(Cliente);
end;

procedure TCtrlCliente.AtualizarCliente(Cliente:TCliente);
begin
  FRepCliente.AtualizarCliente(Cliente);
end;

procedure TCtrlCliente.ExcluirCliente(Cliente:TCliente);
begin
  FRepCliente.ExcluirCliente(Cliente);
end;

function TCtrlCliente.ConsultaCliente(nome: string): TClientDataSet;
begin
  Result := FRepCliente.ConsultaCliente(nome);
end;

constructor TCtrlCliente.Create;
begin
	inherited Create;
  FRepCliente := TRepCliente.create;
end;

destructor TCtrlCliente.Destroy;
begin
  FRepCliente.Free;
	inherited Destroy;
end;

end.
