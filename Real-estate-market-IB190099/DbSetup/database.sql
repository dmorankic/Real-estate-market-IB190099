USE [IB190099]

SET IDENTITY_INSERT [dbo].[City] ON 

INSERT [dbo].[City] ([Id], [Name], [ZipCode]) VALUES (1004, N'Lukavac', N'75300')
INSERT [dbo].[City] ([Id], [Name], [ZipCode]) VALUES (1005, N'Tuzla', N'75000')
INSERT [dbo].[City] ([Id], [Name], [ZipCode]) VALUES (2004, N'Maglaj', N'74250')
INSERT [dbo].[City] ([Id], [Name], [ZipCode]) VALUES (2005, N'Gracanica', N'75301')
INSERT [dbo].[City] ([Id], [Name], [ZipCode]) VALUES (2006, N'Dubrovnik', N'26500')
INSERT [dbo].[City] ([Id], [Name], [ZipCode]) VALUES (2007, N'Mlini', N'25601')
INSERT [dbo].[City] ([Id], [Name], [ZipCode]) VALUES (2008, N'Srebreno', N'25602')
INSERT [dbo].[City] ([Id], [Name], [ZipCode]) VALUES (2014, N'Plat', N'25603')
INSERT [dbo].[City] ([Id], [Name], [ZipCode]) VALUES (3006, N'string', N'string')
INSERT [dbo].[City] ([Id], [Name], [ZipCode]) VALUES (4006, N'Babanovac', N'72286')
INSERT [dbo].[City] ([Id], [Name], [ZipCode]) VALUES (4007, N'Banovici', N'75290')
INSERT [dbo].[City] ([Id], [Name], [ZipCode]) VALUES (4008, N'Orahovica', N'75200')
INSERT [dbo].[City] ([Id], [Name], [ZipCode]) VALUES (4009, N'Orahovic', N'75201')
INSERT [dbo].[City] ([Id], [Name], [ZipCode]) VALUES (5006, N'Zivinice', N'75100')
INSERT [dbo].[City] ([Id], [Name], [ZipCode]) VALUES (6006, N'Moskva', N'45000')
INSERT [dbo].[City] ([Id], [Name], [ZipCode]) VALUES (6007, N'Milano', N'21500')
INSERT [dbo].[City] ([Id], [Name], [ZipCode]) VALUES (6008, N'tzee', N'22111')
INSERT [dbo].[City] ([Id], [Name], [ZipCode]) VALUES (6009, N'rwwwwww', N'44777')
INSERT [dbo].[City] ([Id], [Name], [ZipCode]) VALUES (7006, N'Brcko', N'74200')
SET IDENTITY_INSERT [dbo].[City] OFF

SET IDENTITY_INSERT [dbo].[Address] ON 

INSERT [dbo].[Address] ([Id], [NumberStreet], [CityId]) VALUES (6, N'Armije R BiH, D7', 1004)
INSERT [dbo].[Address] ([Id], [NumberStreet], [CityId]) VALUES (7, N'Sarajevska,bb', 1004)
INSERT [dbo].[Address] ([Id], [NumberStreet], [CityId]) VALUES (8, N'Sarajevska, bb', 1005)
INSERT [dbo].[Address] ([Id], [NumberStreet], [CityId]) VALUES (1006, N'8. marta, bb', 1005)
INSERT [dbo].[Address] ([Id], [NumberStreet], [CityId]) VALUES (1007, N'Armije R BiH, D7', 2004)
INSERT [dbo].[Address] ([Id], [NumberStreet], [CityId]) VALUES (1008, N'Armije R BiH, D8', 1004)
INSERT [dbo].[Address] ([Id], [NumberStreet], [CityId]) VALUES (1009, N'Armije R BiH, D7', 2005)
INSERT [dbo].[Address] ([Id], [NumberStreet], [CityId]) VALUES (1010, N'Ante Starcevica, 25', 2006)
INSERT [dbo].[Address] ([Id], [NumberStreet], [CityId]) VALUES (1011, N'Armije R BiH, D7', 2007)
INSERT [dbo].[Address] ([Id], [NumberStreet], [CityId]) VALUES (1012, N'Armije R BiH, D7', 2008)
INSERT [dbo].[Address] ([Id], [NumberStreet], [CityId]) VALUES (1017, N'Armije R BiH, D7', 2014)
INSERT [dbo].[Address] ([Id], [NumberStreet], [CityId]) VALUES (2010, N'string', 3006)
INSERT [dbo].[Address] ([Id], [NumberStreet], [CityId]) VALUES (3010, N'armije bih ', 1004)
INSERT [dbo].[Address] ([Id], [NumberStreet], [CityId]) VALUES (4010, N'Modrac bb', 1004)
INSERT [dbo].[Address] ([Id], [NumberStreet], [CityId]) VALUES (4011, N'string', 4006)
INSERT [dbo].[Address] ([Id], [NumberStreet], [CityId]) VALUES (4012, N'Postanska ', 4007)
INSERT [dbo].[Address] ([Id], [NumberStreet], [CityId]) VALUES (4013, N'Postanska', 4008)
INSERT [dbo].[Address] ([Id], [NumberStreet], [CityId]) VALUES (4014, N'Postanska', 4009)
INSERT [dbo].[Address] ([Id], [NumberStreet], [CityId]) VALUES (4015, N'Skolska bb', 1004)
INSERT [dbo].[Address] ([Id], [NumberStreet], [CityId]) VALUES (5010, N'Modrac 94', 1004)
INSERT [dbo].[Address] ([Id], [NumberStreet], [CityId]) VALUES (5011, N'Armije R BiH, D7', 1005)
INSERT [dbo].[Address] ([Id], [NumberStreet], [CityId]) VALUES (6011, N'Nova ulica bb', 1004)
INSERT [dbo].[Address] ([Id], [NumberStreet], [CityId]) VALUES (7011, N'Armije BiH, D8', 5006)
INSERT [dbo].[Address] ([Id], [NumberStreet], [CityId]) VALUES (7012, N'Pruga bb', 1004)
INSERT [dbo].[Address] ([Id], [NumberStreet], [CityId]) VALUES (8011, N'Milerova', 1005)
INSERT [dbo].[Address] ([Id], [NumberStreet], [CityId]) VALUES (9011, N'Armije BiH, D8', 1005)
INSERT [dbo].[Address] ([Id], [NumberStreet], [CityId]) VALUES (9012, N'Armije BiH, D8', 1004)
INSERT [dbo].[Address] ([Id], [NumberStreet], [CityId]) VALUES (9013, N'Majkuska bb', 6006)
INSERT [dbo].[Address] ([Id], [NumberStreet], [CityId]) VALUES (9014, N'Milanskih brigada bb', 6007)
INSERT [dbo].[Address] ([Id], [NumberStreet], [CityId]) VALUES (9015, N'aaa', 6008)
INSERT [dbo].[Address] ([Id], [NumberStreet], [CityId]) VALUES (9016, N'aaafff', 6009)
INSERT [dbo].[Address] ([Id], [NumberStreet], [CityId]) VALUES (10011, N'Sarajevska bb', 1004)
INSERT [dbo].[Address] ([Id], [NumberStreet], [CityId]) VALUES (11011, N'Armije Republike, bb', 7006)
INSERT [dbo].[Address] ([Id], [NumberStreet], [CityId]) VALUES (11012, N'Titova, 23', 1004)
INSERT [dbo].[Address] ([Id], [NumberStreet], [CityId]) VALUES (11013, N'Skolska bb', 2005)
INSERT [dbo].[Address] ([Id], [NumberStreet], [CityId]) VALUES (11014, N'Skojevksa bb', 1005)
INSERT [dbo].[Address] ([Id], [NumberStreet], [CityId]) VALUES (11015, N'Rudarska 28', 1004)
INSERT [dbo].[Address] ([Id], [NumberStreet], [CityId]) VALUES (11016, N'Bistarac 94', 1004)
INSERT [dbo].[Address] ([Id], [NumberStreet], [CityId]) VALUES (11017, N'Bosanskih kraljeva 92', 1004)
INSERT [dbo].[Address] ([Id], [NumberStreet], [CityId]) VALUES (11018, N'Turija bb', 1004)
SET IDENTITY_INSERT [dbo].[Address] OFF

