-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 22/10/2026 às 01:37
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `nay_confeitaria`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `compras`
--

CREATE TABLE `compras` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `produto_id` int(11) NOT NULL,
  `quantidade` int(11) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `desconto` decimal(10,2) DEFAULT 0.00,
  `cupom_id` int(11) DEFAULT NULL,
  `data_compra` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `compras`
--

INSERT INTO `compras` (`id`, `usuario_id`, `produto_id`, `quantidade`, `total`, `desconto`, `cupom_id`, `data_compra`) VALUES
(1, 3, 1, 2, 45.00, 5.00, 1, '2026-08-05'),
(2, 5, 2, 3, 105.00, 0.00, NULL, '2026-08-10'),
(3, 4, 3, 1, 36.00, 4.00, 2, '2026-08-15'),
(4, 1, 2, 2, 70.00, 0.00, NULL, '2026-08-20'),
(5, 2, 4, 1, 22.00, 0.00, NULL, '2026-08-25');

-- --------------------------------------------------------

--
-- Estrutura para tabela `cupons`
--

CREATE TABLE `cupons` (
  `id` int(11) NOT NULL,
  `codigo` varchar(30) NOT NULL,
  `desconto` decimal(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `cupons`
--

INSERT INTO `cupons` (`id`, `codigo`, `desconto`) VALUES
(1, 'BOASVINDAS10', 10.00),
(2, 'BOLO15', 15.00),
(3, 'CLIENTE5', 5.00),
(4, 'DOCES20', 20.00),
(5, 'NAY10', 10.00),
(6, 'NAY25', 25.00);

-- --------------------------------------------------------

--
-- Estrutura para tabela `enderecos`
--

CREATE TABLE `enderecos` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `rua` varchar(100) NOT NULL,
  `numero` varchar(10) NOT NULL,
  `bairro` varchar(60) NOT NULL,
  `cidade` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `enderecos`
--

INSERT INTO `enderecos` (`id`, `usuario_id`, `rua`, `numero`, `bairro`, `cidade`) VALUES
(1, 1, 'Rua das Rosas', '125', 'Casa Amarela', 'Recife'),
(2, 3, 'Rua do Sol', '1250', 'Boa Viagem', 'Recife'),
(3, 4, 'Rua das Palmeiras', '565', 'Várzea', 'Recife'),
(4, 5, 'Rua das Acácias', '730', 'Tamarineira', 'Recife');

-- --------------------------------------------------------

--
-- Estrutura para tabela `produtos`
--

CREATE TABLE `produtos` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `preco` decimal(10,2) NOT NULL,
  `quantidade` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `produtos`
--

INSERT INTO `produtos` (`id`, `nome`, `preco`, `quantidade`) VALUES
(1, 'Bolo de cenoura', 25.00, 10),
(2, 'Bolo de chocolate', 35.00, 8),
(3, 'Bolo de morango', 40.00, 5),
(4, 'Bolo de milho', 22.00, 10),
(5, 'Bolo de rolo', 30.00, 7),
(6, 'Bolo de laranja', 24.00, 9),
(7, 'Bolo de limao', 28.00, 6),
(8, 'Bolo de coco', 27.00, 8),
(9, 'Bolo de ninho', 45.00, 5),
(10, 'Bolo de brigadeiro', 42.00, 6),
(11, 'Cupcake de chocolate', 8.00, 20),
(12, 'Cupcake de baunilha', 7.00, 20),
(13, 'Brownie', 6.00, 25),
(14, 'Brigadeiro', 3.00, 20),
(15, 'Beijinho', 3.00, 20),
(16, 'Torta de limao', 38.00, 4),
(17, 'Torta de morango', 45.00, 4),
(18, 'Pudim', 30.00, 6),
(19, 'Mousse de chocolate', 12.00, 12),
(20, 'Mousse de maracuja', 12.00, 15),
(21, 'Mouse de limao', 12.00, 10),
(22, 'Cookie', 5.00, 5),
(23, 'Sonho', 7.00, 15),
(24, 'Quindim', 5.00, 9),
(25, 'Palha italiana', 6.00, 5);

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `nascimento` date DEFAULT NULL,
  `data_nascimento` date DEFAULT '2000-01-01'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `usuarios`
--

INSERT INTO `usuarios` (`id`, `nome`, `email`, `nascimento`, `data_nascimento`) VALUES
(1, 'Beatriz Santos', 'beasantos@gmail.com ', '2000-05-10', NULL),
(2, 'Maria Celina ', 'mariacelina@gmail.com', '1998-08-15', NULL),
(3, 'Juliano Gomes', 'julianogomes@gmail.com', '2005-03-20', NULL),
(4, 'Julia Lima', 'julialima@gmail.com', '2008-11-02', NULL),
(5, 'Pamela Silva', 'pamelas@gmail.com', '1995-01-25', NULL);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `compras`
--
ALTER TABLE `compras`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `cupons`
--
ALTER TABLE `cupons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `codigo` (`codigo`);

--
-- Índices de tabela `enderecos`
--
ALTER TABLE `enderecos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Índices de tabela `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `compras`
--
ALTER TABLE `compras`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `cupons`
--
ALTER TABLE `cupons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `enderecos`
--
ALTER TABLE `enderecos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `produtos`
--
ALTER TABLE `produtos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `enderecos`
--
ALTER TABLE `enderecos`
  ADD CONSTRAINT `enderecos_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
