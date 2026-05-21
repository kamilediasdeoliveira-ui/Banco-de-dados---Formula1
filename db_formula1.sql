CREATE DATABASE db_formula1;
USE db_formula1;

CREATE TABLE paises (
    codigo VARCHAR(3) NOT NULL,
    nome VARCHAR(60) NOT NULL,
    PRIMARY KEY (codigo)
);

CREATE TABLE equipes (
    sigla VARCHAR(3) NOT NULL,
    nome VARCHAR(60) NOT NULL,
    cod_pais VARCHAR(3) NOT NULL,
    PRIMARY KEY (sigla),
    FOREIGN KEY (cod_pais) REFERENCES paises(codigo)
);

CREATE TABLE pilotos (
    numero INT NOT NULL,
    nome VARCHAR(60) NOT NULL,
    cod_pais VARCHAR(3) NOT NULL,
    sigla_equipe VARCHAR(3) NOT NULL,
    PRIMARY KEY (numero),
    FOREIGN KEY (cod_pais) REFERENCES paises(codigo),
    FOREIGN KEY (sigla_equipe) REFERENCES equipes(sigla)
);

CREATE TABLE corridas (
    sigla_gp VARCHAR(3) NOT NULL,
    nome_gp VARCHAR(60) NOT NULL,
    cod_pais VARCHAR(3) NOT NULL,
    qtd_voltas INT NOT NULL,
    PRIMARY KEY (sigla_gp),
    FOREIGN KEY (cod_pais) REFERENCES paises(codigo)
);

CREATE TABLE participantes (
    sigla_gp VARCHAR(3) NOT NULL,
    num_piloto INT NOT NULL,
    posicao_largada INT NOT NULL,
    PRIMARY KEY (sigla_gp, num_piloto),
    FOREIGN KEY (sigla_gp) REFERENCES corridas(sigla_gp),
    FOREIGN KEY (num_piloto) REFERENCES pilotos(numero)
);

INSERT INTO paises (codigo, nome) VALUES
('BRA', 'Brasil'),
('FRA', 'França'),
('ITA', 'Itália'),
('GBR', 'Reino Unido'),
('AUT', 'Áustria'),
('USA', 'Estados Unidos'),
('JPN', 'Japão'),
('GER', 'Alemanha'),
('ARG', 'Argentina'),
('ESP', 'Espanha');

INSERT INTO equipes (sigla, nome, cod_pais) VALUES
('FER', 'Scuderia Ferrari', 'ITA'),
('MER', 'Mercedes-AMG PETRONAS F1 Team', 'GER'),
('RBR', 'Oracle Red Bull Racing', 'AUT'),
('MCL', 'McLaren Formula 1 Team', 'GBR'),
('AST', 'Aston Martin Aramco F1 Team', 'GBR'),
('ALP', 'BWT Alpine F1 Team', 'FRA'),
('AUD', 'Audi F1 Team', 'GER'),
('CAD', 'Cadillac Formula 1 Team', 'USA'),
('HAA', 'MoneyGram Haas F1 Team', 'USA'),
('WIL', 'Williams Racing', 'GBR'),
('RBU', 'Visa Cash App RB F1 Team', 'ITA');


INSERT INTO pilotos (numero, nome, cod_pais, sigla_equipe) VALUES
(10, 'Gabriel Silva', 'BRA', 'FER'),
(11, 'Lucas Oliveira', 'BRA', 'RBR'),
(25, 'Mateus Santos', 'BRA', 'WIL'),
(33, 'Bruno Ferreira', 'BRA', 'AUD'),
(77, 'Thiago Costa', 'BRA', 'HAA'),
(99, 'Giovanni Russo', 'ITA', 'FER'),
(42, 'Leonardo Conti', 'ITA', 'RBU'),
(7, 'Alessandro Ferrari', 'ITA', 'MER'),
(22, 'Thomas Bernard', 'FRA', 'ALP'),
(8, 'Nicolas Petit', 'FRA', 'ALP'),
(5, 'Facundo Morales', 'ARG', 'RBR'),
(1, 'Lukas Weber', 'GER', 'MER'),
(45, 'Ichiro Tanaka', 'JPN', 'RBU'),
(14, 'Javier Garcia', 'ESP', 'AST'),
(55, 'Alejandro Lopez', 'ESP', 'WIL'),
(27, 'Michael Johnson', 'USA', 'CAD'),
(28, 'David Smith', 'USA', 'CAD'),
(3, 'James Wilson', 'GBR', 'MCL'),
(4, 'Harry Brown', 'GBR', 'MCL'),
(18, 'William Taylor', 'GBR', 'AST'),
(20, 'George Evans', 'GBR', 'AUD'),
(19, 'Arthur Wright', 'GBR', 'WIL'),
(88, 'Lewis Jones', 'GBR', 'HAA');

INSERT INTO corridas (sigla_gp, nome_gp, cod_pais, qtd_voltas) VALUES
('SAO', 'GP de São Paulo', 'BRA', 71),
('MNZ', 'GP da Itália', 'ITA', 53),
('SIL', 'GP da Grã-Bretanha', 'GBR', 52),
('SPI', 'GP da Áustria', 'AUT', 71),
('SUZ', 'GP do Japão', 'JPN', 53),
('CAT', 'GP da Espanha', 'ESP', 66),
('MIA', 'GP de Miami', 'USA', 57),
('COT', 'GP dos Estados Unidos', 'USA', 56), -- Austin
('LVS', 'GP de Las Vegas', 'USA', 50),
('LEC', 'GP da França', 'FRA', 53);

