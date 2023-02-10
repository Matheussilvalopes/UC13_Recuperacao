CREATE DATABASE RPG
GO

USE RPG
GO 

CREATE TABLE Usuarios (
IdUsuario INT PRIMARY KEY IDENTITY,
Email VARCHAR(100) UNIQUE NOT NULL,
Senha VARCHAR(50) NOT NULL

)
GO

CREATE TABLE Classes (
IdClasse INT PRIMARY KEY IDENTITY,
Nome VARCHAR(50) UNIQUE NOT NULL,
Descri��o VARCHAR(250)
)
GO

CREATE TABLE Habilidades (
IdHabilidade INT PRIMARY KEY IDENTITY,
Nome VARCHAR(50)

)
GO

CREATE TABLE Personagens (
IdPersonagem INT PRIMARY KEY IDENTITY,
IdUsuario INT FOREIGN KEY REFERENCES Usuarios(IdUsuario),
IdClasse INT FOREIGN KEY REFERENCES Classes(IdClasse),
Nome VARCHAR(30) UNIQUE NOT NULL
)
GO

CREATE TABLE ClasseHabilidades (
IdClasseHabilidades INT PRIMARY KEY IDENTITY,
IdHabilidade INT FOREIGN KEY REFERENCES Habilidades(IdHabilidade),
IdClasse INT FOREIGN KEY REFERENCES Classes(IdClasse)
)
GO

INSERT INTO Classes VALUES
('Mago', 'Lan�a feiti�os'), -- (nome, descri��o da classe) segue a ordem de cria��o
('B�rbaro', 'Ataque forte'),
('Monge', 'Curandeiro')

GO

INSERT INTO Habilidades VALUES
('Lan�a Mortal'),
('Recuperar vida'),
('Bola de fogo'),
('Escudo Supremo'),
('Corrida r�pida')

GO

INSERT INTO Usuarios VALUES
('aphonso@email.com', 123123),
('dano@email.com',321321)
GO

INSERT INTO ClasseHabilidades VALUES
(3,1),(4,1), -- (bola de fogo e escudo supremo => Mago) --os pares devem seguir a ordem de cria��o, 
-- Na tabela Classe Habilidade, primeiro foi referenciada a IdHabilidade e depois a IdClasse por isso � (3,1) e n�o (1,3).
-- Lembrando que pela L�gica uma classe pode ter v�rias habilidadades, por isso temos (3,1),(4,1)
-- Se fosse 1 por 1 cada classe poderia ter apenas uma habilidade.

(4,2),(1,2),(5,2), --(Escudo supremo, Lan�a Mortal, Corrida r�pida => B�rbaro)

(4,3),(2,3),(5,3) -- (Escudo Supremo, Recuperar Vida, Corrida R�pida => Monge)
GO

INSERT INTO Personagens VALUES
(1,2,'Deubug'),(2,1,'Bitbug') --Sempre que for inserir algum valor na tabela, fiqeu atento a ordem de cria��o dos atributos, nesse caso (Nome, IdUsuario, IdClasse)
GO

INSERT INTO Usuarios VALUES
('deletar@email.com', 123445)

DELETE FROM Usuarios WHERE IdUsuario = 3

UPDATE Usuarios SET Email='aphonso@email.com.br' WHERE IdUsuario=1


--DQL Consultas


SELECT * FROM Usuarios
SELECT * FROM Classes
SELECT * FROM Personagens
SELECT * FROM Habilidades

SELECT p.Nome, u.Email FROM Personagens P
INNER JOIN Usuarios U ON P.IdUsuario = U.IdUsuario

SELECT p.Nome,c.Nome, H.Nome FROM Personagens P
INNER JOIN Classes C ON P.IdUsuario = C.IdClasse
INNER JOIN ClasseHabilidades CH ON C.IdClasse = CH.IdClasse
INNER JOIN Habilidades H ON CH.IdHabilidade= H.IdHabilidade

