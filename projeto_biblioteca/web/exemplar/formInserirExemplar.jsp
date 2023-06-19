<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="../estilos/style.css">
        <title>Cadastro de exemplar</title>
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
                        <a class="nav-link active" href="../exemplar/codeListarExemplar.jsp">Exemplares</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="../emprestimo/codeListarEmprestimo.jsp">Empréstimo</a>
                    </li>
                </ul>
                </ul>
            </div>
        </div>

        <h1 class="form-title">Cadastrar novo exemplar</h1>

        <form action="codeInserirExemplar.jsp" method="POST">

            <div class="form-container">
                <div class="form-group">
                    <label for="id_livro">ID do Livro:</label>
                    <input class="form-control" type="text" id="id_livro" name="id_livro" placeholder="ID do livro" required value="<%= request.getParameter("id_livro").trim()%>" readonly>
                </div>
                <div class="form-group">
                    <label for="titulo_livro">Titulo do Livro:</label>
                    <input class="form-control" type="text" id="titulo_livro" name="titulo_livro" placeholder="Titulo do livro" required value="<%= request.getParameter("titulo_livro")%>" readonly>
                </div>

                <div class="form-group">
                    <label for="obs_do_exemplar">Observação: </label>
                    <input class="form-control" type="text" id="obs_do_exemplar" name="obs_do_exemplar" placeholder="Ex: Exemplar com assinatura" required>
                </div>

                <div class="form-group">
                    <label for="status">Status:</label>
                    <select class="form-control" id="status" name="status" readonly required>
                        <option value="" disabled readonly>Selecione o status</option>
                        <option value="Disponível" selected readonly>Disponível</option>
                    </select>
                </div>

                <div class="form-button-container">
                    <button class="btn btn-secondary" type="button" onclick="location.href = 'codeListarExemplar.jsp'">Listar exemplares </button>
                    <button class="btn btn-primary" type="submit">Cadastrar</button>
                </div>

            </div>

        </form>

    </body>
</html>