SET IDENTITY_INSERT [dbo].[Location] ON 

INSERT [dbo].[Location] ([Id], [Latitude], [Longitude]) VALUES (1, 2, 3)
INSERT [dbo].[Location] ([Id], [Latitude], [Longitude]) VALUES (2, 3, 4)
INSERT [dbo].[Location] ([Id], [Latitude], [Longitude]) VALUES (3, 67, 23)
INSERT [dbo].[Location] ([Id], [Latitude], [Longitude]) VALUES (1003, 44.51987948783929, 18.528908081352711)
INSERT [dbo].[Location] ([Id], [Latitude], [Longitude]) VALUES (1004, 44.52764393212582, 18.5390055924654)
INSERT [dbo].[Location] ([Id], [Latitude], [Longitude]) VALUES (2003, 44.530379479700493, 18.632034994661808)
INSERT [dbo].[Location] ([Id], [Latitude], [Longitude]) VALUES (3003, 44.525711642680655, 18.522479832172394)
INSERT [dbo].[Location] ([Id], [Latitude], [Longitude]) VALUES (3004, 27.7089427, 85.3086209)
INSERT [dbo].[Location] ([Id], [Latitude], [Longitude]) VALUES (4003, 44.536530586448684, 18.530805744230747)
INSERT [dbo].[Location] ([Id], [Latitude], [Longitude]) VALUES (4004, 27.7089427, 85.3086209)
INSERT [dbo].[Location] ([Id], [Latitude], [Longitude]) VALUES (5003, 44.529464298574695, 18.529941402375698)
INSERT [dbo].[Location] ([Id], [Latitude], [Longitude]) VALUES (5004, 44.700107136483638, 18.303339332342148)
INSERT [dbo].[Location] ([Id], [Latitude], [Longitude]) VALUES (5005, 44.536526762673049, 18.68038147687912)
INSERT [dbo].[Location] ([Id], [Latitude], [Longitude]) VALUES (5006, 27.7089427, 85.3086209)
INSERT [dbo].[Location] ([Id], [Latitude], [Longitude]) VALUES (5007, 44.518885491588918, 18.513294607400894)
INSERT [dbo].[Location] ([Id], [Latitude], [Longitude]) VALUES (5008, 44.517767643897983, 18.55478435754776)
INSERT [dbo].[Location] ([Id], [Latitude], [Longitude]) VALUES (5009, 44.530263320134992, 18.529201783239841)
INSERT [dbo].[Location] ([Id], [Latitude], [Longitude]) VALUES (5010, 44.51097833839161, 18.362762667238712)
SET IDENTITY_INSERT [dbo].[Location] OFF

SET IDENTITY_INSERT [dbo].[Property] ON 

