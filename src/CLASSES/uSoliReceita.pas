unit uSoliReceita;

interface

type
  TSoliReceita = class
  strict private
    FSTATUS: string;
    FNUM_PEDIDO: integer;
    FCOD_PRODUTO: string;
    FNOME_TEC    : string;
    FDESCRICAO    : STRING;

    procedure SetFSTATUS(val: string);
    function GetFSTATUS: string;

    procedure SetNUMPEDIDO(val: integer);
    function GetNUMPEDIDO: integer;

    procedure SetCODPRODUTO(val: string);
    function GetCODPRODUTO: string;

    procedure SetNOMETEC(val: string);
    function GetNOMETEC: string;

    procedure SetDESCRICAO(val: string);
    function GetDESCRICAO: string;

  public
    property STATUS: string read FSTATUS write FSTATUS;
    property NUMPEDIDO: integer read FNUM_PEDIDO write FNUM_PEDIDO;
    property CODPRODUTO: string read FCOD_PRODUTO write FCOD_PRODUTO;
    property NOMETEC: string read FNOME_TEC write FNOME_TEC;
    property DESCRICAO: string read FDESCRICAO write FDESCRICAO;


    constructor Create;
    destructor Destroy; override;

  end;

implementation

{ TSoliReceita }

constructor TSoliReceita.Create;
begin
  inherited Create;
end;

destructor TSoliReceita.Destroy;
begin

  inherited Destroy;
end;

function TSoliReceita.GetCODPRODUTO: string;
begin
  Result := FCOD_PRODUTO;
end;

function TSoliReceita.GetDESCRICAO: string;
begin
  Result:= FDESCRICAO;
end;

function TSoliReceita.GetNOMETEC: string;
begin
 Result:= FNOME_TEC;
end;

function TSoliReceita.GetNUMPEDIDO: integer;
begin
  Result := FNUM_PEDIDO;
end;

function TSoliReceita.GetFSTATUS: string;
begin
  Result := FSTATUS;
end;

procedure TSoliReceita.SetCODPRODUTO(val: string);
begin
  FCOD_PRODUTO := val;
end;

procedure TSoliReceita.SetDESCRICAO(val: string);
begin

 FDESCRICAO:= val;

end;

procedure TSoliReceita.SetNOMETEC(val: string);
begin
  FNOME_TEC:= val;
end;

procedure TSoliReceita.SetNUMPEDIDO(val: integer);
begin
  FNUM_PEDIDO := val;
end;

procedure TSoliReceita.SetFSTATUS(val: string);
begin
  FSTATUS := val;
end;

end.
