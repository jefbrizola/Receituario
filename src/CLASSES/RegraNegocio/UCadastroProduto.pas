{
 -------------------------------------------------------------------------------
 -- Objetivo....: Classe de regra de negocio de objetos TProduto
 -- Autor.......: Jeferson Brizola
 -------------------------------------------------------------------------------
}



unit UCadastroProduto;

interface

uses Classes, SysUtils, URepositorioProduto, UProduto;

type
  TCadastroProduto = class
  private
    function ValidaDados(pProduto: TProduto):boolean;
  public
    procedure Insert( pProduto: TProduto);
    procedure Update( pProduto: TProduto);
    procedure Delete( pProduto: TProduto);
  end; 

implementation 
                                                                                                      
{ TCadastroProduto } 
                                                                                                      
function TCadastroProduto.ValidaDados(pProduto: TProduto):boolean;
  var Rep: TRepositorioProduto ;
      Produto: TProduto;
begin
  try
    Rep    := TRepositorioProduto.Create ;
    Produto:= TProduto.Create;
    try
      Produto:= Rep.getProduto(pProduto.CODIGO);
      Result := false;
    Except
      Result := true;
    end;

  finally
    Produto.Free;
    Rep.Free;
  end;

end;                                                                                                  
                                                                                                      
procedure TCadastroProduto.Insert(pProduto: TProduto);
begin                                                                                                 
  if ValidaDados(pProduto) then                                                       
  begin                                                                                               
    with TRepositorioProduto.Create() do
    begin                                                                                             
      try                                                                                             
        Insert(pProduto);                                                                 
      finally                                                                                         
        Free;                                                                                         
      end;                                                                                            
    end;                                                                                              
  end                                                                                                 
  else                                                                                                
    raise Exception.Create('Codigo já cadastrado!');
end;                                                                                                  
                                                                                                      
procedure TCadastroProduto.Update( pProduto: TProduto);
begin                                                                                                 
  if ValidaDados(pProduto) then                                                       
  begin                                                                                               
    with TRepositorioProduto.Create() do
    begin                                                                                             
      try                                                                                             
        Update(pProduto);                                                                 
      finally                                                                                         
        Free;                                                                                         
      end;                                                                                            
    end;                                                                                              
  end                                                                                                 
  else                                                                                                
    raise Exception.Create('Dados inválidos!!!');                                 
end;                                                                                                  
                                                                                                      
procedure TCadastroProduto.Delete(pProduto: TProduto);
begin                                                                                                 
  if ValidaDados(pProduto) then                                                       
  begin
    with TRepositorioProduto.Create() do
    begin                                                                                             
      try                                                                                             
        Delete(pProduto);                                                                 
      finally                                                                                         
        Free;                                                                                         
      end;                                                                                            
    end;                                                                                              
  end                                                                                                 
  else                                                                                                
    raise Exception.Create('Dados inválidos!!!');                                 
end;                                                                                                  
                                                                                                      
end.                                                                                                  