INSERT [dbo].[Property] ([Id], [Name], [Description], [Floors], [PropertyType], [Rooms], [Parking], [Water], [Electricity], [Price], [AddressId], [Quadrature], [LocationId], [YearOfConstruction]) VALUES (2007, N'testni oglas', N'on demand', 5, N'Hall', 8, 1, 0, 1, 200000, NULL, 260, NULL, 2003)
INSERT [dbo].[Property] ([Id], [Name], [Description], [Floors], [PropertyType], [Rooms], [Parking], [Water], [Electricity], [Price], [AddressId], [Quadrature], [LocationId], [YearOfConstruction]) VALUES (2009, N'propnamee', N'prop desc', 22, N'Flat', 22, 1, 0, 0, 22333, NULL, 233, NULL, 2008)
INSERT [dbo].[Property] ([Id], [Name], [Description], [Floors], [PropertyType], [Rooms], [Parking], [Water], [Electricity], [Price], [AddressId], [Quadrature], [LocationId], [YearOfConstruction]) VALUES (2010, N'sa redirekcijom', N'opis redirekcija', 23, N'Cottage', 87, 1, 0, 0, 1222, NULL, 2233, NULL, 2001)
INSERT [dbo].[Property] ([Id], [Name], [Description], [Floors], [PropertyType], [Rooms], [Parking], [Water], [Electricity], [Price], [AddressId], [Quadrature], [LocationId], [YearOfConstruction]) VALUES (2011, N'redirektuj me', N'redirectt', 5, N'Cottage', 6, 1, 0, 0, 332, NULL, 223, NULL, 2008)
INSERT [dbo].[Property] ([Id], [Name], [Description], [Floors], [PropertyType], [Rooms], [Parking], [Water], [Electricity], [Price], [AddressId], [Quadrature], [LocationId], [YearOfConstruction]) VALUES (2012, N'redirektuj me', N'redirectt', 5, N'Cottage', 6, 1, 0, 0, 332, NULL, 223, NULL, 2008)
INSERT [dbo].[Property] ([Id], [Name], [Description], [Floors], [PropertyType], [Rooms], [Parking], [Water], [Electricity], [Price], [AddressId], [Quadrature], [LocationId], [YearOfConstruction]) VALUES (2013, N'redirektuj me', N'redirectt', 5, N'Cottage', 6, 1, 0, 0, 332, NULL, 223, NULL, 2008)
INSERT [dbo].[Property] ([Id], [Name], [Description], [Floors], [PropertyType], [Rooms], [Parking], [Water], [Electricity], [Price], [AddressId], [Quadrature], [LocationId], [YearOfConstruction]) VALUES (2014, N'porp redirect', N'eeee j ti', 2, N'Office space', 2, 1, 0, 0, 332, NULL, 223, NULL, 2004)
INSERT [dbo].[Property] ([Id], [Name], [Description], [Floors], [PropertyType], [Rooms], [Parking], [Water], [Electricity], [Price], [AddressId], [Quadrature], [LocationId], [YearOfConstruction]) VALUES (2015, N'porp redirect', N'eeee j ti', 2, N'Office space', 2, 1, 0, 0, 332, NULL, 223, NULL, 2004)
INSERT [dbo].[Property] ([Id], [Name], [Description], [Floors], [PropertyType], [Rooms], [Parking], [Water], [Electricity], [Price], [AddressId], [Quadrature], [LocationId], [YearOfConstruction]) VALUES (2016, N'porp redirect', N'eeee j ti', 2, N'Office space', 2, 1, 0, 0, 332, NULL, 223, NULL, 2004)
INSERT [dbo].[Property] ([Id], [Name], [Description], [Floors], [PropertyType], [Rooms], [Parking], [Water], [Electricity], [Price], [AddressId], [Quadrature], [LocationId], [YearOfConstruction]) VALUES (2017, N'ad ludi', N'eeee', 4, N'Flat', 3, 1, 0, 0, 332, NULL, 335, NULL, 2018)
INSERT [dbo].[Property] ([Id], [Name], [Description], [Floors], [PropertyType], [Rooms], [Parking], [Water], [Electricity], [Price], [AddressId], [Quadrature], [LocationId], [YearOfConstruction]) VALUES (2018, N'ad ludi', N'eeee', 4, N'Flat', 3, 1, 0, 0, 332, NULL, 335, NULL, 2018)
INSERT [dbo].[Property] ([Id], [Name], [Description], [Floors], [PropertyType], [Rooms], [Parking], [Water], [Electricity], [Price], [AddressId], [Quadrature], [LocationId], [YearOfConstruction]) VALUES (2019, N'House Trebrevic', N'House near Sarajevo', 3, N'House', 6, 1, 0, 0, 890, NULL, 200, NULL, 2014)
INSERT [dbo].[Property] ([Id], [Name], [Description], [Floors], [PropertyType], [Rooms], [Parking], [Water], [Electricity], [Price], [AddressId], [Quadrature], [LocationId], [YearOfConstruction]) VALUES (2020, N'House Trebrevic', N'House near Sarajevo', 3, N'House', 6, 1, 0, 0, 890, NULL, 200, NULL, 2014)
INSERT [dbo].[Property] ([Id], [Name], [Description], [Floors], [PropertyType], [Rooms], [Parking], [Water], [Electricity], [Price], [AddressId], [Quadrature], [LocationId], [YearOfConstruction]) VALUES (2021, N'House Trebrevic', N'House near Sarajevo', 3, N'House', 6, 1, 0, 0, 890, NULL, 200, NULL, 2014)
INSERT [dbo].[Property] ([Id], [Name], [Description], [Floors], [PropertyType], [Rooms], [Parking], [Water], [Electricity], [Price], [AddressId], [Quadrature], [LocationId], [YearOfConstruction]) VALUES (2022, N'House Trebrevic', N'House near Sarajevo', 3, N'House', 6, 1, 0, 0, 890, NULL, 200, NULL, 2014)
INSERT [dbo].[Property] ([Id], [Name], [Description], [Floors], [PropertyType], [Rooms], [Parking], [Water], [Electricity], [Price], [AddressId], [Quadrature], [LocationId], [YearOfConstruction]) VALUES (2023, N'House Trebrevic', N'House near Sarajevo', 3, N'House', 6, 1, 0, 0, 890, NULL, 200, NULL, 2014)
INSERT [dbo].[Property] ([Id], [Name], [Description], [Floors], [PropertyType], [Rooms], [Parking], [Water], [Electricity], [Price], [AddressId], [Quadrature], [LocationId], [YearOfConstruction]) VALUES (2024, N'House Trebrevict', N'House near Sarajevo', 3, N'House', 6, 1, 0, 0, 890, NULL, 200, NULL, 2014)
INSERT [dbo].[Property] ([Id], [Name], [Description], [Floors], [PropertyType], [Rooms], [Parking], [Water], [Electricity], [Price], [AddressId], [Quadrature], [LocationId], [YearOfConstruction]) VALUES (2026, N'eee', N'ssss', 3, N'Office space', 3, 0, 0, 0, 332, NULL, 222, NULL, 2222)
INSERT [dbo].[Property] ([Id], [Name], [Description], [Floors], [PropertyType], [Rooms], [Parking], [Water], [Electricity], [Price], [AddressId], [Quadrature], [LocationId], [YearOfConstruction]) VALUES (2027, N'eee', N'ssss', 3, N'Office space', 3, 0, 0, 0, 589, NULL, 222, NULL, 2222)
INSERT [dbo].[Property] ([Id], [Name], [Description], [Floors], [PropertyType], [Rooms], [Parking], [Water], [Electricity], [Price], [AddressId], [Quadrature], [LocationId], [YearOfConstruction]) VALUES (2028, N'sssss', N'desccc

', 5, N'Office space', 4, 1, 0, 1, 223, NULL, 223, NULL, 2221)
INSERT [dbo].[Property] ([Id], [Name], [Description], [Floors], [PropertyType], [Rooms], [Parking], [Water], [Electricity], [Price], [AddressId], [Quadrature], [LocationId], [YearOfConstruction]) VALUES (3004, N'eee', N'fff', 2, N'Flat', 3, 0, 0, 0, 332, NULL, 222, NULL, 20183)
INSERT [dbo].[Property] ([Id], [Name], [Description], [Floors], [PropertyType], [Rooms], [Parking], [Water], [Electricity], [Price], [AddressId], [Quadrature], [LocationId], [YearOfConstruction]) VALUES (3005, N'sss', N'eee', 3, N'House', 3, 0, 0, 0, 333, NULL, 223, NULL, 2018)
INSERT [dbo].[Property] ([Id], [Name], [Description], [Floors], [PropertyType], [Rooms], [Parking], [Water], [Electricity], [Price], [AddressId], [Quadrature], [LocationId], [YearOfConstruction]) VALUES (3006, N'sss', N'eee', 3, N'House', 3, 0, 0, 0, 333, NULL, 223, NULL, 2018)
INSERT [dbo].[Property] ([Id], [Name], [Description], [Floors], [PropertyType], [Rooms], [Parking], [Water], [Electricity], [Price], [AddressId], [Quadrature], [LocationId], [YearOfConstruction]) VALUES (3007, N'sss', N'eee', 3, N'House', 3, 0, 0, 0, 333, NULL, 223, NULL, 2018)
INSERT [dbo].[Property] ([Id], [Name], [Description], [Floors], [PropertyType], [Rooms], [Parking], [Water], [Electricity], [Price], [AddressId], [Quadrature], [LocationId], [YearOfConstruction]) VALUES (3008, N'eee', N'eeee', 5, N'House', 3, 0, 0, 0, 221, NULL, 333, NULL, 2221)
INSERT [dbo].[Property] ([Id], [Name], [Description], [Floors], [PropertyType], [Rooms], [Parking], [Water], [Electricity], [Price], [AddressId], [Quadrature], [LocationId], [YearOfConstruction]) VALUES (3011, N'eee', N'eeee', 3, N'Office space', 3, 1, 0, 0, 33, NULL, 223, NULL, 2221)
INSERT [dbo].[Property] ([Id], [Name], [Description], [Floors], [PropertyType], [Rooms], [Parking], [Water], [Electricity], [Price], [AddressId], [Quadrature], [LocationId], [YearOfConstruction]) VALUES (3012, N'forma je sredjena', N'eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee', 4, N'Flat', 3, 0, 1, 0, 569000, 6011, 332, NULL, 2016)
INSERT [dbo].[Property] ([Id], [Name], [Description], [Floors], [PropertyType], [Rooms], [Parking], [Water], [Electricity], [Price], [AddressId], [Quadrature], [LocationId], [YearOfConstruction]) VALUES (3013, N'wrong zip', N'wrong zip desc', 3, N'House', 3, 0, 0, 1, 345600, 5011, 392, NULL, 2017)
INSERT [dbo].[Property] ([Id], [Name], [Description], [Floors], [PropertyType], [Rooms], [Parking], [Water], [Electricity], [Price], [AddressId], [Quadrature], [LocationId], [YearOfConstruction]) VALUES (3014, N'check address', N'check address description', 3, N'House', 3, 1, 1, 0, 124000, 5011, 312, NULL, 2014)
INSERT [dbo].[Property] ([Id], [Name], [Description], [Floors], [PropertyType], [Rooms], [Parking], [Water], [Electricity], [Price], [AddressId], [Quadrature], [LocationId], [YearOfConstruction]) VALUES (3015, N'prop name', N'desc prop name', 3, N'Office space', 5, 0, 1, 0, 201000, 6, 342, NULL, 2016)
INSERT [dbo].[Property] ([Id], [Name], [Description], [Floors], [PropertyType], [Rooms], [Parking], [Water], [Electricity], [Price], [AddressId], [Quadrature], [LocationId], [YearOfConstruction]) VALUES (4003, N'for sale property mapp', N'desc is short', 3, N'Office space', 5, 0, 0, 1, 230400, 6, 230, 1003, 2019)
INSERT [dbo].[Property] ([Id], [Name], [Description], [Floors], [PropertyType], [Rooms], [Parking], [Water], [Electricity], [Price], [AddressId], [Quadrature], [LocationId], [YearOfConstruction]) VALUES (4004, N'belamionix', N'prodajem bm', 2, N'Hall', 79, 0, 1, 1, 345678, 7012, 567, 1004, 2011)
INSERT [dbo].[Property] ([Id], [Name], [Description], [Floors], [PropertyType], [Rooms], [Parking], [Water], [Electricity], [Price], [AddressId], [Quadrature], [LocationId], [YearOfConstruction]) VALUES (5003, N'demand proeprty', N'demand descriptionis heree', 3, N'House', 3, 0, 1, 0, 332112, 8011, 223, 2003, 2011)
INSERT [dbo].[Property] ([Id], [Name], [Description], [Floors], [PropertyType], [Rooms], [Parking], [Water], [Electricity], [Price], [AddressId], [Quadrature], [LocationId], [YearOfConstruction]) VALUES (6003, N'date', N'aa', 2, N'House', 2, 1, 1, 0, 223, 9015, 22, 3003, 2112)
INSERT [dbo].[Property] ([Id], [Name], [Description], [Floors], [PropertyType], [Rooms], [Parking], [Water], [Electricity], [Price], [AddressId], [Quadrature], [LocationId], [YearOfConstruction]) VALUES (6004, N'date fix', N'eee', 22, N'House', 2, 0, 1, 0, 22333, 9016, 221, 3004, 22111)
INSERT [dbo].[Property] ([Id], [Name], [Description], [Floors], [PropertyType], [Rooms], [Parking], [Water], [Electricity], [Price], [AddressId], [Quadrature], [LocationId], [YearOfConstruction]) VALUES (7003, N'with emplyoee on adve', N'with employee on advertise added', 4, N'Flat', 5, 1, 1, 1, 134588, 10011, 223, 4003, 2001)
INSERT [dbo].[Property] ([Id], [Name], [Description], [Floors], [PropertyType], [Rooms], [Parking], [Water], [Electricity], [Price], [AddressId], [Quadrature], [LocationId], [YearOfConstruction]) VALUES (7004, N'property for admin', N'eeee', 2, N'Flat', 3, 0, 1, 0, 221112, 10011, 222, 4004, 2112)
INSERT [dbo].[Property] ([Id], [Name], [Description], [Floors], [PropertyType], [Rooms], [Parking], [Water], [Electricity], [Price], [AddressId], [Quadrature], [LocationId], [YearOfConstruction]) VALUES (8003, N'House Lukavac', N'House for rent', 2, N'House', 5, 1, 1, 1, 450, 11012, 125, 5003, 2007)
INSERT [dbo].[Property] ([Id], [Name], [Description], [Floors], [PropertyType], [Rooms], [Parking], [Water], [Electricity], [Price], [AddressId], [Quadrature], [LocationId], [YearOfConstruction]) VALUES (8004, N'House Gracanica', N'House for rent', 3, N'House', 6, 1, 1, 0, 542, 11013, 212, 5004, 2019)
INSERT [dbo].[Property] ([Id], [Name], [Description], [Floors], [PropertyType], [Rooms], [Parking], [Water], [Electricity], [Price], [AddressId], [Quadrature], [LocationId], [YearOfConstruction]) VALUES (8005, N'Flat Tuzla', N'Flat for rent', 1, N'Flat', 6, 0, 1, 1, 433, 11014, 98, 5005, 2011)
INSERT [dbo].[Property] ([Id], [Name], [Description], [Floors], [PropertyType], [Rooms], [Parking], [Water], [Electricity], [Price], [AddressId], [Quadrature], [LocationId], [YearOfConstruction]) VALUES (8006, N'Hall Lukavac', N'Hall for retn', 1, N'Hall', 5, 1, 1, 0, 1500, 11015, 670, 5006, 2020)
INSERT [dbo].[Property] ([Id], [Name], [Description], [Floors], [PropertyType], [Rooms], [Parking], [Water], [Electricity], [Price], [AddressId], [Quadrature], [LocationId], [YearOfConstruction]) VALUES (8007, N'House Modrac', N'House for sale', 3, N'House', 5, 1, 1, 1, 98200, 5010, 120, 5007, 2001)
INSERT [dbo].[Property] ([Id], [Name], [Description], [Floors], [PropertyType], [Rooms], [Parking], [Water], [Electricity], [Price], [AddressId], [Quadrature], [LocationId], [YearOfConstruction]) VALUES (8008, N'House Bistarac', N'House in Bistarac for sale', 3, N'House', 4, 1, 1, 1, 190299, 11016, 200, 5008, 2021)
INSERT [dbo].[Property] ([Id], [Name], [Description], [Floors], [PropertyType], [Rooms], [Parking], [Water], [Electricity], [Price], [AddressId], [Quadrature], [LocationId], [YearOfConstruction]) VALUES (8009, N'Office Lukavac', N'Office for sale ', 1, N'Office space', 2, 0, 1, 1, 129000, 11017, 35, 5009, 1999)
INSERT [dbo].[Property] ([Id], [Name], [Description], [Floors], [PropertyType], [Rooms], [Parking], [Water], [Electricity], [Price], [AddressId], [Quadrature], [LocationId], [YearOfConstruction]) VALUES (8010, N'Rustic Cottage', N'Cottage for Sale', 2, N'Cottage', 6, 1, 1, 1, 156000, 11018, 145, 5010, 2022)
SET IDENTITY_INSERT [dbo].[Property] OFF

SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([Id], [Name]) VALUES (1, N'User')
INSERT [dbo].[Role] ([Id], [Name]) VALUES (2, N'Employee')
INSERT [dbo].[Role] ([Id], [Name]) VALUES (3, N'Admin')
SET IDENTITY_INSERT [dbo].[Role] OFF

SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [FirstName], [Username], [PasswordHash], [PasswordSalt], [RoleId], [LastName], [Email], [Phone], [DateOfBirth], [DateRegistered], [Gender], [AddressId]) VALUES (20, N'admin', N'admin', N'dn8BeE/Z7i3MXzUYPPqtJ82iiPs=', N'JCXR+FochjHjf1Z+aP3A8A==', 3, N'admin', N'admin@gmail.com', N'387 60777882', CAST(N'2000-05-23T00:00:00.000' AS DateTime), CAST(N'2023-05-18T16:11:24.843' AS DateTime), N'Male', 1008)
INSERT [dbo].[Users] ([Id], [FirstName], [Username], [PasswordHash], [PasswordSalt], [RoleId], [LastName], [Email], [Phone], [DateOfBirth], [DateRegistered], [Gender], [AddressId]) VALUES (3027, N'Denis', N'denis.tokic', N'RB6jTvQAMXWF+eHFk+sDoSCLgF4=', N'istsOikUTcf0rHuA5P3wjA==', 2, N'Tokic', N'denis.t@gmail.com', N'387 56655000', CAST(N'2023-07-19T00:00:00.000' AS DateTime), CAST(N'2023-07-04T14:42:39.613' AS DateTime), N'Male', 6)
INSERT [dbo].[Users] ([Id], [FirstName], [Username], [PasswordHash], [PasswordSalt], [RoleId], [LastName], [Email], [Phone], [DateOfBirth], [DateRegistered], [Gender], [AddressId]) VALUES (7007, N'Niko', N'niko.belic', N'T02YnBgTAjL+Ya6v0OBxVu0p3Z4=', N'7W4g3IQwUot/E0+TXXIgmw==', 1, N'Belic', N'niko.belic@gmail.com', N'385 90002201', CAST(N'2023-08-29T00:00:00.000' AS DateTime), CAST(N'2023-08-31T11:58:10.453' AS DateTime), N'Male', 9013)
INSERT [dbo].[Users] ([Id], [FirstName], [Username], [PasswordHash], [PasswordSalt], [RoleId], [LastName], [Email], [Phone], [DateOfBirth], [DateRegistered], [Gender], [AddressId]) VALUES (7008, N'Joe ', N'joe .barbaro', N'mkEWKdk8g03bBfGISd3iNklUYB8=', N'FIRmjyEKrKlng/DXe0lMmQ==', 1, N'Barbaro', N'joe.barbaro@gmail.com', N'386 60258852', CAST(N'2023-08-02T00:00:00.000' AS DateTime), CAST(N'2023-08-31T13:25:31.253' AS DateTime), N'Male', 9014)
INSERT [dbo].[Users] ([Id], [FirstName], [Username], [PasswordHash], [PasswordSalt], [RoleId], [LastName], [Email], [Phone], [DateOfBirth], [DateRegistered], [Gender], [AddressId]) VALUES (8007, N'Damir', N'damir.morankic', N'TACnm5euk2x54xabkFXeAAaCHz0=', N'POT1BKTXeyaFE/8VnVijAQ==', 1, N'Morankic', N'dmorankic@outlook.com', N'387 60552225', CAST(N'2000-09-22T00:00:00.000' AS DateTime), CAST(N'2023-09-13T13:58:30.460' AS DateTime), N'Male', 11011)
SET IDENTITY_INSERT [dbo].[Users] OFF

