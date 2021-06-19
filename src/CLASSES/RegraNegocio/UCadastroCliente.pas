{
 -------------------------------------------------------------------------------
 -- Objetivo....: Classe de regra de negocio de objetos TCliente
 -- Autor.......: Jeferson Brizola
 -------------------------------------------------------------------------------
}



unit UCadastroCliente;

interface

uses Classes, SysUtils, URepositorioCliente, UCliente;

type
  TCadastroCliente = class
  private
    function ValidaDados(pCliente: TCliente):boolean;
  public
    procedure Insert( pCliente: TCliente);
    procedure Update( pCliente: TCliente);
    procedure Delete( pCliente: TCliente);
  end; 

implementation 
                                                                                                      
{ TCadastroCliente } 
                                                                                                      
function TCadastroCliente.ValidaDados(pCliente: TCliente):boolean;
  var Rep: TRepositorioCliente ;
      Cliente: TCliente;
begin
  try
    Rep    := TRepositorioCliente.Create ;
    Cliente:= TCliente.Create;
    try
      Cliente:= Rep.getCliente(pCliente.Documento);
      Result := false;
    Except
      Result := true;
    end;

  finally
    Cliente.Free;
    Rep.Free;
  end;
end;

procedure TCadastroCliente.Insert( pCliente: TCliente);
begin                                                                                                 
  if ValidaDados(pCliente) then
  begin                                                                                               
    with TRepositorioCliente.Create() do
    begin                                                                                             
      try
        Insert(pCliente);                                                                 
      finally
        Free;
      end;                                                                                            
    end;                                                                                              
  end                                                                                                 
  else                                                                                                
    raise Exception.Create('CPF já cadastrado!');
end;                                                                                                  
                                                                                                      
procedure TCadastroCliente.Update( pCliente: TCliente);
begin                                                                                                 
  if ValidaDados(pCliente) then                                                       
  begin                                                                                               
    with TRepositorioCliente.Create() do
    begin                                                                                             
      try                                                                                             
        Update(pCliente);                                                                 
      finally                                                                                         
        Free;                                                                                         
      end;                                                                                            
    end;                                                                                              
  end                                                                                                 
  else                                                                                                
    raise Exception.Create('Dados inválidos!!!');                                 
end;                                                                                                  
                                                                                                      
procedure TCadastroCliente.Delete(pCliente: TCliente);
begin                                                                                                 
  if ValidaDados(pCliente) then                                                       
  begin                                                                                               
    with TRepositorioCliente.Create() do
    begin                                                                                             
      try                                                                                             
        Delete(pCliente);                                                                 
      finally                                                                                         
        Free;                                                                                         
      end;                                                                                            
    end;                                                                                              
  end                                                                                                 
  else                                                                                                
    raise Exception.Create('Dados inválidos!!!');                                 
end;                                                                                                  
                                                                                                      
end.                                                                                                  