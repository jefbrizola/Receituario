unit uCliente;

interface



type
  TCliente = class
  strict private
    FNome:string;
    FDocumento:String;
    procedure SetNome(val : String);
    function GetNome : String;
    procedure SetDocumento(val : String);
    function GetDocumento : String;

  public

    property Documento : String read GetDocumento write SetDocumento;
    property Nome :  String read GetNome write SetNome;
    function ValidaDocumento(documento : string): boolean;

    constructor Create;
    destructor Destroy; override;
  end;

implementation



function TCliente.GetDocumento: String;
begin
  Result := FDocumento;
end;

procedure TCliente.SetDocumento(val : String);
begin
  FDocumento := val;
end;


function TCliente.GetNome: String;
begin
  Result := FNome;
end;

procedure TCliente.SetNome(val : String);
begin
  FNome := val;
end;

function TCliente.ValidaDocumento(documento : string): boolean;
begin
  Result := false;
  if Length(documento) > 14 then
  begin
    //é um CNPJ
    if documento <> '' then
      Result := true;
  end
  else
  begin
    //é um CPF
    if documento <> '' then
      Result := true;
  end;  
  

end;



constructor TCliente.Create;
begin
	inherited Create;

end;

destructor TCliente.Destroy;
begin

	inherited Destroy;
end;

end.
