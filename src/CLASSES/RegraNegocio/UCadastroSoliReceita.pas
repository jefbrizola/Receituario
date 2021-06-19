{
 -------------------------------------------------------------------------------

 -- Objetivo....: Classe de regra de negocio de objetos TSoliReceita
 -- Autor.......: Jeferson Brizola
 -------------------------------------------------------------------------------
}



unit UCadastroSoliReceita;

interface

uses Classes, SysUtils, URepositorioSoliReceita, USoliReceita;

type
  TCadastroSoliReceita = class
  private
    function ValidaDados(pSoliReceita: TSoliReceita):boolean; 
  public
    procedure Insert( pSoliReceita: TSoliReceita);
    procedure Update( pSoliReceita: TSoliReceita);
    procedure Delete(pSoliReceita: TSoliReceita);
  end; 

implementation 
                                                                                                      
{ TCadastroSoliReceita } 
                                                                                                      
function TCadastroSoliReceita.ValidaDados(pSoliReceita: TSoliReceita):boolean; 
begin                                                                                                 
  Result := true;                                                                                     
end;                                                                                                  
                                                                                                      
procedure TCadastroSoliReceita.Insert(pSoliReceita: TSoliReceita);
begin                                                                                                 
  if ValidaDados(pSoliReceita) then                                                       
  begin                                                                                               
    with TRepositorioSoliReceita.Create() do
    begin                                                                                             
      try                                                                                             
        Insert(pSoliReceita);                                                                 
      finally                                                                                         
        Free;                                                                                         
      end;                                                                                            
    end;                                                                                              
  end                                                                                                 
  else                                                                                                
    raise Exception.Create('Dados inválidos!!!');                                 
end;                                                                                                  
                                                                                                      
procedure TCadastroSoliReceita.Update(pSoliReceita: TSoliReceita);
begin                                                                                                 
  if ValidaDados(pSoliReceita) then                                                       
  begin                                                                                               
    with TRepositorioSoliReceita.Create() do
    begin                                                                                             
      try                                                                                             
        Update(pSoliReceita);                                                                 
      finally                                                                                         
        Free;                                                                                         
      end;                                                                                            
    end;                                                                                              
  end                                                                                                 
  else                                                                                                
    raise Exception.Create('Dados inválidos!!!');                                 
end;                                                                                                  
                                                                                                      
procedure TCadastroSoliReceita.Delete(pSoliReceita: TSoliReceita);
begin                                                                                                 
  if ValidaDados(pSoliReceita) then                                                       
  begin                                                                                               
    with TRepositorioSoliReceita.Create() do
    begin                                                                                             
      try                                                                                             
        Delete(pSoliReceita);                                                                 
      finally                                                                                         
        Free;                                                                                         
      end;                                                                                            
    end;                                                                                              
  end                                                                                                 
  else                                                                                                
    raise Exception.Create('Dados inválidos!!!');                                 
end;                                                                                                  
                                                                                                      
end.                                                                                                  