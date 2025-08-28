--ativa FK

PRAGMA foreign_keys = ON;

--cria tabela de usuarios

CREATE TABLE usuarios (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    email TEXT NOT NULL UNIQUE,
    senha TEXT NOT NULL
);

CREATE TABLE cliente(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    email TEXT NOT NULL UNIQUE,
    telefone TEXT NOT NULL,
    usuario_id INTEGER NOT NULL UNIQUE,
    FOREIGN KEY (usuario_id) REFERENCES usuarios (id) ON DELETE CASCADE
);


-- TABELA PRODUTO

CREATE TABLE produto (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    descricao TEXT,
    preco REAL NOT NULL CHECK (preco > 0)
);

-- TABELA VENDAS

CREATE TABLE venda (
     id INTEGER PRIMARY KEY AUTOINCREMENT,
     data TEXT NOT NULL,
     usuario_id INTEGER NOT NULL,
     FOREIGN KEY (usuario_id) REFERENCES usuarios (id) ON DELETE SET NULL
);


CREATE TABLE itens_venda (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    venda_id INTEGER NOT NULL,
    produto_id INTEGER NOT NULL,
    quantidade INTEGER NOT NULL CHECK (quantidade > 0),
    preco_unitario REAL NOT NULL CHECK (preco_unitario > 0),
    FOREIGN KEY (venda_id) REFERENCES venda (id) ON DELETE CASCADE,
    FOREIGN KEY (produto_id) REFERENCES produto (id) ON DELETE CASCADE
);

--PRIMARY KEY (venda_id, produto_id), -- CHAVE COMPOSTA

-- inserindo user
INSERT INTO usuarios (nome, email, senha) VALUES ('João Silva', 'joao@example.com', 'senha123');

INSERT INTO usuarios (nome, email, senha) VALUES ('Maria Souza', 'maria@example.com', 'senha456');

----------------------------------------------------------------------//--------------------------------------------------------------

-- inserindo user nos client

INSERT INTO cliente (nome, email, telefone, usuario_id) VALUES ('João Silva', 'joao@example.com', '999999999', 1);

INSERT INTO cliente (nome, email, telefone, usuario_id) VALUES ('Maria Souza', 'maria@example.com', '888888888', 2);

INSERT INTO cliente (nome, email, telefone, usuario_id) VALUES ('Carlos Oliveira', 'carlos@example.com', '777777777', 3);


----------------------------------------------------------------------//--------------------------------------------------------------
-- inserindo produtos 


INSERT INTO produto (nome, descricao, preco) VALUES ('Produto A', 'Descrição do Produto A', 10.50);

INSERT INTO produto (nome, descricao, preco) VALUES ('Produto A', 'Descrição do Produto A', 10.50);

INSERT INTO produto (nome, descricao, preco) VALUES ('Produto B', 'Descrição do Produto B', 20.00);

INSERT INTO produto (nome, descricao, preco) VALUES ('Produto C', 'Descrição do Produto C', 30.00);


----------------------------------------------------------------------//--------------------------------------------------------------

-- inserindo itens venda

INSERT INTO itens_venda (venda_id, produto_id, quantidade, preco_unitario) VALUES (1, 1, 2, 10.50);
INSERT INTO itens_venda (venda_id, produto_id, quantidade, preco_unitario) VALUES (1, 2, 1, 20.00);
INSERT INTO itens_venda (venda_id, produto_id, quantidade, preco_unitario) VALUES (2, 1, 1, 10.50);
INSERT INTO itens_venda (venda_id, produto_id, quantidade, preco_unitario) VALUES (2, 3, 2, 30.00);

----------------------------------------------------------------------//--------------------------------------------------------------
-- inserindo vendas

INSERT INTO venda (data, usuario_id) VALUES ('2023-01-01', 1);
INSERT INTO venda (data, usuario_id) VALUES ('2023-01-02', 2);
INSERT INTO venda (data, usuario_id) VALUES ('2023-01-03', 3);


----------------------------------------------------------------------//--------------------------------------------------------------
