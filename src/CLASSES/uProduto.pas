unit uProduto;

interface

type
  TProduto = class
  strict private

    FCODIGO: String;
    FCONTROLE: String;
    FPRECO: double;
    FDESCRICAO: string;

    procedure SetCodigo(val: String);
    function GetCodigo: String;

    procedure SetControle(val: String);
    function GetControle: String;

    procedure SetPreco(val: double);
    function GetPreco: double;

    procedure SetDescricao(val: String);
    function GetDescricao: String;

  public

    property CODIGO: String read GetCodigo write SetCodigo;
    property CONTROLE: String read GetControle write SetControle;
    property PRECO: double read GetPreco write SetPreco;
    property DESCRICAO: String read GetDescricao write SetDescricao;

    constructor Create;
    destructor Destroy; override;
  end;

implementation

constructor TProduto.Create;
begin
  inherited Create;

end;

destructor TProduto.Destroy;
begin

  inherited Destroy;
end;

function TProduto.GetCodigo: String;
begin
  Result := FCODIGO;
end;

function TProduto.GetControle: String;
begin
  Result := FCONTROLE;
end;

function TProduto.GetDescricao: String;
begin
  Result := FDESCRICAO;
end;

function TProduto.GetPreco: double;
begin
  Result := FPRECO;
end;

procedure TProduto.SetCodigo(val: String);
begin
  FCODIGO := val;

end;

procedure TProduto.SetControle(val: String);
begin
  FCONTROLE := val;
end;

procedure TProduto.SetDescricao(val: String);
begin
  FDESCRICAO := val;
end;

procedure TProduto.SetPreco(val: double);
begin
  FPRECO := val;

end;

end.
