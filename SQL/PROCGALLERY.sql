SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [MANASBHARATI].[PROCGALLERY]
	-- Add the parameters for the stored procedure here
	@MAPID INT  = NULL,
	@USER_IMG NVARCHAR(1200) = NULL,
	@option int
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
	-- 
	if(@option = 1)
	begin
	INSERT [MANASBHARATI].[GALLERY] VALUES (@USER_IMG,CURRENT_TIMESTAMP);
	end

	if(@option = 2)
	begin
	SELECT * FROM [MANASBHARATI].[GALLERY] ORDER BY CREATEDDATE DESC;
	end

		--DELETE
	if(@option = 3)
	begin
	DELETE FROM [MANASBHARATI].[GALLERY] WHERE MAPID = @MAPID;
	end

END
GO