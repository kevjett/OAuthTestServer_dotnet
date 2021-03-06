
/****** Object:  Table [dbo].[OAuth_Authorization]    Script Date: 5/14/2015 12:43:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OAuth_Authorization](
	[OAuth_AuthorizationId] [int] IDENTITY(1,1) NOT NULL,
	[ClientId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[ResourceId] [int] NOT NULL,
	[Scope] [nvarchar](max) NULL,
	[ExpirationDate] [datetime] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_OAuth_Authorization] PRIMARY KEY CLUSTERED 
(
	[OAuth_AuthorizationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OAuth_Client]    Script Date: 5/14/2015 12:43:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OAuth_Client](
	[OAuth_ClientId] [int] IDENTITY(1,1) NOT NULL,
	[ClientIdentifier] [nvarchar](256) NOT NULL,
	[ClientSecret] [nvarchar](max) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[WebsiteUrl] [nvarchar](max) NULL,
	[RedirectUrl] [nvarchar](max) NULL,
	[ClientType] [int] NOT NULL,
 CONSTRAINT [PK_OAuth_Client] PRIMARY KEY CLUSTERED 
(
	[OAuth_ClientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OAuth_ClientScope]    Script Date: 5/14/2015 12:43:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OAuth_ClientScope](
	[ClientId] [int] NOT NULL,
	[ScopeIdentifier] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_OAuth_ClientScope] PRIMARY KEY CLUSTERED 
(
	[ClientId] ASC,
	[ScopeIdentifier] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OAuth_Nonce]    Script Date: 5/14/2015 12:43:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OAuth_Nonce](
	[Context] [nvarchar](500) NOT NULL,
	[Code] [nvarchar](128) NOT NULL,
	[Timestamp] [datetime] NOT NULL,
 CONSTRAINT [PK_OAuth_Nonce] PRIMARY KEY CLUSTERED 
(
	[Context] ASC,
	[Code] ASC,
	[Timestamp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OAuth_Resource]    Script Date: 5/14/2015 12:43:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OAuth_Resource](
	[OAuth_ResourceId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[AuthenticationTokenName] [nvarchar](max) NOT NULL,
	[AuthenticationUrl] [nvarchar](max) NOT NULL,
	[AuthenticationKey] [nvarchar](256) NOT NULL,
	[PublicTokenEncryptionKey] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_OAuth_Resource] PRIMARY KEY CLUSTERED 
(
	[OAuth_ResourceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OAuth_ResourceScope]    Script Date: 5/14/2015 12:43:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OAuth_ResourceScope](
	[ResourceId] [int] NOT NULL,
	[ScopeIdentifier] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_OAuth_ResourceScope] PRIMARY KEY CLUSTERED 
(
	[ResourceId] ASC,
	[ScopeIdentifier] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OAuth_Scope]    Script Date: 5/14/2015 12:43:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OAuth_Scope](
	[Identifier] [nvarchar](128) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_OAuth_Scope] PRIMARY KEY CLUSTERED 
(
	[Identifier] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OAuth_SymmetricCryptoKey]    Script Date: 5/14/2015 12:43:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OAuth_SymmetricCryptoKey](
	[Bucket] [nvarchar](128) NOT NULL,
	[Handle] [nvarchar](max) NOT NULL,
	[ExpiresDate] [datetime] NOT NULL,
	[Secret] [varbinary](max) NOT NULL,
 CONSTRAINT [PK_OAuth_SymmetricCryptoKey] PRIMARY KEY CLUSTERED 
(
	[Bucket] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[OAuth_Client] ON 

GO
INSERT [dbo].[OAuth_Client] ([OAuth_ClientId], [ClientIdentifier], [ClientSecret], [Name], [Description], [WebsiteUrl], [RedirectUrl], [ClientType]) VALUES (1, N'6C9577C8A4E73DDAC48DAA6445BB1', N'03G7UUyj744bzwJmy8lQbN69tdhekv4a', N'iOS App', N'', N'', N'', 0)
GO
SET IDENTITY_INSERT [dbo].[OAuth_Client] OFF
GO
INSERT [dbo].[OAuth_ClientScope] ([ClientId], [ScopeIdentifier]) VALUES (1, N'manage')
GO
INSERT [dbo].[OAuth_ClientScope] ([ClientId], [ScopeIdentifier]) VALUES (1, N'web')
GO
SET IDENTITY_INSERT [dbo].[OAuth_Resource] ON 

GO
INSERT [dbo].[OAuth_Resource] ([OAuth_ResourceId], [Name], [AuthenticationTokenName], [AuthenticationUrl], [AuthenticationKey], [PublicTokenEncryptionKey]) VALUES (1, N'API', N'cb-resource-authentication-token', N'/oauth2/Login', N'349NXP8B6RGTP7v0xx8D042P0ev6WnCS', N'PFJTQUtleVZhbHVlPjxNb2R1bHVzPjZlZnpYTHNvSmQ5OVVQMjdOQ1hWSnpZSFVtMmlLTUVOSlo2eVpVSFNvTE5uYnFMdENZWjZXaEl3SXY5WVBGeit0Z1AvQWN0dXh3N2VWVzdsU0RaU0IvQU8ySk1kOXJ1MkJ4SHRVaUZVd2pySnNHTlRUS1NhVDFDOTA0YXFaTExaRUxmYnVvVllabnFKWkRvdjlreTkwaHZtTTYwY3FXbkU4TGc2aGZSYlFPOD08L01vZHVsdXM+PEV4cG9uZW50PkFRQUI8L0V4cG9uZW50PjwvUlNBS2V5VmFsdWU+')
GO
SET IDENTITY_INSERT [dbo].[OAuth_Resource] OFF
GO
INSERT [dbo].[OAuth_ResourceScope] ([ResourceId], [ScopeIdentifier]) VALUES (1, N'manage')
GO
INSERT [dbo].[OAuth_ResourceScope] ([ResourceId], [ScopeIdentifier]) VALUES (1, N'web')
GO
INSERT [dbo].[OAuth_Scope] ([Identifier], [Description]) VALUES (N'manage', N'Manage account on user''s behalf')
GO
INSERT [dbo].[OAuth_Scope] ([Identifier], [Description]) VALUES (N'web', N'Login to web on user''s behalf')
GO
INSERT [dbo].[OAuth_SymmetricCryptoKey] ([Bucket], [Handle], [ExpiresDate], [Secret]) VALUES (N'https://localhost/dnoa/oauth_authorization_code', N'2oBU', CAST(N'2016-05-14 05:41:22.793' AS DateTime), 0x7E84C6E42D6CE5E18D1E99F8C3DAD40566411CC0FFE77F9D90CD263F5BA538CB)
GO
INSERT [dbo].[OAuth_SymmetricCryptoKey] ([Bucket], [Handle], [ExpiresDate], [Secret]) VALUES (N'https://localhost/dnoa/oauth_refresh_token', N'wxFx', CAST(N'2016-05-14 05:41:22.797' AS DateTime), 0xFE251484D381BAEA12A2DBEC028B5885F26E3F2B503BF28E1B404D31117AD332)
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ_OAuth_Client_ClientIdentifier]    Script Date: 5/14/2015 12:43:01 AM ******/
ALTER TABLE [dbo].[OAuth_Client] ADD  CONSTRAINT [UQ_OAuth_Client_ClientIdentifier] UNIQUE NONCLUSTERED 
(
	[ClientIdentifier] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ_OAuth_Resource_AuthenticationKey]    Script Date: 5/14/2015 12:43:01 AM ******/
