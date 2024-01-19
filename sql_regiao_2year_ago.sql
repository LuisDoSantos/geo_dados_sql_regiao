/* Aqui iremos remover os espaços entre as colunas e trocar por ponto e virgula */
UPDATE sua_tabela
SET sua_coluna = REPLACE(sua_coluna, ' ', ';');
/* em postgressql 
UPDATE sua_tabela
SET sua_coluna = TRANSLATE(sua_coluna, ' ', ';');
*/

/*incluiremos 0 em dados nulos caso int, e adicionar 'nulo' caso string
no postgressql continua igual
*/
UPDATE sua_tabela
SET sua_coluna = COALESCE(sua_coluna, 0) -- Se for inteiro
              , COALESCE(sua_coluna, 'nulo'); -- Se for string

/*agrupar dados de acordo com regiao
no postgressql continua igual
*/
SELECT regiao, COUNT(*) as total
FROM sua_tabela
GROUP BY regiao;

/*identifica e arquiva os dados com data > a 2 anos 

Em postgressql
INSERT INTO tabela_arquivamento
SELECT *
FROM sua_tabela
WHERE data < CURRENT_DATE - INTERVAL '2 years';

DELETE FROM sua_tabela
WHERE data < CURRENT_DATE - INTERVAL '2 years';
*/
INSERT INTO tabela_arquivamento
SELECT *
FROM sua_tabela
WHERE data < DATE_SUB(NOW(), INTERVAL 2 YEAR);

DELETE FROM sua_tabela
WHERE data < DATE_SUB(NOW(), INTERVAL 2 YEAR);

/* 
Ao analisar ou utilizar o codigo lembre que alguns dados são especificos de meu 
arquivo .csv utilizado mas que pode ser atualizado e manuseado para outros usos.
Caminho de arquivos foram alterados, lembre-se de alterar aonde esta 'sua_tabela'

*/

