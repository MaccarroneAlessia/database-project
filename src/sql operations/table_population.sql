/* 
Si passa all’inserimento dei dati attraverso il comando:
INSERT INTO table_name (column1, column2, column3, ...)
VALUES (value1, value2, value3, ...);
*/

USE beb;

INSERT INTO Season (month_, rate) 
VALUES (1, 10),(2, 15),(3, 5),(4, 10),(5, 10),(6, 20),(7, 30),(8, 40),(9, 30),(10, 20),(11, 10),(12, 40);

INSERT INTO Customer(first_name, last_name, phone, email)
VALUES ('Alessia', 'Maccarrone', '1234567890', 'maccalessia@gmail.com'),('Mario', 'Bianchi', '1234567890', 'mario@gmail.com'),('Vittoria', 'Rossi', '1234567890', 'rossi@gmail.com'),('Salvo', 'Catania', '1234567890', 'salvo@gmail.com'),('Gioele', 'Federico', '1234567890', 'fede@gmail.com');

INSERT INTO Home(address_home, name_home)
VALUES ('via catania 1', 'il b&b'),('piazza Italia 209', 'la casa storica'),('via Federico 18', 'Fede b&b');

INSERT INTO Contact(role_staff, office, phone, home_id)
VALUES ('assistenza', 'via Amantea 33', '1234567890', 1), ('prenotazioni', 'via Amantea 33', '1234567890', 1), ('assistenza', 'via Tropea 33', '1234567890', 2), ('assistenza', 'via Tropea 33', '1234567890', 3);

INSERT INTO Room(name_room, type_room, rate, home_id)
VALUES ('camera Deluxe', 'camera singola', 40, 1), ('camera Queen', 'camera doppia', 50, 1), ('camera Matrimoniale standard', 'matrimoniale', 70, 2), ('camera familiare standard', 'tripla', 100, 2), ('camera con vista oceano', 'doppia uso singola', 80, 3), ('Suite King Deluxe', 'camera singola', 40, 3), ('Suite master', 'camera quafrupla', 100, 1), ('camera love', 'matrimoniale', 50, 2), ('camera bimbi', 'camera tripla', 90, 3);

INSERT INTO Servicing(description_service, rate, home_id)
VALUES ('parcheggio', 5, 1), ('piscina', 10, 2), ('cucina', 5, 3);

INSERT INTO PrivateService(rate, room_id)
VALUES (5, 3), (10, 5), (15, 1), (5, 4);

INSERT INTO Staff(CF, hours_worked, salary, role_staff, contact_id, home_id)
VALUES ('mqwert02h67f789x', 50, 1500, 'segretario', 1, 1),('asccdfver', 80, 2000, 'addetto della pulizia', 1, 1 ),('adcsewe', 40, 3000, 'gestore', 2, 1),('vererwfa',50, 1500, 'segretario', 2, 2),('erfvewwv', 80, 2000, 'addetto della pulizia', 3, 2),('vtevberthr', 40, 3000, 'gestore', 3, 2),('rvbtrnyjge', 50, 1500, 'segretario', 4, 3),('vrtgtrbhteb',80, 2000, 'addetto della pulizia', 4, 3),('bge6ye5bngds', 40, 3000, 'gestore', 4, 3),('ffvsrtgsthb', 50, 1500, 'segretario', 4, 1),('cebfkhrfk', 80, 2000, 'addetto della pulizia', 4, 2), ('awjlefefbe',  40, 3000, 'gestore', 1, 3);

INSERT INTO Report(collections, staff_id)
VALUES (0, 'adcsewe'), (0, 'bge6ye5bngds'),(0, 'vtevberthr');

INSERT INTO Reservation(num_people, customer_id)
VALUES (1, 1), (2, 2), (1, 3), (1, 4), (1, 5); 

INSERT INTO Signup(customer_id, home_id)
VALUES (1, 1), (2, 2), (3, 3);

INSERT INTO Sojourn(date_in, date_fin)
VALUES ('2022-09-20', '2022-09-25'), ('2022-10-02', '22-10-07'), ('2022-10-15', '2022-10-22'), ('2022-11-25', '22-11-30'), ('2022-12-20', '2022-12-25');

INSERT INTO Request(reservation_id, sojourn_id, staff_id)
VALUES (1, 1, 'ffvsrtgsthb'), (2, 2, 'vererwfa'), (3, 3, 'rvbtrnyjge'), (4, 4, 'ffvsrtgsthb'), (5, 5, 'vererwfa');

INSERT INTO Selection(request_id, room_id)
VALUES (1, 1), (2, 2), (3, 3), (4, 4), (5, 5);

INSERT INTO Invoice(issuer, pay_type, customer_id, reservation_id)
VALUES (15, 'bonifico', 1, 1), (15, 'bonifico', 2, 2), (15, 'bonifico', 3, 3), (15, 'bonifico', 4, 4), (15, 'bonifico', 5, 5);

INSERT INTO Review(customer_id, room_id, num_stars)
VALUES (1, 1, 4), (2, 2, 5), (3, 3, 3);