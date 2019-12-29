SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [MANASBHARATI].[proctestimonial]
	-- Add the parameters for the stored procedure here
	@mapid int = null,
	@name nvarchar(100) = null,
	@testimonial nvarchar(max) = null,
	@img nvarchar(550) = null,
	@status int = null,
	@option int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
	-- add blogs
	if(@option = 1)
	begin
	insert [MANASBHARATI].[testimonial] values (@name,@testimonial,@img,1,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP);
	end

	if(@option = 2)
	begin
	SELECT * FROM [MANASBHARATI].[testimonial] WHERE STATUS = 1 ORDER BY CREATEDATE DESC;
	end

	if(@option = 3)
	begin
	UPDATE [MANASBHARATI].[testimonial] SET name=@name,testimonial=@testimonial,UPDATEDATE=current_timestamp where mapid=@mapid;
	end

	if(@option = 4)
	begin
	UPDATE [MANASBHARATI].[testimonial] SET status=@status,UPDATEDATE=current_timestamp where mapid=@mapid;
	end
	
END
GO