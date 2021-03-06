unit uPedidoIt;

interface

type
  TPedidoIt = class
  strict private
    FPRECO_UNIT: double;
    FNUM_PEDIDO: integer;
    FPRODUTO: string;
    FQTD: double;


    procedure SetPRECOUNIT(val: double);
    function GetPRECOUNIT: double;

    procedure SetNUMPEDIDO(val: integer);
    function GetNUMPEDIDO: integer;

    procedure SetPRODUTO(val: String);
    function GetPRODUTO: String;

    procedure SetQTD(val: double);
    function GetQTD: double;

  public
    property PRECOUNIT: double read FPRECO_UNIT write FPRECO_UNIT;
    property NUMPEDIDO: integer read FNUM_PEDIDO write FNUM_PEDIDO;
    property PRODUTO: string read FPRODUTO write FPRODUTO;
    property QTD: double read FQTD write FQTD;

    constructor Create;
    destructor Destroy; override;
  end;

implementation

{ TPedidoIt }

constructor TPedidoIt.Create;
begin
  inherited Create;
end;

destructor TPedidoIt.Destroy;
begin

  inherited Destroy;
end;

function TPedidoIt.GetNUMPEDIDO: integer;
begin
  Result := FNUM_PEDIDO;
end;

function TPedidoIt.GetPRECOUNIT: double;
begin
  Result := FPRECO_UNIT;
end;

function TPedidoIt.GetPRODUTO: String;
begin
  Result := FPRODUTO;
end;

function TPedidoIt.GetQTD: double;
begin
  Result := FQTD;
end;

procedure TPedidoIt.SetNUMPEDIDO(val: integer);
begin
  FNUM_PEDIDO := val;
end;

procedure TPedidoIt.SetPRECOUNIT(val: double);
begin
  FPRECO_UNIT := val;
end;

procedure TPedidoIt.SetPRODUTO(val: String);
begin
  FPRODUTO := val;
end;

procedure TPedidoIt.SetQTD(val: double);
begin
  FQTD := val;
end;

end.
