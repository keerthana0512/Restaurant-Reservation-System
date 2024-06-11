CREATE DATABASE restaurantreservationsystem;
use restaurantreservationsystem;

CREATE TABLE Restaurant (
    restaurant_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    location VARCHAR(100),
    cuisine_type VARCHAR(50),
    contact_number VARCHAR(15)
);
desc restaurant;

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    PhoneNumber VARCHAR(15)
);
desc customers;

CREATE TABLE Tables (
    table_id INT PRIMARY KEY AUTO_INCREMENT,
    restaurant_id INT,
    table_number INT,
    seating_capacity INT,
    status VARCHAR(40),
    FOREIGN KEY (restaurant_id) REFERENCES Restaurant(restaurant_id)
);
desc tables;

CREATE TABLE Reservation (
    reservation_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    restaurant_id INT,
    table_id INT,
	ReservationDate DATE,
    ReservationTime TIME,
    NumberOfGuests INT,
    Status VARCHAR(20),
    SpecialRequests VARCHAR(255),
    FOREIGN KEY (customer_id) REFERENCES Customers(customerid),
    FOREIGN KEY (restaurant_id) REFERENCES Restaurant(restaurant_id),
    FOREIGN KEY (table_id) REFERENCES Tables(table_id)
);
desc reservation;

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY AUTO_INCREMENT,
    ReservationID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10, 2),
    OrderStatus VARCHAR(20),
    PaymentMethod VARCHAR(20),
    FOREIGN KEY (ReservationID) REFERENCES Reservation(Reservation_id)
);
desc orders;

CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY AUTO_INCREMENT,
    OrderID INT,
    PaymentDate DATE,
    Amount DECIMAL(10, 2),
    PaymentType VARCHAR(20),
    PaymentStatus VARCHAR(20),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);
desc payments;

CREATE TABLE Review (
    review_id INT PRIMARY KEY AUTO_INCREMENT,
    restaurant_id INT,
    customer_id INT,
    rating INT,
    Comment TEXT,
    FOREIGN KEY (restaurant_id) REFERENCES Restaurant(restaurant_id),
    FOREIGN KEY (customer_id) REFERENCES Customers(customerid)
);
desc review;
show tables;

-- restaurant
INSERT INTO restaurant (name,location,cuisine_type,contact_number)
VALUES ('The Flying Elephant','Vasanth Nagar','Multi-Cuisine',9313218781),
('Karavalli','Ashok Nagar','Coastal',8865890469),
('The Tao Terraces','MG Road','Pan-Asian',7658266413),
('Ebony','MG Road','Indian',8759853505),
('Windmills Craftworks','Whitefield','Multi-Cuisine',8619752883),
('Mavalli Tiffin Rooms (MTR),','Lalbagh Road','South Indian',7542558646),
('High Ultra Lounge','MG Road','Asian Fusion',8588159305),
('Smoke House Deli','Indiranagar','European',8786654189),
('Truffles','Kormangala','American',7292171258),
('Toscano','UB City','Italian',8453654930),
('Punjab Grill','Whitefield','North Indian',8313537710),
('Szechuan Dragon','Malleswaram','Chinese',8180373224),
('Nagarjuna Restaurant','Shanthala Nagar','Andhra',9256707324),
('Kebabs & Kurries','Race Course Road','North Indian',7382889900),
('Absolute Barbecue','Marathahalli','BBQ',8178239511),
('Barbeque Nation','Shanthala Nagar','BBQ',9917142068),
('Rajdhani Thali Restaurant','Jayanagar','Rajasthani',7710076441),
('Hard Rock Cafe','Shanthala Nagar','American',9374414857),
('Vidyarthi Bhavan','Basavanagudi','South Indian',9718513620),
('Empire Restaurant','Church Street','Indian',9703059995),
('Dum Pukht Jolly Nabobs','Shanthala Nagar','Awadhi',9348554539),
('Olive Beach','Ashok Nagar','Mediterranean',7997484805),
('Sanadige','Race Course Road','Coastal',7690519302),
('Saffron','Race Course Road','Indian',9779628399),
('Banana Leaf','Indiranagar','South Indian',9706628139),
('Café Noir','Shanthala Nagar','French',8550082402),
('KFC','Koramangala','Fast Food',8585222800),
('Chutney Chang','Shanthala Nagar','Multi-Cuisine',9592384476),
('Yauatcha','MG Road','Dim Sum',9184683430),
('Le Cirque Signature','Kodihalli','European',7859633666),
('The Fatty Bao','Indiranagar','Asian Fusion',9539962983),
('Corner House Japanese','Ashok Nagar','Korean',9314932553),
('Mainland China','Church Street','Chinese',7341639350),
('Meghana Foods','Jayanagar','Andhra',9696851021),
('Nandhini Restaurant','Jayanagar','Indian',7290496734),
('Matteo Coffea','Church Street','Cafe',8125864221),
("Brahmin's Coffee Bar",'Basavanagudi','South Indian',9656952521),
('Nasi and Mee','Indiranagar','Malaysian',9181917051),
('MTR 1924','Shanthala Nagar','South Indian',8990375756),
('Pecos','Shanthala Nagar','Indonesian',8223913014),
('The Permit Room','Shanthala Nagar','African',8200407091),
('Arbor Brewing Company','Shanthala Nagar','Brewery',9256027224),
('Truffles Ice & Spice','Shanthala Nagar','Japanese',7354995189),
('Ebony Fine-Dine & Café','Koramangala','Multi-Cuisine',9248713170),
('Malabar Veg & Non-Veg','Jayamahal Road','Kerala',8804424351),
('Anand Sweets & Savouries','Jayanagar','Caribbean',7976149646),
('Tandoor','MG Road','Indian',9633003874),
("Naga's",'Koramangala','North Indian',7906764453),
('Toit','Indiranagar','Brewery',8476318521),
('Savory Bites','Koramangala','Indian',8538436348),
('Spice Junction','Indiranagar','Chinese',9111671460),
('Tandoori Flames','MG Road','North Indian',9776324981),
('Pasta Paradise','Jayanagar','Italian',7322558979),
('Biryani House','Malleshwaram','Hyderabadi',8519675772),
('Sushi Shack','Koramangala','Japanese',9315417509),
('Mexicana Grill','Whitefield','Mexican',8618329416),
('Thai Delight','JP Nagar','Thai',8243358859),
('BBQ Nation','Bannerghatta Road','Barbecue',8303617341),
('Pizzeria Uno','Brigade Road','American',8185799581),
('Dimsum Palace','Electronic City','Chinese',9514288289),
('Falafel Express','Marathahalli','Middle Eastern',8980971007),
('Burger Haven','HSR Layout','Fast Food',7502180086),
('Steakhouse 101','Koramangala','Steakhouse',7459122556),
('Vegetarian Bliss','Malleshwaram','Vegetarian',8808865780),
('Seafood Harbor','Indiranagar','Seafood',9188047787),
('Ramen House','MG Road','Japanese',7541886716),
('Curry Bowl','Jayanagar','Indian',8191496966),
('Kebab Kingdom','Whitefield','Mughlai',8785858187),
('Noodle Nation','BTM Layout','Chinese',8913218776),
('Pizza Palace','Koramangala','Italian',8683568630),
('Tandoori Twist','Rajajinagar','North Indian',8348201964),
('Burrito Barn','Marathahalli','Mexican',7363959172),
('Sushi Central','Brigade Road','Japanese',7392938442),
('Shawarma Stop','JP Nagar','Middle Eastern',7373720952),
('Wok Wonders','Electronic City','Chinese',7510143258),
('Grill House','Bannerghatta Road','Barbecue',9662487983),
('Pasta Perfect','HSR Layout','Italian',7954593519),
('Salad Spot','Malleshwaram','fusion',9667352573),
('Rasoi 2.0','Indiranagar','Chinese',8429899369),
('Brik Oven','MG Road','Middle Eastern',7332763502),
('1947 Restaurant - India','Jayanagar','Fast Food',7475402115),
('Yo Foodies','Whitefield','North Indian',9342698153),
('Eiffel Green Resort','Koramangala','Indian',8868775616),
('Drunkling Sizzlers & Pub','Rajajinagar','Hyderabadi',7709040460),
('Skyblue Orchids','Marathahalli','Mexican',9579230473),
('Hyderabadi Meals','Brigade Road','Japanese',9899543234),
('Lutff','JP Nagar','Mughlai',9598460411),
('Punjabi Masala','Electronic City','Italian',7122684149),
('Kerala Food Recipes','Bannerghatta Road','fusion',9265929944),
('Soupermanzkitchen','BTM Layout','Chinese',7394675360),
('Momoxotic','Koramangala','Barbecue',8929697948),
('Pin Me Down','Rajajinagar','Italian',7558513779),
('Dil Se Dilli','Malleshwaram','fusion',7421107825),
('Hunger Joint','Indiranagar','Chinese',7112544418),
('Anamala Homestays','MG Road','Middle Eastern',8659867419),
('Dambal&#39;s Veg','Jayanagar','Fast Food',7393562212),
('Mexican Burrito','Whitefield','North Indian',9418607431),
('The Purple Pan (a Unit Of Right Spin Ventures),','Koramangala','Indian',8896958858),
('Hunger Bugs','Rajajinagar','Hyderabadi',8524136305),
('Chaat Corner','Commercial Street','North Indian',7923489680);

