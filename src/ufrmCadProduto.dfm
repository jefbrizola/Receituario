object FrmCadProduto: TFrmCadProduto
  Left = 0
  Top = 0
  Caption = 'Cadastro de produto'
  ClientHeight = 139
  ClientWidth = 447
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 4
    Top = 23
    Width = 33
    Height = 13
    Caption = 'C'#243'digo'
  end
  object Label2: TLabel
    Left = 102
    Top = 23
    Width = 46
    Height = 13
    Caption = 'Descri'#231#227'o'
  end
  object Label3: TLabel
    Left = 13
    Top = 58
    Width = 24
    Height = 13
    Caption = 'Valor'
  end
  object Label5: TLabel
    Left = 283
    Top = 62
    Width = 62
    Height = 13
    Caption = 'Tec. Agricula'
  end
  object EdCodigo: TEdit
    Left = 43
    Top = 19
    Width = 53
    Height = 21
    TabOrder = 0
  end
  object EdDescr: TEdit
    Left = 157
    Top = 19
    Width = 279
    Height = 21
    TabOrder = 1
  end
  object BtNovo: TButton
    Left = 8
    Top = 104
    Width = 75
    Height = 25
    Caption = 'Novo'
    TabOrder = 3
    OnClick = BtNovoClick
  end
  object BtGravar: TButton
    Left = 353
    Top = 104
    Width = 75
    Height = 25
    Caption = 'Gravar'
    TabOrder = 6
    OnClick = BtGravarClick
  end
  object BtCons: TButton
    Left = 96
    Top = 103
    Width = 75
    Height = 25
    Caption = 'Consultar'
    TabOrder = 7
    OnClick = BtConsClick
  end
  object EdValor: TEdit
    Left = 43
    Top = 55
    Width = 53
    Height = 21
    TabOrder = 2
  end
  object CheckBoxContrl: TCheckBox
    Left = 157
    Top = 61
    Width = 97
    Height = 17
    Caption = 'Controle especial'
    TabOrder = 4
    OnClick = CheckBoxContrlClick
  end
  object BtEditar: TButton
    Left = 263
    Top = 104
    Width = 75
    Height = 24
    Caption = 'Editar'
    TabOrder = 9
    OnClick = BtEditarClick
  end
  object BtExcluir: TButton
    Left = 177
    Top = 104
    Width = 75
    Height = 25
    Caption = 'Excluir'
    TabOrder = 8
    OnClick = BtExcluirClick
  end
  object EdTecA: TEdit
    Left = 353
    Top = 59
    Width = 83
    Height = 21
    Enabled = False
    TabOrder = 5
  end
  object PnlCons: TPanel
    Left = 67
    Top = 23
    Width = 316
    Height = 65
    BiDiMode = bdLeftToRight
    Color = clBtnShadow
    Ctl3D = True
    DoubleBuffered = False
    ParentBiDiMode = False
    ParentBackground = False
    ParentCtl3D = False
    ParentDoubleBuffered = False
    TabOrder = 10
    Visible = False
    object Label4: TLabel
      Left = 27
      Top = 25
      Width = 89
      Height = 13
      Caption = 'C'#243'digo do produto'
    end
    object EdConsProd: TEdit
      Left = 123
      Top = 23
      Width = 86
      Height = 21
      TabOrder = 0
    end
    object BtnOk: TButton
      Left = 220
      Top = 22
      Width = 41
      Height = 25
      Caption = 'OK'
      TabOrder = 1
      OnClick = BtnOkClick
    end
  end
end
