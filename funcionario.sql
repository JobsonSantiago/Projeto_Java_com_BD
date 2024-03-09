-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 05-Dez-2023 às 12:10
-- Versão do servidor: 10.4.22-MariaDB
-- versão do PHP: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `funcionario`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `departamento`
--

CREATE TABLE `departamento` (
  `cod_departamento` int(11) NOT NULL,
  `nome` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `departamento`
--

INSERT INTO `departamento` (`cod_departamento`, `nome`) VALUES
(1, 'DS'),
(2, 'ADM'),
(3, 'fgfg');

-- --------------------------------------------------------

--
-- Estrutura da tabela `endereco_funcionarios`
--

CREATE TABLE `endereco_funcionarios` (
  `sequencia` int(11) NOT NULL,
  `cod_funcionario` int(11) DEFAULT NULL,
  `rua` varchar(100) NOT NULL,
  `numero` int(5) NOT NULL,
  `cep` varchar(10) NOT NULL,
  `bairro` varchar(100) NOT NULL,
  `cidade` varchar(100) NOT NULL,
  `uf` varchar(2) NOT NULL,
  `pais` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `endereco_funcionarios`
--

INSERT INTO `endereco_funcionarios` (`sequencia`, `cod_funcionario`, `rua`, `numero`, `cep`, `bairro`, `cidade`, `uf`, `pais`) VALUES
(1, 1, 'Av Aguia de Haia', 121, '12111-111', 'AE Carvalho', 'Sao Paulo', 'SP', 'Brasil');

-- --------------------------------------------------------

--
-- Estrutura da tabela `funcionario`
--

CREATE TABLE `funcionario` (
  `cod_funcionario` int(11) NOT NULL,
  `nome` varchar(80) NOT NULL,
  `data_nasc` date NOT NULL,
  `email` varchar(100) NOT NULL,
  `data_contratacao` date NOT NULL,
  `genero` varchar(1) NOT NULL,
  `cod_departamento` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `funcionario`
--

INSERT INTO `funcionario` (`cod_funcionario`, `nome`, `data_nasc`, `email`, `data_contratacao`, `genero`, `cod_departamento`) VALUES
(1, 'Jobson', '2023-10-03', 'jobson@gmail.com', '2023-10-10', 'M', 2),
(2, 'Samuel', '2023-10-04', 'samuel@gmail.com', '2023-10-23', 'M', 2),
(5, 'Joao', '2023-08-23', 'joao@gmail.com', '2020-12-23', 'M', 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `telefone_funcionarios`
--

CREATE TABLE `telefone_funcionarios` (
  `sequencia` int(11) NOT NULL,
  `cod_funcionario` int(11) DEFAULT NULL,
  `telefone` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `telefone_funcionarios`
--

INSERT INTO `telefone_funcionarios` (`sequencia`, `cod_funcionario`, `telefone`) VALUES
(1, 1, '(11)99999-9999'),
(2, 1, '(23)42342-2333'),
(4, 1, '(11)98765-4321'),
(8, 2, '(12)12342-3423'),
(9, 2, '(11)11111-1111');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `departamento`
--
ALTER TABLE `departamento`
  ADD PRIMARY KEY (`cod_departamento`);

--
-- Índices para tabela `endereco_funcionarios`
--
ALTER TABLE `endereco_funcionarios`
  ADD PRIMARY KEY (`sequencia`),
  ADD KEY `cod_funcionario` (`cod_funcionario`);

--
-- Índices para tabela `funcionario`
--
ALTER TABLE `funcionario`
  ADD PRIMARY KEY (`cod_funcionario`),
  ADD KEY `cod_departamento` (`cod_departamento`);

--
-- Índices para tabela `telefone_funcionarios`
--
ALTER TABLE `telefone_funcionarios`
  ADD PRIMARY KEY (`sequencia`),
  ADD KEY `cod_funcionario` (`cod_funcionario`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `departamento`
--
ALTER TABLE `departamento`
  MODIFY `cod_departamento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `endereco_funcionarios`
--
ALTER TABLE `endereco_funcionarios`
  MODIFY `sequencia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `funcionario`
--
ALTER TABLE `funcionario`
  MODIFY `cod_funcionario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `telefone_funcionarios`
--
ALTER TABLE `telefone_funcionarios`
  MODIFY `sequencia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `endereco_funcionarios`
--
ALTER TABLE `endereco_funcionarios`
  ADD CONSTRAINT `endereco_funcionarios_ibfk_1` FOREIGN KEY (`cod_funcionario`) REFERENCES `funcionario` (`cod_funcionario`);

--
-- Limitadores para a tabela `funcionario`
--
ALTER TABLE `funcionario`
  ADD CONSTRAINT `funcionario_ibfk_2` FOREIGN KEY (`cod_departamento`) REFERENCES `departamento` (`cod_departamento`);

--
-- Limitadores para a tabela `telefone_funcionarios`
--
ALTER TABLE `telefone_funcionarios`
  ADD CONSTRAINT `telefone_funcionarios_ibfk_1` FOREIGN KEY (`cod_funcionario`) REFERENCES `funcionario` (`cod_funcionario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
