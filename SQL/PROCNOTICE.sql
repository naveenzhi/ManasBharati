SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [MANASBHARATI].[PROCNOTICE]
	-- Add the parameters for the stored procedure here
	@MAPID INT  = NULL,
	@TITLE NVARCHAR(3000) = NULL,
	@URL NVARCHAR(MAX) = NULL,
	@MARKNEW BIT = NULL,
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
	INSERT [MANASBHARATI].[NOTICE] VALUES (@TITLE,@URL,1,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP);
	end

	if(@option = 2)
	begin
	SELECT * FROM [MANASBHARATI].[NOTICE] ORDER BY CREATEDATE DESC;
	end

	--DELETE
	if(@option = 3)
	begin
	DELETE FROM [MANASBHARATI].[NOTICE] WHERE MAPID = @MAPID;
	end

END
GO