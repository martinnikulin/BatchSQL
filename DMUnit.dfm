object DM: TDM
  Height = 337
  Width = 904
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
      'order by  ServerId')
    Left = 181
    Top = 162
  end
  object dsServers: TDataSource
    DataSet = Servers
    Left = 280
    Top = 162
  end
  object Databases: TADOQuery
    Connection = RemoteCatalog
    CursorType = ctStatic
    DataSource = dsServers
    Parameters = <
      item
        Name = 'ServerId'
        DataType = ftInteger
        Value = 1
      end>
    SQL.Strings = (
      
        'select Id as ProjectId,  ProjectName, [Database], :ServerId as S' +
        'erverId, ToUpdate'
      'from Projects'
      'order by [Database]')
    Left = 445
    Top = 93
  end
  object CommandQuery: TADOQuery
    Connection = RemoteGDB
    Parameters = <>
    Left = 746
    Top = 26
  end
  object Scripts: TADOQuery
    Connection = BatchSQLDB
    CursorType = ctStatic
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
      'where PacketId = :PacketId'
      'order by N')
    Left = 181
    Top = 93
  end
  object dsScripts: TDataSource
    DataSet = Scripts
    Left = 280
    Top = 93
  end
  object ServerPackets: TADOQuery
    Connection = BatchSQLDB
    CursorType = ctStatic
    BeforeDelete = ServerPacketsBeforeDelete
    DataSource = dsServers
    Parameters = <
      item
        Name = 'ServerId'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 1
      end>
    SQL.Strings = (
      
        'select    sp.N, PacketId, p.[Name], Appointed, ApplyingDate, Ser' +
        'verId'
      'from       ServerPackets sp'
      'inner join Packets p on p.Id = sp.PacketId'
      'where     ServerId = :ServerId'
      'order by sp.N')
    Left = 181
    Top = 234
  end
  object dsServerPackets: TDataSource
    DataSet = ServerPackets
    Left = 280
    Top = 234
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
    Left = 181
    Top = 26
  end
  object dsPackets: TDataSource
    DataSet = Packets
    Left = 280
    Top = 26
  end
  object dsDatabases: TDataSource
    DataSet = Databases
    Left = 528
    Top = 93
  end
  object RemoteGDB: TADOConnection
    ConnectionString = 
      'Provider=MSOLEDBSQL.1;Integrated Security=SSPI;Persist Security ' +
      'Info=False;User ID="";Initial Catalog=DSCGSystem;Data Source=loc' +
      'alhost;Use Procedure for Prepare=1;Auto Translate=True;Packet Si' +
      'ze=4096;Workstation ID=DESKTOP-TVT25EU;Initial File Name="";Use ' +
      'Encryption for Data=False;Tag with column collation when possibl' +
      'e=False;MARS Connection=False;DataTypeCompatibility=0;Trust Serv' +
      'er Certificate=False;Server SPN="";Application Intent=READWRITE;' +
      'MultiSubnetFailover=False;Use FMTONLY=False;Authentication="";Ac' +
      'cess Token="";TransparentNetworkIPResolution=True;Connect Retry ' +
      'Count=1;Connect Retry Interval=10'
    ConnectionTimeout = 1
    LoginPrompt = False
    Provider = 'MSOLEDBSQL.1'
    Left = 645
    Top = 26
  end
  object RemoteCatalog: TADOConnection
    ConnectionString = 
      'Provider=MSOLEDBSQL.1;Password=DSCG;Persist Security Info=True;U' +
      'ser ID=DSCG;Initial Catalog=DSCGSystem;Data Source=176.196.195.2' +
      '42;Use Procedure for Prepare=1;Auto Translate=True;Packet Size=4' +
      '096;Workstation ID=DESKTOP-TVT25EU;Initial File Name="";Use Encr' +
      'yption for Data=False;Tag with column collation when possible=Fa' +
      'lse;MARS Connection=False;DataTypeCompatibility=0;Trust Server C' +
      'ertificate=False;Server SPN="";Application Intent=READWRITE;Mult' +
      'iSubnetFailover=False;Use FMTONLY=False;Authentication="";Access' +
      ' Token="";TransparentNetworkIPResolution=True;Connect Retry Coun' +
      't=1;Connect Retry Interval=10'
    ConnectionTimeout = 1
    LoginPrompt = False
    Provider = 'MSOLEDBSQL.1'
    Left = 445
    Top = 26
  end
end
