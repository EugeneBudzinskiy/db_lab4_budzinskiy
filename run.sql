-- Function implementation
DO $$
DECLARE id VARCHAR := 'AA';
DECLARE query_result INT;
BEGIN
    query_result = (SELECT count(*) FROM flight_airline WHERE airline = id);
    RAISE INFO '(Query) Flight count for `%`: %', id, query_result;
    RAISE INFO '( Func) Flight count for `%`: %', id, get_flights_count(id);
END;
$$;


-- Procedure implementation
CALL add_new_flight('AA0000','AA','ABE','ABI');
SELECT * FROM flight_route WHERE flight_id = 'AA0000';


-- Trigger implementation
INSERT INTO airlines (airline_id, airline_name) VALUES ('T1', NULL); -- Raise an error
INSERT INTO airlines (airline_id, airline_name) VALUES ('T2', 'TEST'); -- OK

SELECT * FROM airlines WHERE airline_id = 'T1';  -- Would be empty
SELECT * FROM airlines WHERE airline_id = 'T2';  -- Would has result