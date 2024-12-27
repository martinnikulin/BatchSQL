object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = 'BatchSQL'
  ClientHeight = 837
  ClientWidth = 1190
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 13
  object Splitter5: TSplitter
    Left = 0
    Top = 731
    Width = 1190
    Height = 3
    Cursor = crVSplit
    Align = alBottom
    Visible = False
    ExplicitTop = 549
  end
  object Ribbon: TdxRibbon
    Left = 0
    Top = 0
    Width = 1190
    Height = 60
    BarManager = dxBarManager1
    CapitalizeTabCaptions = bDefault
    Style = rs2016Tablet
    ColorSchemeAccent = rcsaBlue
    ColorSchemeName = 'Colorful'
    QuickAccessToolbar.Toolbar = dxBarManager1Bar1
    SupportNonClientDrawing = True
    Contexts = <>
    TabAreaToolbar.Toolbar = dxBarManager1Bar2
    TabOrder = 0
    TabStop = False
    OnTabChanged = RibbonTabChanged
    object dxRibbon1Tab1: TdxRibbonTab
      Active = True
      Caption = 'SQL '#1057#1082#1088#1080#1087#1090#1099
      Groups = <>
      Index = 0
    end
    object dxRibbon1Tab3: TdxRibbonTab
      Caption = #1047#1072#1076#1072#1085#1080#1103
      Groups = <
        item
          ToolbarName = 'dxBarManager1Bar7'
        end>
      Index = 1
    end
    object dxRibbon1Tab2: TdxRibbonTab
      Caption = #1048#1085#1090#1077#1088#1072#1082#1090#1080#1074#1085#1099#1081' '#1089#1082#1088#1080#1087#1090
      Groups = <
        item
          ToolbarName = 'dxBarManager1Bar3'
        end
        item
          ToolbarName = 'dxBarManager1Bar4'
        end>
      Index = 2
    end
  end
  object dxRibbonStatusBar1: TdxRibbonStatusBar
    Left = 0
    Top = 814
    Width = 1190
    Height = 23
    Color = clBtnFace
    Panels = <>
    Ribbon = Ribbon
    LookAndFeel.NativeStyle = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clDefault
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ExplicitTop = 813
    ExplicitWidth = 1186
  end
  object PageControl: TcxPageControl
    Left = 0
    Top = 60
    Width = 1190
    Height = 671
    Align = alClient
    TabOrder = 2
    Properties.ActivePage = cxTabSheet1
    Properties.CustomButtons.Buttons = <>
    Properties.HideTabs = True
    OnChange = PageControlChange
    ExplicitWidth = 1186
    ExplicitHeight = 670
    ClientRectBottom = 670
    ClientRectLeft = 1
    ClientRectRight = 1189
    ClientRectTop = 1
    object cxTabSheet1: TcxTabSheet
      Caption = 'cxTabSheet1'
      ImageIndex = 0
      ExplicitWidth = 1184
      ExplicitHeight = 668
      object Splitter2: TSplitter
        Left = 561
        Top = 0
        Height = 669
        ExplicitLeft = 712
        ExplicitTop = 5
        ExplicitHeight = 486
      end
      object TabControl1: TTabControl
        Left = 564
        Top = 0
        Width = 624
        Height = 669
        Margins.Left = 1
        Margins.Top = 1
        Margins.Right = 1
        Margins.Bottom = 1
        Align = alClient
        TabOrder = 0
        Tabs.Strings = (
          'SQL '#1058#1077#1082#1089#1090)
        TabIndex = 0
        ExplicitWidth = 620
        ExplicitHeight = 668
        object ScriptDBMemo: TcxDBMemo
          Left = 4
          Top = 24
          Align = alClient
          DataBinding.DataField = 'Text'
          DataBinding.DataSource = DM.dsScripts
          Properties.ScrollBars = ssBoth
          Style.BorderStyle = ebsUltraFlat
          Style.LookAndFeel.Kind = lfFlat
          Style.LookAndFeel.ScrollbarMode = sbmClassic
          StyleDisabled.LookAndFeel.Kind = lfFlat
          StyleDisabled.LookAndFeel.ScrollbarMode = sbmClassic
          StyleFocused.LookAndFeel.Kind = lfFlat
          StyleFocused.LookAndFeel.ScrollbarMode = sbmClassic
          StyleHot.LookAndFeel.Kind = lfFlat
          StyleHot.LookAndFeel.ScrollbarMode = sbmClassic
          TabOrder = 0
          ExplicitWidth = 612
          ExplicitHeight = 640
          Height = 641
          Width = 616
        end
      end
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 561
        Height = 669
        Align = alLeft
        Caption = 'Panel1'
        TabOrder = 1
        ExplicitHeight = 668
        object Splitter1: TSplitter
          Left = 1
          Top = 305
          Width = 559
          Height = 3
          Cursor = crVSplit
          Align = alTop
          ExplicitLeft = 3
          ExplicitTop = 319
          ExplicitWidth = 537
        end
        object TabControl2: TTabControl
          Left = 1
          Top = 1
          Width = 559
          Height = 304
          Align = alTop
          TabOrder = 0
          Tabs.Strings = (
            #1055#1072#1082#1077#1090#1099' SQL '#1089#1082#1088#1080#1087#1090#1086#1074)
          TabIndex = 0
          object PacketsGrid: TcxGrid
            Left = 4
            Top = 24
            Width = 551
            Height = 220
            Align = alTop
            TabOrder = 0
            LookAndFeel.Kind = lfFlat
            LookAndFeel.NativeStyle = False
            LookAndFeel.ScrollbarMode = sbmClassic
            object PacketsTableView: TcxGridDBTableView
              Navigator.Buttons.CustomButtons = <>
              Navigator.Buttons.First.Visible = False
              Navigator.Buttons.PriorPage.Visible = False
              Navigator.Buttons.Prior.Visible = False
              Navigator.Buttons.Next.Visible = False
              Navigator.Buttons.NextPage.Visible = False
              Navigator.Buttons.Last.Visible = False
              Navigator.Buttons.Insert.Visible = True
              Navigator.Buttons.Delete.Visible = True
              Navigator.Buttons.Edit.Visible = False
              Navigator.Buttons.Cancel.Visible = False
              Navigator.Buttons.Refresh.Visible = False
              Navigator.Buttons.SaveBookmark.Visible = False
              Navigator.Buttons.GotoBookmark.Visible = False
              Navigator.Buttons.Filter.Visible = False
              Navigator.InfoPanel.Visible = True
              Navigator.Visible = True
              ScrollbarAnnotations.CustomAnnotations = <>
              DataController.DataSource = DM.dsPackets
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <>
              DataController.Summary.SummaryGroups = <>
              OptionsBehavior.ImmediateEditor = False
              OptionsData.Appending = True
              OptionsView.ColumnAutoWidth = True
              OptionsView.DataRowHeight = 26
              OptionsView.GroupByBox = False
              OptionsView.HeaderHeight = 26
              OptionsView.Indicator = True
              OptionsView.IndicatorWidth = 20
              Styles.UseOddEvenStyles = bTrue
              object PacketsTableViewId: TcxGridDBColumn
                Caption = 'Id'
                DataBinding.FieldName = 'PacketId'
                DataBinding.IsNullValueType = True
                HeaderAlignmentHorz = taCenter
                MinWidth = 16
                Width = 42
              end
              object PacketsTableViewName: TcxGridDBColumn
                Caption = #1055#1072#1082#1077#1090
                DataBinding.FieldName = 'Name'
                DataBinding.IsNullValueType = True
                HeaderAlignmentHorz = taCenter
                MinWidth = 16
                Width = 431
              end
              object PacketsTableViewDateCreated: TcxGridDBColumn
                Caption = #1044#1072#1090#1072' '#1089#1086#1079#1076#1072#1085#1080#1103
                DataBinding.FieldName = 'DateCreated'
                DataBinding.IsNullValueType = True
                HeaderAlignmentHorz = taCenter
                MinWidth = 16
                Width = 106
              end
            end
            object PacketsGridLevel: TcxGridLevel
              GridView = PacketsTableView
            end
          end
          object PacketDBMemo: TDBMemo
            Left = 4
            Top = 244
            Width = 551
            Height = 56
            Align = alClient
            DataField = 'Description'
            DataSource = DM.dsPackets
            TabOrder = 1
          end
        end
        object TabControl3: TTabControl
          Left = 1
          Top = 308
          Width = 559
          Height = 360
          Align = alClient
          TabOrder = 1
          Tabs.Strings = (
            'SQL '#1057#1082#1088#1080#1087#1090#1099)
          TabIndex = 0
          ExplicitHeight = 359
          object ScriptsGrid: TcxGrid
            Left = 4
            Top = 24
            Width = 551
            Height = 332
            Align = alClient
            TabOrder = 0
            LookAndFeel.Kind = lfFlat
            LookAndFeel.NativeStyle = False
            LookAndFeel.ScrollbarMode = sbmClassic
            ExplicitHeight = 331
            object ScriptsTableView: TcxGridDBTableView
              Navigator.Buttons.CustomButtons = <>
              Navigator.Buttons.First.Visible = False
              Navigator.Buttons.PriorPage.Visible = False
              Navigator.Buttons.Prior.Visible = False
              Navigator.Buttons.Next.Visible = False
              Navigator.Buttons.NextPage.Visible = False
              Navigator.Buttons.Last.Visible = False
              Navigator.Buttons.Insert.Visible = True
              Navigator.Buttons.Delete.Visible = True
              Navigator.Buttons.Edit.Visible = False
              Navigator.Buttons.Cancel.Visible = False
              Navigator.Buttons.Refresh.Visible = False
              Navigator.Buttons.SaveBookmark.Visible = False
              Navigator.Buttons.GotoBookmark.Visible = False
              Navigator.Buttons.Filter.Visible = False
              Navigator.InfoPanel.Visible = True
              Navigator.Visible = True
              ScrollbarAnnotations.CustomAnnotations = <>
              DataController.DataSource = DM.dsScripts
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <>
              DataController.Summary.SummaryGroups = <>
              OptionsBehavior.ImmediateEditor = False
              OptionsData.Appending = True
              OptionsView.ColumnAutoWidth = True
              OptionsView.DataRowHeight = 26
              OptionsView.GroupByBox = False
              OptionsView.HeaderHeight = 26
              OptionsView.Indicator = True
              OptionsView.IndicatorWidth = 20
              Styles.UseOddEvenStyles = bTrue
              object ScriptsTableViewId: TcxGridDBColumn
                Caption = 'Id'
                DataBinding.FieldName = 'ScriptId'
                DataBinding.IsNullValueType = True
                HeaderAlignmentHorz = taCenter
                MinWidth = 16
                Width = 38
              end
              object ScriptsTableViewN: TcxGridDBColumn
                DataBinding.FieldName = 'N'
                DataBinding.IsNullValueType = True
                HeaderAlignmentHorz = taCenter
                Width = 38
              end
              object ScriptsTableViewName: TcxGridDBColumn
                Caption = #1053#1072#1079#1074#1072#1085#1080#1077
                DataBinding.FieldName = 'Name'
                DataBinding.IsNullValueType = True
                HeaderAlignmentHorz = taCenter
                MinWidth = 16
                Width = 243
              end
              object ScriptsTableViewDesc: TcxGridDBColumn
                Caption = #1054#1087#1080#1089#1072#1085#1080#1077
                DataBinding.FieldName = 'Description'
                DataBinding.IsNullValueType = True
                HeaderAlignmentHorz = taCenter
                MinWidth = 16
                Width = 284
              end
            end
            object ScriptsGridLevel: TcxGridLevel
              GridView = ScriptsTableView
            end
          end
        end
      end
    end
    object cxTabSheet2: TcxTabSheet
      Caption = #1047#1072#1076#1072#1085#1080#1103
      ImageIndex = 1
      object Splitter4: TSplitter
        Left = 528
        Top = 0
        Height = 669
        ExplicitLeft = 640
        ExplicitHeight = 486
      end
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 528
        Height = 669
        Align = alLeft
        BevelOuter = bvNone
        Caption = 'Panel1'
        TabOrder = 0
        object Splitter3: TSplitter
          Left = 0
          Top = 289
          Width = 528
          Height = 3
          Cursor = crVSplit
          Align = alTop
          ExplicitLeft = 5
          ExplicitTop = 268
          ExplicitWidth = 553
        end
        object TabControl5: TTabControl
          Left = 0
          Top = 0
          Width = 528
          Height = 289
          Align = alTop
          TabOrder = 0
          Tabs.Strings = (
            #1057#1077#1088#1074#1077#1088#1099)
          TabIndex = 0
          object ServersGrid: TcxGrid
            Left = 4
            Top = 24
            Width = 520
            Height = 261
            Align = alClient
            TabOrder = 0
            LookAndFeel.Kind = lfFlat
            LookAndFeel.NativeStyle = False
            LookAndFeel.ScrollbarMode = sbmClassic
            object ServersTableView: TcxGridDBTableView
              Navigator.Buttons.CustomButtons = <>
              ScrollbarAnnotations.CustomAnnotations = <>
              OnFocusedRecordChanged = ServersTableViewFocusedRecordChanged
              DataController.DataSource = DM.dsServers
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <>
              DataController.Summary.SummaryGroups = <>
              OptionsBehavior.ImmediateEditor = False
              OptionsView.ColumnAutoWidth = True
              OptionsView.DataRowHeight = 26
              OptionsView.GroupByBox = False
              OptionsView.HeaderHeight = 26
              OptionsView.Indicator = True
              OptionsView.IndicatorWidth = 20
              object ServersTableViewServerId: TcxGridDBColumn
                Caption = 'Id'
                DataBinding.FieldName = 'ServerId'
                DataBinding.IsNullValueType = True
                HeaderAlignmentHorz = taCenter
                MinWidth = 16
                Width = 36
              end
              object ServersTableViewName: TcxGridDBColumn
                Caption = #1057#1077#1088#1074#1077#1088
                DataBinding.FieldName = 'ServerName'
                DataBinding.IsNullValueType = True
                HeaderAlignmentHorz = taCenter
                Width = 426
              end
              object ServersTableViewActual: TcxGridDBColumn
                DataBinding.FieldName = 'Actual'
                DataBinding.IsNullValueType = True
                HeaderAlignmentHorz = taCenter
                MinWidth = 16
                Width = 36
                IsCaptionAssigned = True
              end
            end
            object ServersGridLevel: TcxGridLevel
              GridView = ServersTableView
            end
          end
        end
        object TabControl6: TTabControl
          Left = 0
          Top = 292
          Width = 528
          Height = 377
          Align = alClient
          TabOrder = 1
          Tabs.Strings = (
            #1041#1072#1079#1099' '#1076#1072#1085#1085#1099#1093)
          TabIndex = 0
          object ProjectsGrid: TcxGrid
            Left = 4
            Top = 24
            Width = 520
            Height = 349
            Align = alClient
            TabOrder = 0
            LookAndFeel.Kind = lfFlat
            LookAndFeel.NativeStyle = False
            LookAndFeel.ScrollbarMode = sbmClassic
            object ProjectsTableView: TcxGridDBTableView
              Navigator.Buttons.CustomButtons = <>
              ScrollbarAnnotations.CustomAnnotations = <>
              DataController.DataSource = DM.dsDatabases
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <>
              DataController.Summary.SummaryGroups = <>
              OptionsBehavior.ImmediateEditor = False
              OptionsView.ColumnAutoWidth = True
              OptionsView.DataRowHeight = 26
              OptionsView.GroupByBox = False
              OptionsView.HeaderHeight = 26
              OptionsView.Indicator = True
              OptionsView.IndicatorWidth = 20
              object ProjectsTableViewProjectId: TcxGridDBColumn
                Caption = 'Id'
                DataBinding.FieldName = 'ProjectId'
                DataBinding.IsNullValueType = True
                HeaderAlignmentHorz = taCenter
                HeaderGlyphAlignmentHorz = taCenter
                Width = 45
              end
              object ProjectsTableViewProjectName: TcxGridDBColumn
                Caption = #1055#1088#1086#1077#1082#1090
                DataBinding.FieldName = 'ProjectName'
                DataBinding.IsNullValueType = True
                HeaderAlignmentHorz = taCenter
                HeaderGlyphAlignmentHorz = taCenter
                MinWidth = 16
                Width = 337
              end
              object ProjectsTableViewDatabase: TcxGridDBColumn
                Caption = #1041#1072#1079#1072' '#1076#1072#1085#1085#1099#1093
                DataBinding.FieldName = 'Database'
                DataBinding.IsNullValueType = True
                HeaderAlignmentHorz = taCenter
                MinWidth = 16
                Width = 236
              end
              object ProjectsTableViewToUpdate: TcxGridDBColumn
                DataBinding.FieldName = 'ToUpdate'
                DataBinding.IsNullValueType = True
                Width = 50
                IsCaptionAssigned = True
              end
            end
            object ProjectsGridLevel: TcxGridLevel
              GridView = ProjectsTableView
            end
          end
        end
      end
      object Panel3: TPanel
        Left = 531
        Top = 0
        Width = 657
        Height = 669
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object Splitter6: TSplitter
          Left = 0
          Top = 161
          Width = 657
          Height = 3
          Cursor = crVSplit
          Align = alTop
          ExplicitTop = 286
          ExplicitWidth = 292
        end
        object Splitter7: TSplitter
          Left = 0
          Top = 401
          Width = 657
          Height = 3
          Cursor = crVSplit
          Align = alTop
          ExplicitWidth = 268
        end
        object TabControl4: TTabControl
          Left = 0
          Top = 0
          Width = 657
          Height = 161
          Align = alTop
          TabOrder = 0
          Tabs.Strings = (
            #1055#1072#1082#1077#1090#1099)
          TabIndex = 0
          object ServerPacketsGrid: TcxGrid
            Left = 4
            Top = 24
            Width = 649
            Height = 133
            Align = alClient
            TabOrder = 0
            LookAndFeel.Kind = lfFlat
            LookAndFeel.NativeStyle = False
            LookAndFeel.ScrollbarMode = sbmClassic
            object ServerPacketsTableView: TcxGridDBTableView
              Navigator.Buttons.CustomButtons = <>
              Navigator.Buttons.First.Visible = False
              Navigator.Buttons.PriorPage.Visible = False
              Navigator.Buttons.Prior.Visible = False
              Navigator.Buttons.Next.Visible = False
              Navigator.Buttons.NextPage.Visible = False
              Navigator.Buttons.Last.Visible = False
              Navigator.Buttons.Insert.Visible = True
              Navigator.Buttons.Edit.Visible = False
              Navigator.Buttons.Cancel.Visible = False
              Navigator.Buttons.Refresh.Visible = False
              Navigator.Buttons.SaveBookmark.Visible = False
              Navigator.Buttons.GotoBookmark.Visible = False
              Navigator.Buttons.Filter.Visible = False
              Navigator.Visible = True
              ScrollbarAnnotations.CustomAnnotations = <>
              DataController.DataSource = DM.dsServerPackets
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <>
              DataController.Summary.SummaryGroups = <>
              OptionsBehavior.ImmediateEditor = False
              OptionsData.Appending = True
              OptionsView.ColumnAutoWidth = True
              OptionsView.DataRowHeight = 26
              OptionsView.GroupByBox = False
              OptionsView.HeaderHeight = 26
              OptionsView.Indicator = True
              OptionsView.IndicatorWidth = 20
              object ServerPacketsTableViewN: TcxGridDBColumn
                DataBinding.FieldName = 'N'
                DataBinding.IsNullValueType = True
                HeaderAlignmentHorz = taCenter
                Width = 58
              end
              object ServerPacketsTableViewDescription: TcxGridDBColumn
                Caption = #1055#1072#1082#1077#1090
                DataBinding.FieldName = 'PacketId'
                DataBinding.IsNullValueType = True
                PropertiesClassName = 'TcxLookupComboBoxProperties'
                Properties.KeyFieldNames = 'PacketId'
                Properties.ListColumns = <
                  item
                    FieldName = 'Name'
                  end>
                Properties.ListOptions.ShowHeader = False
                Properties.ListSource = DM.dsPackets
                HeaderAlignmentHorz = taCenter
                Width = 364
              end
              object ServerPacketsTableViewAppointed: TcxGridDBColumn
                DataBinding.FieldName = 'Appointed'
                DataBinding.IsNullValueType = True
                HeaderAlignmentHorz = taCenter
                Width = 39
                IsCaptionAssigned = True
              end
              object ServerPacketsTableViewApplyingDate: TcxGridDBColumn
                Caption = #1044#1072#1090#1072' '#1087#1088#1080#1084#1077#1085#1077#1085#1080#1103
                DataBinding.FieldName = 'ApplyingDate'
                DataBinding.IsNullValueType = True
                HeaderAlignmentHorz = taCenter
                Width = 166
              end
            end
            object ServerPacketsGridLevel: TcxGridLevel
              GridView = ServerPacketsTableView
            end
          end
        end
        object TabControl7: TTabControl
          Left = 0
          Top = 164
          Width = 657
          Height = 237
          Align = alTop
          TabOrder = 1
          Tabs.Strings = (
            'SQL '#1057#1082#1088#1080#1087#1090#1099)
          TabIndex = 0
          object cxGrid1: TcxGrid
            Left = 4
            Top = 24
            Width = 649
            Height = 209
            Align = alClient
            TabOrder = 0
            LookAndFeel.Kind = lfFlat
            LookAndFeel.NativeStyle = False
            LookAndFeel.ScrollbarMode = sbmClassic
            object cxGridDBTableView1: TcxGridDBTableView
              Navigator.Buttons.CustomButtons = <>
              Navigator.Buttons.First.Visible = False
              Navigator.Buttons.PriorPage.Visible = False
              Navigator.Buttons.Prior.Visible = False
              Navigator.Buttons.Next.Visible = False
              Navigator.Buttons.NextPage.Visible = False
              Navigator.Buttons.Last.Visible = False
              Navigator.Buttons.Insert.Visible = True
              Navigator.Buttons.Delete.Visible = True
              Navigator.Buttons.Edit.Visible = False
              Navigator.Buttons.Cancel.Visible = False
              Navigator.Buttons.Refresh.Visible = False
              Navigator.Buttons.SaveBookmark.Visible = False
              Navigator.Buttons.GotoBookmark.Visible = False
              Navigator.Buttons.Filter.Visible = False
              Navigator.InfoPanel.Visible = True
              Navigator.Visible = True
              ScrollbarAnnotations.CustomAnnotations = <>
              DataController.DataSource = DM.dsScripts
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <>
              DataController.Summary.SummaryGroups = <>
              OptionsBehavior.ImmediateEditor = False
              OptionsData.Appending = True
              OptionsView.ColumnAutoWidth = True
              OptionsView.DataRowHeight = 26
              OptionsView.GroupByBox = False
              OptionsView.HeaderHeight = 26
              OptionsView.Indicator = True
              OptionsView.IndicatorWidth = 20
              Styles.UseOddEvenStyles = bTrue
              object cxGridDBColumn1: TcxGridDBColumn
                Caption = 'Id'
                DataBinding.FieldName = 'ScriptId'
                DataBinding.IsNullValueType = True
                HeaderAlignmentHorz = taCenter
                MinWidth = 16
                Width = 38
              end
              object cxGridDBColumn2: TcxGridDBColumn
                DataBinding.FieldName = 'N'
                DataBinding.IsNullValueType = True
                HeaderAlignmentHorz = taCenter
                Width = 38
              end
              object cxGridDBColumn3: TcxGridDBColumn
                Caption = #1053#1072#1079#1074#1072#1085#1080#1077
                DataBinding.FieldName = 'Name'
                DataBinding.IsNullValueType = True
                HeaderAlignmentHorz = taCenter
                MinWidth = 16
                Width = 243
              end
              object cxGridDBColumn4: TcxGridDBColumn
                Caption = #1054#1087#1080#1089#1072#1085#1080#1077
                DataBinding.FieldName = 'Description'
                DataBinding.IsNullValueType = True
                HeaderAlignmentHorz = taCenter
                MinWidth = 16
                Width = 284
              end
            end
            object cxGridLevel1: TcxGridLevel
              GridView = cxGridDBTableView1
            end
          end
        end
        object TabControl8: TTabControl
          Left = 0
          Top = 404
          Width = 657
          Height = 265
          Margins.Left = 1
          Margins.Top = 1
          Margins.Right = 1
          Margins.Bottom = 1
          Align = alClient
          TabOrder = 2
          Tabs.Strings = (
            'SQL '#1058#1077#1082#1089#1090)
          TabIndex = 0
          object cxDBMemo1: TcxDBMemo
            Left = 4
            Top = 24
            Align = alClient
            DataBinding.DataField = 'Text'
            DataBinding.DataSource = DM.dsScripts
            Properties.ScrollBars = ssBoth
            TabOrder = 0
            Height = 237
            Width = 649
          end
        end
      end
    end
    object cxTabSheet3: TcxTabSheet
      Caption = 'cxTabSheet3'
      ImageIndex = 2
      object Splitter9: TSplitter
        Left = 528
        Top = 0
        Height = 669
        ExplicitLeft = 536
      end
      object Panel4: TPanel
        Left = 0
        Top = 0
        Width = 528
        Height = 669
        Align = alLeft
        BevelOuter = bvNone
        Caption = 'Panel1'
        TabOrder = 0
        object Splitter8: TSplitter
          Left = 0
          Top = 289
          Width = 528
          Height = 3
          Cursor = crVSplit
          Align = alTop
          ExplicitLeft = 5
          ExplicitTop = 268
          ExplicitWidth = 553
        end
        object TabControl9: TTabControl
          Left = 0
          Top = 0
          Width = 528
          Height = 289
          Align = alTop
          TabOrder = 0
          Tabs.Strings = (
            #1057#1077#1088#1074#1077#1088#1099)
          TabIndex = 0
          object ServersGrid2: TcxGrid
            Left = 4
            Top = 24
            Width = 520
            Height = 261
            Align = alClient
            TabOrder = 0
            LookAndFeel.Kind = lfFlat
            LookAndFeel.NativeStyle = False
            LookAndFeel.ScrollbarMode = sbmClassic
            object ServersTableView2: TcxGridDBTableView
              Navigator.Buttons.CustomButtons = <>
              ScrollbarAnnotations.CustomAnnotations = <>
              OnFocusedRecordChanged = ServersTableViewFocusedRecordChanged
              DataController.DataSource = DM.dsServers
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <>
              DataController.Summary.SummaryGroups = <>
              OptionsBehavior.ImmediateEditor = False
              OptionsView.ColumnAutoWidth = True
              OptionsView.DataRowHeight = 26
              OptionsView.GroupByBox = False
              OptionsView.HeaderHeight = 26
              OptionsView.Indicator = True
              OptionsView.IndicatorWidth = 20
              object cxGridDBColumn5: TcxGridDBColumn
                Caption = 'Id'
                DataBinding.FieldName = 'ServerId'
                DataBinding.IsNullValueType = True
                HeaderAlignmentHorz = taCenter
                MinWidth = 16
                Width = 36
              end
              object cxGridDBColumn6: TcxGridDBColumn
                Caption = #1057#1077#1088#1074#1077#1088
                DataBinding.FieldName = 'ServerName'
                DataBinding.IsNullValueType = True
                HeaderAlignmentHorz = taCenter
                Width = 426
              end
              object cxGridDBColumn7: TcxGridDBColumn
                DataBinding.FieldName = 'Actual'
                DataBinding.IsNullValueType = True
                HeaderAlignmentHorz = taCenter
                MinWidth = 16
                Width = 36
                IsCaptionAssigned = True
              end
            end
            object ServersGridLevel2: TcxGridLevel
              GridView = ServersTableView2
            end
          end
        end
        object TabControl10: TTabControl
          Left = 0
          Top = 292
          Width = 528
          Height = 377
          Align = alClient
          TabOrder = 1
          Tabs.Strings = (
            #1041#1072#1079#1099' '#1076#1072#1085#1085#1099#1093)
          TabIndex = 0
          object ProjectsGrid2: TcxGrid
            Left = 4
            Top = 24
            Width = 520
            Height = 349
            Align = alClient
            TabOrder = 0
            LookAndFeel.Kind = lfFlat
            LookAndFeel.NativeStyle = False
            LookAndFeel.ScrollbarMode = sbmClassic
            object ProjectsTableView2: TcxGridDBTableView
              Navigator.Buttons.CustomButtons = <>
              ScrollbarAnnotations.CustomAnnotations = <>
              DataController.DataSource = DM.dsDatabases
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <>
              DataController.Summary.SummaryGroups = <>
              OptionsBehavior.ImmediateEditor = False
              OptionsView.ColumnAutoWidth = True
              OptionsView.DataRowHeight = 26
              OptionsView.GroupByBox = False
              OptionsView.HeaderHeight = 26
              OptionsView.Indicator = True
              OptionsView.IndicatorWidth = 20
              object cxGridDBColumn8: TcxGridDBColumn
                Caption = 'Id'
                DataBinding.FieldName = 'ProjectId'
                DataBinding.IsNullValueType = True
                HeaderAlignmentHorz = taCenter
                HeaderGlyphAlignmentHorz = taCenter
                Width = 45
              end
              object cxGridDBColumn9: TcxGridDBColumn
                Caption = #1055#1088#1086#1077#1082#1090
                DataBinding.FieldName = 'ProjectName'
                DataBinding.IsNullValueType = True
                HeaderAlignmentHorz = taCenter
                HeaderGlyphAlignmentHorz = taCenter
                MinWidth = 16
                Width = 337
              end
              object cxGridDBColumn10: TcxGridDBColumn
                Caption = #1041#1072#1079#1072' '#1076#1072#1085#1085#1099#1093
                DataBinding.FieldName = 'Database'
                DataBinding.IsNullValueType = True
                HeaderAlignmentHorz = taCenter
                MinWidth = 16
                Width = 236
              end
              object cxGridDBColumn11: TcxGridDBColumn
                DataBinding.FieldName = 'ToUpdate'
                DataBinding.IsNullValueType = True
                Width = 50
                IsCaptionAssigned = True
              end
            end
            object ProjectsGridLevel2: TcxGridLevel
              GridView = ProjectsTableView2
            end
          end
        end
      end
      object Memo1: TMemo
        Left = 531
        Top = 0
        Width = 657
        Height = 669
        Align = alClient
        ScrollBars = ssBoth
        TabOrder = 1
      end
    end
  end
  object MessageMemo: TMemo
    Left = 0
    Top = 734
    Width = 1190
    Height = 80
    Align = alBottom
    ScrollBars = ssVertical
    TabOrder = 3
    Visible = False
    ExplicitTop = 733
    ExplicitWidth = 1186
  end
  object dxBarManager1: TdxBarManager
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    Categories.Strings = (
      'Default')
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    PopupMenuLinks = <>
    UseSystemFont = True
    Left = 530
    Top = 8
    PixelsPerInch = 96
    object dxBarManager1Bar1: TdxBar
      Caption = 'Quick Access Toolbar'
      CaptionButtons = <>
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 0
      FloatTop = 0
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <>
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object dxBarManager1Bar2: TdxBar
      Caption = 'Tab Area Toolbar'
      CaptionButtons = <>
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 0
      FloatTop = 0
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'cxBarEditItem1'
        end>
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object dxBarManager1Bar7: TdxBar
      Caption = 'Custom 5'
      CaptionButtons = <>
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 1110
      FloatTop = 3
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxBarButton6'
        end>
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object dxBarManager1Bar3: TdxBar
      Caption = 'Custom 1'
      CaptionButtons = <>
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 1214
      FloatTop = 2
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxBarButton9'
        end>
      OneOnRow = False
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object dxBarManager1Bar4: TdxBar
      Caption = 'Custom 2'
      CaptionButtons = <>
      DockedLeft = 120
      DockedTop = 0
      FloatLeft = 1214
      FloatTop = 2
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxBarButton10'
        end>
      OneOnRow = False
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object cxBarEditItem1: TcxBarEditItem
      Caption = 'Text Edit Item'
      Category = 0
      Visible = ivAlways
      PropertiesClassName = 'TcxTextEditProperties'
    end
    object dxBarButton1: TdxBarButton
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100' '#1089#1087#1080#1089#1086#1082' '#1087#1088#1086#1077#1082#1090#1086#1074
      Category = 0
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100' '#1089#1087#1080#1089#1086#1082' '#1087#1088#1086#1077#1082#1090#1086#1074
      Visible = ivAlways
      Glyph.SourceDPI = 96
      Glyph.Data = {
        89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
        6100000027744558745469746C6500526566726573683B5265706561743B4261
        72733B526962626F6E3B52656C6F6164CD4DF6E90000030249444154785EA593
        6D4C926B18C76F018114A40D6D619DE98433AAE3F16D7CB173AC43666FE69C7A
        D4F48825339D4E6136D314EB2C23B46C332B957484A0522E5B6E2C31B537B437
        319BCECC17B2652D672FC715E03194AEEE875A6BB53E796DBFDDCF7EF7FFFFE1
        DAB3DB0500D052C6E5A7FEC73B70F2FDC89A4D48D664FA5A5AF5DB1FE4E8928B
        E2226D9F11FB0F04459A7B3D052A63DE0E71B11B91C10E77FA9D5D94DF70DF59
        4E93EB7EC957DF1B4F935FE009B3EBB7A59FE8704C59E6E185E503DC9D7C0B9A
        5B66D8A7BA33243AD4E087F3A4E9F98F683FD1959EBD8BF0B8E6D418BB1F3C9B
        855DA57A23871BC00C15D755FD99D508E1521DE49EB90E833356B8D4F71C726A
        7A460285F11EC48A92CF5D44D973CC50A8BDF504C6FE7780F2CA3044481AFEF5
        FE3598C1DD24F5E10A73F88109958A8DD94DF69E171638D53E0AA2A36D07885E
        E6E95E8476E6D5090AD57D0B66DB02F45B1661DC6A87B4B2F685E0D8C3422284
        21619605FC5DA148ADE884F303D3905C6630112EF5C40D449AB550D5BDBDA314
        D9C99BC862B52379ED6DF478E215C595B9AAFE4B9918D2CC4857CBE4F834A22D
        672287831C881D4B9B2F74232EE918CFA81283FDDA4B1B241CE9062F7E441076
        0C0C19438B2CD63F8A3AD8017187BB4033F61E88EFA8920E882CD24F92F8D1D5
        F3383467B3D846269EFE877CBC5928707372CAB7FFFFF9F01D890783BE98951E
        8628542ACACDDC88ACAF5E3B4C8656090ACBBD4C846802514DE9DEDAFBD038F4
        06E28F742F083395C7F91B44416BFEDACDA731BD38214995E519AA01A837CF41
        A2A213BC422455B8C744828C56E78E8C956B3921E226739666109A47DE81E4DC
        0024286E424CE935F83DA95A87337E41A92A93ECEA14B043F63F2451591CE78A
        01BB5B50DB14B105725D199C28F0FF47FD24EEF86D28D19B4139340BCAC15908
        2F6807DFF042317BCD9650FF14ED33EA8AB0F5384F65AC2B40889FD48CD1394F
        42D2D9BCD53E5BE515BC98DA21EC017BE0C52A877DB797CBC8547716CE786068
        74AE1411E0F90132C61DC3C67030DE18CF2F8EFC7D78C9CFF9136643522887EA
        10230000000049454E44AE426082}
    end
    object dxBarButton2: TdxBarButton
      Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1089#1082#1088#1080#1087#1090
      Category = 0
      Hint = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1089#1082#1088#1080#1087#1090
      Visible = ivAlways
      Glyph.SourceDPI = 96
      Glyph.Data = {
        89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
        610000001D744558745469746C65004C6F61643B53656C6563743B466F6C6465
        723B4F70656E96333E78000002AB49444154785EA5934F685C5514C67F6FF226
        A4D4A6D408420DD56ED2560B0A9A164349ED42DC48692B2EAA74E94690521AA4
        442A4141DD0522B4B6A894104D2BA6ED4263379A48FE2C12D48CD32668666286
        4E32D34966924966E6FDBDF7F4F166120864E7818FC3399CEFC7C7856B8808DB
        956118DBAE6B7D8B2902D4D564D67A04A0ABFFCFD0549BA39DBD13F2E137A33F
        9EFBE8EB676A3B885D6B1F8A5F6F97F8B5AAFEBEDA2EE3DD6D6737C0EF770F9E
        3C7F6578E2FCD511F7832B23F2533C271DD7470BE7BA7E7817A833D1F2DA0BEF
        7DB799CCB7D698E9EFF8F2ABCE53134372A6B57E4763FF89B6169EDDF7247591
        08590B4EBFB96BCFC79FFDD7070C98CAD3A08AE03E44B4C24471E8AD0B4DBBA7
        D389FB633BD9FFDCD3F40E8C9359580A0026274E1DE3DEC0AFAB85C5D4254047
        94AF4114281B4359E057A8D3799A9E3FCAFC32DCBD3BC43BAF3672EBF211CA96
        CDECBD3B24466E1E4FFCF2F90DC03395ABAA00DF4602B3F62D501E44B31CDEEB
        F0FAE1273872A08419F5F8EDD366527FCCD2DF339C034C0063F4935669BBD883
        5E9D62697A9295856CC86B6C7903C7F1318D0895C5299C621AD1C2726A091102
        095AC992E9B90AAB90C55E986335BBCE81B7BFC0084C688D8807DA43D4CB815C
        C47702D9A10AA924E3DFF7A54CE5288AE97956FEF9975DCD2F214E9172E26744
        FB88AABE8F681DCE288568850E948E059EA23F1826589E4F52CAE4D9FBCA7EEC
        4C0C7FBDB079189A4483F243900E419A5CF211F174E9B6E93A3EF96482866803
        F5A64F25F517CA5A03AD36534835456DA728ADD8140AD674CF586ECEB4CA2E92
        C9F0D48B07B1161FE0E41F82D2E1A1C886494208A243502E5D225FF20601CF2C
        97BD49FCB5D699DF279919061101A97601D0008208208216707D49C7162BDF02
        AE01EC00A24064DBDFB7B504F000BBF764B30208BFF3FFA9C7E0B9B422AAA90C
        AE0000000049454E44AE426082}
    end
    object dxBarButton3: TdxBarButton
      Caption = #1042#1099#1087#1086#1083#1085#1080#1090#1100' '#1089#1082#1088#1080#1087#1090
      Category = 0
      Hint = #1042#1099#1087#1086#1083#1085#1080#1090#1100' '#1089#1082#1088#1080#1087#1090
      Visible = ivAlways
    end
    object dxBarButton4: TdxBarButton
      Caption = #1042#1099#1087#1086#1083#1085#1080#1090#1100' '#1089#1082#1088#1080#1087#1090
      Category = 0
      Hint = #1042#1099#1087#1086#1083#1085#1080#1090#1100' '#1089#1082#1088#1080#1087#1090
      Visible = ivAlways
      Glyph.SourceDPI = 96
      Glyph.Data = {
        89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
        610000001B744558745469746C65004E6578743B506C61793B4172726F773B52
        6967687416E40EAE000002AF49444154785EA5925D6895751CC73FCFD14D46BE
        B41AF6C20A870425152C2F82A08B0ABD295D05416F572184045D2644082A425A
        831A62128E2E448C59108D9430D84A1C81DBD4D6B6D05C3B739B5B3BB1EDAC73
        CEF33CFFDF4BCFE1807076DB173E7CF95FFC3E7C2FFE91BB136501D600D556C0
        3F3839EC8262062A86A9A3E2881B224AE9DF949E032F90A396B5877A46C3BEAF
        0687DF3DDABB0B683CBAE7A99C064352458212AA484053218943F55D3BA4969C
        A8B2E7C5C71E3FF7EBFAEFDEEBFAA56FE1D6C4FECFF73E7D1908638BC1821A6A
        10D439DCD58FA8D7092255A3A5B9898EE71F213FBBF9B99F06365D7CFBE0F9AF
        676E0C1FDED6DC70030803B3154B122388616AF582204A2A30B562DCD5BC8137
        3AB6716DEC9ED7FBD76F7C75C3E6B3DD7F0EF67EFCCC834D7380EC78BFD7D457
        2D90E0A46A9412A5583688E081875A78B3F5DEC6CBD75AF636346D7AAB65EBB3
        9DBF5F387EE242D7AE2520D0E59EBBB320552AC1A8A4423938C58A905F4C3302
        AD5BEE67F72BDB373EB1BDFDC0932F7D34D4FE5AE73B4063DD822408A5D4AB20
        6224197195580966AC6B8878B47D0B0F6FBDAFB5E754F205701A48EE082AA540
        A124148A29E6206A04ABC9725184C6C6D0C84D4606AF2FAE14663E03A47E811A
        CB15214E0D7343CC897211EBD6464C8C4F73F5D278BCFCF7ADEEF93F7A3B97A7
        06E680A44E90A6CA526CC4C18822674D2EC7FCC43C570646AD3033F5CD3F13FD
        870AD7CFFD05C480B5ED3CEEAB048195B262EE141796B87A7194DBF97CDFCAF4
        9583B77F3B35045400FDF0C7593F7DE45B4484D50B982B14B3C33126C76F8E94
        1646F74F0F7ED9079401D9F7C3AC03A880AA60AB7EA2A6B1F27DF7F9A9CAE2E4
        91C94B9F9C014A4068DB71CCCD9C339F9EA5DAA686BB634E9DA0FCF38997EFA6
        961848DB761E7337C7CC5071DC0C73C7AB4419A60044EECEFFC97FFDEAC21326
        FC988F0000000049454E44AE426082}
      PaintStyle = psCaptionGlyph
    end
    object dxBarButton5: TdxBarButton
      Caption = #1042#1099#1087#1086#1083#1085#1080#1090#1100' '#1089#1082#1088#1080#1087#1090
      Category = 0
      Hint = #1042#1099#1087#1086#1083#1085#1080#1090#1100' '#1089#1082#1088#1080#1087#1090
      Visible = ivAlways
    end
    object dxBarButton6: TdxBarButton
      Caption = #1042#1099#1087#1086#1083#1085#1080#1090#1100' '#1087#1072#1082#1077#1090
      Category = 0
      Hint = #1042#1099#1087#1086#1083#1085#1080#1090#1100' '#1087#1072#1082#1077#1090
      Visible = ivAlways
      OnClick = dxBarButton6Click
    end
    object dxBarButton7: TdxBarButton
      Caption = #1054#1095#1080#1089#1090#1080#1090#1100
      Category = 0
      Hint = #1054#1095#1080#1089#1090#1080#1090#1100
      Visible = ivAlways
      Glyph.SourceDPI = 96
      Glyph.Data = {
        89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
        610000001C744558745469746C6500436C656172466F726D617474696E673B43
        6C6561723B806217A8000002F149444154785E55926D68956518C77FF7B3E79C
        452FE00497619A6EE2EA4C361B3115B432DCCA0FE10725DBB4A20F5186A266F3
        CC6ACB054AD6348E471B98D601C5B43EE48A06C2660AA3815858B8EC9015F672
        CE667396F38C739EFBE52A1EE9B0FDE0E6FAF4FF5DD7C57DA954F7C5D34AB14C
        044484E273E0C2EA7002E2041187B1F6CCA667172D17110BE05F1BB9B16CE373
        F58022440421848ECE13B46D5D03020288403235F028E001B704DA186CD8CD81
        3049F243FA0AC65844284A8CD114BB8582C0629D0B476C5EFF2E2242DB2BCDCC
        ABBC17632D4FBFB81B80D7B73451553103AD0D80BAF0D48A703D5F6B8DD11627
        904A6E0581752FBDCD91AE38C6188EBCBF0D117827719CF696752C79E83E002F
        2868CC2D81411BC760FA7776ED3D0AE24259601CDA0404DA118978CC8FCDE2FA
        A96E669CEEE18BE58BDF5CF879DF1B80F502ADD146E8D8FD1187932D1C4AC631
        8126D0065B30284FE12194FF749E92E15F98F3CC1A2A1E7938FEF1E2BAB700DF
        D781411B4B7CF35A9A5EE80007A204631C35F367F365CF59CA7FFE86DA329852
        598519196676FD02F25E747BF2C6B8A7D66F3F212D2F37628B37002094467DA2
        BEE2AFEEE3DC3EF21BE50FCC85208F0091B9312EEFDCC7E5A10CEAF92DA9BE12
        3FF25898548492AACAE954CE2A63F4D2204BFEF99EF2FB2B2028800891582DE9
        F64EAEDE1CE3E2F0D07B0A8802FE84BFF580E8EAD73ED9515317DBD010CD5071
        E51C4A41B4A68EF48E047FFC3DCAB7D93FF7EFCC665A279DEFDA5DBD009195F1
        4FF7B51EBD2007BFCECA81FEAC7C75ECA48C9E3A29034B1BE558F502D95036F5
        007027E0F94C20972B00F8795DB2F1EE99D3182B580032B1857CF6610F0F0E65
        399BF9F5602A77B315186F8A943A8F09A4BFFB11C05D3A3790E8EF3D4F415BA6
        DE017B1267E8CD18F6E72287FE0B6F0372FD8B1ADD98314C5A61E6D236000FB8
        EB9EFACDC9EA555D32EFC984CC69E894E9F5AF7E004C01BC15CAE371140D2894
        88F03FD36A3761ADE6FA6097079402B701258003F240FE093C672966F817D4EB
        9B4E44CBB8550000000049454E44AE426082}
    end
    object dxBarButton8: TdxBarButton
      Caption = #1042#1099#1087#1086#1083#1085#1080#1090#1100' '#1087#1072#1082#1077#1090
      Category = 0
      Hint = #1042#1099#1087#1086#1083#1085#1080#1090#1100' '#1087#1072#1082#1077#1090
      Visible = ivAlways
    end
    object dxBarButton9: TdxBarButton
      Caption = #1042#1099#1087#1086#1083#1085#1080#1090#1100' '#1089#1082#1088#1080#1087#1090
      Category = 0
      Hint = #1042#1099#1087#1086#1083#1085#1080#1090#1100' '#1089#1082#1088#1080#1087#1090
      Visible = ivAlways
      OnClick = dxBarButton9Click
    end
    object dxBarButton10: TdxBarButton
      Caption = #1054#1095#1080#1089#1090#1080#1090#1100
      Category = 0
      Hint = #1054#1095#1080#1089#1090#1080#1090#1100
      Visible = ivAlways
      OnClick = dxBarButton10Click
    end
  end
  object dxSkinController1: TdxSkinController
    NativeStyle = False
    SkinName = 'Office2019Colorful'
    Left = 472
    Top = 8
  end
end
