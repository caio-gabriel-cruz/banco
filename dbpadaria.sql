-- apagando banco de dados se existir
drop database dbpadaria;
-- criando banco de dados 
create database dbpadaria;
-- acessar o banco de dados
use dbpadaria;
--criando as tabelas no banco de dados




create table tbFornecedores(
codForn int not null auto_increment,
nome varchar(100),
email varchar(100) unique,
telCel char(10),
primary key(codForn));


create table tbClientes(
codCli int not null auto_increment,
nome varchar(100) not null,
cpf char(14) unique not null,
email varchar(100) unique,
primary key(codCli));


create table tbFuncionarios(
codFunc int not null auto_increment,
nome varchar(100),
email varchar(100) unique,
telCel char(10),
dataNasc datetime,
salario decimal(9,2) default 0 check(salario >= 0),
sexo char(1) default "F" check(sexo in("F","M")),
primary key(codFunc)
);


create table tbUsuarios(
codUsu int not null auto_increment,
nome varchar(50) not null,
senha varchar(12) not null,
codFunc int not null,
primary key(codUsu),
foreign key(codFunc)references tbFuncionarios(codFunc)
);


create table tbProdutos(
codProd int not null auto_increment,
descricao varchar(100),
quantidade int,
preco decimal(9,2),
dataVal datetime,
lote char(10) unique,
codForn int not null,
primary key(codProd),
foreign key(codForn)references tbFornecedores(codForn));


create table tbVendas(
codVend int not null auto_increment,
dataVend date,
horaVend time,
quantidade decimal(9, 1) default 0 check(quantidade >=0),
valor decimal(9,2) default 0 check(valor >=0),
codProd int not null,
codUsu int not null,
codCli int not null,
primary key(codVend),
foreign key(codProd) references tbProdutos(codProd),
foreign key(codCli)references tbClientes(codCli),
foreign key(codUsu) references tbUsuarios(codUsu)
);

-- visualizando as tabelas
show tables;
-- visualizando a estrutura das tabelas

desc tbUsuarios;
desc tbFornecedores;
desc tbFuncionarios;
desc tbClientes;
desc tbVendas;

--inserindo registros nas tabelas
insert into tbClientes(nome,cpf,email)
	values('alicia sim','484.254.821-54',"alicia.casacomigo@gmail.com");
insert into tbClientes(nome,cpf,email)
	values("alicia 2",'548.364.145-58','alicia.namoraeu@gmail.com');
insert into tbFornecedores(nome, email, telCel)
	values('Verduras SA', 'sac@verdauras.com', '11145665');
insert into tbFornecedores(nome, email, telCel)
	values('Casas Bahia', 'casas.bahia@bahia.com', '11144675');
insert into tbFuncionarios(nome, email, telCel, dataNasc, salario, sexo)
	values('Guilherme do grau', 'grau.guigui@moto.com', '1199556655', "2007-02-25", 7.00, "f" );
insert into tbFuncionarios(nome, email, telCel, dataNasc, salario, sexo)
	values('Shinizi gamepreis', 'voltarocumbole@cpm.com', '1199546645', "2007-05-02", 10.00, "f" );
insert into tbUsuarios(nome, senha, codFunc)
	values('Guilherme do grau', 'rgffr', 1);
insert into tbUsuarios(nome, senha, codFunc)
	values('Shinizi gamepreis', 'ismsas', 2);
insert into tbProdutos(descricao, quantidade, preco, dataVal, lote, codForn)
	values('papel', 10, 22.50, '2007-02-25', '45dgdg5', 1);
insert into tbProdutos(descricao, quantidade, preco, dataVal, lote, codForn)
	values('todynho', 20, 2.50, '2007-02-25', '45dgasag5', 2);
insert into tbProdutos(descricao, quantidade, preco, dataVal, lote, codForn)
	values('Edynho', 10, 100.50, '2007-02-25', '11dgdg5', 2);
insert into tbProdutos(descricao, quantidade, preco, dataVal, lote, codForn)
	values('cupnodes', 20, 5.50, '2007-02-25', '45d34asag5', 2);
insert into tbVendas(dataVend, horaVend, quantidade, valor, codProd, codUsu, codCli)
	values('2022-05-20', '10:50:20', 100, 70.00, 2, 1, 1);
insert into tbVendas(dataVend, horaVend, quantidade, valor, codProd, codUsu, codCli)
	values('2022-05-20', '10:50:20', 100, 5000.00, 3, 1, 1);



--visualizando os registros nas tabelas


select * from tbClientes;
select * from tbFornecedores;
select * from tbFuncionarios;
select * from tbUsuarios;
select * from tbProdutos;
select * from tbVendas;