--select
SELECT nome, idade FROM clientes WHERE cidade = 'São Paulo';
--insert
INSERT INTO clientes (nome, idade, cidade) VALUES ('João', 30, 'Rio de Janeiro');
--update
UPDATE clientes SET idade = 31 WHERE nome = 'João';
--delete
DELETE FROM clientes WHERE nome = 'João';