SET IDENTITY_INSERT [dbo].[Advertise] ON 

INSERT [dbo].[Advertise] ([Id], [Status], [Type], [PropertyId], [UserId], [DateCreated], [EmployeeId]) VALUES (8005, N'approved', N'Rent', 8003, 8007, CAST(N'2023-09-13T14:01:57.377' AS DateTime), 3027)
INSERT [dbo].[Advertise] ([Id], [Status], [Type], [PropertyId], [UserId], [DateCreated], [EmployeeId]) VALUES (8006, N'approved', N'Rent', 8004, 8007, CAST(N'2023-09-13T14:53:33.803' AS DateTime), 3027)
INSERT [dbo].[Advertise] ([Id], [Status], [Type], [PropertyId], [UserId], [DateCreated], [EmployeeId]) VALUES (8009, N'pending', N'Sale', 8007, 8007, CAST(N'2023-09-13T14:59:26.713' AS DateTime), 3027)
INSERT [dbo].[Advertise] ([Id], [Status], [Type], [PropertyId], [UserId], [DateCreated], [EmployeeId]) VALUES (8010, N'approved', N'Sale', 8008, 8007, CAST(N'2023-09-13T15:00:58.553' AS DateTime), 3027)
INSERT [dbo].[Advertise] ([Id], [Status], [Type], [PropertyId], [UserId], [DateCreated], [EmployeeId]) VALUES (8012, N'approved', N'Sale', 8010, 8007, CAST(N'2023-09-13T15:05:00.610' AS DateTime), 20)
SET IDENTITY_INSERT [dbo].[Advertise] OFF

