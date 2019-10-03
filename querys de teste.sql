show databases;

use prova1;

show tables;

insert into usuarios (nome, senha, email, cpf, telefone, endereco, flag_facebook, flag_google, tipo_pagamento, flag_salvar_cartao, flag_limite_excedido) values ("Daniel Gaio", "nãoolheminhasenha", "danielelielgaio@gmail.com", 0000000000 , 54996058180, "Maria anunciação Gomes de Godoy", 0, 0, 0, 1, 0);

select * from usuarios;

insert into musicas (nome_musica, genero, nome_cantor, nome_compositor, duracao, link_acesso_nuvem) values ("Break the twitch", "Axe", "Pedro Biau", "Roberto Carlos", "10:00", "www.wnwdsfkjskfdsbsdgjsdgksugaungg,sdgwug");

select * from musicas;