SELECT * from restaurant;
SELECT count(*) from restaurant;

-- customers
INSERT INTO customers (FirstName, LastName, Email, PhoneNumber)
VALUES ("Amara","Russo","AmaraRusso@gmail.com",8869414286),
("Jamie","Suarez","JamieSuarez@aol.com",9022110397),
("Jimena","Butler","JimenaButler@yahoo.com",9261557810),
("Ryder","Wells","RyderWells@outlook.com",7318255276),
("Cecilia","Barry","CeciliaBarry@gmail.com",9848037174),
("Emery","Castro","EmeryCastro@aol.com",9062413080),
("Eloise","Glass","EloiseGlass@yahoo.com",9416720446),
("Allan","Hayes","AllanHayes@gmail.com",9354843419),
("Iris","Schwartz","IrisSchwartz@example.com",7122656912),
("Edwin","Collins","EdwinCollins@gmail.com",7961285869),
("Kinsley","Ramos","KinsleyRamos@yahoo.com",8901659399),
("Angel","Guevara","AngelGuevara@aol.com",9813513064),
("Teresa","Carrillo","TeresaCarrillo@example.com",8544358132),
("Wade","Greene","WadeGreene@aol.com",8126227359),
("Selena","Santana","SelenaSantana@example.com",9707065878),
("Mohamed","Coffey","MohamedCoffey@outlook.com",9825992205),
("Paola","Nicholson","PaolaNicholson@yahoo.com",9216175010),
("Rodrigo","Meyers","RodrigoMeyers@outlook.com",8208885483),
("Leyla","McClain","LeylaMcClain@outlook.com",8123634418),
("Mitchell","Bauer","MitchellBauer@outlook.com",9007003443),
("Haley","Stephenson","HaleyStephenson@yahoo.com",9397773675),
("Joe","Sweeney","JoeSweeney@aol.com",9316508473),
("Yara","Wang","YaraWang@aol.com",7667545467),
("Cohen","Morton","CohenMorton@gmail.com",7846905024),
("Mallory","Malone","MalloryMalone@outlook.com",9248009918),
("Ruben","Horton","RubenHorton@example.com",7839279271),
("Aitana","McGuire","AitanaMcGuire@example.com",8040458242),
("Casey","Mills","CaseyMills@aol.com",9267249405),
("June","Phan","JunePhan@aol.com",9882707738),
("Maison","Welch","MaisonWelch@gmail.com",7943218457),
("Amira","Anthony","AmiraAnthony@gmail.com",8828717195),
("Shiloh","Best","ShilohBest@yahoo.com",7521811534),
("Lexie","Goodman","LexieGoodman@aol.com",7250568455),
("Philip","Marshall","PhilipMarshall@outlook.com",7104909076),
("Adalyn","Hendricks","AdalynHendricks@example.com",9285808028),
("Dash","Murphy","DashMurphy@outlook.com",7270906844),
("Bella","Lawson","BellaLawson@example.com",8037799993),
("Lane","Cole","LaneCole@yahoo.com",8255317418),
("Margaret","Rose","MargaretRose@gmail.com",9199165410),
("Hayden","Potts","HaydenPotts@gmail.com",9847043307),
("Ellison","Castaneda","EllisonCastaneda@outlook.com",9513950530),
("Collin","Howell","CollinHowell@example.com",7790021017),
("Mckenna","Huber","MckennaHuber@example.com",8969762348),
("Mac","Humphrey","MacHumphrey@example.com",9979165313),
("Journi","Stanley","JourniStanley@aol.com",8292972145),
("Manuel","Delgado","ManuelDelgado@aol.com",9744377186),
("Alani","Proctor","AlaniProctor@outlook.com",8195857952),
("Vance","Saunders","VanceSaunders@yahoo.com",8123817997),
("Meadow","Sutton","MeadowSutton@yahoo.com",7204943168),
("Warren","Everett","WarrenEverett@gmail.com",9478683808),
("Noah","Jacobson","NoahJacobson@outlook.com",7561601848),
("Legacy","Torres","LegacyTorres@yahoo.com",9348273978),
("Violet","Tapia","VioletTapia@gmail.com",8515369932),
("Samir","Klein","SamirKlein@gmail.com",9344612107),
("Elianna","Terrell","EliannaTerrell@gmail.com",7173234632),
("Jaxen","Benjamin","JaxenBenjamin@aol.com",9345151221),
("Jianna","Guevara","JiannaGuevara@gmail.com",9067187837),
("Tommy","Dejesus","TommyDejesus@example.com",9834852607),
("Julissa","Savage","JulissaSavage@outlook.com",7663085873),
("Keaton","Parker","KeatonParker@outlook.com",7031622588),
("Aubrey","Clements","AubreyClements@gmail.com",9319149463),
("Fisher","Fernandez","FisherFernandez@gmail.com",7598622165),
("Amara","Glenn","AmaraGlenn@gmail.com",9974173798),
("Zaid","Page","ZaidPage@outlook.com",7497146968),
("Cataleya","Ward","CataleyaWard@example.com",9367257354),
("Jameson","Welch","JamesonWelch@gmail.com",8746267199),
("Amira","Ellison","AmiraEllison@gmail.com",9570936984),
("Kye","Phillips","KyePhillips@outlook.com",7980717546),
("Naomi","Green","NaomiGreen@example.com",8225485440),
("Anthony","Graham","AnthonyGraham@outlook.com",8595512794),
("Alaia","Hogan","AlaiaHogan@aol.com",7626012309),
("Sonny","Taylor","SonnyTaylor@example.com",8345211566),
("Sofia","Bruce","SofiaBruce@aol.com",8367473130),
("Uriah","Page","UriahPage@outlook.com",7977252753),
("Cataleya","Perez","CataleyaPerez@gmail.com",7416351958),
("Owen","Dickson","OwenDickson@yahoo.com",8006585447),
("Emmalynn","Quintero","EmmalynnQuintero@yahoo.com",8454913458),
("Thatcher","Gibbs","ThatcherGibbs@outlook.com",9566084631),
("Carter","Sellers","CarterSellers@yahoo.com",9672744061),
("Madden","Duran","MaddenDuran@aol.com",8037096377),
("Willa","Cameron","WillaCameron@outlook.com",9167329794),
("Rayan","Kelly","RayanKelly@outlook.com",7936174604),
("Ruby","Contreras","RubyContreras@gmail.com",7448408595),
("Emilio","Faulkner","EmilioFaulkner@aol.com",9814660140),
("Ansley","Howard","AnsleyHoward@yahoo.com",8038758662),
("Jeremiah","Waters","JeremiahWaters@aol.com",9945183279),
("Bristol","Reyna","BristolReyna@example.com",7086609118),
("Reginald","Adams","ReginaldAdams@gmail.com",9927670055),
("Stella","Franco","StellaFranco@example.com",9495601850),
("Gage","Hodge","GageHodge@gmail.com",9013471410),
("Coraline","Austin","CoralineAustin@yahoo.com",8048751750),
("Omar","McCarty","OmarMcCarty@gmail.com",7500732055),
("Halo","Fox","HaloFox@aol.com",8075454571),
("Antonio","Hutchinson","AntonioHutchinson@example.com",9958248568),
("Jamie","McDowell","JamieMcDowell@example.com",9282255700),
("Lachlan","Harmon","LachlanHarmon@aol.com",7089823575),
("Maren","McCarthy","MarenMcCarthy@outlook.com",9677749742),
("Devin","Li","DevinLi@outlook.com",8672317587),
("Paige","Herman","PaigeHerman@outlook.com",9374185645),
("Juelz","Costa","JuelzCosta@outlook.com",8039296134);

