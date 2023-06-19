<%-- 
    Document   : formExcluirLivro
    Created on : 20 de mai. de 2023, 20:44:28
    Author     : marlo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="../estilos/style.css">
        <title>Excluir livro</title>
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
                        <a class="nav-link active" href="../livro/codeListarLivro.jsp">Livros</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="../exemplar/codeListarExemplar.jsp">Exemplares</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="../emprestimo/codeListarEmprestimo.jsp">Empréstimo</a>
                    </li>
                </ul>
                </ul>
            </div>
        </div>

        <h1 class="form-title">Informações do livro a ser excluído: </h1>

        <form action="codeExcluirLivro.jsp" method="POST">
            <div class="form-container">
                <div class="form-group">
                    <label>ID:</label>
                    <input class="form-control" type="text" name="id" value="<%= request.getParameter("id")%>" readonly>
                </div>

                <div class="form-group">
                    <label>Título:</label>
                    <input class="form-control" type="text" name="titulo" value="<%= request.getParameter("titulo")%>" readonly> 
                </div>

                <div class="form-group">
                    <label>Editora:</label>
                    <input class="form-control" type="text" name="editora" value="<%= request.getParameter("editora")%>" readonly>
                </div>

                <div class="form-group">
                    <label>Ano de Publicação:</label>
                    <input class="form-control" type="text" name="ano_publicacao" value="<%= request.getParameter("ano_publicacao")%>" readonly>
                </div>

                <div class="form-group">
                    <label>Gênero:</label>
                    <input class="form-control" type="text" name="genero" value="<%= request.getParameter("genero")%>" readonly>
                </div>

                <div class="form-group">
                    <label>ISBN:</label>
                    <input class="form-control" type="text" name="isbn" value="<%= request.getParameter("isbn")%>" readonly>
                </div>

                <div class="form-button-container">
                    <button class="btn btn-secondary" type="button" onclick="location.href = 'codeListarLivro.jsp'">Listar livros</button>
                    <button class="btn btn-danger" type="submit" onclick="location.href = 'codeExcluirLivro.jsp'">Excluir livro</button>
                </div>
            </div>
        </form>


    </body>
</html>
