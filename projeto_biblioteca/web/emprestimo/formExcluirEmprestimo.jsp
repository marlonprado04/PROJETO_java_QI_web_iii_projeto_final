<%-- 
    Document   : formExcluirEmprestimo
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
        <title>Excluir empréstimo</title>
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

        <h1 class="form-title">Informações do empréstimo a ser excluído </h1>

        <form action="codeExcluirEmprestimo.jsp" method="POST">
            <div class="form-container">
                <div class="form-group">
                    <label>ID do empréstimo</label>
                    <input class="form-control" type="text" name="id" value="<%= request.getParameter("id")%>" readonly>
                </div>
                <div class="form-group">
                    <label>ID do aluno</label>
                    <input class="form-control" type="text" name="id_aluno" value="<%= request.getParameter("id_aluno")%>" readonly>
                </div>
                <div class="form-group">
                    <label>ID do exemplar</label>
                    <input class="form-control" type="text" name="id_exemplar" value="<%= request.getParameter("id_exemplar")%>" readonly>
                </div>

                <div class="form-group">
                    <label>Data de empréstimo: </label>
                    <input class="form-control" type="date" name="data_emprestimo" value="<%= request.getParameter("data_emprestimo")%>" readonly>
                </div>

                <div class="form-group">
                    <label>Data de devolução: </label>
                    <input class="form-control" type="date" name="data_devolucao" value="<%= request.getParameter("data_devolucao")%>" readonly>
                </div>

                <div class="form-group">
                    <label for="status_emprestimo">Status:</label>
                    <select class="form-control" id="status_emprestimo" name="status_emprestimo" required readonly>
                        <option value="<%= request.getParameter("status")%>" selected readonly><%= request.getParameter("status")%></option>
                        <option value="Empenhado" readonly>Emprestado</option>
                        <option value="Finalizado" readonly>Finalizado</option>
                        <option value="Atrasado" readonly>Atrasado</option>
                    </select>
                </div>

                <div class="form-button-container">
                    <button class="btn btn-secondary" type="button" onclick="location.href = 'codeListarEmprestimo.jsp'">Listar empréstimos</button>
                    <button class="btn btn-danger" type="submit" onclick="location.href = 'codeExcluirEmprestimo.jsp'">Realizar exclusão</button>
                </div>
            </div>
        </form>
    </body>