{
 -------------------------------------------------------------------------------
 -- Objetivo....: Classe de regra de negocio de objetos TPedidoCab
 -- Autor.......: Jeferson Brizola
 -------------------------------------------------------------------------------
}



unit UCadastroPedidoCab;

interface

uses Classes, SysUtils, URepositorioPedidoCab, UPedidoCab;

type
  TCadastroPedidoCab = class
  private
    function ValidaDados(pPedidoCab: TPedidoCab):boolean; 
  public
    procedure Insert( pPedidoCab: TPedidoCab);
    procedure Update(pPedidoCab: TPedidoCab);
    procedure Delete(pPedidoCab: TPedidoCab);
  end; 

implementation 
                                                                                                      
{ TCadastroPedidoCab } 
                                                                                                      
function TCadastroPedidoCab.ValidaDados(pPedidoCab: TPedidoCab):boolean; 
begin                                                                                                 
  Result := true;                                                                                     
end;                                                                                                  

procedure TCadastroPedidoCab.Insert(pPedidoCab: TPedidoCab);
begin                                                                                                 
  if ValidaDados(pPedidoCab) then                                                       
  begin                                                                                               
    with TRepositorioPedidoCab.Create() do
    begin                                                                                             
      try                                                                                             
        Insert(pPedidoCab);                                                                 
      finally                                                                                         
        Free;                                                                                         
      end;                                                                                            
    end;                                                                                              
  end                                                                                                 
  else                                                                                                
    raise Exception.Create('Dados inv?lidos!!!');                                 
end;                                                                                                  
                                                                                                      
procedure TCadastroPedidoCab.Update(pPedidoCab: TPedidoCab);
begin                                                                                                 
  if ValidaDados(pPedidoCab) then                                                       
  begin                                                                                               
    with TRepositorioPedidoCab.Create() do
    begin                                                                                             
      try                                                                                             
        Update(pPedidoCab);                                                                 
      finally                                                                                         
        Free;                                                                                         
      end;                                                                                            
    end;                                                                                              
  end                                                                                                 
  else                                                                                                
    raise Exception.Create('Dados inv?lidos!!!');                                 
end;                                                                                                  
                                                                                                      
procedure TCadastroPedidoCab.Delete(pPedidoCab: TPedidoCab);
begin                                                                                                 
  if ValidaDados(pPedidoCab) then                                                       
  begin                                                                                               
    with TRepositorioPedidoCab.Create() do
    begin                                                                                             
      try                                                                                             
        Delete(pPedidoCab);                                                                 
      finally                                                                                         
        Free;                                                                                         
      end;                                                                                            
    end;                                                                                              
  end                                                                                                 
  else                                                                                                
    raise Exception.Create('Dados inv?lidos!!!');                                 
end;                                                                                                  
                                                                                                      
end.                                                                                                  