INSERT INTO participantes (sigla_gp, num_piloto, posicao_largada) VALUES
('SAO', 10, 1),
('SAO', 99, 2),
('SAO', 1, 3),
('SAO', 3, 4),
('SAO', 22, 5),
('SAO', 11, 6),
('SAO', 5, 7),
('SAO', 7, 8),
('SAO', 4, 9),
('SAO', 8, 10),
('SAO', 27, 11),
('SAO', 14, 12),
('SAO', 25, 13),
('SAO', 42, 14),
('SAO', 18, 15),
('SAO', 33, 16),
('SAO', 20, 17), 
('SAO', 28, 18),
('SAO', 45, 19),
('SAO', 55, 20),
('SAO', 77, 21),
('SAO', 88, 22);

-- QUERIES 
 #  ETAPA 3 - Lista o nome dos países que começam com a letra B e terminam com a letra L.
 SELECT  nome
 FROM paises
 WHERE nome LIKE "B%L";
 
 # ETAPA 4 - Lista o nome dos pilotos que são dos países BRASIL, ITÁLIA e FRANÇA
 SELECT nome
 FROM pilotos
 WHERE cod_pais  IN('BRA','ITA','FRA')
 order by nome asc;
 
 # ETAPA 5 -  Lista o nome dos pilotos
 SELECT nome 
 FROM pilotos;
 
 # ETAPA 6 - Lista o nome dos gp e a quantidade de voltas (use ALIAS)
 SELECT nome_gp AS 'GRANDS PRIX', qtd_voltas AS ' QUANTIDADE DE VOLTAS'
 FROM corridas;
 
 # ETAPA 7 - Lista o nome dos pilotos e seus países
SELECT pilotos.nome AS 'PILOTOS' , paises.nome AS 'PAÍS'
FROM pilotos inner join paises
on pilotos.cod_pais = paises.codigo;

#  ETAPA 8 - Adição do atributo salário na tabela piloto
ALTER TABLE pilotos ADD salario FLOAT(8,2);

# ETAPA 9 - Populando o atributo salário da tabela piloto
SELECT * FROM pilotos  -- Só para verificar se a tabela foi populada
ORDER BY numero asc;

UPDATE pilotos  SET salario = 100000 WHERE numero = '10';
UPDATE pilotos  SET salario = 90000 WHERE numero = '55';
UPDATE pilotos  SET salario = 80000 WHERE numero = '7';
UPDATE pilotos  SET salario = 69000 WHERE numero = '19';
UPDATE pilotos  SET salario = 80000 WHERE numero = '33';
UPDATE pilotos  SET salario = 100000 WHERE numero = '28';
UPDATE pilotos  SET salario = 65000 WHERE numero = '5';
UPDATE pilotos  SET salario = 340000 WHERE numero = '20';
UPDATE pilotos  SET salario = 88000 WHERE numero = '99';
UPDATE pilotos  SET salario = 112000 WHERE numero = '4';
UPDATE pilotos  SET salario = 89000 WHERE numero = '45';
UPDATE pilotos  SET salario = 233000 WHERE numero = '3';
UPDATE pilotos  SET salario = 90000 WHERE numero = '14';
UPDATE pilotos  SET salario = 91000 WHERE numero = '18';
UPDATE pilotos  SET salario = 74000 WHERE numero = '42';
UPDATE pilotos  SET salario = 89000 WHERE numero = '88';
UPDATE pilotos  SET salario = 90000 WHERE numero = '11';
UPDATE pilotos  SET salario = 81000 WHERE numero = '1';
UPDATE pilotos  SET salario = 95000 WHERE numero = '25';
UPDATE pilotos  SET salario = 88000 WHERE numero = '27';
UPDATE pilotos  SET salario = 220000 WHERE numero = '8';
UPDATE pilotos  SET salario = 110000 WHERE numero = '77';
UPDATE pilotos  SET salario = 90000 WHERE numero = '22';

 # ETAPA 10 - Lista o nome dos pilotos cujos salários sejam entre 70 e 100 mil
 SELECT nome as 'NOME DOS PILOTOS QUE RECEBEM ENTRE $70.000 E $100.000'
 FROM pilotos
 WHERE salario BETWEEN 70000 AND 100000;

# ETAPA 11-  Retorne para cada cod_pais, a média salarial dos empregados
SELECT ROUND(AVG(salario),2) AS ' MÉDIA SALARIAL', cod_pais AS 'CODIGO DO PAÍS' 
FROM pilotos
GROUP BY cod_pais;



# ETAPA 12 - Exiba todos os diferentes valores dos salários contidos na tabela pilotos ordenados em ordem crescente de valor
SELECT distinct(salario) AS ' FAIXA SALARIAL DOS PILOTOS(DO MENOR ATÉ O MAIOR SALÁRIO)'
FROM pilotos
ORDER BY salario ASC;

select cod_pais as 'Codigo do País', count(*) as 'Total de Pilotos'
from pilotos
group by cod_pais


 