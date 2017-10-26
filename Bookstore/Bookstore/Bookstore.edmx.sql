
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 10/26/2017 15:56:01
-- Generated from EDMX file: F:\ProjectDB\Bookstore\Bookstore\Bookstore.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [Bookstore];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------


-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Customers'
CREATE TABLE [dbo].[Customers] (
    [CId] int IDENTITY(1,1) NOT NULL,
    [Cname] nvarchar(max)  NOT NULL,
    [Phone] nvarchar(max)  NOT NULL,
    [Address] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Rental_Info'
CREATE TABLE [dbo].[Rental_Info] (
    [RId] int IDENTITY(1,1) NOT NULL,
    [Rent_date] nvarchar(max)  NOT NULL,
    [Due_date] nvarchar(max)  NOT NULL,
    [CustomerCId] int  NOT NULL
);
GO

-- Creating table 'Books'
CREATE TABLE [dbo].[Books] (
    [BId] int IDENTITY(1,1) NOT NULL,
    [Title] nvarchar(max)  NOT NULL,
    [Price] nvarchar(max)  NOT NULL,
    [Status] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Authors'
CREATE TABLE [dbo].[Authors] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Publishers'
CREATE TABLE [dbo].[Publishers] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Categories'
CREATE TABLE [dbo].[Categories] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [BookBId] int  NOT NULL
);
GO

-- Creating table 'BookRental_Info'
CREATE TABLE [dbo].[BookRental_Info] (
    [Books_BId] int  NOT NULL,
    [Rental_Info_RId] int  NOT NULL
);
GO

-- Creating table 'BookAuthor'
CREATE TABLE [dbo].[BookAuthor] (
    [Books_BId] int  NOT NULL,
    [Authors_Id] int  NOT NULL
);
GO

-- Creating table 'BookPublisher'
CREATE TABLE [dbo].[BookPublisher] (
    [Books_BId] int  NOT NULL,
    [Publishers_Id] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [CId] in table 'Customers'
ALTER TABLE [dbo].[Customers]
ADD CONSTRAINT [PK_Customers]
    PRIMARY KEY CLUSTERED ([CId] ASC);
GO

-- Creating primary key on [RId] in table 'Rental_Info'
ALTER TABLE [dbo].[Rental_Info]
ADD CONSTRAINT [PK_Rental_Info]
    PRIMARY KEY CLUSTERED ([RId] ASC);
GO

-- Creating primary key on [BId] in table 'Books'
ALTER TABLE [dbo].[Books]
ADD CONSTRAINT [PK_Books]
    PRIMARY KEY CLUSTERED ([BId] ASC);
GO

-- Creating primary key on [Id] in table 'Authors'
ALTER TABLE [dbo].[Authors]
ADD CONSTRAINT [PK_Authors]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Publishers'
ALTER TABLE [dbo].[Publishers]
ADD CONSTRAINT [PK_Publishers]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Categories'
ALTER TABLE [dbo].[Categories]
ADD CONSTRAINT [PK_Categories]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Books_BId], [Rental_Info_RId] in table 'BookRental_Info'
ALTER TABLE [dbo].[BookRental_Info]
ADD CONSTRAINT [PK_BookRental_Info]
    PRIMARY KEY CLUSTERED ([Books_BId], [Rental_Info_RId] ASC);
GO

-- Creating primary key on [Books_BId], [Authors_Id] in table 'BookAuthor'
ALTER TABLE [dbo].[BookAuthor]
ADD CONSTRAINT [PK_BookAuthor]
    PRIMARY KEY CLUSTERED ([Books_BId], [Authors_Id] ASC);
GO

-- Creating primary key on [Books_BId], [Publishers_Id] in table 'BookPublisher'
ALTER TABLE [dbo].[BookPublisher]
ADD CONSTRAINT [PK_BookPublisher]
    PRIMARY KEY CLUSTERED ([Books_BId], [Publishers_Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [CustomerCId] in table 'Rental_Info'
ALTER TABLE [dbo].[Rental_Info]
ADD CONSTRAINT [FK_CustomerRental_Info]
    FOREIGN KEY ([CustomerCId])
    REFERENCES [dbo].[Customers]
        ([CId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CustomerRental_Info'
CREATE INDEX [IX_FK_CustomerRental_Info]
ON [dbo].[Rental_Info]
    ([CustomerCId]);
GO

-- Creating foreign key on [Books_BId] in table 'BookRental_Info'
ALTER TABLE [dbo].[BookRental_Info]
ADD CONSTRAINT [FK_BookRental_Info_Book]
    FOREIGN KEY ([Books_BId])
    REFERENCES [dbo].[Books]
        ([BId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Rental_Info_RId] in table 'BookRental_Info'
ALTER TABLE [dbo].[BookRental_Info]
ADD CONSTRAINT [FK_BookRental_Info_Rental_Info]
    FOREIGN KEY ([Rental_Info_RId])
    REFERENCES [dbo].[Rental_Info]
        ([RId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_BookRental_Info_Rental_Info'
CREATE INDEX [IX_FK_BookRental_Info_Rental_Info]
ON [dbo].[BookRental_Info]
    ([Rental_Info_RId]);
GO

-- Creating foreign key on [Books_BId] in table 'BookAuthor'
ALTER TABLE [dbo].[BookAuthor]
ADD CONSTRAINT [FK_BookAuthor_Book]
    FOREIGN KEY ([Books_BId])
    REFERENCES [dbo].[Books]
        ([BId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Authors_Id] in table 'BookAuthor'
ALTER TABLE [dbo].[BookAuthor]
ADD CONSTRAINT [FK_BookAuthor_Author]
    FOREIGN KEY ([Authors_Id])
    REFERENCES [dbo].[Authors]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_BookAuthor_Author'
CREATE INDEX [IX_FK_BookAuthor_Author]
ON [dbo].[BookAuthor]
    ([Authors_Id]);
GO

-- Creating foreign key on [Books_BId] in table 'BookPublisher'
ALTER TABLE [dbo].[BookPublisher]
ADD CONSTRAINT [FK_BookPublisher_Book]
    FOREIGN KEY ([Books_BId])
    REFERENCES [dbo].[Books]
        ([BId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Publishers_Id] in table 'BookPublisher'
ALTER TABLE [dbo].[BookPublisher]
ADD CONSTRAINT [FK_BookPublisher_Publisher]
    FOREIGN KEY ([Publishers_Id])
    REFERENCES [dbo].[Publishers]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_BookPublisher_Publisher'
CREATE INDEX [IX_FK_BookPublisher_Publisher]
ON [dbo].[BookPublisher]
    ([Publishers_Id]);
GO

-- Creating foreign key on [BookBId] in table 'Categories'
ALTER TABLE [dbo].[Categories]
ADD CONSTRAINT [FK_BookCategory]
    FOREIGN KEY ([BookBId])
    REFERENCES [dbo].[Books]
        ([BId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_BookCategory'
CREATE INDEX [IX_FK_BookCategory]
ON [dbo].[Categories]
    ([BookBId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------