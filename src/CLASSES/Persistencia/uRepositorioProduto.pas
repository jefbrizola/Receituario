{
 -------------------------------------------------------------------------------
 -- Objetivo....: Classe de persist�ncia de objetos TProduto
 -- Autor.......: Jeferson Brizola
 -------------------------------------------------------------------------------
}

unit URepositorioProduto;

interface

uses
  uProduto,  SysUtils, dbclient, FireDAC.Comp.Client, udm;

type
  TRepositorioProduto = class
    public
      procedure Insert(pProduto: TProduto);
      procedure Update(pProduto: TProduto);
      procedure Delete(pProduto: TProduto);
      function  getProduto(pCODIGO: string): TProduto;
  end; 

implementation
                                                                                                                               

function TRepositorioProduto.getProduto(pCODIGO: string): TProduto; 
var                                                                                                                          
  LQry: TFDQuery;                                                                                                             
begin                                                                                                                          
  LQry := TFDQuery.Create(nil);
  LQry.Connection:= DM.FDConnection;

  Result := nil;                                                                                               
                                                                                                               
  with LQry do                                                                                                  
  begin                                                                                                        
    try                                                                                                        
      SQL.Text := 'SELECT * FROM PRODUTO ' + #13#10 + 
                 'WHERE CODIGO = :CODIGO'                           ;

      ParamByName('CODIGO' ).AsString  := pCODIGO;
      try
        Open;                                                                                                                          
      except                                                                                                                           
        on E : Exception do                                                                                                            
        begin
          raise Exception.Create('Erro ao consultar Produto' + #13#13 + E.Message);
        end;
      end;
                                                                                                                                      
      if IsEmpty then                                                                                                                  
        raise Exception.Create('Produto inexistente!');                                                 
                                                                                                                                      
      Result := TProduto.Create;                                                                                       

      Result.PRECO := LQry.FieldByName('PRECO').AsFloat;
      Result.DESCRICAO := LQry.FieldByName('DESCRICAO').AsString;
      Result.CODIGO := LQry.FieldByName('CODIGO').AsString;
      Result.CONTROLE := LQry.FieldByName('CONTROLE').AsString;
    finally                                                                                                                           
      Free;                                                                                                                           
    end;                                                                                                                              
  end;                                                                                                                                
end;                                                                                                                           
                                                                                                                               


                                                                                                                       
                                                                                                                               
procedure TRepositorioProduto.Insert(pProduto: TProduto);
var                                                                                                                          
  LQry: TFDQuery;                                                                                                             
begin                                                                                                                          
  LQry := TFDQuery.Create(nil);
  LQry.Connection:= DM.FDConnection;

  with LQry do                                                                                                 
  begin                                                                                                       
    try                                                                                                       
      SQL.Text := 'INSERT INTO PRODUTO(PRECO                                             , ' + #13#10 + 
                  '                        DESCRICAO                                         , ' + #13#10 + 
                  '                        CODIGO                                            , ' + #13#10 + 
                  '                        CONTROLE) ' + #13#10 + 
                  'VALUES (:PRECO                                             , ' + #13#10 + 
                  '        :DESCRICAO                                         , ' + #13#10 + 
                  '        :CODIGO                                            , ' + #13#10 + 
                  '        :CONTROLE                                          ) '; 

      ParamByName('PRECO'                                 ).AsFloat          := pProduto.PRECO;
      ParamByName('DESCRICAO'                             ).AsString          := pProduto.DESCRICAO;
      ParamByName('CODIGO'                                ).AsString          := pProduto.CODIGO;
      ParamByName('CONTROLE'                              ).AsString          := pProduto.CONTROLE;

      try
        ExecSQL
      except
        on E : Exception do
        begin
          raise Exception.Create('Erro ao inserir Produto' + #13#13 + E.Message);                        
        end;                                                                                                                           
      end;                                                                                                                             
    finally                                                                                                                            
      Free;                                                                                                                            
    end;                                                                                                                               
  end;                                                                                                                               
end;                                                                                                                           
                                                                                                                               
procedure TRepositorioProduto.Update(pProduto: TProduto);
var                                                                                                                          
  LQry: TFDQuery;
begin
  LQry := TFDQuery.Create(nil);
  LQry.Connection:= DM.FDConnection;

  with LQry do                                                                                                  
  begin                                                                                                        
    try                                                                                                        
                                                                                                               
      SQL.Text := 'UPDATE PRODUTO SET ' + #13#10 +                          
                  '  PRECO = :PRECO,' + #13#10 + 
                  '  DESCRICAO = :DESCRICAO,' + #13#10 + 
                  '  CONTROLE = :CONTROLE' + #13#10 + 
                 'WHERE CODIGO = :CODIGO'                           ;


      ParamByName('PRECO').AsFloat               := pProduto.PRECO;
      ParamByName('DESCRICAO').AsString          := pProduto.DESCRICAO;
      ParamByName('CONTROLE').AsString          := pProduto.CONTROLE;
      ParamByName('CODIGO').AsString          := pProduto.CODIGO;


      try
       ExecSQL
      except
        on E : Exception do
        begin
          raise Exception.Create('Erro ao atualizar Produto' + #13#13 + E.Message);                      
        end;                                                                                                                           
      end;                                                                                                                             
    finally                                                                                                                            
      Free;                                                                                                                            
    end;                                                                                                                               
  end;                                                                              
end;                                                                                                                           
                                                                                                                               
procedure TRepositorioProduto.Delete(pProduto: TProduto);
var                                                                                                                          
  LQry: TFDQuery;                                                                                                             
begin
  LQry := TFDQuery.Create(nil);
  LQry.Connection:= DM.FDConnection;
                                                                                                               
  with LQry do                                                                                                  
  begin
    try                                                                                                        
      SQL.Text := 'DELETE FROM PRODUTO ' + #13#10 + 
                 'WHERE CODIGO = :CODIGO'                           ;

      ParamByName('CODIGO'                                ).AsString          := pProduto.CODIGO;

      try
        ExecSQL
      except
        on E : Exception do
        begin

          raise Exception.Create('Erro ao excluir Produto!' + #13#13 + E.Message);      
        end;                                                                                                             
      end;                                                                                                               
    finally                                                                                                               
      Free;                                                                                                               
    end;                                                                                                                  
  end;                                                                                                                    
end;                                                                                                                           
                                                                                                                               
end.                                                                                                  