ALTER TABLE [dbo].[OAuth_Resource] ADD  CONSTRAINT [UQ_OAuth_Resource_AuthenticationKey] UNIQUE NONCLUSTERED 
(
	[AuthenticationKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[OAuth_Authorization]  WITH CHECK ADD  CONSTRAINT [FK_OAuth_Authorization_ClientId] FOREIGN KEY([ClientId])
REFERENCES [dbo].[OAuth_Client] ([OAuth_ClientId])
GO
ALTER TABLE [dbo].[OAuth_Authorization] CHECK CONSTRAINT [FK_OAuth_Authorization_ClientId]
GO
ALTER TABLE [dbo].[OAuth_Authorization]  WITH CHECK ADD  CONSTRAINT [FK_OAuth_Authorization_ResourceId] FOREIGN KEY([ResourceId])
REFERENCES [dbo].[OAuth_Resource] ([OAuth_ResourceId])
GO
ALTER TABLE [dbo].[OAuth_Authorization] CHECK CONSTRAINT [FK_OAuth_Authorization_ResourceId]
GO
ALTER TABLE [dbo].[OAuth_Authorization]  WITH CHECK ADD  CONSTRAINT [FK_OAuth_Authorization_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[OAuth_Authorization] CHECK CONSTRAINT [FK_OAuth_Authorization_UserId]
GO
ALTER TABLE [dbo].[OAuth_ClientScope]  WITH CHECK ADD  CONSTRAINT [FK_OAuth_ClientScope_ClientId] FOREIGN KEY([ClientId])
REFERENCES [dbo].[OAuth_Client] ([OAuth_ClientId])
GO
ALTER TABLE [dbo].[OAuth_ClientScope] CHECK CONSTRAINT [FK_OAuth_ClientScope_ClientId]
GO
ALTER TABLE [dbo].[OAuth_ClientScope]  WITH CHECK ADD  CONSTRAINT [FK_OAuth_ClientScope_ScopeIdentifier] FOREIGN KEY([ScopeIdentifier])
REFERENCES [dbo].[OAuth_Scope] ([Identifier])
GO
ALTER TABLE [dbo].[OAuth_ClientScope] CHECK CONSTRAINT [FK_OAuth_ClientScope_ScopeIdentifier]
GO
ALTER TABLE [dbo].[OAuth_ResourceScope]  WITH CHECK ADD  CONSTRAINT [FK_OAuth_ResourceScope_ResourceId] FOREIGN KEY([ResourceId])
REFERENCES [dbo].[OAuth_Resource] ([OAuth_ResourceId])
GO
ALTER TABLE [dbo].[OAuth_ResourceScope] CHECK CONSTRAINT [FK_OAuth_ResourceScope_ResourceId]
GO
ALTER TABLE [dbo].[OAuth_ResourceScope]  WITH CHECK ADD  CONSTRAINT [FK_OAuth_ResourceScope_ScopeIdentifier] FOREIGN KEY([ScopeIdentifier])
REFERENCES [dbo].[OAuth_Scope] ([Identifier])
GO
ALTER TABLE [dbo].[OAuth_ResourceScope] CHECK CONSTRAINT [FK_OAuth_ResourceScope_ScopeIdentifier]
GO
