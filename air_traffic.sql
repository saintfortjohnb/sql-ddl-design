DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE airlines
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

INSERT INTO airlines (name)
VALUES ('United'), ('British Airways'), ('Delta'), ('TUI Fly Belgium'), ('Air China'), ('American Airlines'), ('Avianca Brasil');

CREATE TABLE countries
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

INSERT INTO countries (name)
VALUES ('United States'), ('Japan'), ('United Kingdom'), ('France'), ('Morocco'), ('UAE'), ('China'), ('Brazil'), ('Chile');

CREATE TABLE cities
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  country_id INTEGER REFERENCES countries(id)
);

INSERT INTO cities (name, country_id)
VALUES 
  ('Washington DC', 1), ('Seattle', 1), ('Los Angeles', 1), ('Las Vegas', 1), 
  ('New York', 1), ('Charlotte', 1), ('Cedar Rapids', 1), ('Chicago', 1), 
  ('New Orleans', 1), ('Tokyo', 2), ('London', 3), ('Paris', 4), 
  ('Casablanca', 5), ('Dubai', 6), ('Beijing', 7), ('Sao Paolo', 8), 
  ('Santiago', 9), ('Mexico City', 1);

CREATE TABLE flights
(
  id SERIAL PRIMARY KEY,
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL,
  airline_id INTEGER REFERENCES airlines(id),
  from_city_id INTEGER REFERENCES cities(id),
  to_city_id INTEGER REFERENCES cities(id)
);

INSERT INTO flights (departure, arrival, airline_id, from_city_id, to_city_id)
VALUES 
  ('2018-04-08 09:00:00', '2018-04-08 12:00:00', 1, 1, 2), 
  ('2018-12-19 12:45:00', '2018-12-19 16:15:00', 2, 10, 3), 
  ('2018-01-02 07:00:00', '2018-01-02 08:03:00', 3, 3, 4), 
  ('2018-04-15 16:50:00', '2018-04-15 21:00:00', 3, 2, 18), 
  ('2018-08-01 18:30:00', '2018-08-01 21:50:00', 4, 12, 13), 
  ('2018-10-31 01:15:00', '2018-10-31 12:55:00', 5, 14, 15), 
  ('2019-02-06 06:00:00', '2019-02-06 07:47:00', 1, 5, 6), 
  ('2018-12-22 14:42:00', '2018-12-22 15:56:00', 6, 7, 8), 
  ('2019-02-06 16:28:00', '2019-02-06 19:18:00', 6, 6, 9), 
  ('2019-01-20 19:30:00', '2019-01-20 22:45:00', 7, 16, 17);

CREATE TABLE tickets
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  seat TEXT NOT NULL,
  flight_id INTEGER REFERENCES flights(id)
);

INSERT INTO tickets (first_name, last_name, seat, flight_id)
VALUES 
  ('Jennifer', 'Finch', '33B', 1), 
  ('Thadeus', 'Gathercoal', '8A', 2), 
  ('Sonja', 'Pauley', '12F', 3), 
  ('Jennifer', 'Finch', '20A', 4), 
  ('Waneta', 'Skeleton', '23D', 5), 
  ('Thadeus', 'Gathercoal', '18C', 6), 
  ('Berkie', 'Wycliff', '9E', 7), 
  ('Alvin', 'Leathes', '1A', 8), 
  ('Berkie', 'Wycliff', '32B', 9), 
  ('Cory', 'Squibbes', '10D', 10);