SELECT * FROM customers;
SELECT count(*) from customers;

-- tables
INSERT INTO tables (restaurant_id,table_number,seating_capacity,status)
Values (11,133,2,'Not Available'),
(27,132,4,'Available'),
(1,106,4,'Not Available'),
(23,141,8,'Not Available'),
(27,106,6,'Available'),
(26,128,2,'Available'),
(48,125,6,'Not Available'),
(41,124,2,'Available'),
(18,145,6,'Not Available'),
(26,102,6,'Not Available'),
(10,124,2,'Available'),
(5,128,2,'Available'),
(13,144,4,'Not Available'),
(17,122,6,'Available'),
(43,150,8,'Not Available'),
(21,128,8,'Not Available'),
(24,146,8,'Not Available'),
(9,143,2,'Not Available'),
(28,117,8,'Available'),
(12,103,4,'Available'),
(35,107,2,'Available'),
(1,135,6,'Available'),
(13,123,6,'Available'),
(21,111,2,'Not Available'),
(10,103,2,'Available'),
(38,128,8,'Not Available'),
(37,122,4,'Available'),
(42,133,2,'Not Available'),
(41,126,4,'Available'),
(42,101,4,'Available'),
(8,116,4,'Available'),
(8,145,8,'Available'),
(10,148,4,'Available'),
(33,148,4,'Available'),
(39,118,8,'Available'),
(50,132,6,'Available'),
(50,120,6,'Available'),
(35,109,2,'Available'),
(46,118,4,'Available'),
(22,112,4,'Available'),
(20,109,8,'Available'),
(29,130,2,'Not Available'),
(46,115,6,'Not Available'),
(1,102,2,'Not Available'),
(4,107,2,'Not Available'),
(30,144,2,'Not Available'),
(23,136,2,'Available'),
(42,111,4,'Available'),
(44,146,6,'Not Available'),
(49,145,8,'Available'),
(41,139,6,'Available'),
(11,109,6,'Not Available'),
(14,121,8,'Not Available'),
(33,123,2,'Available'),
(4,127,8,'Available'),
(28,133,6,'Not Available'),
(5,131,4,'Available'),
(1,138,2,'Not Available'),
(47,118,4,'Available'),
(37,146,6,'Available'),
(18,121,6,'Not Available'),
(39,132,6,'Available'),
(46,132,8,'Available'),
(11,129,6,'Available'),
(15,105,2,'Available'),
(3,102,6,'Not Available'),
(25,130,2,'Available'),
(27,101,8,'Not Available'),
(31,146,2,'Available'),
(32,149,2,'Available'),
(41,122,2,'Not Available'),
(9,129,2,'Available'),
(17,135,8,'Not Available'),
(17,110,6,'Not Available'),
(16,129,6,'Available'),
(38,118,4,'Not Available'),
(34,109,4,'Available'),
(5,141,6,'Not Available'),
(24,113,6,'Not Available'),
(2,107,8,'Not Available'),
(2,119,6,'Not Available'),
(9,105,6,'Not Available'),
(35,117,6,'Available'),
(41,121,2,'Not Available'),
(32,109,4,'Not Available'),
(21,101,6,'Not Available'),
(44,123,8,'Not Available'),
(1,108,8,'Available'),
(32,117,4,'Available'),
(18,132,2,'Not Available'),
(27,139,4,'Available'),
(36,135,6,'Not Available'),
(1,129,2,'Not Available'),
(44,130,2,'Available'),
(48,140,8,'Available'),
(13,125,2,'Available'),
(32,112,6,'Not Available'),
(47,105,4,'Not Available'),
(3,129,8,'Available'),
(47,142,2,'Not Available');

