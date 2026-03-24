-- 1. Inserir Administrador (id 1)
INSERT INTO Admin (nome, email, password) 
VALUES ('Admin SaudINOB', 'admin@saudinob.pt', 'admin123');

-- 2. Inserir Médicos (associados ao admin 1)
INSERT INTO Medico (nome, email, password, especialidade, telefone, admin_id) VALUES
('Dr. João Silva', 'joao.silva@saudinob.pt', 'med123', 'Pneumologia', '910000001', 1),
('Dra. Ana Santos', 'ana.santos@saudinob.pt', 'med123', 'Clínica Geral', '910000002', 1);

-- 3. Inserir Utentes
INSERT INTO Utente (nome, email, password, telefone, data_nascimento, medico_id, admin_id) VALUES
('Carlos Martins', 'carlos.m@email.com', 'user123', '920000001', '1975-05-12', 1, 1),
('Maria Oliveira', 'maria.o@email.com', 'user123', '920000002', '1982-10-24', 2, 1);

-- 4. Inserir Avaliações CARAT simuladas (para o utente Carlos, id 1)
INSERT INTO AvaliacaoCARAT (respostas, score_total, interpretacao, utente_id) VALUES
('{"q1": 4, "q2": 4, "q3": 4, "q4": 4}', 26, 'Controlado', 1),
('{"q1": 2, "q2": 1, "q3": 2, "q4": 2}', 15, 'Controlo Insuficiente', 1);

-- 5. Inserir Sintomas para o utente Carlos (id 1)
INSERT INTO Sintoma (descricao, severidade, utente_id) VALUES
('Tosse noturna persistente', 'Moderada', 1),
('Falta de ar ao subir escadas', 'Grave', 1);

-- 6. Inserir Medicação para a utente Maria (id 2)
INSERT INTO Medicacao (nome, dose, periodo, utente_id) VALUES
('Inalador Corticosteroide', '2 puffs', '12/12h', 2);