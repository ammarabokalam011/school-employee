USE [SchoolDB]
GO
SET IDENTITY_INSERT [dbo].[Classfication] ON 

INSERT [dbo].[Classfication] ([ID], [Name]) VALUES (1, N'primary')
INSERT [dbo].[Classfication] ([ID], [Name]) VALUES (7, N'secondery')
SET IDENTITY_INSERT [dbo].[Classfication] OFF
GO
SET IDENTITY_INSERT [dbo].[Grade] ON 

INSERT [dbo].[Grade] ([ID], [Name], [ClassficationID]) VALUES (1, N'First', 1)
INSERT [dbo].[Grade] ([ID], [Name], [ClassficationID]) VALUES (2, N'c', 1)
INSERT [dbo].[Grade] ([ID], [Name], [ClassficationID]) VALUES (3, N'Second', 1)
SET IDENTITY_INSERT [dbo].[Grade] OFF
GO
SET IDENTITY_INSERT [dbo].[ClassRoom] ON 

INSERT [dbo].[ClassRoom] ([ID], [Name], [Location], [GradeID]) VALUES (1, N'ClassRoom1', N'b', 1)
INSERT [dbo].[ClassRoom] ([ID], [Name], [Location], [GradeID]) VALUES (3, N'Z', N'x', 3)
SET IDENTITY_INSERT [dbo].[ClassRoom] OFF
GO
SET IDENTITY_INSERT [dbo].[Period] ON 

INSERT [dbo].[Period] ([ID], [StartTime], [EndTime]) VALUES (1, CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time))
INSERT [dbo].[Period] ([ID], [StartTime], [EndTime]) VALUES (6, CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time))
INSERT [dbo].[Period] ([ID], [StartTime], [EndTime]) VALUES (16, CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time))
INSERT [dbo].[Period] ([ID], [StartTime], [EndTime]) VALUES (17, CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time))
INSERT [dbo].[Period] ([ID], [StartTime], [EndTime]) VALUES (27, CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time))
INSERT [dbo].[Period] ([ID], [StartTime], [EndTime]) VALUES (32, CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time))
SET IDENTITY_INSERT [dbo].[Period] OFF
GO
SET IDENTITY_INSERT [dbo].[Subject] ON 

INSERT [dbo].[Subject] ([ID], [Name], [GradeId]) VALUES (1, N'a', 1)
INSERT [dbo].[Subject] ([ID], [Name], [GradeId]) VALUES (3, N'b', 1)
SET IDENTITY_INSERT [dbo].[Subject] OFF
GO
INSERT [dbo].[Student] ([ID], [FirstName], [LastName], [MotherName], [FatherName], [BirthDate], [Discount], [ClassRoomId], [BusRegister], [GradeId], [Username], [Password]) VALUES (N'04d78d63-16eb-4e1a-9236-f31663d25051', N'a', N'b', N'x', N'c', CAST(N'2000-01-01' AS Date), N'10', 1, 1, 1, N'ammaraboklam', N'kl')
GO
INSERT [dbo].[Teacher] ([ID], [FirstName], [LastName], [Detail]) VALUES (1, N'a', N'a', N'a')
GO
INSERT [dbo].[Schedule] ([ClassRoomId], [SubjectId], [PeriodId], [TeacherId], [Day]) VALUES (1, 1, 1, 1, 5)
INSERT [dbo].[Schedule] ([ClassRoomId], [SubjectId], [PeriodId], [TeacherId], [Day]) VALUES (1, 1, 6, 1, 3)
INSERT [dbo].[Schedule] ([ClassRoomId], [SubjectId], [PeriodId], [TeacherId], [Day]) VALUES (1, 1, 17, 1, 6)
INSERT [dbo].[Schedule] ([ClassRoomId], [SubjectId], [PeriodId], [TeacherId], [Day]) VALUES (1, 1, 27, 1, 4)
INSERT [dbo].[Schedule] ([ClassRoomId], [SubjectId], [PeriodId], [TeacherId], [Day]) VALUES (1, 1, 32, 1, 2)
INSERT [dbo].[Schedule] ([ClassRoomId], [SubjectId], [PeriodId], [TeacherId], [Day]) VALUES (1, 3, 1, NULL, 0)
INSERT [dbo].[Schedule] ([ClassRoomId], [SubjectId], [PeriodId], [TeacherId], [Day]) VALUES (1, 3, 6, NULL, 6)
INSERT [dbo].[Schedule] ([ClassRoomId], [SubjectId], [PeriodId], [TeacherId], [Day]) VALUES (1, 3, 16, NULL, 1)
INSERT [dbo].[Schedule] ([ClassRoomId], [SubjectId], [PeriodId], [TeacherId], [Day]) VALUES (1, 3, 17, NULL, 3)
INSERT [dbo].[Schedule] ([ClassRoomId], [SubjectId], [PeriodId], [TeacherId], [Day]) VALUES (1, 3, 32, NULL, 5)
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

INSERT [dbo].[Fee] ([ID], [Amount], [WarrningDate], [LastDate], [Name], [GradeId], [Year]) VALUES (1, 1000, CAST(N'2020-09-08' AS Date), CAST(N'2020-09-11' AS Date), N'as', 1, 200)
SET IDENTITY_INSERT [dbo].[Fee] OFF
GO
SET IDENTITY_INSERT [dbo].[Payment] ON 

INSERT [dbo].[Payment] ([ID], [PayDate], [Amount], [Creditor], [Debtor], [StudentId], [FeeId]) VALUES (1, CAST(N'2020-09-30T00:00:00.000' AS DateTime), 1, N's', N's', N'04d78d63-16eb-4e1a-9236-f31663d25051', 1)
INSERT [dbo].[Payment] ([ID], [PayDate], [Amount], [Creditor], [Debtor], [StudentId], [FeeId]) VALUES (2, CAST(N'2020-09-30T00:00:00.000' AS DateTime), 39, N'SuperSuperAdmin', N'C', N'04d78d63-16eb-4e1a-9236-f31663d25051', 1)
INSERT [dbo].[Payment] ([ID], [PayDate], [Amount], [Creditor], [Debtor], [StudentId], [FeeId]) VALUES (3, CAST(N'2020-09-30T00:00:00.000' AS DateTime), 100, N'SuperSuperAdmin', N'd', N'04d78d63-16eb-4e1a-9236-f31663d25051', 1)
INSERT [dbo].[Payment] ([ID], [PayDate], [Amount], [Creditor], [Debtor], [StudentId], [FeeId]) VALUES (4, CAST(N'2020-09-30T00:00:00.000' AS DateTime), 394, N'SuperSuperAdmin', N'kd', N'04d78d63-16eb-4e1a-9236-f31663d25051', 1)
INSERT [dbo].[Payment] ([ID], [PayDate], [Amount], [Creditor], [Debtor], [StudentId], [FeeId]) VALUES (5, CAST(N'2020-09-30T00:00:00.000' AS DateTime), 31, N'SuperSuperAdmin', N'C', N'04d78d63-16eb-4e1a-9236-f31663d25051', 1)
SET IDENTITY_INSERT [dbo].[Payment] OFF
GO
INSERT [dbo].[TeacherSubject] ([TeacherId], [SubjectId]) VALUES (1, 1)
GO
SET IDENTITY_INSERT [dbo].[News] ON 

INSERT [dbo].[News] ([ID], [Detail], [PublishDate], [FinishedDate], [Visible]) VALUES (2, N'sa', CAST(N'2020-09-30T00:00:00.000' AS DateTime), CAST(N'2020-08-31T04:30:00.000' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[News] OFF
GO
