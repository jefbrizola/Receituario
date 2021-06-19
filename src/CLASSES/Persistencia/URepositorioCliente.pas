{
 -------------------------------------------------------------------------------

 -- Unit........: URepositorioCliente
 -- Objetivo....: Classe de persistência de objetos TCliente
 -- Autor.......: Jeferson Brizola

 -------------------------------------------------------------------------------
}



unit URepositorioCliente;

interface

uses Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Comp.Client, FireDAC.Comp.DataSet,
  FireDAC.Stan.Param, SysUtils, UCliente, firedac.Dapt, uDM;

type
  TRepositorioCliente = class
    public
      procedure Insert(pCliente: TCliente);
      procedure Update(pCliente: TCliente);
      procedure Delete(pCliente: TCliente);
      function  getCliente(pCPF: string): TCliente;

  end; 

implementation 
                                                                                                                               
{ TRepositorioCliente } 
                                                                                                                               
function TRepositorioCliente.getCliente(pCPF: string): TCliente;
var                                                                                                                          
  LQry: TFDQuery;                                                                                                             
begin                                                                                                                          
    LQry := TFDQuery.Create(nil);
    LQry.Connection:= DM.FDConnection;
                                                                                                               
  Result := nil;                                                                                               
                                                                                                               
  with LQry do                                                                                                  
  begin                                                                                                        
    try                                                                                                        
      SQL.Text := 'SELECT * FROM CLIENTE ' + #13#10 + 
                 'WHERE CPF = :CPF'                                 ;

      ParamByName('CPF'                                   ).AsString          := pCPF;
      try                                                                                                                              
        Open;
      except
        on E : Exception do
        begin
          raise Exception.Create('Erro ao consultar Cliente' + #13#13 + E.Message);                      
        end;                                                                                                                           
      end;                                                                                                                             
                                                                                                                                      
      if IsEmpty then                                                                                                                  
        raise Exception.Create('Cliente inexistente!');                                                 
                                                                                                                                      
      Result := TCliente.Create;                                                                                       

      Result.NOME := LQry.FieldByName('NOME').AsString;
      Result.Documento := LQry.FieldByName('CPF').AsString;

    finally                                                                                                                           
      Free;                                                                                                                           
    end;                                                                                                                              
  end;                                                                                                                                
end;                                                                                                                           
                                                                                                                               

                                                                                                                               
procedure TRepositorioCliente.Insert(pCliente: TCliente);
var                                                                                                                          
  LQry: TFDQuery;                                                                                                             
begin                                                                                                                          
   LQry := TFDQuery.Create(nil);
   LQry.Connection:= DM.FDConnection;
                                                                                                              
  with LQry do                                                                                                 
  begin                                                                                                       
    try                                                                                                       
      SQL.Text := 'INSERT INTO CLIENTE(NOME                                              , ' + #13#10 +
                  '                        CPF) ' + #13#10 + 
                  'VALUES (:NOME                                              , ' + #13#10 + 
                  '        :CPF                                               ) '; 

      ParamByName('NOME'                                  ).AsString          := pCliente.NOME;
      ParamByName('CPF'                                   ).AsString          := pCliente.Documento;

      try                                                                                                                              
        ExecSQL
      except                                                                                                                           
        on E : Exception do                                                                                                            
        begin
          raise Exception.Create('Erro ao inserir Cliente' + #13#13 + E.Message);                        
        end;                                                                                                                           
      end;                                                                                                                             
    finally                                                                                                                            
      Free;                                                                                                                            
    end;                                                                                                                               
  end;                                                                                                                               
end;                                                                                                                           
                                                                                                                               
procedure TRepositorioCliente.Update(pCliente: TCliente);
var                                                                                                                          
  LQry: TFDQuery;                                                                                                             
begin                                                                                                                          
   LQry := TFDQuery.Create(nil);
   LQry.Connection:= DM.FDConnection;
                                                                                                               
  with LQry do
  begin                                                                                                        
    try                                                                                                        
                                                                                                               
      SQL.Text := ' UPDATE CLIENTE SET ' + #13#10 +
                  '  NOME = :NOME      ' + #13#10 +
                 '  WHERE CPF = :CPF ;  '                                 ;


      ParamByName('NOME').AsString          := pCliente.NOME;
      ParamByName('CPF').AsString          := pCliente.Documento;


      try                                                                                                                              
       ExecSQL;
      except
        on E : Exception do
        begin

          raise Exception.Create('Erro ao atualizar Cliente' + #13#13 + E.Message);                      
        end;                                                                                                                           
      end;                                                                                                                             
    finally
      Free;                                                                                                                            
    end;                                                                                                                               
  end;                                                                              
end;                                                                                                                           
                                                                                                                               
procedure TRepositorioCliente.Delete(pCliente: TCliente);
var                                                                                                                          
  LQry: TFDQuery;                                                                                                             
begin                                                                                                                          
  LQry := TFDQuery.Create(nil);
  LQry.Connection:= DM.FDConnection;

  with LQry do                                                                                                  
  begin                                                                                                        
    try                                                                                                        
      SQL.Text := 'DELETE FROM CLIENTE ' + #13#10 + 
                 'WHERE CPF = :CPF'                                 ;

      ParamByName('CPF'                                   ).AsString          := pCliente.Documento;

      try                                                                                                                
        ExecSQL
      except                                                                                                             
        on E : Exception do
        begin

          raise Exception.Create('Erro ao excluir Cliente!' + #13#13 + E.Message);      
        end;                                                                                                             
      end;                                                                                                               
    finally                                                                                                               
      Free;                                                                                                               
    end;                                                                                                                  
  end;                                                                                                                    
end;                                                                                                                           
                                                                                                                               
end.                                                                                                  