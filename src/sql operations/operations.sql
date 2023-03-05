USE beb;
/*

L'istruzione CALL viene utilizzata per richiamare una procedura archiviata in un DATABASE.
CALL sp_name([parameter[,...]]) 
CALL sp_name[()]
-------------------------------------
CREATE PROCEDURE proc_name: Crea una nuova stored procedure con nome proc_ nome.

( [{[IN | OUT | INOUT] [parameter_name] datatype [AS LOCATOR] [RESULT]} [, ...]] ) 
: specifica il numero di parametri della procedura e il tipo di dati di ciascun parametro. 
Un parametro per una routine può essere utilizzato solo per l'input, l'output o sia l'input che l'output. 
Il nome dei parametri deve essere univoco all'interno della routine.

[{IN | OUT | INOUT}] parameter_name_1 datatype,
[{IN | OUT | INOUT}] parameter_name_2 datatype,
[{IN | OUT | INOUT}] parameter_name_3 datatype,[...]
IN : identifica il parametro come parametro di input per la routine.
datatype : specifica il tipo di dati dei parametri.

*/

/*O1 : Cliente effettua prenotazione per una camera*/
DELIMITER //
CREATE PROCEDURE op1(IN num INT, IN client INT)
BEGIN
    INSERT INTO Reservation(num_people, customer_id) VALUES (num, client);
END //
DELIMITER ;

/*O2 : Cliente modifica prenotazione (data del soggiorno)*/
DELIMITER //
CREATE PROCEDURE op2(IN data_i DATE, IN data_f DATE, IN id INT)
BEGIN
    UPDATE Sojourn 
    SET date_in = data_i AND date_fin = data_f
    WHERE sojourn_id = id;
END //
DELIMITER ;

/*O3 : Cliente cancella la prenotazione*/
DELIMITER //
CREATE PROCEDURE op3(IN id INT)
BEGIN
    DELETE 
    FROM Reservation 
    WHERE reservation_id = id;
END //
DELIMITER ;

/*O4 : Ricerca delle prenotazioni di un cliente*/
DELIMITER //
CREATE PROCEDURE op4(IN id INT)
BEGIN
    SELECT *
    FROM Reservation R, Customer C, Request Re
    WHERE R.customer_id = C.customer_id AND C.customer_id = id AND R.reservation_id = Re.reservation_id;
END //
DELIMITER ;

/*O5 : Calcolo del costo della prenotazione*/
DELIMITER //
CREATE PROCEDURE op5(IN id INT)
BEGIN
    SELECT R.reservation_id, SUM(cost) AS CostoTotale
    FROM Reservation R, Request Re
    WHERE R.reservation_id = Re.reservation_id AND R.reservation_id = id
    GROUP BY R.reservation_id;
END //
DELIMITER ;

/*O6 : Visualizzare lo storico delle prenotazioni per un cliente*/
DELIMITER //
CREATE PROCEDURE op6(IN id INT)
BEGIN
    SELECT *
    FROM Reservation R, Customer C, Request Re, Sojourn S, Selection Se, Servicing Ser, Room Ro
    WHERE R.customer_id = C.customer_id AND C.customer_id = id AND R.reservation_id = Re.reservation_id AND Re.sojourn_id = S.sojourn_id AND Se.request_id = Re.request_id AND Ser.service_id = Se.service_id AND Ro.room_id = Se.room_id;
END //
DELIMITER ;

/*O7 : Visualizzare i dettagli di una richiesta*/
DELIMITER //
CREATE PROCEDURE op7(IN id INT)
BEGIN
    SELECT *
    FROM Request Re, Reservation R, Sojourn S, Customer C
    WHERE R.reservation_id = Re.reservation_id AND R.customer_id = C.customer_id AND Re.sojourn_id = S.sojourn_id;
END //
DELIMITER ;

/*O8 : Visualizzare i dettagli del soggiorno di un cliente*/
DELIMITER //
CREATE PROCEDURE op8(IN id INT)
BEGIN
    SELECT date_in, date_fin
    FROM Reservation R, Sojourn S
    WHERE R.sojourn_id = S.sojourn_id AND R.reservation_id = id;
END //
DELIMITER ;

/*O9 : Visualizzare disponibilità di una camera*/
DELIMITER //
CREATE PROCEDURE op9(IN id INT)
BEGIN
    SELECT availability_room
    FROM Room R
    WHERE room_id = id;
END //
DELIMITER ;

