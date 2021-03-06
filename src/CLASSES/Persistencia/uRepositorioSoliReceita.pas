{
 -------------------------------------------------------------------------------
 -- Objetivo....: Classe de persist�ncia de objetos TSoliReceita
 -- Autor.......: Jeferson Brizola
 -------------------------------------------------------------------------------
}



unit URepositorioSoliReceita;

interface

uses
  uSoliReceita,  SysUtils, dbclient, FireDAC.Comp.Client, UDM;


type
  TRepositorioSoliReceita = class
  private
    public
      procedure Insert(pSoliReceita: TSoliReceita);
      procedure Update(pSoliReceita: TSoliReceita);
      procedure Delete(pSoliReceita: TSoliReceita);
      function  getSoliReceita(pNUMPEDIDO: integer; pCODPRODUTO: string): TSoliReceita overload;
      procedure getSoliReceita(var Psoli: TClientDataSet) overload;
      procedure getSoliReceita(var Psoli: TClientDataSet; pNUMPEDIDO: integer)overload;

  end;

implementation


function TRepositorioSoliReceita.getSoliReceita(pNUMPEDIDO: integer; pCODPRODUTO: string): TSoliReceita;
var
  LQry: TFDQuery;
begin
  LQry := TFDQuery.Create(nil);
  LQry.Connection:= DM.FDConnection;

  Result := nil;                                                                                               
                                                                                                               
  with LQry do                                                                                                  
  begin                                                                                                        
    try                                                                                                        
      SQL.Text := 'SELECT * FROM SOLI_RECEITA        ' + #13#10 +
                  'WHERE NUM_PEDIDO = :NUM_PEDIDO    '                   + #13#10 +
                  'AND   COD_PRODUTO = :COD_PRODUTO  '                ;

      ParamByName('NUM_PEDIDO'                            ).AsInteger         := pNUMPEDIDO;
      ParamByName('COD_PRODUTO'                           ).AsString          := pCODPRODUTO;
      try                                                                                                                              
        Open;                                                                                                                          
      except                                                                                                                           
        on E : Exception do                                                                                                            
        begin
          raise Exception.Create('Erro ao consultar SoliReceita' + #13#13 + E.Message);
        end;
      end;

      if IsEmpty then
        raise Exception.Create('SoliReceita inexistente!');

      Result := TSoliReceita.Create;

      Result.STATUS := LQry.FieldByName('STATUS').AsString;
      Result.NUMPEDIDO := LQry.FieldByName('NUM_PEDIDO').AsInteger;
      Result.CODPRODUTO := LQry.FieldByName('COD_PRODUTO').AsString;
    finally                                                                                                                           
      Free;                                                                                                                           
    end;
  end;                                                                                                                                
end;                                                                                                                           
                                                                                                                               

                                                                                                                               
procedure TRepositorioSoliReceita.getSoliReceita(var Psoli: TClientDataSet) ;
var
  LQry: TFDQuery;
begin
  LQry := TFDQuery.Create(nil);
  LQry.Connection:= DM.FDConnection;

  with LQry do
  begin
    try
      SQL.Text := 'SELECT S.cod_produto, P.DESCRICAO, PC.num_pedido, T.NOME        ' + #13#10 +
                  'from SOLI_RECEITA S, TEC_AGRICULA T, PRODUTO P, PEDIDO_CAB PC   ' + #13#10 +
                  'where S.COD_PRODUTO = P.CODIGO and                              ' + #13#10 +
                  '      S.NUM_PEDIDO = PC.NUM_PEDIDO and                          ' + #13#10 +
                  '      P.CONTROLE = T.NUM_REGISTRO and                              ' + #13#10 +
                  '      S.STATUS = ''A''                                          ';

      try
        Open;
      except
        on E : Exception do
        begin
          raise Exception.Create('Erro ao consultar SoliReceita' + #13#13 + E.Message);
        end;
      end;

      if IsEmpty then
        raise Exception.Create('SoliReceitas inexistentes!');


      Psoli.Open;
      LQry.First;

      while not LQry.Eof do
      begin
        Psoli.Insert;
        Psoli.FieldByName('Pedido').AsInteger         := LQry.FieldByName('NUM_PEDIDO').AsInteger;
        Psoli.FieldByName('Codigo').AsString          := LQry.FieldByName('COD_PRODUTO').AsString;
        Psoli.FieldByName('Descricao').AsString       := LQry.FieldByName('DESCRICAO').AsString;
        Psoli.FieldByName('Nome').AsString            := LQry.FieldByName('NOME').AsString;

        LQry.Next;
      end;


    finally
      Free;
    end;
  end;
end;



procedure TRepositorioSoliReceita.getSoliReceita(var Psoli: TClientDataSet; pNUMPEDIDO: integer);
var
  LQry: TFDQuery;
begin
  LQry := TFDQuery.Create(nil);
  LQry.Connection:= DM.FDConnection;

  with LQry do
  begin
    try
      SQL.Text := 'SELECT S.cod_produto, P.DESCRICAO, PC.num_pedido, T.NOME        ' + #13#10 +
                  'from SOLI_RECEITA S, TEC_AGRICULA T, PRODUTO P, PEDIDO_CAB PC   ' + #13#10 +
                  'where S.NUM_PEDIDO = :NUM_PEDIDO and                            ' + #13#10 +
                  '      S.COD_PRODUTO = P.CODIGO and                              ' + #13#10 +
                  '      S.NUM_PEDIDO = PC.NUM_PEDIDO and                          ' + #13#10 +
                  '      P.CONTROLE = T.NUM_REGISTRO and                              ' + #13#10 +
                  '      S.STATUS = ''A''                                          ';

      ParamByName('NUM_PEDIDO'                            ).AsInteger         := pNUMPEDIDO;

      try
        Open;
      except
        on E : Exception do
        begin
          raise Exception.Create('Erro ao consultar SoliReceita' + #13#13 + E.Message);
        end;
      end;

      if IsEmpty then
        raise Exception.Create('SoliReceita inexistente!');


      Psoli.Open;
      LQry.First;

      while not LQry.Eof do
      begin
        Psoli.Insert;
        Psoli.FieldByName('Pedido').AsInteger         := LQry.FieldByName('NUM_PEDIDO').AsInteger;
        Psoli.FieldByName('Codigo').AsString          := LQry.FieldByName('COD_PRODUTO').AsString;
        Psoli.FieldByName('Descricao').AsString       := LQry.FieldByName('DESCRICAO').AsString;
        Psoli.FieldByName('Nome').AsString            := LQry.FieldByName('NOME').AsString;

        LQry.Next;
      end;

    finally
      Free;
    end;
  end;
end;

procedure TRepositorioSoliReceita.Insert(pSoliReceita: TSoliReceita);
var                                                                                                                          
  LQry: TFDQuery;                                                                                                             
begin
  LQry := TFDQuery.Create(nil);
  LQry.Connection:= DM.FDConnection;
                                                                                                              
  with LQry do                                                                                                 
  begin                                                                                                       
    try                                                                                                       
      SQL.Text := 'INSERT INTO SOLI_RECEITA(NUM_PEDIDO                                        , ' + #13#10 +
                  '                         COD_PRODUTO, STATUS) ' + #13#10 +
                  'VALUES (:NUM_PEDIDO                                        , ' + #13#10 +
                  '        :COD_PRODUTO, :STATUS                                       ) ';

      ParamByName('NUM_PEDIDO'                            ).AsInteger         := pSoliReceita.NUMPEDIDO;
      ParamByName('COD_PRODUTO'                           ).AsString          := pSoliReceita.CODPRODUTO;
      ParamByName('STATUS'                                ).AsString          := pSoliReceita.STATUS;

      try
        ExecSQL
      except                                                                                                                           
        on E : Exception do                                                                                                            
        begin
          raise Exception.Create('Erro ao inserir SoliReceita' + #13#13 + E.Message);
        end;                                                                                                                           
      end;                                                                                                                             
    finally                                                                                                                            
      Free;                                                                                                                            
    end;                                                                                                                               
  end;                                                                                                                               
end;                                                                                                                           
                                                                                                                               
procedure TRepositorioSoliReceita.Update(pSoliReceita: TSoliReceita);
var                                                                                                                          
  LQry: TFDQuery;                                                                                                             
begin                                                                                                                          
  LQry := TFDQuery.Create(nil);
  LQry.Connection:= DM.FDConnection;

  with LQry do
  begin
    try

      SQL.Text := 'UPDATE SOLI_RECEITA SET ' + #13#10 +
                  '  STATUS = :STATUS' + #13#10 +
                 'WHERE NUM_PEDIDO = :NUM_PEDIDO'                   + #13#10 +
                 'AND   COD_PRODUTO = :COD_PRODUTO'                ;


      ParamByName('STATUS'                                ).AsString              := pSoliReceita.STATUS;
      ParamByName('NUM_PEDIDO'                            ).AsInteger         := pSoliReceita.NUMPEDIDO;
      ParamByName('COD_PRODUTO'                           ).AsString          := pSoliReceita.CODPRODUTO;


      try
        ExecSQL
      except                                                                                                                           
        on E : Exception do                                                                                                            
        begin
          raise Exception.Create('Erro ao atualizar SoliReceita' + #13#13 + E.Message);                      
        end;                                                                                                                           
      end;                                                                                                                             
    finally                                                                                                                            
      Free;                                                                                                                            
    end;                                                                                                                               
  end;                                                                              
end;                                                                                                                           
                                                                                                                               
procedure TRepositorioSoliReceita.Delete(pSoliReceita: TSoliReceita);
var                                                                                                                          
  LQry: TFDQuery;                                                                                                             
begin                                                                                                                          
   LQry := TFDQuery.Create(nil);
  LQry.Connection:= DM.FDConnection;
                                                                                                               
  with LQry do                                                                                                  
  begin                                                                                                        
    try                                                                                                        
      SQL.Text := 'DELETE FROM SOLI_RECEITA ' + #13#10 + 
                 'WHERE NUM_PEDIDO = :NUM_PEDIDO'                   + #13#10 + 
                 'AND   COD_PRODUTO = :COD_PRODUTO'                ;

      ParamByName('NUM_PEDIDO'                            ).AsInteger         := pSoliReceita.NUMPEDIDO;
      ParamByName('COD_PRODUTO'                           ).AsString          := pSoliReceita.CODPRODUTO;

      try                                                                                                                
        ExecSQL
      except                                                                                                             
        on E : Exception do                                                                                              
        begin
          raise Exception.Create('Erro ao excluir SoliReceita!' + #13#13 + E.Message);      
        end;                                                                                                             
      end;                                                                                                               
    finally                                                                                                               
      Free;                                                                                                               
    end;                                                                                                                  
  end;                                                                                                                    
end;                                                                                                                           
                                                                                                                               
end.                                                                                                  