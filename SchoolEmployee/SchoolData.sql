USE [SchoolDB]
GO
SET IDENTITY_INSERT [dbo].[Classfication] ON 

INSERT [dbo].[Classfication] ([ID], [Name]) VALUES (1, N'primary')
INSERT [dbo].[Classfication] ([ID], [Name]) VALUES (6, N'primary')
INSERT [dbo].[Classfication] ([ID], [Name]) VALUES (7, N'secondery')
SET IDENTITY_INSERT [dbo].[Classfication] OFF
GO
SET IDENTITY_INSERT [dbo].[Grade] ON 

INSERT [dbo].[Grade] ([ID], [Name], [ClassficationID]) VALUES (1, N'First', 1)
SET IDENTITY_INSERT [dbo].[Grade] OFF
GO
INSERT [dbo].[Employee] ([ID], [FirstName], [LastName], [FatherName], [MotherName], [BirthDate], [Role], [Username], [Password]) VALUES (N'b5aa7f8b-dc7f-46e5-8845-c068e07bd593', N's', N'sqs', N's', N's', CAST(N'2020-09-10' AS Date), N's', N's', N'043A718774C572BD8A25ADBEB1BFCD5C0256AE11CECF9F9C3F925D0E52BEAF89')
GO
SET IDENTITY_INSERT [dbo].[Permission] ON 

INSERT [dbo].[Permission] ([ID], [Name], [DisplayName]) VALUES (1, N'ManageEmployees', N'Manage Employees')
INSERT [dbo].[Permission] ([ID], [Name], [DisplayName]) VALUES (2, N'Add1', N'Add1')
INSERT [dbo].[Permission] ([ID], [Name], [DisplayName]) VALUES (3, N'Edit', N'Edit')
INSERT [dbo].[Permission] ([ID], [Name], [DisplayName]) VALUES (4, N'Remove1', N'Remove1')
SET IDENTITY_INSERT [dbo].[Permission] OFF
GO
INSERT [dbo].[EmployeePermission] ([PermissionId], [EmployeeId]) VALUES (1, N'b5aa7f8b-dc7f-46e5-8845-c068e07bd593')
INSERT [dbo].[EmployeePermission] ([PermissionId], [EmployeeId]) VALUES (4, N'b5aa7f8b-dc7f-46e5-8845-c068e07bd593')
GO
SET IDENTITY_INSERT [dbo].[Fee] ON 

INSERT [dbo].[Fee] ([ID], [Amount], [WarrningDate], [LastDate], [Name], [GradeId], [Year]) VALUES (1, 10, CAST(N'2020-09-17' AS Date), CAST(N'2020-09-09' AS Date), N's', 1, 190)
SET IDENTITY_INSERT [dbo].[Fee] OFF
GO