SET IDENTITY_INSERT [dbo].[Payment] ON 

INSERT [dbo].[Payment] ([Id], [Amount], [UserId], [TransactionDate], [AdvertiseId], [EmployeeId]) VALUES (2006, 90, 8007, CAST(N'2023-09-13T14:14:07.200' AS DateTime), 8005, 3027)
INSERT [dbo].[Payment] ([Id], [Amount], [UserId], [TransactionDate], [AdvertiseId], [EmployeeId]) VALUES (2007, 31200, 7007, CAST(N'2023-09-13T15:30:56.080' AS DateTime), 8012, 20)
INSERT [dbo].[Payment] ([Id], [Amount], [UserId], [TransactionDate], [AdvertiseId], [EmployeeId]) VALUES (2008, 90, 7007, CAST(N'2023-09-13T15:33:17.247' AS DateTime), 8005, 3027)
SET IDENTITY_INSERT [dbo].[Payment] OFF

SET IDENTITY_INSERT [dbo].[DemandAdvertise] ON 

INSERT [dbo].[DemandAdvertise] ([Id], [Status], [Type], [Description], [MinQuadrature], [MaxQuadrature], [Location], [Floors], [PropertyType], [Rooms], [Parking], [Water], [Electricity], [UserId], [DateCreated]) VALUES (2002, N'approved', N'Buy', N'I''m looking for office space in Tuzla', 23, 40, N'Tuzla', 1, N'Office space', 2, 0, 0, 0, 8007, CAST(N'2023-09-13T15:09:26.533' AS DateTime))
INSERT [dbo].[DemandAdvertise] ([Id], [Status], [Type], [Description], [MinQuadrature], [MaxQuadrature], [Location], [Floors], [PropertyType], [Rooms], [Parking], [Water], [Electricity], [UserId], [DateCreated]) VALUES (2003, N'approved', N'Rent', N'I''m looking for House in Lukavac', 80, 120, N'Lukavac', 2, N'House', 5, 1, 1, 1, 8007, CAST(N'2023-09-13T15:10:32.013' AS DateTime))
INSERT [dbo].[DemandAdvertise] ([Id], [Status], [Type], [Description], [MinQuadrature], [MaxQuadrature], [Location], [Floors], [PropertyType], [Rooms], [Parking], [Water], [Electricity], [UserId], [DateCreated]) VALUES (2004, N'pending', N'Buy', N'I need a cottage in Dobosnica', 60, 100, N'Dobosnica', 3, N'Cottage', 4, 0, 1, 1, 8007, CAST(N'2023-09-13T15:11:12.140' AS DateTime))
INSERT [dbo].[DemandAdvertise] ([Id], [Status], [Type], [Description], [MinQuadrature], [MaxQuadrature], [Location], [Floors], [PropertyType], [Rooms], [Parking], [Water], [Electricity], [UserId], [DateCreated]) VALUES (2005, N'pending', N'Buy', N'I need office in Tuzla', 40, 50, N'Tuzla', 1, N'Office space', 2, 1, 1, 0, 8007, CAST(N'2023-09-13T15:11:44.017' AS DateTime))
SET IDENTITY_INSERT [dbo].[DemandAdvertise] OFF

SET IDENTITY_INSERT [dbo].[SavedDemandAdvertise] ON 

