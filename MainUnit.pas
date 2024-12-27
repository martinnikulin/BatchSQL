unit MainUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, 
  dxBar, dxRibbon, dxRibbonForm, dxRibbonSkins, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxClasses, dxRibbonBackstageView, cxBarEditItem,
  dxRibbonCustomizationForm, cxTextEdit, dxBarBuiltInMenu, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator,
  dxDateRanges, Data.DB, cxDBData, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridCustomView, cxGrid, Vcl.ExtCtrls,
  Vcl.StdCtrls, cxPC, dxSkinsForm, dxStatusBar, dxRibbonStatusBar, Vcl.ExtDlgs,
  dxCore, dxScrollbarAnnotations, cxContainer, cxMemo, cxDBEdit, Vcl.Grids,
  Vcl.DBGrids, Vcl.DBCtrls, Vcl.ComCtrls, cxDBLookupComboBox;

const
  UM_SHOWBACKSTAGE = WM_USER +1001;

type
  TMainForm = class(TdxRibbonForm)
    dxBarManager1: TdxBarManager;
    dxBarManager1Bar1: TdxBar;
    Ribbon: TdxRibbon;
    dxRibbon1Tab1: TdxRibbonTab;
    dxRibbonStatusBar1: TdxRibbonStatusBar;
    dxSkinController1: TdxSkinController;
    dxBarManager1Bar2: TdxBar;
    cxBarEditItem1: TcxBarEditItem;
    dxRibbon1Tab2: TdxRibbonTab;
    PageControl: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxTabSheet2: TcxTabSheet;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    dxBarButton1: TdxBarButton;
    dxBarButton2: TdxBarButton;
    dxBarButton3: TdxBarButton;
    dxBarButton4: TdxBarButton;
    MessageMemo: TMemo;
    dxRibbon1Tab3: TdxRibbonTab;
    cxTabSheet3: TcxTabSheet;
    Panel2: TPanel;
    ProjectsGrid: TcxGrid;
    ProjectsTableView: TcxGridDBTableView;
    ProjectsGridLevel: TcxGridLevel;
    ProjectsTableViewProjectName: TcxGridDBColumn;
    ProjectsTableViewDatabase: TcxGridDBColumn;
    dxBarButton5: TdxBarButton;
    dxBarManager1Bar7: TdxBar;
    dxBarButton6: TdxBarButton;
    Splitter4: TSplitter;
    Splitter5: TSplitter;
    ScriptsGrid: TcxGrid;
    ScriptsTableView: TcxGridDBTableView;
    ScriptsTableViewId: TcxGridDBColumn;
    ScriptsTableViewName: TcxGridDBColumn;
    ScriptsTableViewDesc: TcxGridDBColumn;
    ScriptsGridLevel: TcxGridLevel;
    PacketsGrid: TcxGrid;
    PacketsTableView: TcxGridDBTableView;
    PacketsGridLevel: TcxGridLevel;
    PacketsTableViewId: TcxGridDBColumn;
    PacketsTableViewName: TcxGridDBColumn;
    PacketsTableViewDateCreated: TcxGridDBColumn;
    ServersGrid: TcxGrid;
    ServersTableView: TcxGridDBTableView;
    ServersTableViewName: TcxGridDBColumn;
    ServersGridLevel: TcxGridLevel;
    ServersTableViewActual: TcxGridDBColumn;
    ServersTableViewServerId: TcxGridDBColumn;
    dxBarButton7: TdxBarButton;
    ServerPacketsGrid: TcxGrid;
    ServerPacketsTableView: TcxGridDBTableView;
    ServerPacketsGridLevel: TcxGridLevel;
    PacketDBMemo: TDBMemo;
    ScriptsTableViewN: TcxGridDBColumn;
    ProjectsTableViewProjectId: TcxGridDBColumn;
    ServerPacketsTableViewDescription: TcxGridDBColumn;
    ServerPacketsTableViewAppointed: TcxGridDBColumn;
    ServerPacketsTableViewN: TcxGridDBColumn;
    TabControl1: TTabControl;
    TabControl2: TTabControl;
    TabControl3: TTabControl;
    TabControl4: TTabControl;
    TabControl5: TTabControl;
    Splitter3: TSplitter;
    TabControl6: TTabControl;
    Panel1: TPanel;
    ServerPacketsTableViewApplyingDate: TcxGridDBColumn;
    dxBarButton8: TdxBarButton;
    ProjectsTableViewToUpdate: TcxGridDBColumn;
    Panel3: TPanel;
    TabControl7: TTabControl;
    cxGrid1: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridDBColumn3: TcxGridDBColumn;
    cxGridDBColumn4: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    Splitter6: TSplitter;
    Splitter7: TSplitter;
    TabControl8: TTabControl;
    cxDBMemo1: TcxDBMemo;
    Panel4: TPanel;
    Splitter8: TSplitter;
    TabControl9: TTabControl;
    ServersGrid2: TcxGrid;
    ServersTableView2: TcxGridDBTableView;
    cxGridDBColumn5: TcxGridDBColumn;
    cxGridDBColumn6: TcxGridDBColumn;
    cxGridDBColumn7: TcxGridDBColumn;
    ServersGridLevel2: TcxGridLevel;
    TabControl10: TTabControl;
    ProjectsGrid2: TcxGrid;
    ProjectsTableView2: TcxGridDBTableView;
    cxGridDBColumn8: TcxGridDBColumn;
    cxGridDBColumn9: TcxGridDBColumn;
    cxGridDBColumn10: TcxGridDBColumn;
    cxGridDBColumn11: TcxGridDBColumn;
    ProjectsGridLevel2: TcxGridLevel;
    Splitter9: TSplitter;
    Memo1: TMemo;
    dxBarManager1Bar3: TdxBar;
    dxBarButton9: TdxBarButton;
    dxBarManager1Bar4: TdxBar;
    dxBarButton10: TdxBarButton;
    ScriptDBMemo: TcxDBMemo;
    procedure FormCreate(Sender: TObject);
    procedure RibbonTabChanged(Sender: TdxCustomRibbon);
    procedure FormShow(Sender: TObject);
    procedure dxBarButton6Click(Sender: TObject);
    procedure ServersTableViewFocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure PageControlChange(Sender: TObject);
    procedure dxBarButton10Click(Sender: TObject);
    procedure dxBarButton9Click(Sender: TObject);
  private
    Initiated: Boolean;
    procedure ProcessingMessage(Sender: TObject);
    procedure SetScriptsDataSource;
    procedure DisableControls;
    procedure EnableControls;
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation
uses
  DMUnit, DBUpdaterUnit, MessengerUnit;
{$R *.dfm}

