{
 -------------------------------------------------------------------------------
 -- Objetivo....: Classe de regra de negocio de objetos TTecAgricula
 -- Autor.......: Jeferson Brizola
 -------------------------------------------------------------------------------
}



unit UCadastroTecAgricula;

interface

uses Classes, SysUtils, URepositorioTecAgricula, UTecAgricula;

type
  TCadastroTecAgricula = class
  private
    function ValidaDados(pTecAgricula: TTecAgricula):boolean; 
  public
    procedure Insert( pTecAgricula: TTecAgricula);
    procedure Update( pTecAgricula: TTecAgricula);
    procedure Delete( pTecAgricula: TTecAgricula);
  end; 

implementation 
                                                                                                      
{ TCadastroTecAgricula } 
                                                                                                      
function TCadastroTecAgricula.ValidaDados(pTecAgricula: TTecAgricula):boolean; 
begin                                                                                                 
  Result := true;                                                                                     
end;                                                                                                  
                                                                                                      
procedure TCadastroTecAgricula.Insert(pTecAgricula: TTecAgricula);
begin                                                                                                 
  if ValidaDados(pTecAgricula) then                                                       
  begin                                                                                               
    with TRepositorioTecAgricula.Create() do
    begin                                                                                             
      try                                                                                             
        Insert(pTecAgricula);                                                                 
      finally                                                                                         
        Free;                                                                                         
      end;                                                                                            
    end;                                                                                              
  end                                                                                                 
  else                                                                                                
    raise Exception.Create('Dados inv?lidos!!!');                                 
end;                                                                                                  
                                                                                                      
procedure TCadastroTecAgricula.Update(pTecAgricula: TTecAgricula);
begin                                                                                                 
  if ValidaDados(pTecAgricula) then                                                       
  begin                                                                                               
    with TRepositorioTecAgricula.Create() do
    begin                                                                                             
      try                                                                                             
        Update(pTecAgricula);                                                                 
      finally                                                                                         
        Free;                                                                                         
      end;                                                                                            
    end;                                                                                              
  end                                                                                                 
  else                                                                                                
    raise Exception.Create('Dados inv?lidos!!!');                                 
end;                                                                                                  

procedure TCadastroTecAgricula.Delete(pTecAgricula: TTecAgricula);
begin                                                                                                 
  if ValidaDados(pTecAgricula) then                                                       
  begin                                                                                               
    with TRepositorioTecAgricula.Create() do
    begin                                                                                             
      try                                                                                             
        Delete(pTecAgricula);                                                                 
      finally                                                                                         
        Free;                                                                                         
      end;                                                                                            
    end;                                                                                              
  end                                                                                                 
  else                                                                                                
    raise Exception.Create('Dados inv?lidos!!!');                                 
end;                                                                                                  
                                                                                                      
end.                                                                                                  