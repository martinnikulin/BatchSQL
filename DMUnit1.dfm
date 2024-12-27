object DM: TDM
  Height = 585
  Width = 434
  object BatchSQLDB: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=MSOLEDBSQL.1;Integrated Security=SSPI;Persist Security ' +
      'Info=False;User ID="";Initial Catalog=BatchSQLDB;Data Source=loc' +
      'alhost;Initial File Name="";Server SPN="";Authentication="";Acce' +
      'ss Token="";'
    ConnectionTimeout = 1
    LoginPrompt = False
    Provider = 'MSOLEDBSQL.1'
    Left = 77
    Top = 26
  end
  object Servers: TADOQuery
    Connection = BatchSQLDB
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select     Id as ServerId, ServerName, RemoteServer As ServerAdd' +
        'r, Actual'
      'from       Servers'
      'order by  Id')
    Left = 77
    Top = 250
  end
  object dsServers: TDataSource
    DataSet = Servers
    Left = 176
    Top = 250
  end
  object Projects: TADOQuery
    Connection = BatchSQLDB
    CursorType = ctStatic
    DataSource = dsServers
    Parameters = <>
    SQL.Strings = (
      
        'select ProjectId,  ProjectName, [Database], ServerId from Projec' +
        'ts'
      'where ServerId = ServerId'
      'order by [Database]')
    Left = 77
    Top = 325
  end
  object CommandQuery: TADOQuery
    Parameters = <>
    Left = 298
    Top = 93
  end
  object Scripts: TADOQuery
    Connection = BatchSQLDB
    CursorType = ctStatic
    AfterInsert = ScriptsAfterInsert
    AfterPost = ScriptsAfterPost
    AfterDelete = ScriptsAfterDelete
    DataSource = dsPackets
    Parameters = <
      item
        Name = 'PacketId'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 10
      end>
    SQL.Strings = (
      'select Id as ScriptId, N, Name, Description, Text, PacketId'
      'from Scripts'
      'where PacketId = :PacketId')
    Left = 77
    Top = 162
  end
  object dsScritpts: TDataSource
    DataSet = Scripts
    Left = 176
    Top = 162
  end
  object ProjectPackets: TADOQuery
    Connection = BatchSQLDB
    CursorType = ctStatic
    DataSource = dsProjects
    Parameters = <
      item
        Name = 'ServerId'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 1
      end
      item
        Name = 'ProjectId'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
      end>
    SQL.Strings = (
      
        'select     N, PacketId, Appointed, ApplyingDate, ProjectId, Serv' +
        'erId'
      'from       ProjectPackets'
      'where     ServerId = :ServerId and'
      '           ProjectId = :ProjectId'
      '')
    Left = 77
    Top = 394
  end
  object dsProjectPackets: TDataSource
    DataSet = ProjectPackets
    Left = 176
    Top = 394
  end
  object Packets: TADOQuery
    Connection = BatchSQLDB
    CursorType = ctStatic
    AfterInsert = PacketsAfterInsert
    Parameters = <>
    SQL.Strings = (
      'select    Id as PacketId,'
      '          [Name],'
      '          [Description],'
      '          DateCreated'
      'from      Packets')
    Left = 77
    Top = 90
  end
  object dsPackets: TDataSource
    DataSet = Packets
    Left = 176
    Top = 90
  end
  object dsProjects: TDataSource
    DataSet = Projects
    Left = 176
    Top = 328
  end
end
