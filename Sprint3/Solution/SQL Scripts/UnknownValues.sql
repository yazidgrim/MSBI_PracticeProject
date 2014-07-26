USE [STM_DW]
GO
set identity_insert [dbo].[DimFare] ON
INSERT INTO [dbo].[DimFare]
           ([DimFareID]
		   ,[FareName]
           ,[FarePrice]
           ,[Currency]
           ,[TransferDuration])
     VALUES
           (-1
		   ,'Unknown'
           ,-1
           ,'n/a'
           ,-1)
set identity_insert [dbo].[DimFare] OFF
GO


