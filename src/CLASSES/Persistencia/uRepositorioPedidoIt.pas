{
 -------------------------------------------------------------------------------
 -- Objetivo....: Classe de persistência de objetos TPedidoIt
 -- Autor.......: Jeferson Brizola
 -------------------------------------------------------------------------------
}


unit URepositorioPedidoIt;

interface

uses
  uPedidoIt,  SysUtils, dbclient, FireDAC.Comp.Client, uDM;

type
  TRepositorioPedidoIt = class
    public
      procedure Insert(pPedidoIt: TPedidoIt);
      procedure Update(pPedidoIt: TPedidoIt);
      procedure Delete(pPedidoIt: TPedidoIt);
      function  getPedidoIt(pNUMPEDIDO, pPRODUTO: integer): TPedidoIt;
  end;

implementation


function TRepositorioPedidoIt.getPedidoIt(pNUMPEDIDO, pPRODUTO: integer): TPedidoIt; 
var
  LQry: TFDQuery;                                                                                                             
begin
  LQry := TFDQuery.Create(nil);
  LQry.Connection:= DM.FDConnection;
                                                                                                               
  Result := nil;
                                                                                                               
  with LQry do
  begin                                                                                                        
    try                                                                                                        
      SQL.Text := 'SELECT * FROM PEDIDO_IT ' + #13#10 + 
                 'WHERE NUM_PEDIDO = :NUM_PEDIDO'                   + #13#10 + 
                 'AND   PRODUTO = :PRODUTO'                        ;

      ParamByName('NUM_PEDIDO'                            ).AsInteger         := pNUMPEDIDO;
      ParamByName('PRODUTO'                               ).AsInteger         := pPRODUTO;
      try                                                                                                                              
        Open;                                                                                                                          
      except
        on E : Exception do
        begin
          raise Exception.Create('Erro ao consultar PedidoIt' + #13#13 + E.Message);                      
        end;                                                                                                                           
      end;                                                                                                                             
                                                                                                                                      
      if IsEmpty then                                                                                                                  
        raise Exception.Create('PedidoIt inexistente!');                                                 
                                                                                                                                      
      Result := TPedidoIt.Create;                                                                                       

      Result.PRECOUNIT := LQry.FieldByName('PRECO_UNIT').AsFloat;
      Result.NUMPEDIDO := LQry.FieldByName('NUM_PEDIDO').AsInteger;
      Result.PRODUTO := LQry.FieldByName('PRODUTO').AsString;
      Result.QTD := LQry.FieldByName('QTD').AsFloat;

    finally
      Free;                                                                                                                           
    end;                                                                                                                              
  end;                                                                                                                                
end;                                                                                                                           
                                                                                                                               



                                                                                                                               
procedure TRepositorioPedidoIt.Insert(pPedidoIt: TPedidoIt);
var                                                                                                                          
  LQry: TFDQuery;                                                                                                             
begin                                                                                                                          
  LQry := TFDQuery.Create(nil);
  LQry.Connection:= DM.FDConnection;

  with LQry do                                                                                                 
  begin                                                                                                       
    try                                                                                                       
      SQL.Text := 'INSERT INTO PEDIDO_IT(PRECO_UNIT                                        , ' + #13#10 + 
                  '                        NUM_PEDIDO                                        , ' + #13#10 + 
                  '                        PRODUTO                                           , ' + #13#10 + 
                  '                        QTD) ' + #13#10 + 
                  'VALUES (:PRECO_UNIT                                        , ' + #13#10 + 
                  '        :NUM_PEDIDO                                        , ' + #13#10 + 
                  '        :PRODUTO                                           , ' + #13#10 + 
                  '        :QTD                                               ) '; 

      ParamByName('PRECO_UNIT'                            ).AsFloat          := pPedidoIt.PRECOUNIT;
      ParamByName('NUM_PEDIDO'                            ).AsInteger         := pPedidoIt.NUMPEDIDO;
      ParamByName('PRODUTO'                               ).AsString          := pPedidoIt.PRODUTO;
      ParamByName('QTD'                                   ).AsFloat           := pPedidoIt.QTD;

      try
        ExecSQL
      except
        on E : Exception do
        begin

          raise Exception.Create('Erro ao inserir PedidoIt' + #13#13 + E.Message);                        
        end;                                                                                                                           
      end;                                                                                                                             
    finally                                                                                                                            
      Free;                                                                                                                            
    end;                                                                                                                               
  end;                                                                                                                               
end;                                                                                                                           
                                                                                                                               
procedure TRepositorioPedidoIt.Update(pPedidoIt: TPedidoIt);
var                                                                                                                          
  LQry: TFDQuery;                                                                                                             
begin                                                                                                                          
   LQry := TFDQuery.Create(nil);
  LQry.Connection:= DM.FDConnection;

  with LQry do
  begin
    try

      SQL.Text := 'UPDATE PEDIDO_IT SET ' + #13#10 +
                  '  PRECO_UNIT = :PRECO_UNIT,' + #13#10 +
                  '  QTD = :QTD' + #13#10 +
                 'WHERE NUM_PEDIDO = :NUM_PEDIDO'                   + #13#10 +
                 'AND   PRODUTO = :PRODUTO'                        ;


      ParamByName('PRECO_UNIT').AsFloat          := pPedidoIt.PRECOUNIT;
      ParamByName('QTD').AsFloat           := pPedidoIt.QTD;
      ParamByName('NUM_PEDIDO'                            ).AsInteger         := pPedidoIt.NUMPEDIDO;
      ParamByName('PRODUTO'                               ).AsString         := pPedidoIt.PRODUTO;

      try                                                                                                                              
        ExecSQL
      except
        on E : Exception do
        begin

          raise Exception.Create('Erro ao atualizar PedidoIt' + #13#13 + E.Message);                      
        end;                                                                                                                           
      end;                                                                                                                             
    finally                                                                                                                            
      Free;                                                                                                                            
    end;                                                                                                                               
  end;                                                                              
end;                                                                                                                           
                                                                                                                               
procedure TRepositorioPedidoIt.Delete(pPedidoIt: TPedidoIt);
var                                                                                                                          
  LQry: TFDQuery;                                                                                                             
begin                                                                                                                          
   LQry := TFDQuery.Create(nil);
  LQry.Connection:= DM.FDConnection;

  with LQry do
  begin
    try
      SQL.Text := 'DELETE FROM PEDIDO_IT ' + #13#10 +
                 'WHERE NUM_PEDIDO = :NUM_PEDIDO'                   + #13#10 +
                 'AND   PRODUTO = :PRODUTO'                        ;

      ParamByName('NUM_PEDIDO'                            ).AsInteger         := pPedidoIt.NUMPEDIDO;
      ParamByName('PRODUTO'                               ).AsString         := pPedidoIt.PRODUTO;

      try                                                                                                                
        ExecSQL
      except                                                                                                             
        on E : Exception do                                                                                              
        begin

          raise Exception.Create('Erro ao excluir PedidoIt!' + #13#13 + E.Message);      
        end;                                                                                                             
      end;                                                                                                               
    finally                                                                                                               
      Free;                                                                                                               
    end;                                                                                                                  
  end;                                                                                                                    
end;                                                                                                                           
                                                                                                                               
end.                                                                                                  