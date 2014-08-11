IF (SELECT OBJECT_ID FROM sys.indexes WHERE name = 'ix_Complaint_OwnerId') IS NULL
BEGIN
    CREATE NONCLUSTERED INDEX [ix_Complaint_OwnerId]
    ON [dbo].[Complaint]([OwnerId] ASC)
    WITH (ONLINE = ON)
END

IF (SELECT OBJECT_ID FROM sys.indexes WHERE name = 'ix_Complaint_OwnerFirstName') IS NULL
BEGIN
    CREATE NONCLUSTERED INDEX [ix_Complaint_OwnerFirstName] ON [dbo].[Complaint]
    ([OwnerFirstName] ASC)
    WITH (ONLINE = ON)
END

IF (SELECT OBJECT_ID FROM sys.indexes WHERE name = 'ix_Complaint_StatusId') IS NULL
BEGIN
    CREATE NONCLUSTERED INDEX [ix_Complaint_StatusId]
    ON [dbo].[Complaint] ([StatusId] ASC)
    WITH (ONLINE = ON)
END

IF (SELECT OBJECT_ID FROM sys.indexes WHERE name = 'ix_Determination_AnGComplaintId') IS NULL
BEGIN
    CREATE NONCLUSTERED INDEX [ix_Determination_AnGComplaintId]
    ON [dbo].[Determination] ([AnGComplaintId] ASC)
    WITH (ONLINE = ON)
END

IF (SELECT OBJECT_ID FROM sys.indexes WHERE name = 'ix_Recommendation_AnGComplaintId') IS NULL
BEGIN
    CREATE NONCLUSTERED INDEX [ix_Recommendation_AnGComplaintId]
    ON [dbo].[Recommendation] ([AnGComplaintId] ASC)
    WITH (ONLINE = ON)
END

IF (SELECT OBJECT_ID FROM sys.indexes WHERE name = 'ix_Requester_AnGComplaintId') IS NULL
BEGIN
    CREATE NONCLUSTERED INDEX [ix_Requester_AnGComplaintId]
    ON [dbo].[Requester] ([AnGComplaintId] ASC)
    WITH (ONLINE = ON)
END

IF (SELECT OBJECT_ID FROM sys.indexes WHERE name = 'ix_AnGMember_AnGComplaintId') IS NULL
BEGIN
    CREATE NONCLUSTERED INDEX [ix_AnGMember_AnGComplaintId]
    ON [dbo].[AnGMember] ([AnGComplaintId] ASC)
    WITH (ONLINE = ON)
END

IF (SELECT OBJECT_ID FROM sys.indexes WHERE name = 'ix_AnGMember_MemberId') IS NULL
BEGIN
    CREATE NONCLUSTERED INDEX [ix_AnGMember_MemberId]
    ON [dbo].[AnGMember] ([MemberId] ASC)
    WITH (ONLINE = ON)
END

IF (SELECT OBJECT_ID FROM sys.indexes WHERE name = 'ix_AnGMember_MemberFirstName') IS NULL
BEGIN
    CREATE NONCLUSTERED INDEX [ix_AnGMember_MemberFirstName]
    ON [dbo].[AnGMember] ([MemberFirstName] ASC)
    WITH (ONLINE = ON)
END

IF (SELECT OBJECT_ID FROM sys.indexes WHERE name = 'ix_Note_AnGComplaintId') IS NULL
BEGIN
    CREATE NONCLUSTERED INDEX [ix_Note_AnGComplaintId]
    ON [dbo].[Note] ([AnGComplaintId] ASC)
    WITH (ONLINE = ON)
END

IF (SELECT OBJECT_ID FROM sys.indexes WHERE name = 'ix_AuthorizedRepresentative_AnGComplaintId') IS NULL
BEGIN
    CREATE NONCLUSTERED INDEX [ix_AuthorizedRepresentative_AnGComplaintId]
    ON [dbo].[AuthorizedRepresentative] ([AnGComplaintId] ASC)
    WITH (ONLINE = ON)
END

IF (SELECT OBJECT_ID FROM sys.indexes WHERE name = 'ix_Extension_AnGComplaintId') IS NULL
BEGIN
    CREATE NONCLUSTERED INDEX [ix_Extension_AnGComplaintId]
    ON [dbo].[Extension] ([AnGComplaintId] ASC)
    WITH (ONLINE = ON)
END

