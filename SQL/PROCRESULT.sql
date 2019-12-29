SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [IDEAL].[PROCRESULT]
	-- Add the parameters for the stored procedure here
	@RESULT TypeBulkResult READONLY,
	@MAPID INT = NULL,
	@REGNO INT = NULL,
	@ROLLNO INT = NULL,
	@CLASS NVARCHAR(300) = NULL,
	@CLASS_SECTION NVARCHAR(10) = NULL,
	@SUBJECTNAME NVARCHAR(100) = NULL,
	@THEORY DECIMAL = NULL,
	@PERIODIC DECIMAL = NULL,
	@TERMEND NVARCHAR(10) = NULL,
	@TOTAL DECIMAL = NULL,
	@TOTALMARKS DECIMAL = NULL,
	@PERCENTAGE DECIMAL = NULL,
	@option int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
	

	--  Add Bulk Result
	IF(@option = 1)
	BEGIN
	
	INSERT INTO  [IDEAL].[RESULT] (REGNO,ROLLNO,CLASS,CLASS_SECTION,SUBJECTNAME,PERIODIC,THEORY, TERMEND,TOTAL,TOTALMARKS,PERCENTAGE,CREATEDATE,UPDATEDATE) SELECT REGNO,ROLLNO,CLASS,CLASS_SECTION,SUBJECTNAME,PERIODIC,THEORY, TERMEND,TOTAL,TOTALMARKS,PERCENTAGE, CURRENT_TIMESTAMP,CURRENT_TIMESTAMP FROM @RESULT;

	END

	--  Sarch Result
	IF(@option = 2)
	BEGIN
	
	SELECT STUDNAME,FATHER_NAME,REGNO,ROLLNO,ADMITTED_CLASS,SECTION FROM  [IDEAL].[ADMISSION] WHERE ADMITTED_CLASS = @CLASS AND SECTION = @CLASS_SECTION AND ROLLNO = @ROLLNO;

	SELECT MAPID,SUBJECTNAME,THEORY,PERIODIC,TERMEND,TOTAL,TOTALMARKS,PERCENTAGE FROM  [IDEAL].[RESULT] WHERE CLASS = @CLASS AND CLASS_SECTION = @CLASS_SECTION AND ROLLNO = @ROLLNO;

	END
	
END
GO

