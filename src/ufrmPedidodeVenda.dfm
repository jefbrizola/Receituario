object frmPedidodeVenda: TfrmPedidodeVenda
  Left = 0
  Top = 0
  Caption = 'Pedido Venda'
  ClientHeight = 506
  ClientWidth = 593
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
  object Label6: TLabel
    Left = 432
    Top = 455
    Width = 70
    Height = 13
    Caption = 'Total Pedido'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LabNumpedido: TLabel
    Left = 8
    Top = 16
    Width = 117
    Height = 14
    Caption = 'N'#250'mero do pedido:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object GridPedido: TDBGrid
    Left = 9
    Top = 223
    Width = 576
    Height = 197
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
        Title.Caption = 'C'#243'digo'
        Width = 63
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Descricao'
        Title.Caption = 'Descri'#231#227'o'
        Width = 320
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'Quantidade'
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'Valor'
        Title.Caption = 'Valor Total'
        Width = 89
        Visible = True
      end>
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 48
    Width = 577
    Height = 65
    Caption = 'Cliente'
    TabOrder = 0
    object Label2: TLabel
      Left = 226
      Top = 35
      Width = 27
      Height = 13
      Caption = 'Nome'
    end
    object Label1: TLabel
      Left = 6
      Top = 35
      Width = 19
      Height = 13
      Caption = 'CPF'
    end
    object EdCPF: TEdit
      Left = 35
      Top = 32
      Width = 121
      Height = 21
      MaxLength = 11
      TabOrder = 0
    end
    object EdNome: TEdit
      Left = 259
      Top = 32
      Width = 306
      Height = 21
      Enabled = False
      TabOrder = 1
    end
    object BtnOk: TButton
      Left = 162
      Top = 32
      Width = 41
      Height = 22
      Caption = 'OK'
      TabOrder = 2
      OnClick = BtnOkClick
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 128
    Width = 577
    Height = 89
    Caption = 'Produto'
    TabOrder = 1
    object Label3: TLabel
      Left = 7
      Top = 25
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
    end
    object Label4: TLabel
      Left = 121
      Top = 25
      Width = 46
      Height = 13
      Caption = 'Descri'#231#227'o'
    end
    object Label5: TLabel
      Left = 444
      Top = 25
      Width = 53
      Height = 13
      Caption = ' Valor Unit.'
    end
    object Label7: TLabel
      Left = 381
      Top = 25
      Width = 34
      Height = 13
      Caption = 'Quant.'
    end
    object LabelAviso: TLabel
      Left = 9
      Top = 69
      Width = 143
      Height = 13
      Caption = 'Produto com controle especial'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    object EdCodProd: TEdit
      Left = 7
      Top = 44
      Width = 53
      Height = 21
      Alignment = taRightJustify
      TabOrder = 0
    end
    object EdDescr: TEdit
      Left = 121
      Top = 44
      Width = 246
      Height = 21
      Enabled = False
      TabOrder = 1
    end
    object BtIncluir: TButton
      Left = 504
      Top = 43
      Width = 61
      Height = 23
      Caption = 'Incluir'
      TabOrder = 2
      OnClick = BtIncluirClick
    end
    object EdValor: TEdit
      Left = 445
      Top = 44
      Width = 53
      Height = 21
      Alignment = taRightJustify
      Enabled = False
      TabOrder = 3
    end
    object EdQtd: TEdit
      Left = 381
      Top = 44
      Width = 53
      Height = 21
      Alignment = taRightJustify
      TabOrder = 4
    end
    object BtnOk2: TButton
      Left = 64
      Top = 43
      Width = 41
      Height = 24
      Caption = 'OK'
      TabOrder = 5
      OnClick = BtnOk2Click
    end
  end
  object BtNovo: TButton
    Left = 127
    Top = 448
    Width = 75
    Height = 25
    Caption = 'Novo'
    TabOrder = 3
    OnClick = BtNovoClick
  end
  object BtGravar: TButton
    Left = 224
    Top = 448
    Width = 75
    Height = 25
    Caption = 'Gravar'
    TabOrder = 4
    OnClick = BtGravarClick
  end
  object BtCancelar: TButton
    Left = 319
    Top = 448
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 5
    OnClick = BtCancelarClick
  end
  object EdTotal: TEdit
    Left = 508
    Top = 450
    Width = 62
    Height = 21
    Alignment = taRightJustify
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
    Text = '0'
  end
  object EdNumPedido: TEdit
    Left = 133
    Top = 14
    Width = 68
    Height = 22
    Alignment = taRightJustify
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 7
  end
end
