Propósitos dos Arquivos do Projeto AVA Para Quem não tem

Oque temos que Fazer por Enquanto para prototipo 1:

ava/index.php
- Página inicial com formulários de login e cadastro para alunos e professores. Redireciona para o dashboard após login.

ava/login.php
- Processa o formulário de login, verifica email e senha no banco (alunos ou professores) e inicia a sessão do usuário.

ava/register.php
- Processa o cadastro de alunos ou professores, salvando nome, email, senha (criptografada) e ano escolar (para alunos) no banco.

ava/student_dashboard.php
- Painel do aluno, mostra matérias inscritas e postagens recentes (avisos/tarefas). Responsivo com cards.

ava/teacher_dashboard.php
- Painel do professor, exibe matérias lecionadas, postagens e resumo de entregas dos alunos. Inclui opção para criar postagens.

ava/subject_detail.php
- Mostra detalhes de uma matéria, listando postagens (avisos/tarefas). Alunos enviam tarefas; professores veem entregas.

ava/post_create.php
- Permite que professores criem postagens ou tarefas, com título, texto, anexo e prazo, salvando no banco.

ava/assignment_submit.php
- Permite que alunos enviem tarefas, fazendo upload de arquivos e marcando como entregue no banco.

ava/profile.php
- Gerencia perfil do usuário (editar nome/email) e inscrições em matérias (alunos) ou visualização de matérias (professores).

ava/submissions_view.php
- Mostra ao professor quem entregou ou não uma tarefa, com nome, status, data e link para download do arquivo.

ava/includes/db_connect.php
- Configura a conexão com o banco de dados pji2 (MySQL) usando PDO, usado por todos os arquivos PHP.

ava/includes/auth.php
- Gerencia autenticação e sessões, com funções para verificar login e definir o papel (aluno/professor).

ava/assets/css/styles.css
- Estiliza o sistema, personalizando o Bootstrap com cores temáticas e ajustes responsivos para celular e desktop.

ava/assets/js/scripts.js
- Adiciona interatividade no frontend, como validação de formulários, botões de mostrar/esconder senha e filtros.
