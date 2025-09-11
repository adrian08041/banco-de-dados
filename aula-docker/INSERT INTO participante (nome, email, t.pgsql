INSERT INTO participante (nome, email, telefone) VALUES ('João Silva', 'joao.silva@example.com', '1234-5678'),
('Maria Oliveira', 'maria.oliveira@example.com', '9876-5432'),
('Carlos Souza', 'carlos.souza@example.com', '5555-5555');


INSERT INTO evento (nome, descricao, data, local) VALUES 
('Conferência de Tecnologia', 'Evento anual sobre as últimas tendências em tecnologia.', '2024-09-15', 'Centro de Convenções'),
('Workshop de Marketing Digital', 'Aprenda as melhores práticas de marketing digital.', '2024-10-20', 'Hotel Central'),
('Seminário de Saúde e Bem-estar', 'Discussões sobre saúde mental e física.', '2024-11-05', 'Auditório Municipal');

INSERT INTO inscricao (id_participante, id_evento, data_inscricao, status) VALUES 
(1, 1, '2024-08-01', 'confirmada'),
(2, 1, '2024-08-02', 'pendente'),
(3, 2, '2024-09-15', 'cancelada'),
(1, 3, '2024-10-10', 'confirmada');

INSERT INTO pagamento (id_inscricao, valor, data_pagamento, status) VALUES 
(1, 150.00, '2024-08-05', 'pago'),
(4, 100.00, '2024-10-15', 'pago');