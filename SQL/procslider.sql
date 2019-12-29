

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [MANASBHARATI].[procslider]
	-- Add the parameters for the stored procedure here
	@mapid int = null,
	@title nvarchar(500) =  null,
	@btnname nvarchar(250) = null,
	@img nvarchar(250) =  null,
	@url nvarchar(max) =  null,
	@displayorder int=  null,
	@option int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
	-- Login Validation
	if(@option = 1)
	begin
	insert [MANASBHARATI].slider values (@title,@img,@btnname,@url,@displayorder,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP);
	end

	if(@option = 2)
	begin
	select mapid,title,img,btnname,url,displayorder from [MANASBHARATI].slider order by displayorder asc;
	end

	if(@option = 3)
	begin
	update [MANASBHARATI].slider set title=@title,img=@img,btnname=@btnname,url=@url,displayorder=@displayorder,Updatedate = CURRENT_TIMESTAMP where mapid = @mapid;
	end

	if(@option = 4)
	begin
	delete from [MANASBHARATI].slider  where mapid = @mapid;
	end


END
GO