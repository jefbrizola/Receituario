

unit URepositorioTecAgricula;

interface

uses
  uTecAgricula,  SysUtils, dbclient, FireDAC.Comp.Client, uDM;

type
  TRepositorioTecAgricula = class
    public
      procedure Insert(pTecAgricula: TTecAgricula);
      procedure Update(pTecAgricula: TTecAgricula);
      procedure Delete(pTecAgricula: TTecAgricula);
      function  getTecAgricula(pCPF: string): TTecAgricula;

  end;

implementation

                                                                                                                               
function TRepositorioTecAgricula.getTecAgricula(pCPF: string): TTecAgricula;
  var LQry: TFDQuery;
begin
  LQry := TFDQuery.Create(nil);
  LQry.Connection:= DM.FDConnection;

  Result := nil;                                                                                               
                                                                                                               
  with LQry do
  begin                                                                                                        
    try                                                                                                        
      SQL.Text := 'SELECT * FROM TEC_AGRICULA ' + #13#10 + 
                 'WHERE CPF = :CPF'                                 ;

      ParamByName('CPF'  ).AsString          := pCPF;
      try                                                                                                                              
        Open;                                                                                                                          
      except                                                                                                                           
        on E : Exception do                                                                                                            
        begin
          raise Exception.Create('Erro ao consultar TecAgricula' + #13#13 + E.Message);
        end;
      end;

      if IsEmpty then
        raise Exception.Create('TecAgricula inexistente!');

      Result := TTecAgricula.Create;

      Result.Documento := FieldByName('CPF').AsString;
      Result.NOME := FieldByName('NOME').AsString;
      Result.DocumentoReg := FieldByName('NUM_REGISTRO').AsString;

    finally
      Free;
    end;
  end;
end;



                                                                                                                               
procedure TRepositorioTecAgricula.Insert(pTecAgricula: TTecAgricula);
var                                                                                                                          
  LQry: TFDQuery;                                                                                                             
begin                                                                                                                          
  LQry := TFDQuery.Create(nil);
  LQry.Connection:= DM.FDConnection;
                                                                                                              
  with LQry do                                                                                                 
  begin                                                                                                       
    try                                                                                                       
      SQL.Text := 'INSERT INTO TEC_AGRICULA(CPF                                               , ' + #13#10 + 
                  '                        NOME                                              , ' + #13#10 + 
                  '                        NUM_REGISTRO) ' + #13#10 + 
                  'VALUES (:CPF                                               , ' + #13#10 + 
                  '        :NOME                                              , ' + #13#10 + 
                  '        :NUM_REGISTRO                                      ) '; 

      ParamByName('CPF'                                   ).AsString          := pTecAgricula.Documento;
      ParamByName('NOME'                                  ).AsString          := pTecAgricula.NOME;
      ParamByName('NUM_REGISTRO'                          ).AsString          := pTecAgricula.DocumentoReg;

      try
         ExecSQL;
      except
        on E : Exception do
        begin
          raise Exception.Create('Erro ao inserir TecAgricula' + #13#13 + E.Message);                        
        end;                                                                                                                           
      end;                                                                                                                             
    finally
      Free;                                                                                                                            
    end;                                                                                                                               
  end;                                                                                                                               
end;                                                                                                                           
                                                                                                                               
procedure TRepositorioTecAgricula.Update(pTecAgricula: TTecAgricula);
var                                                                                                                          
  LQry: TFDQuery;                                                                                                             
begin                                                                                                                          
  LQry := TFDQuery.Create(nil);
  LQry.Connection:= DM.FDConnection;
                                                                                                               
  with LQry do                                                                                                  
  begin                                                                                                        
    try                                                                                                        
                                                                                                               
      SQL.Text := 'UPDATE TEC_AGRICULA SET ' + #13#10 +                          
                  '  NOME = :NOME,' + #13#10 + 
                  '  NUM_REGISTRO = :NUM_REGISTRO' + #13#10 + 
                 'WHERE CPF = :CPF'                                 ;


      ParamByName('NOME').AsString                 := pTecAgricula.NOME;
      ParamByName('NUM_REGISTRO').AsString          := pTecAgricula.DocumentoReg;
      ParamByName('CPF'         ).AsString          := pTecAgricula.Documento;

      try
        ExecSQL
      except
        on E : Exception do
        begin
          raise Exception.Create('Erro ao atualizar TecAgricula' + #13#13 + E.Message);
        end;
      end;
    finally
      Free;
    end;
  end;
end;

procedure TRepositorioTecAgricula.Delete(pTecAgricula: TTecAgricula);
var
  LQry: TFDQuery;
begin
  LQry := TFDQuery.Create(nil);
  LQry.Connection:= DM.FDConnection;

  with LQry do
  begin
    try
      SQL.Text := 'DELETE FROM TEC_AGRICULA ' + #13#10 +
                 'WHERE CPF = :CPF'                                 ;

      ParamByName('CPF').AsString          := pTecAgricula.DocumentoReg;

      try
        ExecSQL
      except                                                                                                             
        on E : Exception do                                                                                              
        begin                                                                                                            

          raise Exception.Create('Erro ao excluir TecAgricula!' + #13#13 + E.Message);
        end;                                                                                                             
      end;                                                                                                               
    finally                                                                                                               
      Free;                                                                                                               
    end;                                                                                                                  
  end;                                                                                                                    
end;                                                                                                                           
                                                                                                                               
end.                                                                                                  