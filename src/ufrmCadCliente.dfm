object FrmCadClientes: TFrmCadClientes
  Left = 0
  Top = 0
  Caption = 'Cadastro de Clientes'
  ClientHeight = 141
  ClientWidth = 440
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 12
    Width = 19
    Height = 13
    Caption = 'CPF'
  end
  object Label2: TLabel
    Left = 12
    Top = 52
    Width = 27
    Height = 13
    Caption = 'Nome'
  end
  object EdCPF: TEdit
    Left = 49
    Top = 8
    Width = 121
    Height = 21
    Enabled = False
    MaxLength = 11
    TabOrder = 0
  end
  object EdNome: TEdit
    Left = 47
    Top = 49
    Width = 290
    Height = 21
    Enabled = False
    TabOrder = 1
  end
  object BtNovo: TButton
    Left = 13
    Top = 104
    Width = 75
    Height = 25
    Caption = 'Novo'
    TabOrder = 2
    OnClick = BtNovoClick
  end
  object BtGravar: TButton
    Left = 339
    Top = 104
    Width = 75
    Height = 25
    Caption = 'Gravar'
    TabOrder = 3
    OnClick = BtGravarClick
  end
  object BtCons: TButton
    Left = 94
    Top = 104
    Width = 75
    Height = 25
    Caption = 'Consultar'
    TabOrder = 4
    OnClick = BtConsClick
  end
  object BtEditar: TButton
    Left = 258
    Top = 104
    Width = 75
    Height = 25
    Caption = 'Editar'
    TabOrder = 5
    OnClick = BtEditarClick
  end
  object BtExcluir: TButton
    Left = 175
    Top = 104
    Width = 75
    Height = 25
    Caption = 'Excluir'
    TabOrder = 6
    OnClick = BtExcluirClick
  end
  object PnlCons: TPanel
    Left = 94
    Top = 26
    Width = 299
    Height = 65
    Color = clBtnShadow
    ParentBackground = False
    TabOrder = 7
    Visible = False
    object Label3: TLabel
      Left = 96
      Top = 9
      Width = 69
      Height = 13
      Caption = 'Informe o CPF'
    end
    object EdConsCPF: TEdit
      Left = 51
      Top = 28
      Width = 153
      Height = 21
      MaxLength = 11
      TabOrder = 0
    end
    object BtnOk: TButton
      Left = 211
      Top = 26
      Width = 41
      Height = 25
      Caption = 'OK'
      TabOrder = 1
      OnClick = BtnOkClick
    end
  end
end
