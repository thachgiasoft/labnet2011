USE [nhmamnnk_LabnetManager]
GO
/****** Object:  StoredProcedure [dbo].[sp_Report_PatientResult]    Script Date: 12/27/2011 20:24:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE  PROCEDURE [dbo].[sp_Report_PatientResult] 
	@LabExaminationId int = null
AS
BEGIN
	SELECT p.FirstName, CASE WHEN p.Gender = 0 THEN N'Nữ' ELSE 'Nam' END AS Gender,
			p.Address, p.Age, p.Phone, lab.ExaminationNumber, lab.ReceivedDate, lab.Diagnosis,
			t.Description AS TestName, t.Range, t.Unit, t.TestSectionId, ts.Name AS TestSectionName,
			r.Value, t.LowIndex, t.HighIndex, t.IsBold, r.LastUpdated
	FROM Patient p
	INNER JOIN PatientItem pt ON pt.PatientId = p.Id
	INNER JOIN LabExamination lab ON lab.PatientId = p.Id
	INNER JOIN Analysis a ON a.PatientItemId = pt.Id
	INNER JOIN Test t ON a.TestId = t.Id
	INNER JOIN TestSection ts ON t.TestSectionId = ts.ID
	INNER JOIN Result r ON r.AnalysisId = a.id
	WHERE lab.Id = @LabExaminationId AND r.IsReportable = 1
	and a.Status <> 1
	ORDER BY t.TestSectionId, t.SortOrder
END

