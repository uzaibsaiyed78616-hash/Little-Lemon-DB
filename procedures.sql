DELIMITER //

CREATE PROCEDURE GetMaxQuantity()
BEGIN
    SELECT MAX(Quantity) AS MaxQuantity FROM Orders;
END //

CREATE PROCEDURE AddBooking(
    IN booking_id INT,
    IN booking_date DATE,
    IN table_no INT,
    IN customer_id INT
)
BEGIN
    INSERT INTO Bookings VALUES (booking_id, booking_date, table_no, customer_id);
END //

CREATE PROCEDURE UpdateBooking(
    IN booking_id INT,
    IN new_date DATE
)
BEGIN
    UPDATE Bookings 
    SET BookingDate = new_date 
    WHERE BookingID = booking_id;
END //

CREATE PROCEDURE CancelBooking(
    IN booking_id INT
)
BEGIN
    DELETE FROM Bookings WHERE BookingID = booking_id;
END //

CREATE PROCEDURE ManageBooking(
    IN booking_date DATE,
    IN table_no INT
)
BEGIN
    IF EXISTS (
        SELECT * FROM Bookings 
        WHERE BookingDate = booking_date AND TableNo = table_no
    ) THEN
        SELECT 'Table already booked' AS Status;
    ELSE
        SELECT 'Table available' AS Status;
    END IF;
END //

DELIMITER ;