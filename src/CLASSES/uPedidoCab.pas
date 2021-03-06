
unit uPedidoCab;

interface


type
  TPedidoCab = class
   strict private

    FPRECO_TOTAL                    : double    ;
    FCLIENTE_CPF                    : string          ;
    FSTATUS                         : string         ;
    FDT_EMISSAO                     : string          ;
    FNUM_PEDIDO                     : integer         ;

    procedure SetPRECOTOTAL(val : double);
    function GetPRECOTOTAL : double;

    procedure SetCLIENTECPF(val : String);
    function GetCLIENTECPF : String;

    procedure SetSTATUS(val : String);
    function GetSTATUS : String;

    procedure SetDTEMISSAO(val : String);
    function GetDTEMISSAO : String;

    procedure SetNUMPEDIDO(val : integer);
    function GetNUMPEDIDO : integer;

  public

    property PRECOTOTAL                               : double          read FPRECO_TOTAL                    write FPRECO_TOTAL                    ;
    property CLIENTECPF                               : string          read FCLIENTE_CPF                    write FCLIENTE_CPF                    ;
    property STATUS                                   : string         read FSTATUS                          write FSTATUS                         ;
    property DTEMISSAO                                : string          read FDT_EMISSAO                     write FDT_EMISSAO                     ;
    property NUMPEDIDO                                : integer         read FNUM_PEDIDO                     write FNUM_PEDIDO                     ;

    constructor Create;
    destructor Destroy; override;
  end;

implementation

{ TPedidoCab }


constructor TPedidoCab.Create;
begin
	inherited Create;

end;

destructor TPedidoCab.Destroy;
begin

	inherited Destroy;
end;

function TPedidoCab.GetCLIENTECPF: String;
begin
 Result:= FCLIENTE_CPF;

end;

function TPedidoCab.GetDTEMISSAO: String;
begin

 Result:= FDT_EMISSAO;

end;

function TPedidoCab.GetNUMPEDIDO: integer;
begin
 Result:= FNUM_PEDIDO ;
end;

function TPedidoCab.GetPRECOTOTAL: double;
begin
 Result:=  FPRECO_TOTAL;
end;

function TPedidoCab.GetSTATUS: String;
begin
 Result:= FSTATUS ;
end;

procedure TPedidoCab.SetCLIENTECPF(val: String);
begin
FCLIENTE_CPF := val;

end;

procedure TPedidoCab.SetDTEMISSAO(val: String);
begin
FDT_EMISSAO:= val;
end;

procedure TPedidoCab.SetNUMPEDIDO(val: integer);
begin
FNUM_PEDIDO:= val;
end;

procedure TPedidoCab.SetPRECOTOTAL(val: double);
begin
FPRECO_TOTAL:= val;
end;

procedure TPedidoCab.SetSTATUS(val: String);
begin
FSTATUS:= val;
end;

end.