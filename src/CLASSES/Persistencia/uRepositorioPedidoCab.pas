{
 -------------------------------------------------------------------------------
 -- Objetivo....: Classe de persist�ncia de objetos TPedidoCab
 -- Autor.......: Jeferson Brizola
 -------------------------------------------------------------------------------
}



unit URepositorioPedidoCab;

interface

uses
  uPedidoCab,  SysUtils, dbclient, FireDAC.Comp.Client, uDM;

type
  TRepositorioPedidoCab = class
    public
      procedure Insert(pPedidoCab: TPedidoCab);
      procedure Update(pPedidoCab: TPedidoCab);
      procedure MudaStatus(pPedidoCab: TPedidoCab);
      procedure Delete(pPedidoCab: TPedidoCab);
      function  getPedidoCab(pNUMPEDIDO: integer): TPedidoCab;
      function  getSequencia : Integer;

  end;

implementation


function TRepositorioPedidoCab.getPedidoCab(pNUMPEDIDO: integer): TPedidoCab; 
var
  LQry: TFDQuery;
begin
  LQry := TFDQuery.Create(nil);
  LQry.Connection:= DM.FDConnection;
                                                                                                               
  Result := nil;                                                                                               
                                                                                                               
  with LQry do                                                                                                  
  begin                                                                                                        
    try                                                                                                        
      SQL.Text := 'SELECT * FROM PEDIDO_CAB ' + #13#10 + 
                 'WHERE NUM_PEDIDO = :NUM_PEDIDO'                   ;

      ParamByName('NUM_PEDIDO'                            ).AsInteger         := pNUMPEDIDO;
      try                                                                                                                              
        Open;                                                                                                                          
      except                                                                                                                           
        on E : Exception do                                                                                                            
        begin
          raise Exception.Create('Erro ao consultar PedidoCab' + #13#13 + E.Message);                      
        end;                                                                                                                           
      end;                                                                                                                             
                                                                                                                                      
      if IsEmpty then                                                                                                                  
        raise Exception.Create('PedidoCab inexistente!');                                                 
                                                                                                                                      
      Result := TPedidoCab.Create;                                                                                       

      Result.PRECOTOTAL := LQry.FieldByName('PRECO_TOTAL').AsFloat;
      Result.CLIENTECPF := LQry.FieldByName('CLIENTE_CPF').AsString;
      Result.STATUS := LQry.FieldByName('STATUS').AsString;
      Result.DTEMISSAO := LQry.FieldByName('DT_EMISSAO').AsString;
      Result.NUMPEDIDO := LQry.FieldByName('NUM_PEDIDO').AsInteger;

    finally                                                                                                                           
      Free;                                                                                                                           
    end;                                                                                                                              
  end;                                                                                                                                
end;                                                                                                                           
                                                                                                                               

                                                                                                                               
function TRepositorioPedidoCab.getSequencia: Integer;
var
  LQry: TFDQuery;
begin
  LQry := TFDQuery.Create(nil);
  LQry.Connection:= DM.FDConnection;


  with LQry do
  begin
    try
      SQL.Text := 'select GEN_ID(GERANUMPEDIDOVENDA, 10) SEQ from RDB$DATABASE' ;

      try
        Open;
      except
        on E : Exception do
        begin
          raise Exception.Create('Erro ao consultar sequencial' + #13#13 + E.Message);
        end;
      end;

      if IsEmpty then
        raise Exception.Create('sequencial inexistente!');


      Result := LQry.FieldByName('SEQ').asinteger;


    finally
      Free;
    end;
  end;
end;

procedure TRepositorioPedidoCab.Insert(pPedidoCab: TPedidoCab);
var                                                                                                                          
  LQry: TFDQuery;                                                                                                             
begin                                                                                                                          
  LQry := TFDQuery.Create(nil);
  LQry.Connection:= DM.FDConnection;

  with LQry do                                                                                                 
  begin                                                                                                       
    try                                                                                                       
      SQL.Text := 'INSERT INTO PEDIDO_CAB(PRECO_TOTAL                                       , ' + #13#10 + 
                  '                        CLIENTE_CPF                                       , ' + #13#10 + 
                  '                        STATUS                                            , ' + #13#10 + 
                  '                        DT_EMISSAO                                        , ' + #13#10 + 
                  '                        NUM_PEDIDO) ' + #13#10 + 
                  'VALUES (:PRECO_TOTAL                                       , ' + #13#10 + 
                  '        :CLIENTE_CPF                                       , ' + #13#10 + 
                  '        :STATUS                                            , ' + #13#10 + 
                  '        :DT_EMISSAO                                        , ' + #13#10 + 
                  '        :NUM_PEDIDO                                        ) '; 

      ParamByName('PRECO_TOTAL'                           ).AsFloat          := pPedidoCab.PRECOTOTAL;
      ParamByName('CLIENTE_CPF'                           ).AsString          := pPedidoCab.CLIENTECPF;
      ParamByName('STATUS'                                ).AsString         := pPedidoCab.STATUS;
      ParamByName('DT_EMISSAO'                            ).AsString          := pPedidoCab.DTEMISSAO;
      ParamByName('NUM_PEDIDO'                            ).AsInteger         := pPedidoCab.NUMPEDIDO;

      try
        ExecSQL
      except
        on E : Exception do
        begin

          raise Exception.Create('Erro ao inserir PedidoCab' + #13#13 + E.Message);                        
        end;                                                                                                                           
      end;                                                                                                                             
    finally                                                                                                                            
      Free;                                                                                                                            
    end;                                                                                                                               
  end;                                                                                                                               
end;                                                                                                                           
                                                                                                                               
procedure TRepositorioPedidoCab.Update(pPedidoCab: TPedidoCab);
var
  LQry: TFDQuery;
begin
  LQry := TFDQuery.Create(nil);
  LQry.Connection:= DM.FDConnection;
                                                                                                               
  with LQry do                                                                                                  
  begin                                                                                                        
    try                                                                                                        
                                                                                                               
      SQL.Text := 'UPDATE PEDIDO_CAB SET ' + #13#10 +                          
                  '  PRECO_TOTAL = :PRECO_TOTAL,' + #13#10 + 
                  '  CLIENTE_CPF = :CLIENTE_CPF,' + #13#10 + 
                  '  STATUS = :STATUS,' + #13#10 + 
                  '  DT_EMISSAO = :DT_EMISSAO' + #13#10 + 
                 'WHERE NUM_PEDIDO = :NUM_PEDIDO'                   ;


      ParamByName('PRECO_TOTAL').AsFloat          := pPedidoCab.PRECOTOTAL;
      ParamByName('CLIENTE_CPF').AsString          := pPedidoCab.CLIENTECPF;
      ParamByName('STATUS').AsString         := pPedidoCab.STATUS;
      ParamByName('DT_EMISSAO').AsString          := pPedidoCab.DTEMISSAO;
      ParamByName('NUM_PEDIDO'     ).AsInteger         := pPedidoCab.NUMPEDIDO;

      try                                                                                                                              
         ExecSQL
      except
        on E : Exception do
        begin
          raise Exception.Create('Erro ao atualizar PedidoCab' + #13#13 + E.Message);
        end;                                                                                                                           
      end;                                                                                                                             
    finally                                                                                                                            
      Free;
    end;                                                                                                                               
  end;                                                                              
end;
                                                                                                                               
procedure TRepositorioPedidoCab.MudaStatus(pPedidoCab: TPedidoCab);
var
  LQry: TFDQuery;
begin
  LQry := TFDQuery.Create(nil);
  LQry.Connection:= DM.FDConnection;

  with LQry do
  begin
    try

      SQL.Text := 'UPDATE PEDIDO_CAB SET ' + #13#10 +
                  '  STATUS = :STATUS    ' + #13#10 +
                 'WHERE NUM_PEDIDO = :NUM_PEDIDO'                   ;


      ParamByName('STATUS').AsString         := pPedidoCab.STATUS;
      ParamByName('NUM_PEDIDO'     ).AsInteger         := pPedidoCab.NUMPEDIDO;

      try
         ExecSQL
      except
        on E : Exception do
        begin
          raise Exception.Create('Erro ao atualizar Status PedidoCab' + #13#13 + E.Message);
        end;
      end;
    finally
      Free;
    end;
  end;
end;

procedure TRepositorioPedidoCab.Delete(pPedidoCab: TPedidoCab);
var                                                                                                                          
  LQry: TFDQuery;                                                                                                             
begin                                                                                                                          
  LQry := TFDQuery.Create(nil);
  LQry.Connection:= DM.FDConnection;
                                                                                                               
  with LQry do                                                                                                  
  begin
    try
      SQL.Text := 'DELETE FROM PEDIDO_CAB ' + #13#10 +
                 'WHERE NUM_PEDIDO = :NUM_PEDIDO'                   ;

      ParamByName('NUM_PEDIDO'     ).AsInteger         := pPedidoCab.NUMPEDIDO;

      try
        ExecSQL
      except
        on E : Exception do
        begin
          raise Exception.Create('Erro ao excluir PedidoCab!' + #13#13 + E.Message);      
        end;                                                                                                             
      end;                                                                                                               
    finally                                                                                                               
      Free;                                                                                                               
    end;                                                                                                                  
  end;                                                                                                                    
end;                                                                                                                           
                                                                                                                               
end.                                                                                                  