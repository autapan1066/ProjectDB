
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 12/15/2017 12:09:30
-- Generated from EDMX file: C:\Users\ArmZa555\Desktop\book_gu2\book_gu\book_shop\book_shop\Models\bookmodel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [DBBookja];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_CustomerRental_info]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Rental_infoSet] DROP CONSTRAINT [FK_CustomerRental_info];
GO
IF OBJECT_ID(N'[dbo].[FK_Rental_infoBook_Rental_info]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Rental_infoBook] DROP CONSTRAINT [FK_Rental_infoBook_Rental_info];
GO
IF OBJECT_ID(N'[dbo].[FK_Rental_infoBook_Book]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Rental_infoBook] DROP CONSTRAINT [FK_Rental_infoBook_Book];
GO
IF OBJECT_ID(N'[dbo].[FK_BookAuthor_Book]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[BookAuthor] DROP CONSTRAINT [FK_BookAuthor_Book];
GO
IF OBJECT_ID(N'[dbo].[FK_BookAuthor_Author]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[BookAuthor] DROP CONSTRAINT [FK_BookAuthor_Author];
GO
IF OBJECT_ID(N'[dbo].[FK_BookCategory_Book]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[BookCategory] DROP CONSTRAINT [FK_BookCategory_Book];
GO
IF OBJECT_ID(N'[dbo].[FK_BookCategory_Category]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[BookCategory] DROP CONSTRAINT [FK_BookCategory_Category];
GO
IF OBJECT_ID(N'[dbo].[FK_BookPublisher_Book]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[BookPublisher] DROP CONSTRAINT [FK_BookPublisher_Book];
GO
IF OBJECT_ID(N'[dbo].[FK_BookPublisher_Publisher]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[BookPublisher] DROP CONSTRAINT [FK_BookPublisher_Publisher];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[BookSet1]', 'U') IS NOT NULL
    DROP TABLE [dbo].[BookSet1];
GO
IF OBJECT_ID(N'[dbo].[AuthorSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AuthorSet];
GO
IF OBJECT_ID(N'[dbo].[PublisherSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PublisherSet];
GO
IF OBJECT_ID(N'[dbo].[CategorySet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[CategorySet];
GO
IF OBJECT_ID(N'[dbo].[Rental_infoSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Rental_infoSet];
GO
IF OBJECT_ID(N'[dbo].[CustomerSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[CustomerSet];
GO
IF OBJECT_ID(N'[dbo].[Rental_infoBook]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Rental_infoBook];
GO
IF OBJECT_ID(N'[dbo].[BookAuthor]', 'U') IS NOT NULL
    DROP TABLE [dbo].[BookAuthor];
GO
IF OBJECT_ID(N'[dbo].[BookCategory]', 'U') IS NOT NULL
    DROP TABLE [dbo].[BookCategory];
GO
IF OBJECT_ID(N'[dbo].[BookPublisher]', 'U') IS NOT NULL
    DROP TABLE [dbo].[BookPublisher];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'BookSet1'
CREATE TABLE [dbo].[BookSet1] (
    [Bid] int IDENTITY(1,1) NOT NULL,
    [Title] nvarchar(max)  NOT NULL,
    [Status] nvarchar(max)  NOT NULL,
    [Price] bigint  NOT NULL
);
GO

-- Creating table 'AuthorSet'
CREATE TABLE [dbo].[AuthorSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'PublisherSet'
CREATE TABLE [dbo].[PublisherSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'CategorySet'
CREATE TABLE [dbo].[CategorySet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Rental_infoSet'
CREATE TABLE [dbo].[Rental_infoSet] (
    [Rid] int IDENTITY(1,1) NOT NULL,
    [Rent_date] datetime  NOT NULL,
    [Due_date] datetime  NOT NULL,
    [CustomerCid] int  NOT NULL
);
GO

-- Creating table 'CustomerSet'
CREATE TABLE [dbo].[CustomerSet] (
    [Cid] int IDENTITY(1,1) NOT NULL,
    [Cname] nvarchar(max)  NOT NULL,
    [Phone] nvarchar(max)  NOT NULL,
    [Address] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Rental_infoBook'
CREATE TABLE [dbo].[Rental_infoBook] (
    [Rental_info_Rid] int  NOT NULL,
    [Book_Bid] int  NOT NULL
);
GO

-- Creating table 'BookAuthor'
CREATE TABLE [dbo].[BookAuthor] (
    [Book_Bid] int  NOT NULL,
    [Author_Id] int  NOT NULL
);
GO

-- Creating table 'BookCategory'
CREATE TABLE [dbo].[BookCategory] (
    [Book_Bid] int  NOT NULL,
    [Category_Id] int  NOT NULL
);
GO

-- Creating table 'BookPublisher'
CREATE TABLE [dbo].[BookPublisher] (
    [Book_Bid] int  NOT NULL,
    [Publisher_Id] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Bid] in table 'BookSet1'
ALTER TABLE [dbo].[BookSet1]
ADD CONSTRAINT [PK_BookSet1]
    PRIMARY KEY CLUSTERED ([Bid] ASC);
GO

-- Creating primary key on [Id] in table 'AuthorSet'
ALTER TABLE [dbo].[AuthorSet]
ADD CONSTRAINT [PK_AuthorSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'PublisherSet'
ALTER TABLE [dbo].[PublisherSet]
ADD CONSTRAINT [PK_PublisherSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'CategorySet'
ALTER TABLE [dbo].[CategorySet]
ADD CONSTRAINT [PK_CategorySet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Rid] in table 'Rental_infoSet'
ALTER TABLE [dbo].[Rental_infoSet]
ADD CONSTRAINT [PK_Rental_infoSet]
    PRIMARY KEY CLUSTERED ([Rid] ASC);
GO

-- Creating primary key on [Cid] in table 'CustomerSet'
ALTER TABLE [dbo].[CustomerSet]
ADD CONSTRAINT [PK_CustomerSet]
    PRIMARY KEY CLUSTERED ([Cid] ASC);
GO

-- Creating primary key on [Rental_info_Rid], [Book_Bid] in table 'Rental_infoBook'
ALTER TABLE [dbo].[Rental_infoBook]
ADD CONSTRAINT [PK_Rental_infoBook]
    PRIMARY KEY CLUSTERED ([Rental_info_Rid], [Book_Bid] ASC);
GO

-- Creating primary key on [Book_Bid], [Author_Id] in table 'BookAuthor'
ALTER TABLE [dbo].[BookAuthor]
ADD CONSTRAINT [PK_BookAuthor]
    PRIMARY KEY CLUSTERED ([Book_Bid], [Author_Id] ASC);
GO

-- Creating primary key on [Book_Bid], [Category_Id] in table 'BookCategory'
ALTER TABLE [dbo].[BookCategory]
ADD CONSTRAINT [PK_BookCategory]
    PRIMARY KEY CLUSTERED ([Book_Bid], [Category_Id] ASC);
GO

-- Creating primary key on [Book_Bid], [Publisher_Id] in table 'BookPublisher'
ALTER TABLE [dbo].[BookPublisher]
ADD CONSTRAINT [PK_BookPublisher]
    PRIMARY KEY CLUSTERED ([Book_Bid], [Publisher_Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [CustomerCid] in table 'Rental_infoSet'
ALTER TABLE [dbo].[Rental_infoSet]
ADD CONSTRAINT [FK_CustomerRental_info]
    FOREIGN KEY ([CustomerCid])
    REFERENCES [dbo].[CustomerSet]
        ([Cid])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CustomerRental_info'
CREATE INDEX [IX_FK_CustomerRental_info]
ON [dbo].[Rental_infoSet]
    ([CustomerCid]);
GO

-- Creating foreign key on [Rental_info_Rid] in table 'Rental_infoBook'
ALTER TABLE [dbo].[Rental_infoBook]
ADD CONSTRAINT [FK_Rental_infoBook_Rental_info]
    FOREIGN KEY ([Rental_info_Rid])
    REFERENCES [dbo].[Rental_infoSet]
        ([Rid])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Book_Bid] in table 'Rental_infoBook'
ALTER TABLE [dbo].[Rental_infoBook]
ADD CONSTRAINT [FK_Rental_infoBook_Book]
    FOREIGN KEY ([Book_Bid])
    REFERENCES [dbo].[BookSet1]
        ([Bid])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Rental_infoBook_Book'
CREATE INDEX [IX_FK_Rental_infoBook_Book]
ON [dbo].[Rental_infoBook]
    ([Book_Bid]);
GO

-- Creating foreign key on [Book_Bid] in table 'BookAuthor'
ALTER TABLE [dbo].[BookAuthor]
ADD CONSTRAINT [FK_BookAuthor_Book]
    FOREIGN KEY ([Book_Bid])
    REFERENCES [dbo].[BookSet1]
        ([Bid])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Author_Id] in table 'BookAuthor'
ALTER TABLE [dbo].[BookAuthor]
ADD CONSTRAINT [FK_BookAuthor_Author]
    FOREIGN KEY ([Author_Id])
    REFERENCES [dbo].[AuthorSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_BookAuthor_Author'
CREATE INDEX [IX_FK_BookAuthor_Author]
ON [dbo].[BookAuthor]
    ([Author_Id]);
GO

-- Creating foreign key on [Book_Bid] in table 'BookCategory'
ALTER TABLE [dbo].[BookCategory]
ADD CONSTRAINT [FK_BookCategory_Book]
    FOREIGN KEY ([Book_Bid])
    REFERENCES [dbo].[BookSet1]
        ([Bid])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Category_Id] in table 'BookCategory'
ALTER TABLE [dbo].[BookCategory]
ADD CONSTRAINT [FK_BookCategory_Category]
    FOREIGN KEY ([Category_Id])
    REFERENCES [dbo].[CategorySet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_BookCategory_Category'
CREATE INDEX [IX_FK_BookCategory_Category]
ON [dbo].[BookCategory]
    ([Category_Id]);
GO

-- Creating foreign key on [Book_Bid] in table 'BookPublisher'
ALTER TABLE [dbo].[BookPublisher]
ADD CONSTRAINT [FK_BookPublisher_Book]
    FOREIGN KEY ([Book_Bid])
    REFERENCES [dbo].[BookSet1]
        ([Bid])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Publisher_Id] in table 'BookPublisher'
ALTER TABLE [dbo].[BookPublisher]
ADD CONSTRAINT [FK_BookPublisher_Publisher]
    FOREIGN KEY ([Publisher_Id])
    REFERENCES [dbo].[PublisherSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_BookPublisher_Publisher'
CREATE INDEX [IX_FK_BookPublisher_Publisher]
ON [dbo].[BookPublisher]
    ([Publisher_Id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------