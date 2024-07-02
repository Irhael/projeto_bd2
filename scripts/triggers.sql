-- TRIGGERS

-- Function
CREATE OR REPLACE FUNCTION att_quantidade_users()
RETURNS TRIGGER AS $$
BEGIN
    UPDATE Plataforma
    SET qtd_users = qtd_users + 1
    WHERE nro = NEW.nro_plataforma;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Trigger
CREATE TRIGGER trg_att_quantidade_users
AFTER INSERT ON PlataformaUsuario
FOR EACH ROW
EXECUTE FUNCTION att_quantidade_users();
