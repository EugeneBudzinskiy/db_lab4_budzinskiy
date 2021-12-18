CREATE OR REPLACE FUNCTION get_flights_count(airline_id_ VARCHAR)
RETURNS INT
LANGUAGE 'plpgsql'
AS $$
BEGIN
    RETURN (SELECT COUNT(*) FROM flight_airline WHERE airline = airline_id_);
END;
$$;
