SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [MANASBHARATI].[PROCBINDPAGE]
	-- Add the parameters for the stored procedure here
	
	@option int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
	

	

	IF(@option = 1)
	BEGIN
	 SELECT TOP 6 * FROM [MANASBHARATI].[GALLERY] ORDER BY CREATEDDATE DESC;
	 SELECT * FROM [MANASBHARATI].[testimonial] WHERE STATUS = 1 ORDER BY CREATEDATE DESC;
	 select mapid,title,img,url,btnname from [MANASBHARATI].slider order by displayorder asc;
	END
	
END
GO

