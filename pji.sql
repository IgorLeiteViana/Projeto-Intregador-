-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 26/10/2025 às 18:55
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
-- Banco de dados: `pji2`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `alunos`
--

CREATE TABLE `alunos` (
  `id_aluno` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `senha_hash` varchar(255) NOT NULL,
  `ano_escolar` enum('6','7','8','9') NOT NULL,
  `data_cadastro` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `aluno_materia_inscricao`
--

CREATE TABLE `aluno_materia_inscricao` (
  `id_aluno` int(11) NOT NULL,
  `id_materia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `entregas_aluno`
--

CREATE TABLE `entregas_aluno` (
  `id_entrega` int(11) NOT NULL,
  `id_aluno` int(11) NOT NULL,
  `id_postagem` int(11) NOT NULL,
  `data_entrega` timestamp NULL DEFAULT NULL,
  `entregue` tinyint(1) NOT NULL DEFAULT 0,
  `arquivo_entrega_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `materias`
--

CREATE TABLE `materias` (
  `id_materia` int(11) NOT NULL,
  `nome_disciplina` varchar(50) NOT NULL,
  `ano_escolar` enum('6','7','8','9') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `postagens`
--

CREATE TABLE `postagens` (
  `id_postagem` int(11) NOT NULL,
  `id_materia` int(11) NOT NULL,
  `id_professor` int(11) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `corpo` text DEFAULT NULL,
  `data_publicacao` timestamp NOT NULL DEFAULT current_timestamp(),
  `prazo_entrega` date DEFAULT NULL,
  `anexo_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `professores`
--

CREATE TABLE `professores` (
  `id_professor` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `senha_hash` varchar(255) NOT NULL,
  `data_cadastro` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `professor_materia`
--

CREATE TABLE `professor_materia` (
  `id_professor` int(11) NOT NULL,
  `id_materia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `alunos`
--
ALTER TABLE `alunos`
  ADD PRIMARY KEY (`id_aluno`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Índices de tabela `aluno_materia_inscricao`
--
ALTER TABLE `aluno_materia_inscricao`
  ADD PRIMARY KEY (`id_aluno`,`id_materia`),
  ADD KEY `id_materia` (`id_materia`);

--
-- Índices de tabela `entregas_aluno`
--
ALTER TABLE `entregas_aluno`
  ADD PRIMARY KEY (`id_entrega`),
  ADD UNIQUE KEY `uk_aluno_postagem` (`id_aluno`,`id_postagem`),
  ADD KEY `id_postagem` (`id_postagem`);

--
-- Índices de tabela `materias`
--
ALTER TABLE `materias`
  ADD PRIMARY KEY (`id_materia`),
  ADD UNIQUE KEY `uk_materia_ano` (`nome_disciplina`,`ano_escolar`);

--
-- Índices de tabela `postagens`
--
ALTER TABLE `postagens`
  ADD PRIMARY KEY (`id_postagem`),
  ADD KEY `id_materia` (`id_materia`),
  ADD KEY `id_professor` (`id_professor`);

--
-- Índices de tabela `professores`
--
ALTER TABLE `professores`
  ADD PRIMARY KEY (`id_professor`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Índices de tabela `professor_materia`
--
ALTER TABLE `professor_materia`
  ADD PRIMARY KEY (`id_professor`,`id_materia`),
  ADD KEY `id_materia` (`id_materia`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `alunos`
--
ALTER TABLE `alunos`
  MODIFY `id_aluno` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `entregas_aluno`
--
ALTER TABLE `entregas_aluno`
  MODIFY `id_entrega` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `materias`
--
ALTER TABLE `materias`
  MODIFY `id_materia` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `postagens`
--
ALTER TABLE `postagens`
  MODIFY `id_postagem` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `professores`
--
ALTER TABLE `professores`
  MODIFY `id_professor` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `aluno_materia_inscricao`
--
ALTER TABLE `aluno_materia_inscricao`
  ADD CONSTRAINT `aluno_materia_inscricao_ibfk_1` FOREIGN KEY (`id_aluno`) REFERENCES `alunos` (`id_aluno`) ON DELETE CASCADE,
  ADD CONSTRAINT `aluno_materia_inscricao_ibfk_2` FOREIGN KEY (`id_materia`) REFERENCES `materias` (`id_materia`) ON DELETE CASCADE;

--
-- Restrições para tabelas `entregas_aluno`
--
ALTER TABLE `entregas_aluno`
  ADD CONSTRAINT `entregas_aluno_ibfk_1` FOREIGN KEY (`id_aluno`) REFERENCES `alunos` (`id_aluno`) ON DELETE CASCADE,
  ADD CONSTRAINT `entregas_aluno_ibfk_2` FOREIGN KEY (`id_postagem`) REFERENCES `postagens` (`id_postagem`) ON DELETE CASCADE;

--
-- Restrições para tabelas `postagens`
--
ALTER TABLE `postagens`
  ADD CONSTRAINT `postagens_ibfk_1` FOREIGN KEY (`id_materia`) REFERENCES `materias` (`id_materia`) ON DELETE CASCADE,
  ADD CONSTRAINT `postagens_ibfk_2` FOREIGN KEY (`id_professor`) REFERENCES `professores` (`id_professor`);

--
-- Restrições para tabelas `professor_materia`
--
ALTER TABLE `professor_materia`
  ADD CONSTRAINT `professor_materia_ibfk_1` FOREIGN KEY (`id_professor`) REFERENCES `professores` (`id_professor`) ON DELETE CASCADE,
  ADD CONSTRAINT `professor_materia_ibfk_2` FOREIGN KEY (`id_materia`) REFERENCES `materias` (`id_materia`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
