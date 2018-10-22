-- sup

exec msdb.dbo.sp_send_dbmail --@profile_name='dilax'
 @recipients='sql.admins@dilax.com'
, @subject='Auswertung defekter pages'
, @body='Hello'
, @query='select * from DWM_UL_2009.dbo.dw_sys_vehicle'
, @attach_query_result_as_file=1
, @query_result_separator=';'
, @query_attachment_filename='Fahrzeugübersicht.csv'
--, @query_result_header=0
, @query_result_width=10000