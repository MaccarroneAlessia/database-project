CREATE DATABASE IF NOT EXISTS beb;

USE beb;

CREATE TABLE IF NOT EXISTS Season ( 
    /*Stagione (id_stagione, mese, tariffa) 
    Season (season_id, month, rate) */
    season_id INTEGER UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    month_ SMALLINT UNSIGNED,
    rate FLOAT UNSIGNED DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS Customer ( 
    /*Cliente (id_cliente, nome, cognome, telefono, mail, cc, num_tessera, punti, data_in, data_fine)
    Customer (customer_id, first_name, last_name, phone, email, banking_count, num_card, pointEGERs, start_date, end_date)*/
    customer_id INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(30),
    last_name VARCHAR(35) NOT NULL,
    phone VARCHAR(13) NOT NULL,
    email VARCHAR(40) NOT NULL,
    banking_count VARCHAR(16),
    num_card INTEGER UNSIGNED,
    points INTEGER UNSIGNED DEFAULT 0,
    start_date_card TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    end_date DATE,
    PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS Home ( 
    /*Sede (id_sede, indirizzo, nome) 
    Home (home_id, address, name) */
    home_id INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    address_home VARCHAR(50),
    name_home VARCHAR(30),
    PRIMARY KEY (`home_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS Contact ( 
    /*Recapito (id_recapito, ruolo, ufficio, telefono, id_sede) 
    Contact (contact_id, role_staff, office, phone, home_id) */
    contact_id INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    role_staff VARCHAR(30),
    office VARCHAR(30),
    phone VARCHAR(13) NOT NULL,
    home_id INTEGER UNSIGNED,
    FOREIGN KEY (`home_id`) REFERENCES Home(`home_id`),
    PRIMARY KEY (`contact_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS Room ( 
    /*Camera (id_camera, nome, tipologia, descrizione, tariffa, disponibilità, id_sede) 
    Room (room_id, name, type, description, rate, availability, home_id) */
    room_id INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    name_room VARCHAR(30),
    type_room VARCHAR(50),
    description_room TEXT,
    rate FLOAT UNSIGNED NOT NULL DEFAULT 0,
    availability_room BOOLEAN NOT  NULL DEFAULT 0,
    home_id INTEGER UNSIGNED,
    FOREIGN KEY (`home_id`) REFERENCES Home(`home_id`),
    PRIMARY KEY (`room_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS Servicing ( 
    /*Servizio (id_servizio, descrizione, tariffa, id_sede) 
    Service (service_id, description, rate, home_id) */
    service_id INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    description_service TEXT,
    rate FLOAT UNSIGNED NOT NULL DEFAULT 0,
    home_id INTEGER UNSIGNED,
    FOREIGN KEY (`home_id`) REFERENCES Home(`home_id`),
    PRIMARY KEY (`service_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS PrivateService ( 
    /*ServizioPrivato (id_servizio, tariffa, descrizione, id_camera) 
    PrivateService (service_id, rate, description, room_id) */
    private_service_id INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    rate FLOAT UNSIGNED DEFAULT 0,
    description_service TEXT,
    room_id INTEGER UNSIGNED,
    FOREIGN KEY (`room_id`) REFERENCES Room(`room_id`),
    PRIMARY KEY (`private_service_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS Staff ( 
    /*Personale (CF, cognome, nome, telefono, email, ore_lav, stipendio, ruolo, id_sede, id_recapito)
    Staff (CF, last_name, first_name, phone, email, hours_worked, salary, role_staff, home_id, contact_id) */
    CF VARCHAR(16) NOT NULL UNIQUE,
    last_name VARCHAR(35),
    first_name VARCHAR(35),
    phone VARCHAR(13),
    email VARCHAR(40),
    hours_worked INTEGER UNSIGNED DEFAULT 0,
    salary INTEGER UNSIGNED DEFAULT 0,
    role_staff VARCHAR(40),
    home_id INTEGER UNSIGNED,
    contact_id INTEGER UNSIGNED,
    FOREIGN KEY (`home_id`) REFERENCES Home(`home_id`),
    FOREIGN KEY (`contact_id`) REFERENCES Contact(`contact_id`),
    PRIMARY KEY (`CF`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS Report ( 
    /*Report (report_id, data, incassi, id_personale) 
    Report (report_id, curr_date, collections, staff_id) */
    report_id INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    curr_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    collections FLOAT NOT NULL,
    staff_id VARCHAR(16),
    FOREIGN KEY (`staff_id`) REFERENCES Staff(`CF`),
    PRIMARY KEY (`report_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS Reservation ( 
    /*Prenotazione (id_prenotazione, data, num_persone, id_cliente, id_fattura)
    Reservation (reservation_id, date, num_people, customer_id, invoice_id) */
    reservation_id INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    date_ TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    num_people INTEGER UNSIGNED,
    customer_id INTEGER UNSIGNED,
    FOREIGN KEY (`customer_id`) REFERENCES Customer(`customer_id`),
    PRIMARY KEY (`reservation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE IF NOT EXISTS Invoice ( 
    /*Fattura (numero, data, aliquota, importo, emittente, tipo, descrizione, id_cliente, report_id)
    Invoice (invoice_number, curr_date, rate, amount, issuer, type, description, customer_id, report_id)*/
    invoice_number INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    curr_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    rate FLOAT,
    amount FLOAT NOT NULL DEFAULT 0,
    issuer VARCHAR(70),
    pay_type VARCHAR(30),
    pay_description TEXT,
    customer_id INTEGER UNSIGNED,
    report_id INTEGER UNSIGNED,
    reservation_id INTEGER UNSIGNED,
    FOREIGN KEY (`customer_id`) REFERENCES Customer(`customer_id`),
    FOREIGN KEY (`report_id`) REFERENCES Report(`report_id`),
    FOREIGN KEY (`reservation_id`) REFERENCES Reservation(`reservation_id`),
    PRIMARY KEY (`invoice_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS Review ( 
    /*Recensione (id_cliente, id_camera, num_stelle, commento)
    Review (customer_id, room_id, num_stars, comment)*/
    customer_id INTEGER UNSIGNED,
    room_id INTEGER UNSIGNED,
    FOREIGN KEY (`customer_id`) REFERENCES Customer(`customer_id`), 
    FOREIGN KEY (`room_id`) REFERENCES Room(`room_id`),
    num_stars SMALLINT UNSIGNED,
    comment TEXT,
    PRIMARY KEY (`customer_id`, `room_id`, `num_stars`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS Signup ( 
    /*Registrazione (id_cliente, id_sede, password)
    Signup (customer_id, home_id, password) */
    customer_id INTEGER UNSIGNED,
    home_id INTEGER UNSIGNED,
    FOREIGN KEY (`customer_id`) REFERENCES Customer(`customer_id`),
    FOREIGN KEY (`home_id`) REFERENCES Home(`home_id`),
    password VARCHAR(30),
    PRIMARY KEY (`customer_id`, `home_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS Sojourn ( 
    /*Soggiorno (id_soggiorno, data_in, data_fin, id_stagione) 
    Sojourn (sojourn_id, date_in, date_fin, id_season) */
    sojourn_id INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    date_in DATE NOT NULL,
    date_fin DATE NOT NULL,
    season_id INTEGER UNSIGNED,
    FOREIGN KEY (`season_id`) REFERENCES Season(`season_id`),
    PRIMARY KEY (`sojourn_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS Request ( 
    /*Richiesta (id_richiesta, note, costo, id_prenotazione, id_soggiorno, id_personale)
    Request (request_id, notes, cost, reservation_id, sojourn_id, staff_id) */
    request_id INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    notes TEXT,
    cost FLOAT DEFAULT 0,
    reservation_id INTEGER UNSIGNED,
    sojourn_id INTEGER UNSIGNED,
    staff_id VARCHAR(16),
    FOREIGN KEY (`reservation_id`) REFERENCES Reservation(`reservation_id`),
    FOREIGN KEY (`sojourn_id`) REFERENCES Sojourn(`sojourn_id`),
    FOREIGN KEY (`staff_id`) REFERENCES Staff(`CF`),
    PRIMARY KEY (`request_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS Selection ( 
    /*Selezione  (id_selezione, id_richiesta, id_camera, id_servizio) 
    Selection (selection_id, request_id, room_id, service_id) */
    selection_id INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    request_id INTEGER UNSIGNED,
    room_id INTEGER UNSIGNED,
    service_id INTEGER UNSIGNED,
    FOREIGN KEY (`request_id`) REFERENCES Request(`request_id`),
    FOREIGN KEY (`room_id`) REFERENCES Room(`room_id`),
    FOREIGN KEY (`service_id`) REFERENCES Servicing(`service_id`),
    PRIMARY KEY (`selection_id`, `request_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

