object frmLiberaSoli: TfrmLiberaSoli
  Left = 0
  Top = 0
  Caption = 'Libera Solicita'#231#227'o de Receita'
  ClientHeight = 283
  ClientWidth = 514
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 12
    Top = 21
    Width = 87
    Height = 13
    Caption = 'N'#250'mero do pedido'
  end
  object GridSoli: TDBGrid
    Left = 8
    Top = 56
    Width = 498
    Height = 178
    Ctl3D = True
    ParentCtl3D = False
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Codigo'
        Title.Caption = 'Produto'
        Width = 46
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Descricao'
        ImeName = 'Descricao'
        Title.Caption = 'Descri'#231#227'o'
        Width = 152
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Pedido'
        Width = 52
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Nome'
        ImeName = 'Tecnico'
        Title.Caption = 'T'#233'cnico'
        Width = 205
        Visible = True
      end>
  end
  object BtConsultar: TButton
    Left = 207
    Top = 16
    Width = 75
    Height = 25
    Caption = 'Consultar'
    TabOrder = 1
    OnClick = BtConsultarClick
  end
  object BtAssinar: TButton
    Left = 206
    Top = 245
    Width = 105
    Height = 25
    Caption = 'Assinar Receita'
    TabOrder = 3
    OnClick = BtAssinarClick
  end
  object EdNumPed: TEdit
    Left = 105
    Top = 18
    Width = 96
    Height = 21
    TabOrder = 0
  end
end
