unit uTecAgricula;

interface



type
  TTecAgricula = class
  strict private
    FNome:string;
    FDocumento:String;
    FDocumentoReg:String;

    procedure SetNome(val : String);
    function GetNome : String;

    procedure SetDocumento(val : String);
    function GetDocumento : String;

    procedure SetDocumentoReg(val : String);
    function GetDocumentoReg : String;

  public

    property Documento : String read GetDocumento write SetDocumento;
    property Nome :  String read GetNome write SetNome;
    property DocumentoReg : String read GetDocumentoReg write SetDocumentoReg;


    function ValidaDocumento(documento : string): boolean;

    constructor Create;
    destructor Destroy; override;
  end;

implementation

function TTecAgricula.GetDocumentoReg: String;
begin
  Result := FDocumentoReg;
end;

procedure TTecAgricula.SetDocumentoReg(val : String);
begin
  FDocumentoReg := val;
end;


function TTecAgricula.GetDocumento: String;
begin
  Result := FDocumento;
end;

procedure TTecAgricula.SetDocumento(val : String);
begin
  FDocumento := val;
end;


function TTecAgricula.GetNome: String;
begin
  Result := FNome;
end;

procedure TTecAgricula.SetNome(val : String);
begin
  FNome := val;
end;

function TTecAgricula.ValidaDocumento(documento : string): boolean;
begin
  Result := false;
  if Length(documento) > 14 then
  begin
    //? um CNPJ
    if documento <> '' then
      Result := true;
  end
  else
  begin
    //? um CPF
    if documento <> '' then
      Result := true;
  end;  
  

end;



constructor TTecAgricula.Create;
begin
	inherited Create;

end;

destructor TTecAgricula.Destroy;
begin

	inherited Destroy;
end;

end.