{ TForm2 }

procedure TMainForm.FormShow(Sender: TObject);
begin
try
try
  DisableControls;
  DM.OpenTables;
  Messenger.OnMessage := ProcessingMessage;
  Initiated := True;
except
  Initiated := False;
end;
finally
  EnableControls;
  Ribbon.Tabs[0].Active := True;
end;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  DisableAero := True;
end;

procedure TMainForm.dxBarButton10Click(Sender: TObject);
begin
  Memo1.Clear;
end;

procedure TMainForm.dxBarButton6Click(Sender: TObject);
var
  DBUpdater: TDBUpdater;
begin
  MessageMemo.Clear;
  DisableControls;
  DM.RunPackets := True;
  DM.ProcessServers;
  DM.Scripts.DataSource := DM.dsServerPackets;
  EnableControls;
end;

procedure TMainForm.dxBarButton9Click(Sender: TObject);
begin
  DisableControls;
  DM.RunPackets := False;
  DM.MemoLines := Memo1.Lines;
  DM.ProcessServers;
  EnableControls;
end;

procedure TMainForm.RibbonTabChanged(Sender: TdxCustomRibbon);
begin
  PageControl.ActivePageIndex := Ribbon.ActiveTab.Index;
end;

procedure TMainForm.PageControlChange(Sender: TObject);
begin
  SetScriptsDataSource;
end;

procedure TMainForm.SetScriptsDataSource;
begin
  if PageControl.ActivePageIndex = 0 then
    DM.Scripts.DataSource := DM.dsPackets
  else if PageControl.ActivePageIndex = 1 then
    DM.Scripts.DataSource := DM.dsServerPackets;
end;

procedure TMainForm.ProcessingMessage(Sender: TObject);
begin
  MessageMemo.Visible := True;
  Splitter5.Visible := True;
  MessageMemo.Lines.Add(Messenger.MessageText);
  MessageMemo.SetFocus;
end;

procedure TMainForm.ServersTableViewFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  if Initiated then
    DM.RequeryDatabases;
end;

procedure TMainForm.DisableControls;
begin
  //PacketsTableView.DataController.DataSource := nil;
  //ScriptsTableView.DataController.DataSource := nil;
  ServersTableView.DataController.DataSource := nil;
  ServersTableView2.DataController.DataSource := nil;
  //ServerPacketsTableView.DataController.DataSource := nil;
  ScriptDBMemo.Enabled := false;
end;

procedure TMainForm.EnableControls;
begin
  //PacketsTableView.DataController.DataSource := DM.dsPackets;
  //ScriptsTableView.DataController.DataSource := DM.dsScripts;
  ServersTableView.DataController.DataSource := DM.dsServers;
  ServersTableView2.DataController.DataSource := DM.dsServers;
  //ProjectsTableView.DataController.DataSource := DM.dsDatabases;
  //ServerPacketsTableView.DataController.DataSource := DM.dsServerPackets;
  ScriptDBMemo.Enabled := true;
end;

end.
