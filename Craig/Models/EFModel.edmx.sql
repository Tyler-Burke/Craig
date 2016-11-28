
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 11/28/2016 07:48:38
-- Generated from EDMX file: C:\Users\ty_bu\Documents\Visual Studio 2015\Websites\Craig\Craig\Models\EFModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [CraigDB];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_Call_To_Location]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Call] DROP CONSTRAINT [FK_Call_To_Location];
GO
IF OBJECT_ID(N'[dbo].[FK_Call_To_Platform]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Call] DROP CONSTRAINT [FK_Call_To_Platform];
GO
IF OBJECT_ID(N'[dbo].[FK_Call_To_User]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Call] DROP CONSTRAINT [FK_Call_To_User];
GO
IF OBJECT_ID(N'[dbo].[FK_Resolution_To_Call]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Resolution] DROP CONSTRAINT [FK_Resolution_To_Call];
GO
IF OBJECT_ID(N'[dbo].[FK_Resolution_To_User]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Resolution] DROP CONSTRAINT [FK_Resolution_To_User];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Call]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Call];
GO
IF OBJECT_ID(N'[dbo].[Location]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Location];
GO
IF OBJECT_ID(N'[dbo].[Platform]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Platform];
GO
IF OBJECT_ID(N'[dbo].[Resolution]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Resolution];
GO
IF OBJECT_ID(N'[dbo].[User]', 'U') IS NOT NULL
    DROP TABLE [dbo].[User];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Calls'
CREATE TABLE [dbo].[Calls] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Platform_Id] int  NOT NULL,
    [Location_Id] int  NOT NULL,
    [Severity] varchar(50)  NOT NULL,
    [Extension] varchar(50)  NOT NULL,
    [Details] nvarchar(max)  NOT NULL,
    [TimeOpened] datetime  NOT NULL,
    [LastUpdated] datetime  NOT NULL,
    [State] varchar(50)  NOT NULL,
    [User_Id] int  NOT NULL
);
GO

-- Creating table 'Locations'
CREATE TABLE [dbo].[Locations] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] varchar(50)  NOT NULL,
    [CreatedAt] datetime  NOT NULL
);
GO

-- Creating table 'Platforms'
CREATE TABLE [dbo].[Platforms] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] varchar(50)  NOT NULL,
    [CreatedAt] datetime  NOT NULL
);
GO

-- Creating table 'Resolutions'
CREATE TABLE [dbo].[Resolutions] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Details] nvarchar(max)  NOT NULL,
    [TimeLogged] datetime  NOT NULL,
    [User_Id] int  NOT NULL,
    [Call_Id] int  NOT NULL
);
GO

-- Creating table 'Users'
CREATE TABLE [dbo].[Users] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Username] varchar(50)  NOT NULL,
    [Password] varchar(50)  NOT NULL,
    [FirstName] varchar(50)  NOT NULL,
    [LastName] varchar(50)  NOT NULL,
    [Email] varchar(50)  NOT NULL,
    [EmployeeNumber] int  NOT NULL,
    [CraigRole] varchar(50)  NOT NULL,
    [ServerListRole] varchar(50)  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Calls'
ALTER TABLE [dbo].[Calls]
ADD CONSTRAINT [PK_Calls]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Locations'
ALTER TABLE [dbo].[Locations]
ADD CONSTRAINT [PK_Locations]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Platforms'
ALTER TABLE [dbo].[Platforms]
ADD CONSTRAINT [PK_Platforms]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Resolutions'
ALTER TABLE [dbo].[Resolutions]
ADD CONSTRAINT [PK_Resolutions]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Users'
ALTER TABLE [dbo].[Users]
ADD CONSTRAINT [PK_Users]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Location_Id] in table 'Calls'
ALTER TABLE [dbo].[Calls]
ADD CONSTRAINT [FK_Call_To_Location]
    FOREIGN KEY ([Location_Id])
    REFERENCES [dbo].[Locations]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Call_To_Location'
CREATE INDEX [IX_FK_Call_To_Location]
ON [dbo].[Calls]
    ([Location_Id]);
GO

-- Creating foreign key on [Platform_Id] in table 'Calls'
ALTER TABLE [dbo].[Calls]
ADD CONSTRAINT [FK_Call_To_Platform]
    FOREIGN KEY ([Platform_Id])
    REFERENCES [dbo].[Platforms]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Call_To_Platform'
CREATE INDEX [IX_FK_Call_To_Platform]
ON [dbo].[Calls]
    ([Platform_Id]);
GO

-- Creating foreign key on [Call_Id] in table 'Resolutions'
ALTER TABLE [dbo].[Resolutions]
ADD CONSTRAINT [FK_Resolution_To_Call]
    FOREIGN KEY ([Call_Id])
    REFERENCES [dbo].[Calls]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Resolution_To_Call'
CREATE INDEX [IX_FK_Resolution_To_Call]
ON [dbo].[Resolutions]
    ([Call_Id]);
GO

-- Creating foreign key on [User_Id] in table 'Resolutions'
ALTER TABLE [dbo].[Resolutions]
ADD CONSTRAINT [FK_Resolution_To_User]
    FOREIGN KEY ([User_Id])
    REFERENCES [dbo].[Users]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Resolution_To_User'
CREATE INDEX [IX_FK_Resolution_To_User]
ON [dbo].[Resolutions]
    ([User_Id]);
GO

-- Creating foreign key on [User_Id] in table 'Calls'
ALTER TABLE [dbo].[Calls]
ADD CONSTRAINT [FK_Call_To_User]
    FOREIGN KEY ([User_Id])
    REFERENCES [dbo].[Users]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Call_To_User'
CREATE INDEX [IX_FK_Call_To_User]
ON [dbo].[Calls]
    ([User_Id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------