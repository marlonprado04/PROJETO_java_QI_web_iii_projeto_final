<%-- 
    Document   : formAlterarLivro
    Created on : 20 de mai. de 2023, 20:48:08
    Author     : marlo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="../estilos/style.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alterar exemplar</title>
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

            </div>
        </div>


        <h1 class="form-title">Informações do exemplar a ser alterado: </h1>

        <form action="codeAlterarExemplar.jsp" method="POST">
            <div class="form-container">
                <div class="form-group">
                    <label>ID do exemplar</label>
                    <input class="form-control" type="text" name="id" value="<%= request.getParameter("id")%>" readonly>
                </div>
                <div class="form-group">
                    <label>Código do livro:</label>
                    <input class="form-control" type="text" name="id_livro" value="<%= request.getParameter("id_livro")%>" readonly>
                </div>
                <div class="form-group">
                    <label>Nome do livro:</label>
                    <input class="form-control" type="text" name="titulo_livro" value="<%= request.getParameter("titulo_livro")%>" readonly>
                </div>

                <div class="form-group">
                    <label for="status">Status:</label>
                    <select class="form-control" id="status" name="status" required>
                        <option value="<%= request.getParameter("status")%>" selected><%= request.getParameter("status")%></option>
                        <option value="Emprestado">Emprestado</option>
                        <option value="Disponível">Disponível</option>
                    </select>
                </div>

                <div class="form-group">
                    <label>Observação: </label>
                    <input class="form-control" type="text" name="obs_do_exemplar" value="<%= request.getParameter("obs_do_exemplar")%>">
                </div>

                <div class="form-button-container">
                    <button class="btn btn-secondary" type="button" onclick="location.href = 'codeListarExemplar.jsp'">Listar exemplares</button>
                    <button class="btn btn-primary" type="submit" onclick="location.href = 'codeAlterarExemplar.jsp'">Realizar alteração</button>
                </div>
            </div>
        </form>
    </body>