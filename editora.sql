mysql -h localhost -u root -p

Create database Editora;

use Editora;

create table Livrarias(
    IDLivraria int not null primary key auto_increment,
    NomeLivraria varchar(30) not null,
    Endereco varchar(100) not null,
    Telefone bigint not null
);

create table Livros(
    IDLivro int not null primary key auto_increment,
    TituloLivro varchar(30) not null, 
    Autor varchar(50) not null,
    PrecoUnitario decimal(5,2)
);

create table NotasFiscais(
    IDVenda int not null primary key auto_increment,
    DataVenda datetime not null,
    IDLivraria int not null,
    constraint fk_NotasFiscais foreign key (IDLivraria)
    references Livrarias (IDLivraria)
);

create table ItensNF(
    IDVenda int not null,
    IDLivro int not null ,
    QtdeVendida int not null,
    constraint fk_ItensNf foreign key (IDVenda)
    references NotasFiscais (IDVenda),
    constraint fk_ItensNfIdLivro foreign key (IDLivro)
    references livros (IDLivro);


insert into Livrarias 
values (null, "Livraria Francesa", "Rua Barão de Itapetininga, 275", '1132314555'),
(null, "Livraria da Vila", "Rua Fradique Coutinho, 915", "1138145811"),
(null, "Devir Livraria Ltda", "Rua Teodureto Souto, 624", "1121278787"),
(null, "Livraria Cultura", "Avenida Paulista, 2073", "1131704033"),
(null, "Moonshadowns Livraria", "Rua Treze de Maio, 966", "1932663916");

insert into Livros 
values (null, "Windowns Vista", "Suriani, Rogério Massaro", '35.00'),
(null, "Organização de sistemas", "Fernandes, Leila Maria Pinheiro", '34.00'),
(null, "Logica de programação", "Xavier, Gley Fabiano Cardoso", '87.00'),
(null, "Linkania: Uma teoria de redes", "Dimantas, Hernani", '299.00'),
(null, "Internet: Navegando melhor na web", "Filho, Ozeas Vieira Santana", '40.00'),
(null, "Inclusão digital: uma visão critica", "Cazeloto, edilson", '47.00'),
(null, "Guia internet de conectividade", "Cyclades, edilson", '47.00'),
(null, "Estrategias para midia digitel 2.0", "Correa, elizabeth saad", '87.00'),
(null, "Corel draw x4", "Andrade, maria angel searfim de", '74.00'),
(null, "comunidades virtuais", "filho, jayme teixeira", '32.00');

insert into NotasFiscais
values (null, '2021-11-08', 4),
(null, '2021-11-08', 5),
(null, '2021-11-10', 2),
(null, '2021-11-15', 1);

insert into ItensNF 
values (1,3,5),(1, 9, 10),(1, 1, 20),(2, 10, 2),(3, 8, 15),(3, 10, 15),(3, 2, 15),(4, 5, 10),(4, 7, 5),(4, 6, 10),(4, 2, 5);

select * from Livros where PrecoUnitario > 40.50;

select nomeLivraria from Livrarias where telefone like '32%';

select IDvenda,dataVenda,IDLivraria as nomelivraria from NotasFiscais;

select idVenda,idlivro as titulolivro, qtdeVendida from itensNf;

select itensNF.idVenda,itensnf.idlivro as titulolivro, itensNF.qtdeVendida, Livros.PrecoUnitario 
from itensNF inner join Livros
on itensNf.idlivro = livros.idlivro;