SELECT * from tables;
SELECT count(*) from tables;

-- reservation
INSERT INTO reservation (customer_id,restaurant_id,table_id,ReservationDate,ReservationTime,NumberOfGuests,Status,SpecialRequests)
VALUES (35,20,80,'2023-05-18','18:15:00',8,'Confirmed','Higher chair for kids'),
(69,38,18,'2023-05-01','13:45:00',2,'Cancelled','Anniversary'),
(45,40,67,'2023-05-01','10:45:00',6,'Cancelled','Anniversary'),
(68,44,1,'2023-06-21','22:30:00',8,'Cancelled','Higher chair for kids'),
(75,2,15,'2023-06-04','20:00:00',4,'Cancelled','Window Seat'),
(24,8,77,'2023-04-12','15:30:00',2,'Completed','Window Seat'),
(15,41,49,'2023-05-04','21:15:00',6,'Confirmed','Anniversary'),
(37,34,42,'2023-06-08','14:15:00',8,'Confirmed','Higher chair for kids'),
(70,47,94,'2023-05-29','22:45:00',2,'Cancelled','Anniversary'),
(75,10,91,'2023-05-31','17:00:00',6,'Confirmed','Birthday'),
(36,29,16,'2023-04-04','20:00:00',2,'Completed','No special request'),
(53,42,40,'2023-05-06','15:45:00',4,'Cancelled','Vegetarian'),
(77,25,27,'2023-05-31','23:30:00',4,'Cancelled','Birthday'),
(5,31,58,'2023-06-04','11:00:00',8,'Confirmed','Window Seat'),
(48,29,74,'2023-05-30','18:15:00',6,'Confirmed','Higher chair for kids'),
(72,48,68,'2023-06-28','22:45:00',2,'Confirmed','Higher chair for kids'),
(49,22,26,'2023-04-11','17:30:00',6,'Completed','No special request'),
(67,40,70,'2023-04-15','15:30:00',6,'Completed','Higher chair for kids'),
(76,9,19,'2023-04-09','18:15:00',8,'Completed','Anniversary'),
(32,15,78,'2023-04-13','14:00:00',8,'Completed','Higher chair for kids'),
(64,34,14,'2023-06-10','17:45:00',2,'Confirmed','Birthday'),
(94,48,68,'2023-05-15','12:00:00',2,'Cancelled','Vegetarian'),
(1,9,65,'2023-06-13','21:45:00',4,'Confirmed','Anniversary'),
(5,3,57,'2023-05-05','21:45:00',2,'Cancelled','Window Seat'),
(93,2,46,'2023-06-12','21:15:00',4,'Confirmed','Higher chair for kids'),
(9,45,38,'2023-05-05','23:30:00',2,'Confirmed','Anniversary'),
(52,23,89,'2023-06-01','11:15:00',2,'Confirmed','Window Seat'),
(88,43,46,'2023-05-28','19:30:00',8,'Cancelled','Window Seat'),
(66,36,97,'2023-04-11','23:15:00',2,'Completed','Higher chair for kids'),
(87,32,16,'2023-04-08','21:00:00',8,'Completed','No special request'),
(62,31,27,'2023-06-11','13:30:00',2,'Confirmed','Anniversary'),
(38,36,70,'2023-04-22','16:15:00',4,'Completed','Birthday'),
(16,44,25,'2023-06-30','17:00:00',6,'Cancelled','Birthday'),
(10,42,57,'2023-06-14','20:45:00',2,'Confirmed','No special request'),
(4,7,76,'2023-04-04','20:30:00',2,'Completed','Anniversary'),
(24,47,76,'2023-05-01','18:45:00',8,'Cancelled','Window Seat'),
(54,5,48,'2023-05-20','22:30:00',8,'Confirmed','Anniversary'),
(65,38,54,'2023-06-30','17:00:00',4,'Cancelled','Vegetarian'),
(7,12,22,'2023-06-21','22:00:00',4,'Confirmed','Anniversary'),
(62,44,41,'2023-04-19','13:30:00',8,'Completed','Vegetarian'),
(49,35,13,'2023-04-29','13:00:00',8,'Completed','No special request'),
(93,34,22,'2023-05-14','19:00:00',4,'Confirmed','Anniversary'),
(33,25,53,'2023-06-23','15:30:00',4,'Confirmed','Higher chair for kids'),
(56,5,80,'2023-05-23','17:30:00',6,'Confirmed','Vegetarian'),
(35,17,41,'2023-06-29','10:00:00',4,'Confirmed','Window Seat'),
(11,17,69,'2023-06-11','23:00:00',6,'Confirmed','Higher chair for kids'),
(22,37,48,'2023-05-03','17:15:00',2,'Confirmed','Higher chair for kids'),
(17,16,79,'2023-05-22','20:45:00',2,'Confirmed','Higher chair for kids'),
(65,18,1,'2023-05-08','12:15:00',4,'Confirmed','Window Seat'),
(64,25,27,'2023-05-25','16:15:00',4,'Cancelled','No special request'),
(60,11,35,'2023-04-24','18:30:00',8,'Completed','Higher chair for kids'),
(69,28,37,'2023-04-29','14:45:00',2,'Completed','No special request'),
(83,45,20,'2023-06-25','15:30:00',8,'Confirmed','Anniversary'),
(79,23,71,'2023-06-24','13:15:00',2,'Cancelled','No special request'),
(35,2,65,'2023-05-27','18:45:00',4,'Cancelled','Vegetarian'),
(3,26,96,'2023-04-26','23:45:00',4,'Completed','Vegetarian'),
(44,30,12,'2023-06-04','23:00:00',4,'Cancelled','Birthday'),
(24,43,71,'2023-06-22','20:00:00',2,'Cancelled','Anniversary'),
(28,38,97,'2023-04-06','12:45:00',8,'Completed','Vegetarian'),
(79,6,13,'2023-04-30','20:30:00',8,'Completed','Birthday'),
(74,16,35,'2023-06-06','17:15:00',4,'Cancelled','Anniversary'),
(58,22,66,'2023-06-10','22:45:00',8,'Cancelled','Window Seat'),
(94,29,20,'2023-06-17','23:00:00',4,'Confirmed','Window Seat'),
(15,29,86,'2023-06-18','18:00:00',6,'Cancelled','Window Seat'),
(64,11,44,'2023-05-09','11:15:00',8,'Cancelled','Vegetarian'),
(27,34,88,'2023-06-11','13:45:00',2,'Confirmed','Higher chair for kids'),
(31,33,91,'2023-05-12','17:30:00',6,'Cancelled','No special request'),
(39,16,25,'2023-05-23','12:45:00',8,'Confirmed','Birthday'),
(25,30,64,'2023-06-30','10:45:00',8,'Cancelled','Birthday'),
(26,30,35,'2023-06-25','11:00:00',2,'Confirmed','Vegetarian'),
(44,42,82,'2023-05-11','19:45:00',6,'Cancelled','Window Seat'),
(67,3,18,'2023-06-30','11:00:00',6,'Confirmed','No special request'),
(97,4,15,'2023-04-29','19:30:00',2,'Completed','Vegetarian'),
(43,34,79,'2023-06-07','20:30:00',2,'Confirmed','Birthday'),
(32,31,99,'2023-06-12','13:30:00',6,'Cancelled','Anniversary'),
(20,24,38,'2023-06-13','11:30:00',6,'Cancelled','Birthday'),
(87,18,40,'2023-04-22','17:45:00',6,'Completed','Window Seat'),
(85,12,56,'2023-05-04','15:30:00',8,'Confirmed','Higher chair for kids'),
(21,42,54,'2023-05-22','11:30:00',4,'Confirmed','No special request'),
(97,35,8,'2023-05-27','21:00:00',2,'Confirmed','Vegetarian'),
(44,6,25,'2023-05-17','10:15:00',6,'Confirmed','Vegetarian'),
(67,2,22,'2023-06-12','17:15:00',8,'Confirmed','Higher chair for kids'),
(6,36,8,'2023-04-08','17:30:00',8,'Completed','Vegetarian'),
(91,11,55,'2023-06-04','19:30:00',8,'Confirmed','Higher chair for kids'),
(46,42,3,'2023-04-10','20:30:00',6,'Completed','Birthday'),
(63,40,14,'2023-04-05','13:15:00',2,'Completed','Vegetarian'),
(77,16,63,'2023-05-22','19:30:00',6,'Cancelled','Anniversary'),
(50,16,70,'2023-05-12','22:45:00',8,'Confirmed','Vegetarian'),
(100,20,2,'2023-04-09','10:45:00',6,'Completed','No special request'),
(79,21,96,'2023-06-22','19:45:00',2,'Confirmed','No special request'),
(48,10,58,'2023-05-22','15:00:00',4,'Confirmed','Anniversary'),
(35,43,48,'2023-05-29','14:45:00',2,'Confirmed','Birthday'),
(59,42,88,'2023-05-19','13:45:00',6,'Confirmed','Vegetarian'),
(46,21,75,'2023-05-20','20:15:00',8,'Confirmed','Higher chair for kids'),
(46,9,70,'2023-06-19','13:00:00',2,'Cancelled','No special request'),
(58,28,64,'2023-05-20','19:00:00',4,'Cancelled','Window Seat'),
(96,20,77,'2023-05-21','22:45:00',8,'Confirmed','Vegetarian'),
(61,41,60,'2023-06-19','19:00:00',2,'Cancelled','Vegetarian'),
(6,49,98,'2023-04-01','17:30:00',4,'Completed','Higher chair for kids'),
(70,28,5,'2023-06-26','18:45:00',6,'Confirmed','Vegetarian');

