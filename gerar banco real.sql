-- MySQL Workbench Synchronization
-- Generated: 2019-10-03 14:58
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: andre

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

ALTER TABLE `prova1`.`usuarios_has_tipo_conta`
RENAME TO  `prova1`.`pertence` ;

CREATE TABLE IF NOT EXISTS `prova1`.`paga` (
  `id` VARCHAR(45) NOT NULL,
  `usuarios_id` INT(11) NOT NULL,
  `pagamentos_id` INT(11) NOT NULL,
  `flag_cartao` TINYINT(4) NULL DEFAULT NULL,
  `flag_boleto` TINYINT(4) NULL DEFAULT NULL,
  `valor` VARCHAR(10) NOT NULL,
  `data` DATE NOT NULL,

  PRIMARY KEY (`id`),
  CONSTRAINT `fk_usuarios_has_pagamentos_usuarios1`
    FOREIGN KEY (`usuarios_id`)
    REFERENCES `prova1`.`usuarios` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuarios_has_pagamentos_pagamentos1`
    FOREIGN KEY (`pagamentos_id`)
    REFERENCES `prova1`.`pagamentos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `prova1`.`cartoes_credito` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `nome_titular` VARCHAR(100) NOT NULL,
  `numero_cartao` VARCHAR(30) NOT NULL,
  `data_vencimento` DATE NOT NULL,
  `usuarios_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`, `usuarios_id`),
  
  CONSTRAINT `fk_cartoes_credito_usuarios1`
    FOREIGN KEY (`usuarios_id`)
    REFERENCES `prova1`.`usuarios` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `prova1`.`musicas` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `nome_musica` VARCHAR(45) NOT NULL,
  `genero` VARCHAR(45) NOT NULL,
  `nome_cantor` VARCHAR(45) NOT NULL,
  `nome_compositor` VARCHAR(45) NOT NULL,
  `duracao` VARCHAR(45) NULL DEFAULT NULL,
  `link_acesso_nuvem` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `prova1`.`gravadoras` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `data_inicio_contrato` DATE NOT NULL,
  `data_fim_contrato` DATE NOT NULL,
  `flag_contrato_ativo` TINYINT(4) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `prova1`.`pertence` (
  `id` VARCHAR(45) NOT NULL,
  `musicas_id` INT(11) NOT NULL,
  `gravadoras_id` INT(11) NOT NULL,
 
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_musicas_has_gravadoras_musicas1`
    FOREIGN KEY (`musicas_id`)
    REFERENCES `prova1`.`musicas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_musicas_has_gravadoras_gravadoras1`
    FOREIGN KEY (`gravadoras_id`)
    REFERENCES `prova1`.`gravadoras` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `prova1`.`lista` (
  `id` VARCHAR(45) NOT NULL,
  `usuarios_id` INT(11) NOT NULL,
  `musicas_id` INT(11) NOT NULL,
  `genero` VARCHAR(45) NULL DEFAULT NULL,
  `nome` VARCHAR(45) NULL DEFAULT NULL,
  `artista` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
 
  CONSTRAINT `fk_usuarios_has_musicas_usuarios1`
    FOREIGN KEY (`usuarios_id`)
    REFERENCES `prova1`.`usuarios` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuarios_has_musicas_musicas1`
    FOREIGN KEY (`musicas_id`)
    REFERENCES `prova1`.`musicas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `prova1`.`baixa` (
  `id` VARCHAR(45) NOT NULL,
  `usuarios_id` INT(11) NOT NULL,
  `musicas_id` INT(11) NOT NULL,
  `cont` DECIMAL NOT NULL,
  `timestamp` VARCHAR(45) NOT NULL,
  `baixacol` TIMESTAMP NULL DEFAULT NULL,
 
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_usuarios_has_musicas_usuarios2`
    FOREIGN KEY (`usuarios_id`)
    REFERENCES `prova1`.`usuarios` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuarios_has_musicas_musicas2`
    FOREIGN KEY (`musicas_id`)
    REFERENCES `prova1`.`musicas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
