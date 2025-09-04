PRAGMA foreign_keys = ON;

CREATE TABLE participante (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    email TEXT NOT NULL UNIQUE,
    telefone TEXT 
);

CREATE TABLE evento (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    descricao TEXT,
    data TEXT NOT NULL,
    local TEXT NOT NULL
);


CREATE TABLE inscricao (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    participante_id INTEGER NOT NULL,
    evento_id INTEGER NOT NULL,
    data_inscricao TEXT,
    status TEXT CHECK(status IN ('confirmada', 'cancelada')),
    FOREIGN KEY (participante_id) REFERENCES participante(id) ON DELETE CASCADE,
    FOREIGN KEY (evento_id) REFERENCES evento(id) ON DELETE CASCADE
   
);



CREATE TABLE pagamento(
   id INTEGER PRIMARY KEY AUTOINCREMENT,
   inscricao_id INTEGER UNIQUE,
   valor REAL ,
   data_pagamento TEXT,
   status TEXT CHECK(status IN ('pendente', 'pago')),
   FOREIGN KEY (inscricao_id) REFERENCES inscricao(id) ON DELETE CASCADE
)

INSERT INTO tabela (col1, col2, ...) VALUES (v1, v2, ...);
-- Exemplo de inserção de dados

-- participantes
INSERT INTO participante (nome, email, telefone) VALUES ('João Silva', 'joao.silva@example.com', '1234-5678');
INSERT INTO participante (nome, email, telefone) VALUES ('Maria Oliveira', 'maria.oliveira@example.com', '8765-4321');
INSERT INTO participante (nome, email, telefone) VALUES ('Carlos Souza', 'carlos.souza@example.com', '1357-2468');

-- eventos
INSERT INTO evento (nome, descricao, data, local) VALUES ('Workshop de Python', 'Aprenda os fundamentos do Python.', '2024-07-15', 'Sala 101');
INSERT INTO evento (nome, descricao, data, local) VALUES ('Seminario Sql', 'discussão sobre SQL', '2024-08-20', 'sala 202');

-- inscrições
INSERT INTO inscricao (participante_id, evento_id, data_inscricao, status) VALUES (1, 2, '2024-06-01', 'confirmada');
INSERT INTO inscricao (participante_id, evento_id, data_inscricao, status) VALUES (3, 1, '2024-06-02', 'confirmada');
INSERT INTO inscricao (participante_id, evento_id, data_inscricao, status) VALUES (2, 2, '2024-06-03', 'confirmada');
INSERT INTO inscricao (participante_id, evento_id, data_inscricao, status) VALUES (1, 1, '2024-06-04', 'confirmada');

-- pagamentos
INSERT INTO pagamento (inscricao_id, valor, data_pagamento, status) VALUES (1, 100.00, '2024-06-01', 'pago');
INSERT INTO pagamento (inscricao_id, valor, data_pagamento, status) VALUES (2, 150.00, '2024-06-02', 'pago');
INSERT INTO pagamento (inscricao_id, valor, data_pagamento, status) VALUES (3, 200.00, '2024-06-03', 'pago');
INSERT INTO pagamento (inscricao_id, valor, data_pagamento, status) VALUES (4, 100.00, '2024-06-04', 'pago');