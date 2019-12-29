SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [MANASBHARATI].[PROCADMIN]
	-- Add the parameters for the stored procedure here
	@Userid int = null,
	@Username nvarchar(100)  = null,
	@Password nvarchar(12) = null,
	@User_img nvarchar(100) = null,
	@Status bit = null,
	@UserType nvarchar( 16 ) = null,
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
	select Userid,Username,Status,User_img,UserType from [MANASBHARATI].[ADMIN] where Username = @Username and Password = @Password and Status = 1;
	end

END
GO