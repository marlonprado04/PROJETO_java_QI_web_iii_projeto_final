<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="../estilos/style.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

        <title>Cadastro de empréstimo</title>
    </head>
    <body>

        <div class="header">
            <h1>Biblioteca</h1>
            <div>
                <ul class="nav nav-pills nav-fill">
                    <li class="nav-item">
                        <a class="nav-link" href="../aluno/codeListarAluno.jsp">Alunos</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="../livro/codeListarLivro.jsp">Livros</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="../exemplar/codeListarExemplar.jsp">Exemplares</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="../emprestimo/codeListarEmprestimo.jsp">Empréstimo</a>
                    </li>
                </ul>
                </ul>
            </div>
        </div>

        <h1 class="form-title">Cadastrar novo empréstimo</h1>

        <form action="codeInserirEmprestimo.jsp" method="POST">

            <!-- Informações do aluno-->

            <div class="form-container">
                <h3>Informações do aluno:</h3>

                <div class="form-group">
                    <label for="id_aluno">ID do Aluno:</label>
                    <input class="form-control" type="text" id="id_aluno" name="id_aluno" placeholder="Ex: 123" value="<%=request.getParameter("id_aluno")%>" required readonly>
                </div>
                <div class="form-group">
                    <label for="nome">Nome:</label>
                    <input class="form-control" type="text" id="nome" name="nome" placeholder="Ex: Roberta" value="<%=request.getParameter("nome")%>" required readonly>
                </div>
            </div>

            <!-- Informações do livro-->
            <div class="form-container">
                <h3>Informações do livro:</h3>

                <div class="form-group">
                    <label for="id_livro">ID do Livro:</label>
                    <input class="form-control" type="text" id="id_livro" name="id_livro" placeholder="Ex: 123" value="<%=request.getParameter("id_livro")%>" required readonly>
                </div>
                <div class="form-group">
                    <label for="titulo">Titulo</label>
                    <input class="form-control" type="text" id="titulo" name="titulo" placeholder="Ex: Dom Casmurro" value="<%=request.getParameter("titulo")%>" required readonly>
                </div>
            </div>

            <!-- Informações do exemplar-->
            <div class="form-container">
                <h3>Informações do exemplar:</h3>

                <div class="form-group">
                    <label for="id_exemplar">ID do Exemplar:</label>
                    <input class="form-control" type="text" id="id_exemplar" name="id_exemplar" placeholder="Ex: 456" value="<%=request.getParameter("id_exemplar")%>" required readonly>
                </div>

                <div class="form-group">
                    <label for="obs_exemplar">Observação: </label>
                    <input class="form-control" type="text" id="obs_exemplar" name="obs_exemplar" placeholder="Ex: 456" value="<%=request.getParameter("obs_exemplar")%>"required>
                </div>

                <div class="form-group">
                    <label for="status_exemplar">Status:</label>
                    <select class="form-control" id="status_exemplar" name="status_exemplar" required>
                        <option value="" >Selecione o status</option>
                        <option value="Emprestado" selected>Emprestado</option>
                        <option value="Disponível" selected>Disponível</option>

                    </select>
                </div>
            </div>
            <!-- Informações do empréstimo-->

            <div class="form-container">
                <h3>Informações do empréstimo:</h3>

                <div class="form-group">
                    <label for="data_emprestimo">Data de Empréstimo:</label>
                    <input class="form-control" type="date" id="data_emprestimo" name="data_emprestimo" placeholder="Ex: 2023-05-20" required>
                </div>

                <div class="form-group">
                    <label  for="data_devolucao">Data de Devolução:</label>
                    <input class="form-control" type="date" id="data_devolucao" name="data_devolucao" placeholder="Ex: 2023-06-01" required>
                </div>

                <div class="form-group">
                    <label  for="status_emprestimo">Status:</label>
                    <select class="form-control" id="status_emprestimo" name="status_emprestimo" required>
                        <option value="" disabled>Selecione o status</option>
                        <option value="Empenhado" name="status_emprestimo">Empenhado</option>
                        <option value="Finalizado" name="status_emprestimo">Finalizado</option>
                        <option value="Atrasado" name="status_emprestimo">Atrasado</option>
                    </select>
                </div>

                <div class="form-button-container">
                    <button class="btn btn-secondary" type="button" onclick="location.href = 'codeListarEmprestimo.jsp'">Listar empréstimos</button>
                    <button class="btn btn-primary" type="submit">Cadastrar</button>
                </div>
            </div>

        </form>

    </body>
</html>