INSERT [dbo].[SavedDemandAdvertise] ([Id], [DemandAdvertiseId], [UserId]) VALUES (1003, 2002, 8007)
INSERT [dbo].[SavedDemandAdvertise] ([Id], [DemandAdvertiseId], [UserId]) VALUES (1004, 2002, 7007)
SET IDENTITY_INSERT [dbo].[SavedDemandAdvertise] OFF

SET IDENTITY_INSERT [dbo].[DemandMessage] ON 

INSERT [dbo].[DemandMessage] ([Id], [Content], [SenderId], [DemandAdvertiseId], [IsEmployee], [Timestamp]) VALUES (1005, N'I have something like that', 7007, 2002, 0, CAST(N'2023-09-13T15:26:03.333' AS DateTime))
INSERT [dbo].[DemandMessage] ([Id], [Content], [SenderId], [DemandAdvertiseId], [IsEmployee], [Timestamp]) VALUES (1006, N'How much do you want for your property?', 7007, 2002, 1, CAST(N'2023-09-13T15:32:13.663' AS DateTime))
SET IDENTITY_INSERT [dbo].[DemandMessage] OFF

SET IDENTITY_INSERT [dbo].[Rating] ON 

INSERT [dbo].[Rating] ([Id], [PropertyId], [UserId], [Rating]) VALUES (4110, 4003, 3027, 9)
INSERT [dbo].[Rating] ([Id], [PropertyId], [UserId], [Rating]) VALUES (4111, 4003, 7007, 8)
INSERT [dbo].[Rating] ([Id], [PropertyId], [UserId], [Rating]) VALUES (4112, 4004, 7007, 8)
INSERT [dbo].[Rating] ([Id], [PropertyId], [UserId], [Rating]) VALUES (4113, 5003, 7007, 8)
INSERT [dbo].[Rating] ([Id], [PropertyId], [UserId], [Rating]) VALUES (4114, 6003, 7007, 8)
INSERT [dbo].[Rating] ([Id], [PropertyId], [UserId], [Rating]) VALUES (4115, 6004, 7007, 8)
INSERT [dbo].[Rating] ([Id], [PropertyId], [UserId], [Rating]) VALUES (4116, 7004, 7007, 8)
INSERT [dbo].[Rating] ([Id], [PropertyId], [UserId], [Rating]) VALUES (4117, 7003, 7007, 8)
INSERT [dbo].[Rating] ([Id], [PropertyId], [UserId], [Rating]) VALUES (4118, 7003, 7008, 8)
INSERT [dbo].[Rating] ([Id], [PropertyId], [UserId], [Rating]) VALUES (4119, 6003, 7008, 8)
INSERT [dbo].[Rating] ([Id], [PropertyId], [UserId], [Rating]) VALUES (4120, 6004, 7008, 8)
INSERT [dbo].[Rating] ([Id], [PropertyId], [UserId], [Rating]) VALUES (4121, 4004, 7008, 8)
INSERT [dbo].[Rating] ([Id], [PropertyId], [UserId], [Rating]) VALUES (4122, 5003, 7008, 8)
INSERT [dbo].[Rating] ([Id], [PropertyId], [UserId], [Rating]) VALUES (4123, 4003, 7008, 8)
INSERT [dbo].[Rating] ([Id], [PropertyId], [UserId], [Rating]) VALUES (4124, 8003, 8007, 5)
INSERT [dbo].[Rating] ([Id], [PropertyId], [UserId], [Rating]) VALUES (4125, 8010, 7007, 10)
SET IDENTITY_INSERT [dbo].[Rating] OFF

SET IDENTITY_INSERT [dbo].[SavedAdvertise] ON 

INSERT [dbo].[SavedAdvertise] ([Id], [AdvertiseId], [UserId]) VALUES (13004, 8006, 8007)
SET IDENTITY_INSERT [dbo].[SavedAdvertise] OFF

SET IDENTITY_INSERT [dbo].[Message] ON 

INSERT [dbo].[Message] ([Id], [Content], [SenderId], [Timestamp], [AdvertiseId], [IsEmployee]) VALUES (8025, N'What is the lowest price?', 8007, CAST(N'2023-09-13T14:34:44.150' AS DateTime), 8005, 0)
INSERT [dbo].[Message] ([Id], [Content], [SenderId], [Timestamp], [AdvertiseId], [IsEmployee]) VALUES (8026, N'Lowest I can go is 430', 8007, CAST(N'2023-09-13T14:37:57.450' AS DateTime), 8005, 0)
INSERT [dbo].[Message] ([Id], [Content], [SenderId], [Timestamp], [AdvertiseId], [IsEmployee]) VALUES (8027, N'Why did you say what is the lowest price?', 8007, CAST(N'2023-09-13T14:38:33.657' AS DateTime), 8005, 1)
SET IDENTITY_INSERT [dbo].[Message] OFF

SET IDENTITY_INSERT [dbo].[Image] ON 

