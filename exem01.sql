-- ============================================================================
-- 02/10/2025 aula ministrada pelo professor Anderson Valadão
-- disciplina de SGBD, 6° período curso de engenharia da computação - UEMG
-- ============================================================================

-- criacao das tabelas
CREATE TABLE clientes(
  cliente_id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(100),
  email VARCHAR(100),
  estado CHAR(2)
);
  
 CREATE TABLE pedidos(
   pedido_id INT AUTO_INCREMENT PRIMARY KEY,
   cliente_id INT,
   data_pedido DATE,
   valor DECIMAL(10, 2),
   FOREIGN KEY (cliente_id) REFERENCES clientes(cliente_id)
);

-- insercao e consulta de dados
INSERT INTO clientes(nome, email, estado) VALUES
('lucas Melo', '@gmail.com', 'SP'),
('juninho', '@gmail.com', 'SP'),
('luquinha', '@gmail.com', 'SP');

INSERT INTO pedidos(cliente_id, data_pedido, valor) VALUES
(1, '2025-09-01', 150.00),
(2, '2025-08-01', 500.00),
(3, '2025-08-01', 500.00),
(1, '2025-07-01', 600.00);

SELECT * FROM pedidos;

SELECT c.cliente_id, c.nome, COUNT(p.pedido_id) AS total_pedidos, SUM(p.valor) AS total_gasto
FROM clientes c
INNER JOIN pedidos p ON c.cliente_id=p.cliente_id
GROUP BY c.cliente_id, c.nome;
