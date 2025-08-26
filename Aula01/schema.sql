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