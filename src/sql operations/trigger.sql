USE beb;

/*trigger che una volta registrato un utente ad una sede aggiunge il numero della tessera*/

DELIMITER //
CREATE TRIGGER T_tessera
AFTER INSERT ON Signup
FOR EACH ROW
BEGIN 
    UPDATE Customer C
    SET C.num_card = RAND()
    WHERE C.customer_id = new.customer_id;
END //
DELIMITER ;

