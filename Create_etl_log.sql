IF OBJECT_ID('etl.load_log', 'U') IS NULL
BEGIN
    CREATE TABLE etl.load_log (
        log_id        INT IDENTITY(1,1) PRIMARY KEY,
        batch_id      INT,
        source_file   NVARCHAR(260),
        target_table  NVARCHAR(200),
        rows_loaded   INT,
        load_ts       DATETIME2 DEFAULT SYSDATETIME()
    );
END
GO