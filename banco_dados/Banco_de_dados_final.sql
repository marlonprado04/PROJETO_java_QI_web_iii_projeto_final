-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3307
-- Tempo de geração: 31/05/2023 às 22:19
-- Versão do servidor: 10.4.28-MariaDB
-- Versão do PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `biblioteca`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `aluno`
--

CREATE TABLE `aluno` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `sobrenome` varchar(100) NOT NULL,
  `cpf` varchar(14) NOT NULL,
  `telefone` varchar(14) NOT NULL,
  `email` varchar(80) NOT NULL,
  `curso` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `aluno`
--

INSERT INTO `aluno` (`id`, `nome`, `sobrenome`, `cpf`, `telefone`, `email`, `curso`) VALUES
(1, 'Manoel', 'Joaquim', '123', '123', '123', '123'),
(2, 'Rafael                                            ', 'a                                            ', 'Joaquim       ', 'oiuahi        ', 'ojhol                               ', 'lb'),
(3, 'Ruan', 'da Silva', '123', '123', '123', '123'),
(5, 'Pamela', 'Joaquina', '123', '123', '123', '123'),
(6, 'Marlon', 'prado', 'ihih', 'loulhol', 'ouhoh', 'hçh'),
(7, 'Marlon', 'prado', 'ihih', 'loulhol', 'ouhoh', 'hçh'),
(31, 'Joana                               ', 'da Silva                               ', '123.456.789-25', '(51)982909810 ', 'amaral@joao.com                               ', 'Ciência da computação');

-- --------------------------------------------------------

--
-- Estrutura para tabela `emprestimo`
--

CREATE TABLE `emprestimo` (
  `id` int(11) NOT NULL,
  `id_exemplar` int(11) NOT NULL,
  `id_aluno` int(11) NOT NULL,
  `data_emprestimo` varchar(10) NOT NULL,
  `data_devolucao` varchar(10) NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `emprestimo`
--

INSERT INTO `emprestimo` (`id`, `id_exemplar`, `id_aluno`, `data_emprestimo`, `data_devolucao`, `status`) VALUES
(12, 9, 1, '2023-05-30', '2023-05-30', 'Empenhado'),
(17, 18, 7, '2023-05-31', '2023-06-07', 'Empenhado');

-- --------------------------------------------------------

--
-- Estrutura para tabela `exemplar`
--

CREATE TABLE `exemplar` (
  `id` int(11) NOT NULL,
  `id_livro` int(11) NOT NULL,
  `obs_do_exemplar` varchar(200) NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `exemplar`
--

INSERT INTO `exemplar` (`id`, `id_livro`, `obs_do_exemplar`, `status`) VALUES
(8, 4, 'ASASAS                                                                                             ', 'Emprestado'),
(9, 4, 'Bla bla bla', 'Emprestado'),
(18, 8, 'TINHA SIM!', 'Emprestado');

-- --------------------------------------------------------

--
-- Estrutura para tabela `livro`
--

CREATE TABLE `livro` (
  `id` int(11) NOT NULL,
  `titulo` varchar(200) NOT NULL,
  `autor` varchar(100) NOT NULL,
  `editora` varchar(100) NOT NULL,
  `ano_publicacao` varchar(4) NOT NULL,
  `genero` varchar(50) NOT NULL,
  `isbn` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `livro`
--

INSERT INTO `livro` (`id`, `titulo`, `autor`, `editora`, `ano_publicacao`, `genero`, `isbn`) VALUES
(3, 'Python para dados                               ', 'Shakespeare', '123                               ', '123 ', '1231                               ', '123'),
(4, 'Hábitos atômicos', '123', '123', '123', '123', '123'),
(5, 'O poder do hábito', 'Mcrog', '1212', 'ijoi', 'ouoh', 'ooh'),
(6, 'Madkjoh', 'hoholh', 'olbb', 'aaaa', 'oolblbl', 'bolbolb'),
(8, 'Python: a linguagem que mudará o mundo                               ', 'Pythinho                               ', 'Pythonhouse                               ', '2019', 'Computação, python                               ', '0000');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `aluno`
--
ALTER TABLE `aluno`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `emprestimo`
--
ALTER TABLE `emprestimo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_emprestimo_exemplar` (`id_exemplar`),
  ADD KEY `fk_emprestimo_aluno` (`id_aluno`);

--
-- Índices de tabela `exemplar`
--
ALTER TABLE `exemplar`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_exemplar_livro` (`id_livro`);

--
-- Índices de tabela `livro`
--
ALTER TABLE `livro`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `aluno`
--
ALTER TABLE `aluno`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT de tabela `emprestimo`
--
ALTER TABLE `emprestimo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de tabela `exemplar`
--
ALTER TABLE `exemplar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de tabela `livro`
--
ALTER TABLE `livro`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `emprestimo`
--
ALTER TABLE `emprestimo`
  ADD CONSTRAINT `fk_emprestimo_aluno` FOREIGN KEY (`id_aluno`) REFERENCES `aluno` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_emprestimo_exemplar` FOREIGN KEY (`id_exemplar`) REFERENCES `exemplar` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `exemplar`
--
ALTER TABLE `exemplar`
  ADD CONSTRAINT `fk_exemplar_livro` FOREIGN KEY (`id_livro`) REFERENCES `livro` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
