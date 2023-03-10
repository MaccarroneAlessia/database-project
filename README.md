# database-project

### Project report :
https://docs.google.com/presentation/d/1cMVPjF0AZqicDH3ZbJ3HvmyrWora0he0QCBW3J7WFGU/edit?usp=sharing

## What's in it
The following repository contains a database design for the management of a Bed and Breakfast.
It begins by scanning all the various steps from reality analysis to physical design in SQL and implementation of a test web interface with Laravel.

## How to run the project 
### with mysql
```bash
cd database-project/src/sql\ operations/
sudo mysql -u root < tables.sql
sudo mysql -u root < operations.sql
sudo mysql -u root < trigger.sql
sudo mysql -u root < table_population.sql

sudo mysql -u admin -padmin

cd /etc/phpmyadmin
php -S localhost:7777
```

### Visualizing the web interface
```bash
cd database-project/src/sql\ operations/
sudo mysql -u root < mysql_setup.sql

cd database-project/src/webManagement/
php artisan migrate
php artisan route:list --exception-vendor
php artisan serve
```
