object FrmPrincipal: TFrmPrincipal
  Left = 0
  Top = 0
  ClientHeight = 349
  ClientWidth = 661
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object MainMenu1: TMainMenu
    Left = 312
    Top = 72
    object Cadastrodecliente1: TMenuItem
      Caption = 'Cadastro de cliente '
      OnClick = Cadastrodecliente1Click
    end
    object CadastrodeProdutos1: TMenuItem
      Caption = 'Cadastro de Produtos'
      OnClick = CadastrodeProdutos1Click
    end
    object PedidodeVenda1: TMenuItem
      Caption = 'Pedido de Venda'
      OnClick = PedidodeVenda1Click
    end
    object Solicitaodereceita1: TMenuItem
      Caption = 'Solicita'#231#227'o de receita'
      OnClick = Solicitaodereceita1Click
    end
  end
end
