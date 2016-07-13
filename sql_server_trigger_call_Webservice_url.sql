ALTER TRIGGER [dbo].[tgr_test] 
	ON [dbo].[TriggerTest] 	
	AFTER INSERT, UPDATE, DELETE
AS 
BEGIN

declare @object         int,
        @responseText   varchar(8000)
  
exec sp_OACreate 'MSXML2.XMLHTTP', @object out
 
exec sp_OAMethod @object, 'open', null, 'get', 'http://path_url', 'false'
exec sp_OAMethod @object, 'send'
exec sp_OAMethod @object, 'responseText', @responseText output
  
select @responseText responseText
  
exec sp_OADestroy @object
 
END
