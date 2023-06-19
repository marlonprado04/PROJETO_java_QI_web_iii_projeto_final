<%@page import="java.util.ArrayList"%>
<%@page import="modeloDTO.LivroDTO"%>
<%@page import="modeloDAO.LivroDAO"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="../estilos/style.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro de exemplar</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
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

        <!-- SESSÃO COM INFORMAÇÕES DO ALUNO-->
        <form method="POST">
            <div class="form-container">
                <h3>Informações do aluno:</h3>
                <div class="form-group">
                    <label for="id_aluno">ID</label>
                    <input class="form-control" type="text" id="id_aluno" name="id_aluno" placeholder="ID do aluno" required value="<%= request.getParameter("id_aluno") != null ? request.getParameter("id_aluno").trim() : ""%>" readonly>
                </div>
                <div class="form-group">
                    <label for="nome">Nome</label>
                    <input class="form-control" type="text" id="nome" name="nome" placeholder="Nome do aluno" required value="<%= request.getParameter("nome")%>" readonly>
                </div>
                <div class="form-group">
                    <label for="sobrenome">Sobrenome</label>
                    <input class="form-control" type="text" id="sobrenome" name="sobrenome" placeholder="Sobrenome do aluno" required value="<%= request.getParameter("sobrenome")%>" readonly>
                </div>
            </div>
        </form>

        <!-- SESSÃO COM INFORMAÇÕES DOS LIVROS -->
        <div class="container">
            <h1 class="form-title">Lista de Livros</h1>
            <div class="container">
                <nav class="navbar navbar-light bg-light float-right">
                    <form class="form-inline" action="formSelecionarLivroParaEmprestimo.jsp" method="GET">
                        <input class="form-control mr-sm-2" type="search" placeholder="Digite o título..." aria-label="Search" name="titulo" value="<%= request.getParameter("titulo") != null ? request.getParameter("titulo") : ""%>">
                        <input type="hidden" name="id_aluno" value="<%= request.getParameter("id_aluno") != null ? request.getParameter("id_aluno").trim() : ""%>">
                        <input type="hidden" name="nome" value="<%= request.getParameter("nome")%>">
                        <input type="hidden" name="sobrenome" value="<%= request.getParameter("sobrenome")%>">
                        <button class="btn btn-outline-primary my-2 my-sm-0" type="submit">Pesquisar por título</button>
                    </form>
                </nav>

            </div>

            <table class="table table-bordered table-striped">
                <thead class="thead-dark">
                    <tr>
                        <th scope="col">ID</th>
                        <th scope="col">Título</th>
                        <th scope="col">Autor</th>
                        <th scope="col">Editora</th>
                        <th scope="col">Ano de Publicação</th>
                        <th scope="col">Gênero</th>
                        <th scope="col">ISBN</th>
                        <th colspan="2">Empréstimo</th>
                    </tr>
                </thead>
                <tbody>
                    <%-- Corrigido aqui --%>
                    <%
                        String titulo = request.getParameter("titulo") != null ? request.getParameter("titulo").trim() : "";
                        try {
                            LivroDAO objLivroDAO = new LivroDAO();
                            ArrayList<LivroDTO> lista = objLivroDAO.ConsultarLivroPorTitulo(titulo);
                            for (int num = 0; num < lista.size(); num++) {
                    %>
                    <tr>
                        <td><%= lista.get(num).getId()%></td>
                        <td><%= lista.get(num).getTitulo()%></td>
                        <td><%= lista.get(num).getAutor()%></td>
                        <td><%= lista.get(num).getEditora()%></td>
                        <td><%= lista.get(num).getAnoPublicacao()%></td>
                        <td><%= lista.get(num).getGenero()%></td>
                        <td><%= lista.get(num).getIsbn()%></td>
                        <td>
                            <a class="btn btn-info btn-sm" href="formSelecionarExemplarParaEmprestimo.jsp?id_aluno=<%= request.getParameter("id_aluno") != null ? request.getParameter("id_aluno").trim() : ""%>
                               &nome=<%= request.getParameter("nome")%>
                               &sobrenome=<%= request.getParameter("sobrenome")%>
                               &id_livro=<%= lista.get(num).getId()%>
                               &titulo=<%= lista.get(num).getTitulo()%>">Selecionar livro</a>
                        </td>

                    </tr>
                    <%
                            }
                        } catch (Exception e) {
                            out.println(e);
                        }
                    %>
                </tbody>
            </table>

        </div>
    </body>
</html>
