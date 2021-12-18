CREATE OR REPLACE PROCEDURE add_new_flight(
    flight_id_ VARCHAR,
    airline_id_ VARCHAR,
    orig_airport_id VARCHAR,
    dest_airport_id VARCHAR
)
LANGUAGE 'plpgsql'
AS $$
BEGIN
    INSERT INTO flight_airline (airline, flight_id)
        VALUES (airline_id_, flight_id_);
    INSERT INTO flight_route (destination_airport, origin_airport, flight_id)
        VALUES (dest_airport_id, orig_airport_id, flight_id_);
END;
$$;
