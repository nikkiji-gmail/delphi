object FormMain: TFormMain
  Left = 0
  Top = 0
  Caption = 'Windows 11 BLE '#44592#44592' '#44160#49353#44592
  ClientHeight = 480
  ClientWidth = 680
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  DesignSize = (
    680
    480)
  TextHeight = 15
  object LabelTitle: TLabel
    Left = 16
    Top = 16
    Width = 204
    Height = 21
    Caption = 'Bluetooth Low Energy '#49828#52880#45320
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LabelStatus: TLabel
    Left = 16
    Top = 453
    Width = 28
    Height = 15
    Anchors = [akLeft, akBottom]
    Caption = #51456#48708
  end
  object ListView1: TListView
    Left = 16
    Top = 88
    Width = 648
    Height = 345
    Anchors = [akLeft, akTop, akRight, akBottom]
    Columns = <>
    GridLines = True
    ReadOnly = True
    RowSelect = True
    TabOrder = 0
    ViewStyle = vsReport
  end
  object ButtonStartScan: TButton
    Left = 16
    Top = 48
    Width = 150
    Height = 33
    Caption = #49828#52880' '#49884#51089
    TabOrder = 1
    OnClick = ButtonStartScanClick
  end
  object ButtonStopScan: TButton
    Left = 172
    Top = 48
    Width = 150
    Height = 33
    Caption = #49828#52880' '#51473#51648
    Enabled = False
    TabOrder = 2
    OnClick = ButtonStopScanClick
  end
  object ButtonClear: TButton
    Left = 328
    Top = 48
    Width = 150
    Height = 33
    Caption = #47785#47197' '#51648#50864#44592
    TabOrder = 3
    OnClick = ButtonClearClick
  end
end