SELECT * from reservation;
SELECT count(*) from reservation;

-- orders
INSERT INTO orders (ReservationID,OrderDate,TotalAmount,OrderStatus,PaymentMethod)
VALUES (37,'2023-04-28','221.00','Completed','Cash'),
(49,'2023-06-23','968.00','Pending','Cash'),
(15,'2023-05-26','622.00','Completed','Mobile Payment'),
(66,'2023-06-21','603.00','Pending','Mobile Payment'),
(5,'2023-04-04','848.00','Completed','Mobile Payment'),
(9,'2023-06-02','372.00','Pending','Credit Card'),
(66,'2023-05-07','476.00','Pending','Debit Card'),
(65,'2023-06-15','692.00','Pending','Debit Card'),
(3,'2023-06-04','559.00','Pending','Debit Card'),
(92,'2023-06-03','363.00','Completed','Debit Card'),
(28,'2023-04-15','545.00','Pending','Debit Card'),
(2,'2023-05-08','931.00','Completed','Mobile Payment'),
(78,'2023-05-10','857.00','Completed','Cash'),
(20,'2023-04-14','314.00','Completed','Debit Card'),
(40,'2023-04-13','115.00','Completed','Debit Card'),
(61,'2023-05-03','153.00','Completed','Mobile Payment'),
(25,'2023-06-04','733.00','Completed','Credit Card'),
(85,'2023-05-10','554.00','Pending','Credit Card'),
(79,'2023-04-24','139.00','Pending','Cash'),
(1,'2023-04-02','924.00','Pending','Debit Card'),
(58,'2023-05-11','778.00','Completed','Debit Card'),
(91,'2023-05-31','341.00','Pending','Mobile Payment'),
(20,'2023-06-05','475.00','Completed','Debit Card'),
(37,'2023-04-15','985.00','Completed','Credit Card'),
(61,'2023-06-19','423.00','Completed','Mobile Payment'),
(72,'2023-05-10','851.00','Completed','Cash'),
(56,'2023-05-10','704.00','Completed','Mobile Payment'),
(20,'2023-06-01','256.00','Pending','Cash'),
(29,'2023-04-15','430.00','Completed','Credit Card'),
(50,'2023-06-17','120.00','Pending','Mobile Payment'),
(38,'2023-04-26','977.00','Pending','Debit Card'),
(22,'2023-06-10','238.00','Completed','Debit Card'),
(24,'2023-05-22','939.00','Pending','Credit Card'),
(11,'2023-05-14','814.00','Completed','Credit Card'),
(47,'2023-05-16','236.00','Completed','Credit Card'),
(41,'2023-04-19','101.00','Pending','Mobile Payment'),
(24,'2023-05-10','702.00','Completed','Debit Card'),
(4,'2023-04-12','400.00','Pending','Cash'),
(38,'2023-05-16','345.00','Pending','Cash'),
(49,'2023-05-28','950.00','Completed','Cash'),
(94,'2023-04-20','741.00','Pending','Credit Card'),
(35,'2023-06-15','543.00','Pending','Cash'),
(81,'2023-05-18','772.00','Pending','Cash'),
(38,'2023-06-16','866.00','Completed','Credit Card'),
(98,'2023-04-23','365.00','Pending','Credit Card'),
(12,'2023-05-31','988.00','Pending','Debit Card'),
(34,'2023-04-20','250.00','Pending','Credit Card'),
(97,'2023-04-18','845.00','Pending','Cash'),
(24,'2023-06-08','490.00','Pending','Credit Card'),
(72,'2023-05-11','910.00','Completed','Cash'),
(69,'2023-04-18','391.00','Pending','Mobile Payment'),
(44,'2023-05-27','265.00','Pending','Debit Card'),
(46,'2023-04-01','958.00','Pending','Credit Card'),
(43,'2023-05-09','967.00','Pending','Cash'),
(12,'2023-04-25','249.00','Completed','Debit Card'),
(62,'2023-04-01','104.00','Completed','Mobile Payment'),
(52,'2023-05-13','770.00','Pending','Credit Card'),
(15,'2023-06-25','663.00','Completed','Credit Card'),
(84,'2023-05-11','529.00','Pending','Debit Card'),
(18,'2023-06-16','991.00','Completed','Mobile Payment'),
(58,'2023-06-25','322.00','Pending','Credit Card'),
(16,'2023-04-13','977.00','Pending','Credit Card'),
(78,'2023-05-14','523.00','Completed','Mobile Payment'),
(10,'2023-05-03','899.00','Completed','Debit Card'),
(62,'2023-04-04','538.00','Completed','Mobile Payment'),
(27,'2023-06-02','128.00','Completed','Mobile Payment'),
(32,'2023-04-04','329.00','Pending','Cash'),
(50,'2023-04-27','344.00','Pending','Debit Card'),
(94,'2023-04-20','198.00','Pending','Mobile Payment'),
(24,'2023-05-11','288.00','Pending','Mobile Payment'),
(87,'2023-06-08','771.00','Pending','Debit Card'),
(29,'2023-06-05','797.00','Completed','Mobile Payment'),
(19,'2023-05-13','199.00','Completed','Credit Card'),
(59,'2023-05-16','233.00','Pending','Mobile Payment'),
(89,'2023-06-19','806.00','Completed','Credit Card'),
(92,'2023-05-15','195.00','Completed','Debit Card'),
(32,'2023-06-21','331.00','Pending','Debit Card'),
(30,'2023-05-07','518.00','Completed','Cash'),
(5,'2023-04-10','169.00','Completed','Credit Card'),
(13,'2023-06-19','904.00','Pending','Mobile Payment'),
(52,'2023-05-21','118.00','Pending','Debit Card'),
(62,'2023-06-22','470.00','Pending','Mobile Payment'),
(87,'2023-06-21','995.00','Completed','Debit Card'),
(57,'2023-05-08','956.00','Completed','Credit Card'),
(32,'2023-06-16','413.00','Completed','Debit Card'),
(72,'2023-05-10','450.00','Completed','Credit Card'),
(60,'2023-05-31','777.00','Completed','Mobile Payment'),
(65,'2023-06-22','705.00','Pending','Cash'),
(78,'2023-05-27','894.00','Completed','Debit Card'),
(20,'2023-06-22','775.00','Completed','Debit Card'),
(67,'2023-06-24','879.00','Pending','Credit Card'),
(58,'2023-06-19','698.00','Completed','Credit Card'),
(76,'2023-04-20','138.00','Pending','Credit Card'),
(22,'2023-04-23','944.00','Completed','Cash'),
(88,'2023-06-24','193.00','Pending','Debit Card'),
(82,'2023-05-12','151.00','Completed','Credit Card'),
(81,'2023-05-08','252.00','Pending','Credit Card'),
(47,'2023-04-04','766.00','Completed','Debit Card'),
(63,'2023-06-09','277.00','Pending','Mobile Payment'),
(28,'2023-06-25','761.00','Pending','Mobile Payment');

