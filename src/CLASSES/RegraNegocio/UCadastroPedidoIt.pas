{
 -------------------------------------------------------------------------------
 -- Objetivo....: Classe de regra de negocio de objetos TPedidoIt
 -- Autor.......: Jeferson Brizola
 -------------------------------------------------------------------------------
}


unit UCadastroPedidoIt;

interface

uses Classes, SysUtils, URepositorioPedidoIt, UPedidoIt;

type
  TCadastroPedidoIt = class
  private
    function ValidaDados(pPedidoIt: TPedidoIt):boolean; 
  public
    procedure Insert(pPedidoIt: TPedidoIt);
    procedure Update(pPedidoIt: TPedidoIt);
    procedure Delete(pPedidoIt: TPedidoIt);
  end; 

implementation 
                                                                                                      
{ TCadastroPedidoIt } 
                                                                                                      
function TCadastroPedidoIt.ValidaDados(pPedidoIt: TPedidoIt):boolean; 
begin                                                                                                 
  Result := true;                                                                                     
end;                                                                                                  
                                                                                                      
procedure TCadastroPedidoIt.Insert( pPedidoIt: TPedidoIt);
begin                                                                                                 
  if ValidaDados(pPedidoIt) then                                                       
  begin                                                                                               
    with TRepositorioPedidoIt.Create() do
    begin                                                                                             
      try                                                                                             
        Insert(pPedidoIt);                                                                 
      finally                                                                                         
        Free;                                                                                         
      end;                                                                                            
    end;                                                                                              
  end                                                                                                 
  else                                                                                                
    raise Exception.Create('Dados inválidos!!!');                                 
end;                                                                                                  
                                                                                                      
procedure TCadastroPedidoIt.Update(pPedidoIt: TPedidoIt);
begin                                                                                                 
  if ValidaDados(pPedidoIt) then                                                       
  begin                                                                                               
    with TRepositorioPedidoIt.Create() do
    begin                                                                                             
      try                                                                                             
        Update(pPedidoIt);                                                                 
      finally                                                                                         
        Free;                                                                                         
      end;                                                                                            
    end;                                                                                              
  end                                                                                                 
  else                                                                                                
    raise Exception.Create('Dados inválidos!!!');                                 
end;                                                                                                  
                                                                                                      
procedure TCadastroPedidoIt.Delete( pPedidoIt: TPedidoIt);
begin                                                                                                 
  if ValidaDados(pPedidoIt) then                                                       
  begin                                                                                               
    with TRepositorioPedidoIt.Create() do
    begin                                                                                             
      try                                                                                             
        Delete(pPedidoIt);                                                                 
      finally                                                                                         
        Free;                                                                                         
      end;                                                                                            
    end;                                                                                              
  end                                                                                                 
  else                                                                                                
    raise Exception.Create('Dados inválidos!!!');                                 
end;                                                                                                  
                                                                                                      
end.                                                                                                  