INSERT [dbo].[Image] ([Id], [ImageUrl], [PropertyId]) VALUES (4, N'images/0ee6bb59-b92f-4b28-95ae-4d4b0064eb42.jpg', NULL)
INSERT [dbo].[Image] ([Id], [ImageUrl], [PropertyId]) VALUES (5, N'images/ac756816-4f0a-4b1c-82cc-e888a690f613.jpg', NULL)
INSERT [dbo].[Image] ([Id], [ImageUrl], [PropertyId]) VALUES (6, N'images/43368cea-e1e8-4527-adc8-0ad8844b7d29.jpg', NULL)
INSERT [dbo].[Image] ([Id], [ImageUrl], [PropertyId]) VALUES (7, N'images/45c3c93b-af31-40c6-8bc1-457cbd86aa07.jpg', NULL)
INSERT [dbo].[Image] ([Id], [ImageUrl], [PropertyId]) VALUES (8, N'images/fb40d7dd-a24c-464e-8dbc-a816d3a87e3c.jpg', NULL)
INSERT [dbo].[Image] ([Id], [ImageUrl], [PropertyId]) VALUES (9, N'images/2b7eed24-ca59-4e67-b04a-08dafceb4f64.jpg', NULL)
INSERT [dbo].[Image] ([Id], [ImageUrl], [PropertyId]) VALUES (10, N'images/f58d44f2-b105-4008-96da-c47142530b7a.jpg', NULL)
INSERT [dbo].[Image] ([Id], [ImageUrl], [PropertyId]) VALUES (11, N'images/8b7718df-84ca-43b9-bbad-173520d23ba7.jpg', NULL)
INSERT [dbo].[Image] ([Id], [ImageUrl], [PropertyId]) VALUES (12, N'images/c308e43f-c29c-454b-8df4-067d9118a0ca.jpg', NULL)
INSERT [dbo].[Image] ([Id], [ImageUrl], [PropertyId]) VALUES (13, N'images/d292f21c-d26f-47c9-bc09-153136660794.jpg', NULL)
INSERT [dbo].[Image] ([Id], [ImageUrl], [PropertyId]) VALUES (14, N'images/dc6ad9c3-d998-481f-b4a0-4065a7cc09f5.jpg', NULL)
INSERT [dbo].[Image] ([Id], [ImageUrl], [PropertyId]) VALUES (15, N'images/becabd21-77ab-48b2-bb0c-994407cecb29.jpg', NULL)
INSERT [dbo].[Image] ([Id], [ImageUrl], [PropertyId]) VALUES (16, N'images/723ffafa-3817-4db7-87c2-ae4610073707.jpg', NULL)
INSERT [dbo].[Image] ([Id], [ImageUrl], [PropertyId]) VALUES (17, N'images/e4dafbf1-eb80-41b8-b92e-f0acdeef3d22.jpg', NULL)
INSERT [dbo].[Image] ([Id], [ImageUrl], [PropertyId]) VALUES (18, N'images/515b7e32-cfe8-4a98-8782-34194c1f6437.jpg', NULL)
INSERT [dbo].[Image] ([Id], [ImageUrl], [PropertyId]) VALUES (19, N'images/d738f494-ddfa-432a-8ce6-d542c903da12.jpg', NULL)
INSERT [dbo].[Image] ([Id], [ImageUrl], [PropertyId]) VALUES (20, N'images/b66f37f0-f588-4baf-b376-a27d434f48eb.jpg', NULL)
INSERT [dbo].[Image] ([Id], [ImageUrl], [PropertyId]) VALUES (21, N'images/e70cb99f-29ff-408d-9475-326e040676a5.jpg', NULL)
INSERT [dbo].[Image] ([Id], [ImageUrl], [PropertyId]) VALUES (22, N'images/6d710647-317a-4f98-852c-d3da100fe78f.jpg', NULL)
INSERT [dbo].[Image] ([Id], [ImageUrl], [PropertyId]) VALUES (23, N'images/9af9f79e-337c-4288-8065-8c97a8f25366.jpg', NULL)
INSERT [dbo].[Image] ([Id], [ImageUrl], [PropertyId]) VALUES (24, N'images/600e190d-f671-4425-8e69-82b61e16eecb.jpg', NULL)
INSERT [dbo].[Image] ([Id], [ImageUrl], [PropertyId]) VALUES (25, N'images/f27a3ce1-62fb-44f5-97db-71c101eded2e.jpg', NULL)
INSERT [dbo].[Image] ([Id], [ImageUrl], [PropertyId]) VALUES (1013, N'images/99a66e18-a122-4ab4-a461-f8a5052a29eb.jpg', NULL)
INSERT [dbo].[Image] ([Id], [ImageUrl], [PropertyId]) VALUES (1015, N'images/36020acf-db07-4947-ae31-432faa64f223.jpg', NULL)
INSERT [dbo].[Image] ([Id], [ImageUrl], [PropertyId]) VALUES (1016, N'images/187c18fd-42cd-4167-8069-33d4f9098c72.jpg', NULL)
INSERT [dbo].[Image] ([Id], [ImageUrl], [PropertyId]) VALUES (1017, N'images/310bb10b-465e-4b2c-b429-a9923fbd7da5.jpg', NULL)
INSERT [dbo].[Image] ([Id], [ImageUrl], [PropertyId]) VALUES (1018, N'images/c181872b-d1c0-4a10-b52e-fa467c1a65cc.jpg', NULL)
INSERT [dbo].[Image] ([Id], [ImageUrl], [PropertyId]) VALUES (1019, N'images/bf6fcffb-2203-4a94-a833-92dcd637a70b.jpg', 2009)
INSERT [dbo].[Image] ([Id], [ImageUrl], [PropertyId]) VALUES (1020, N'images/5fe49090-0bbc-4e5b-a040-ae082d8f8c42.jpg', 2009)
INSERT [dbo].[Image] ([Id], [ImageUrl], [PropertyId]) VALUES (1021, N'images/394a2ba1-c260-4cd3-9102-66fcb01d4053.jpg', 2010)
INSERT [dbo].[Image] ([Id], [ImageUrl], [PropertyId]) VALUES (1022, N'images/20935f28-f275-470c-9b1c-eca9c611b687.jpg', 2010)
INSERT [dbo].[Image] ([Id], [ImageUrl], [PropertyId]) VALUES (1023, N'images/d440ad15-b5e2-4a29-8c72-168d5fdbdef2.jpg', 2010)
INSERT [dbo].[Image] ([Id], [ImageUrl], [PropertyId]) VALUES (1024, N'images/5f794894-9e2c-4c75-a2b0-5e9d009c4640.jpg', 2010)
INSERT [dbo].[Image] ([Id], [ImageUrl], [PropertyId]) VALUES (1025, N'images/a97e9c4d-6165-4599-88ca-3d2f21a60f42.jpg', 2010)
INSERT [dbo].[Image] ([Id], [ImageUrl], [PropertyId]) VALUES (1026, N'images/278f7aa1-4631-4b94-98d3-fc359b9394c0.jpg', 2013)
INSERT [dbo].[Image] ([Id], [ImageUrl], [PropertyId]) VALUES (1027, N'images/cccd311a-5a1d-4810-9069-4bd5802560e7.jpg', 2013)
INSERT [dbo].[Image] ([Id], [ImageUrl], [PropertyId]) VALUES (1028, N'images/b79fc5eb-fec4-4d6d-bc92-c55b6b0f268f.jpg', 2013)
INSERT [dbo].[Image] ([Id], [ImageUrl], [PropertyId]) VALUES (1029, N'images/3cfc55ed-f38a-4711-8bb2-5720a414904e.jpg', 2016)
INSERT [dbo].[Image] ([Id], [ImageUrl], [PropertyId]) VALUES (1030, N'images/f31462c7-579c-408c-8331-87a70665a84a.jpg', 2016)
INSERT [dbo].[Image] ([Id], [ImageUrl], [PropertyId]) VALUES (1031, N'images/5021cfff-1a3c-4f21-9c30-738d3c106cf5.jpg', 2016)
INSERT [dbo].[Image] ([Id], [ImageUrl], [PropertyId]) VALUES (1032, N'images/cb218719-3783-47b8-b343-3416ec75e28a.jpg', 2018)
INSERT [dbo].[Image] ([Id], [ImageUrl], [PropertyId]) VALUES (1033, N'images/e03b9d67-8874-4408-b699-18706803dce0.jpg', 2018)
INSERT [dbo].[Image] ([Id], [ImageUrl], [PropertyId]) VALUES (1034, N'images/40cb83b7-0f5a-4784-bcc5-9f147cd46e93.jpg', 2018)
INSERT [dbo].[Image] ([Id], [ImageUrl], [PropertyId]) VALUES (2013, N'images/d6fbef68-5a99-4771-8b2f-bbc1fcd6e1f5.jpg', 3012)
INSERT [dbo].[Image] ([Id], [ImageUrl], [PropertyId]) VALUES (2014, N'images/dfa184f5-716a-47a6-a803-846e42d4b5ca.jpg', 3012)
INSERT [dbo].[Image] ([Id], [ImageUrl], [PropertyId]) VALUES (2015, N'images/d63af04e-346b-4170-84c4-e4cd2c42e74a.jpg', 3012)
INSERT [dbo].[Image] ([Id], [ImageUrl], [PropertyId]) VALUES (2016, N'images/fe620a9b-8aef-4b6f-be22-c191dbbef23a.jpg', 3012)
INSERT [dbo].[Image] ([Id], [ImageUrl], [PropertyId]) VALUES (2017, N'images/4378f5b1-ba63-4557-bdad-a8e211d25e99.jpg', 3012)
INSERT [dbo].[Image] ([Id], [ImageUrl], [PropertyId]) VALUES (2018, N'images/df9ec392-5b4d-4f79-9d77-3e24a21b69f3.jpg', 3012)
INSERT [dbo].[Image] ([Id], [ImageUrl], [PropertyId]) VALUES (2019, N'images/f0207068-68b7-425e-a56f-50cf9a3eb591.jpg', 3012)
INSERT [dbo].[Image] ([Id], [ImageUrl], [PropertyId]) VALUES (2020, N'images/df61c33e-f2c8-4dea-b2e7-6b99cd2d88c1.jpg', 3012)
INSERT [dbo].[Image] ([Id], [ImageUrl], [PropertyId]) VALUES (2021, N'images/85e56ae5-9e67-4811-a979-3acf0d3d5b57.jpg', 3012)
INSERT [dbo].[Image] ([Id], [ImageUrl], [PropertyId]) VALUES (2022, N'images/87e7408c-f6fc-4262-a258-a0ebdb6dcd84.jpg', 3012)
INSERT [dbo].[Image] ([Id], [ImageUrl], [PropertyId]) VALUES (2023, N'images/3c2d1cb5-78f6-4fd3-9438-efeffeb3ed5c.jpg', 3012)
INSERT [dbo].[Image] ([Id], [ImageUrl], [PropertyId]) VALUES (2024, N'images/3f85298b-cffd-4734-bfbb-371370ddff93.jpg', 3012)
INSERT [dbo].[Image] ([Id], [ImageUrl], [PropertyId]) VALUES (2025, N'images/37d68d40-74e8-4a7d-aa2b-8174928000c3.jpg', 3012)
INSERT [dbo].[Image] ([Id], [ImageUrl], [PropertyId]) VALUES (2026, N'images/b61db956-ef89-4ec5-b778-8f612197a97b.jpg', 3012)
INSERT [dbo].[Image] ([Id], [ImageUrl], [PropertyId]) VALUES (2027, N'images/c12184e4-9a5d-4ed9-908f-bf6ede0c662d.jpg', 3013)
INSERT [dbo].[Image] ([Id], [ImageUrl], [PropertyId]) VALUES (2028, N'images/7e70c5a7-0bac-43b5-8d93-e1a178a5bb52.jpg', 3014)
INSERT [dbo].[Image] ([Id], [ImageUrl], [PropertyId]) VALUES (2029, N'images/d43af071-e29b-4132-a22d-57f397f6d02c.jpg', 3015)
INSERT [dbo].[Image] ([Id], [ImageUrl], [PropertyId]) VALUES (2030, N'images/fed82313-49c5-4d22-b951-250c624dacd8.jpg', 3015)
INSERT [dbo].[Image] ([Id], [ImageUrl], [PropertyId]) VALUES (2031, N'images/9f36d0d1-17f1-4894-ac5e-4f236c698fc5.jpg', 3015)
INSERT [dbo].[Image] ([Id], [ImageUrl], [PropertyId]) VALUES (3010, N'images/12926267-a753-458e-8b8f-623e81314b9f.jpg', 4003)
INSERT [dbo].[Image] ([Id], [ImageUrl], [PropertyId]) VALUES (3011, N'images/12b78689-bff9-4901-ae48-b6e6b6237f33.jpg', 4004)
INSERT [dbo].[Image] ([Id], [ImageUrl], [PropertyId]) VALUES (4010, N'images/12980db7-f246-410a-8b06-c6e325315a12.jpg', 5003)
INSERT [dbo].[Image] ([Id], [ImageUrl], [PropertyId]) VALUES (5010, N'images/33b7ecf6-bc39-4ff3-b303-f3b766dc1b5e.jpg', 6003)
INSERT [dbo].[Image] ([Id], [ImageUrl], [PropertyId]) VALUES (6010, N'images/72313221-9b0c-4686-a577-186ef65955f6.jpg', 7003)
INSERT [dbo].[Image] ([Id], [ImageUrl], [PropertyId]) VALUES (6011, N'images/ce544ada-49f6-42dd-858d-f093417b8847.jpg', 7003)
INSERT [dbo].[Image] ([Id], [ImageUrl], [PropertyId]) VALUES (7010, N'images/1133cc59-9142-4cc5-beb3-94a82cce45fa.jpg', 8003)
INSERT [dbo].[Image] ([Id], [ImageUrl], [PropertyId]) VALUES (7011, N'images/fbc1eed6-5a74-4a80-8f95-3e92cb8346af.jpg', 8003)
INSERT [dbo].[Image] ([Id], [ImageUrl], [PropertyId]) VALUES (7012, N'images/708e7502-01c2-4909-b6d8-e3f000d33566.jpg', 8003)
INSERT [dbo].[Image] ([Id], [ImageUrl], [PropertyId]) VALUES (7013, N'images/1fb8d119-6568-4e4e-b8a2-07fa7a19c5db.jpg', 8003)
INSERT [dbo].[Image] ([Id], [ImageUrl], [PropertyId]) VALUES (7014, N'images/2f24cd19-30da-4f4a-9b65-8c0b2a118155.jpg', 8003)
INSERT [dbo].[Image] ([Id], [ImageUrl], [PropertyId]) VALUES (7015, N'images/777cdecd-7113-4b51-b7c2-4efe3a0aade5.jpg', 8003)
INSERT [dbo].[Image] ([Id], [ImageUrl], [PropertyId]) VALUES (7016, N'images/519f784a-3dbc-42ff-a6fa-7d29c6113aa6.jpg', NULL)
INSERT [dbo].[Image] ([Id], [ImageUrl], [PropertyId]) VALUES (7017, N'images/52866bf2-eea4-470e-91f5-8166e354445c.jpg', NULL)
INSERT [dbo].[Image] ([Id], [ImageUrl], [PropertyId]) VALUES (7018, N'images/1dba3001-2414-472f-ba50-c1d9b5370faf.jpg', 8004)
INSERT [dbo].[Image] ([Id], [ImageUrl], [PropertyId]) VALUES (7019, N'images/2877663a-e62f-4da3-b6c7-37466759032d.jpg', 8004)
INSERT [dbo].[Image] ([Id], [ImageUrl], [PropertyId]) VALUES (7020, N'images/23f78219-f93d-4b68-bf81-6336d25f7391.jpg', 8005)
INSERT [dbo].[Image] ([Id], [ImageUrl], [PropertyId]) VALUES (7021, N'images/d83596f5-71b1-4d12-b197-378c9c51c6bd.jpg', 8005)
INSERT [dbo].[Image] ([Id], [ImageUrl], [PropertyId]) VALUES (7022, N'images/a2bda70a-435f-42d8-9d7f-c2fc469daf81.jpg', 8006)
INSERT [dbo].[Image] ([Id], [ImageUrl], [PropertyId]) VALUES (7023, N'images/0ffc57bd-636e-47fb-b994-393f37bdd6ee.jpg', 8007)
INSERT [dbo].[Image] ([Id], [ImageUrl], [PropertyId]) VALUES (7024, N'images/e3733a22-f33c-4d34-85a6-73635c9c54d9.jpg', 8008)
INSERT [dbo].[Image] ([Id], [ImageUrl], [PropertyId]) VALUES (7025, N'images/2cbc0b20-d2dd-489a-a4ad-7c1ca1468ad7.jpg', 8009)
INSERT [dbo].[Image] ([Id], [ImageUrl], [PropertyId]) VALUES (7026, N'images/8ffde515-753a-488b-b3a3-0aface421daa.jpg', 8010)
INSERT [dbo].[Image] ([Id], [ImageUrl], [PropertyId]) VALUES (7027, N'images/9a0793ce-4e7c-4235-8ca4-df882078a1cc.jpg', 8010)
SET IDENTITY_INSERT [dbo].[Image] OFF