SELECT * from orders;
SELECT count(*) from orders;

-- payments
INSERT INTO payments (OrderID,PaymentDate,Amount,PaymentType,PaymentStatus)
VALUES (64,'2023-04-28','221.00','Cash','Completed'),
(77,'2023-06-23','968.00','Cash','Pending'),
(20,'2023-05-26','622.00','Mobile Payment','Completed'),
(38,'2023-06-21','603.00','Mobile Payment','Pending'),
(94,'2023-04-04','848.00','Mobile Payment','Completed'),
(21,'2023-06-02','372.00','Credit Card','Pending'),
(11,'2023-05-07','476.00','Debit Card','Pending'),
(51,'2023-06-15','692.00','Debit Card','Pending'),
(4,'2023-06-04','559.00','Debit Card','Pending'),
(21,'2023-06-03','363.00','Debit Card','Completed'),
(89,'2023-04-15','545.00','Debit Card','Pending'),
(72,'2023-05-08','931.00','Mobile Payment','Completed'),
(20,'2023-05-10','857.00','Cash','Completed'),
(5,'2023-04-14','314.00','Debit Card','Completed'),
(32,'2023-04-13','115.00','Debit Card','Completed'),
(69,'2023-05-03','153.00','Mobile Payment','Completed'),
(99,'2023-06-04','733.00','Credit Card','Completed'),
(92,'2023-05-10','554.00','Credit Card','Pending'),
(20,'2023-04-24','139.00','Cash','Pending'),
(10,'2023-04-02','924.00','Debit Card','Pending'),
(73,'2023-05-11','778.00','Debit Card','Completed'),
(3,'2023-05-31','341.00','Mobile Payment','Pending'),
(49,'2023-06-05','475.00','Debit Card','Completed'),
(78,'2023-04-15','985.00','Credit Card','Completed'),
(65,'2023-06-19','423.00','Mobile Payment','Completed'),
(14,'2023-05-10','851.00','Cash','Completed'),
(6,'2023-05-10','704.00','Mobile Payment','Completed'),
(30,'2023-06-01','256.00','Cash','Pending'),
(42,'2023-04-15','430.00','Credit Card','Completed'),
(88,'2023-06-17','120.00','Mobile Payment','Pending'),
(64,'2023-04-26','977.00','Debit Card','Pending'),
(4,'2023-06-10','238.00','Debit Card','Completed'),
(57,'2023-05-22','939.00','Credit Card','Pending'),
(80,'2023-05-14','814.00','Credit Card','Completed'),
(85,'2023-05-16','236.00','Credit Card','Completed'),
(62,'2023-04-19','101.00','Mobile Payment','Pending'),
(46,'2023-05-10','702.00','Debit Card','Completed'),
(88,'2023-04-12','400.00','Cash','Pending'),
(91,'2023-05-16','345.00','Cash','Pending'),
(98,'2023-05-28','950.00','Cash','Completed'),
(44,'2023-04-20','741.00','Credit Card','Pending'),
(4,'2023-06-15','543.00','Cash','Pending'),
(95,'2023-05-18','772.00','Cash','Pending'),
(89,'2023-06-16','866.00','Credit Card','Completed'),
(4,'2023-04-23','365.00','Credit Card','Pending'),
(54,'2023-05-31','988.00','Debit Card','Pending'),
(100,'2023-04-20','250.00','Credit Card','Pending'),
(1,'2023-04-18','845.00','Cash','Pending'),
(94,'2023-06-08','490.00','Credit Card','Pending'),
(56,'2023-05-11','910.00','Cash','Completed'),
(32,'2023-04-18','391.00','Mobile Payment','Pending'),
(6,'2023-05-27','265.00','Debit Card','Pending'),
(28,'2023-04-01','958.00','Credit Card','Pending'),
(93,'2023-05-09','967.00','Cash','Pending'),
(49,'2023-04-25','249.00','Debit Card','Completed'),
(14,'2023-04-01','104.00','Mobile Payment','Completed'),
(45,'2023-05-13','770.00','Credit Card','Pending'),
(59,'2023-06-25','663.00','Credit Card','Completed'),
(8,'2023-05-11','529.00','Debit Card','Pending'),
(58,'2023-06-16','991.00','Mobile Payment','Completed'),
(28,'2023-06-25','322.00','Credit Card','Pending'),
(99,'2023-04-13','977.00','Credit Card','Pending'),
(92,'2023-05-14','523.00','Mobile Payment','Completed'),
(93,'2023-05-03','899.00','Debit Card','Completed'),
(28,'2023-04-04','538.00','Mobile Payment','Completed'),
(89,'2023-06-02','128.00','Mobile Payment','Completed'),
(17,'2023-04-04','329.00','Cash','Pending'),
(31,'2023-04-27','344.00','Debit Card','Pending'),
(18,'2023-04-20','198.00','Mobile Payment','Pending'),
(54,'2023-05-11','288.00','Mobile Payment','Pending'),
(41,'2023-06-08','771.00','Debit Card','Pending'),
(85,'2023-06-05','797.00','Mobile Payment','Completed'),
(83,'2023-05-13','199.00','Credit Card','Completed'),
(82,'2023-05-16','233.00','Mobile Payment','Pending'),
(52,'2023-06-19','806.00','Credit Card','Completed'),
(13,'2023-05-15','195.00','Debit Card','Completed'),
(22,'2023-06-21','331.00','Debit Card','Pending'),
(5,'2023-05-07','518.00','Cash','Completed'),
(83,'2023-04-10','169.00','Credit Card','Completed'),
(47,'2023-06-19','904.00','Mobile Payment','Pending'),
(25,'2023-05-21','118.00','Debit Card','Pending'),
(93,'2023-06-22','470.00','Mobile Payment','Pending'),
(90,'2023-06-21','995.00','Debit Card','Completed'),
(93,'2023-05-08','956.00','Credit Card','Completed'),
(65,'2023-06-16','413.00','Debit Card','Completed'),
(68,'2023-05-10','450.00','Credit Card','Completed'),
(46,'2023-05-31','777.00','Mobile Payment','Completed'),
(61,'2023-06-22','705.00','Cash','Pending'),
(8,'2023-05-27','894.00','Debit Card','Completed'),
(66,'2023-06-22','775.00','Debit Card','Completed'),
(96,'2023-06-24','879.00','Credit Card','Pending'),
(55,'2023-06-19','698.00','Credit Card','Completed'),
(63,'2023-04-20','138.00','Credit Card','Pending'),
(80,'2023-04-23','944.00','Cash','Completed'),
(22,'2023-06-24','193.00','Debit Card','Pending'),
(77,'2023-05-12','151.00','Credit Card','Completed'),
(36,'2023-05-08','252.00','Credit Card','Pending'),
(57,'2023-04-04','766.00','Debit Card','Completed'),
(28,'2023-06-09','277.00','Mobile Payment','Pending'),
(60,'2023-06-25','761.00','Mobile Payment','Pending');