/*O10 : Aggiungere punti fedeltà nella tessera di un cliente*/
DELIMITER //
CREATE PROCEDURE op10(IN id INT)
BEGIN
    UPDATE Customer
    SET points = points + 5
    WHERE customer_id = id;
END //
DELIMITER ;

/*O11 : Visualizzare punti nella tessera di un cliente*/
DELIMITER //
CREATE PROCEDURE op11(IN id INT)
BEGIN
    SELECT points
    FROM Customer C
    WHERE customer_id = id;
END //
DELIMITER ;

/*O12 : Visualizzare recensioni camera*/
DELIMITER //
CREATE PROCEDURE op12(IN id INT)
BEGIN
    SELECT customer_id, num_stars, comment
    FROM Review R
    WHERE room_id = id;
END //
DELIMITER ;

/*O13 : Gestore genera report*/
DELIMITER //
CREATE PROCEDURE op13(IN idS INT, IN idR INT)
BEGIN
    INSERT INTO Report(report_id, collections, staff_id) 
    SELECT idR, SUM(amount), idS
    FROM Invoice I 
    WHERE report_id = NULL;
    
    UPDATE Invoice
    SET report_id = idR
    WHERE report_id = NULL;
END //
DELIMITER ;

/*O14 : Aggiunta di una nuova sede*/
DELIMITER //
CREATE PROCEDURE op14(IN addr VARCHAR(50), IN n VARCHAR(30))
BEGIN
   INSERT INTO Home(address_home, name_home)
   VALUES (addr, n);
END //
DELIMITER ;

/*procedura per aggiornare la stagione del soggiorno*/
DELIMITER //
CREATE PROCEDURE P_Soggiorno(IN sojourn_id INT)
BEGIN
    DECLARE inizio INT;
    DECLARE stagione INT;

    SELECT MONTH(S.date_in) INTO inizio
    FROM Sojourn S
    WHERE S.sojourn_id = sojourn_id;

    SELECT season_id INTO stagione
    FROM Season Se
    WHERE Se.month_ = inizio;

    UPDATE Sojourn S
    SET S.season_id = stagione
    WHERE S.sojourn_id = sojourn_id;
END //
DELIMITER ;


DELIMITER //
CREATE PROCEDURE calculate_cost_request(IN new_request_id INT)
BEGIN
    DECLARE costocamere FLOAT;
    DECLARE costoservizi FLOAT;
    DECLARE numgiorni FLOAT;

    SELECT DISTINCT SUM(Ro.rate), SUM(Se.rate), SUM(DATEDIFF(So.date_fin, So.date_in)) INTO costocamere, costoservizi, numgiorni
    FROM Request Re, Room Ro, Selection S, Servicing Se, Sojourn So
    WHERE Re.request_id = new_request_id AND S.request_id = Re.request_id AND S.room_id = Ro.room_id AND S.service_id = Se.service_id AND Re.sojourn_id = So.sojourn_id
    GROUP BY Re.request_id;

    UPDATE Request R
    SET R.cost = (costocamere + costoservizi) * numgiorni
    WHERE R.request_id = new_request_id;
END //
DELIMITER ;


DELIMITER //
CREATE PROCEDURE calculate_cost_invoice(IN new_invoice_id INT)
BEGIN
    DECLARE costorischiesta FLOAT;
    DECLARE num_persone FLOAT;
    DECLARE sconto FLOAT;

    SELECT Re.cost, R.num_people, C.points INTO costorischiesta, num_persone, sconto
    FROM Invoice I, Reservation R, Request Re, Customer C
    WHERE I.invoice_number = new_invoice_id AND I.reservation_id = R.reservation_id AND R.reservation_id = Re.reservation_id AND C.customer_id = R.customer_id;

    UPDATE Invoice I
    SET I.amount = ((costorischiesta * num_persone) + ((costorischiesta * num_persone) * I.rate / 100)) - sconto
    WHERE I.invoice_number = new_invoice_id;
END //
DELIMITER ;

/*

DELIMITER //
CREATE PROCEDURE calculate_cost_invoice(IN new_invoice_id INT)
BEGIN
    UPDATE Invoice i
    INNER JOIN Request r ON i.reservation_id = r.reservation_id
    INNER JOIN Reservation re ON r.reservation_id = re.reservation_id 
    INNER JOIN Customer c ON re.customer_id = c.customer_id
    SET i.amount = r.cost * re.num_people * i.rate - c.points
    WHERE i.invoice_number = new_invoice_id;
END //
DELIMITER ;

*/