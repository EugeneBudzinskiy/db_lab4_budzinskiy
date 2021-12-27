-- Check if name of new added airline is `NULL`, if so raise exception
CREATE OR REPLACE FUNCTION check_empty_airline_name()
RETURNS TRIGGER
LANGUAGE 'plpgsql'
AS $$
BEGIN
    IF NEW.airline_name is NULL THEN
        RAISE EXCEPTION '`airline_name` cannot be `NULL`';
    END IF;
    RETURN NULL;
END;
$$;

DROP TRIGGER IF EXISTS check_empty_airline_name_trigger on airlines;
CREATE TRIGGER check_empty_airline_name_trigger
AFTER INSERT ON airlines
FOR EACH ROW EXECUTE FUNCTION check_empty_airline_name();