SELECT * from payments;
SELECT count(*) from payments;

-- reviews
INSERT INTO review (restaurant_id,customer_id,rating,Comment)
VALUES (25,98,5,'The food was amazing, and the service was excellent.'),
(23,79,3,'Great ambiance, but the food was a bit salty.'),
(14,87,4,'I loved the dessert, but the main course was average.'),
(28,61,2,'Service was slow, and the food was cold.'),
(50,89,5,'Absolutely fantastic experience! Will come again.'),
(27,53,3,'The pasta was overcooked, but the sauce was delicious.'),
(24,76,4,'Wonderful place for a family dinner.'),
(47,14,2,'Too expensive for the quality of food offered.'),
(29,71,5,'Friendly staff and great food.'),
(12,95,3,'The steak was perfect, but the side dishes were bland.'),
(32,35,4,'Excellent variety on the menu.'),
(10,6,2,'Not worth the hype.'),
(50,38,5,'A hidden gem with outstanding food.'),
(16,57,3,'The food was just okay, but the Korean were incredible.'),
(3,44,2,'Fantastic service but the food was mediocre.'),
(34,82,5,'The ambiance and food were both top-notch.'),
(15,35,3,'Portions were small for the price.'),
(48,9,4,'Perfect for a romantic dinner.'),
(31,86,2,'Long wait times and average food.'),
(19,19,5,"Best dining experience I've had in a long time."),
(17,99,3,'Food was good but the place was too noisy.'),
(38,41,4,'Highly recommend the seafood dishes.'),
(3,90,2,"Disappointing visit. Won't return."),
(34,42,5,'Loved the outdoor seating area.'),
(46,2,3,'Service was friendly but the food took forever.'),
(18,64,4,'Good value for money.'),
(46,30,2,'The food was bland and overpriced.'),
(24,91,5,'Great place for a quick bite.'),
(36,33,3,'The ambiance was nice, but the food was underwhelming.'),
(6,7,4,'Enjoyed every bite!'),
(3,87,2,'Food was cold and tasteless.'),
(32,49,5,'Outstanding service and delicious food.'),
(49,96,3,'Too crowded and the service was slow.'),
(22,49,4,'The drinks were amazing, and the food was good.'),
(17,26,2,'Terrible experience. Will not come back.'),
(13,30,5,'Lovely decor and great food.'),
(44,7,3,'Food was okay, but nothing special.'),
(21,22,4,'The appetizers were the best part of the meal.'),
(30,80,2,'Poor service and mediocre food.'),
(8,30,5,'Best restaurant in town!'),
(16,89,3,'Food was overpriced for the quality.'),
(4,18,4,'Great place to celebrate special occasions.'),
(9,64,2,'Will not recommend to others.'),
(9,39,5,'Fantastic food and excellent service.'),
(11,38,3,"Nice place but the food didn't meet my expectations."),
(3,53,4,'The desserts were out of this world.'),
(7,83,2,'Service was inattentive.'),
(12,22,5,'Highly recommended for a gourmet experience.'),
(28,54,3,'Food was just average.'),
(2,61,4,'A must-visit for food lovers.'),
(42,17,2,'Extremely disappointed with the food.'),
(26,62,5,'Loved the vegetarian options.'),
(28,48,3,'Service was great, but the food was average.'),
(7,84,4,'A delightful dining experience.'),
(15,88,2,'Not worth the price.'),
(16,85,5,'Will definitely come back!'),
(18,96,3,'The food was okay, but the service was terrible.'),
(16,29,4,'Amazing flavors and great presentation.'),
(45,50,2,'Food took too long to arrive.'),
(2,78,5,"The best meal I've had in years!"),
(3,77,3,'The place was nice, but the food was not impressive.'),
(14,16,4,'Great variety of dishes.'),
(49,36,2,'The food was not fresh.'),
(21,42,5,'Excellent food and atmosphere.'),
(8,90,3,'Service was average, food was good.'),
(29,84,4,'A wonderful dining experience overall.'),
(14,60,2,'Very disappointed with my meal.'),
(15,88,5,'Highly recommended!'),
(1,22,3,'The food was good, but the service was slow.'),
(42,78,4,'Loved the ambiance and the food.'),
(3,55,2,'Food quality needs improvement.'),
(12,21,5,'Exceptional food and service.'),
(27,24,3,'Average food but nice setting.'),
(12,12,4,'A great place for brunch.'),
(33,21,2,'Not impressed with the food.'),
(33,48,5,'Best dining experience ever!'),
(28,14,3,'Food was okay, service was not.'),
(38,42,4,'Wonderful flavors and great service.'),
(5,48,2,'The food was disappointing.'),
(2,19,5,'Will recommend to friends and family.'),
(44,57,3,'Decent food but nothing special.'),
(43,37,4,'A culinary delight.'),
(50,17,2,'Very poor service.'),
(31,10,5,'Perfect dining experience.'),
(44,23,3,'Food was average, ambiance was nice.'),
(10,34,4,'Great food and friendly staff.'),
(3,67,2,'Not worth the money.'),
(35,5,5,'Outstanding experience!'),
(47,23,3,'Food was fine, service was slow.'),
(25,93,4,'Highly enjoyable meal.'),
(19,84,2,'Below average food quality.'),
(34,45,5,'The food was amazing, and the service was excellent.'),
(38,48,3,'Great ambiance, but the food was a bit salty.'),
(37,61,4,'I loved the dessert, but the main course was average.'),
(28,72,2,'Service was slow, and the food was cold.'),
(19,34,5,'Absolutely fantastic experience! Will come again.'),
(19,77,5,'Excellent service and food.'),
(45,3,4,'Great experience, but a bit noisy.'),
(29,88,3,"The decor was nice, but the food didn't quite meet my expectations. It was just average"),
(43,36,4,'A lovely place with great food and a cozy ambiance. Just wish the portion sizes were a bit larger');

SELECT * from review;
SELECT count(*) from review;