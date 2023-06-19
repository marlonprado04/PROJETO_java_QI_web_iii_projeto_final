<%@page import="modeloDTO.LivroDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modeloDAO.LivroDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="../estilos/style.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de Livros</title>
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
        <div class="container">


            <h1 class="form-title">Resultado da consulta pelo autor: <%=request.getParameter("autor")%></h1>

            <div class="container">
                <nav class="navbar navbar-light bg-light float-right">
                    <form class="form-inline" action='codeConsultarLivroPorTitulo.jsp' method="POST">
                        <input class="form-control mr-sm-2" type="search" placeholder="Digite o titulo..." aria-label="Search" name='titulo'>
                        <button class="btn btn-outline-primary my-2 my-sm-0" type="submit" onclick="location.href = 'codeConsultarLivroPorTitulo.jsp'">Pesquisar por titulo</button>
                    </form>
                </nav>

                <nav class="navbar navbar-light bg-light float-right">
                    <form class="form-inline" action='codeConsultarLivroPorAutor.jsp' method="POST">
                        <input class="form-control mr-sm-2" type="search" placeholder="Digite o nome do autor..." aria-label="Search" name='autor'>
                        <button class="btn btn-outline-primary my-2 my-sm-0" type="submit" onclick="location.href = 'codeConsultarLivroPorAutor.jsp'">Pesquisar por autor</button>
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
                        <th colspan="2">Exemplar</th>
                        <th colspan="2">Cadastro do livro</th>
                    </tr>

                </thead>
                <%
                    try {
                        LivroDAO objLivroDAO = new LivroDAO();
                        ArrayList<LivroDTO> lista = objLivroDAO.ConsultarLivroPorAutor(request.getParameter("autor"));
                        for (int num = 0; num < lista.size(); num++) {
                %>
                <tbody>
                    <tr>
                        <td><%= lista.get(num).getId()%></td>
                        <td><%= lista.get(num).getTitulo()%></td>
                        <td><%= lista.get(num).getAutor()%></td>
                        <td><%= lista.get(num).getEditora()%></td>
                        <td><%= lista.get(num).getAnoPublicacao()%></td>
                        <td><%= lista.get(num).getGenero()%></td>
                        <td><%= lista.get(num).getIsbn()%></td>
                        <td>
                            <a class="btn btn-info btn-sm" href="../exemplar/formInserirExemplar.jsp?id_livro=<%= lista.get(num).getId()%>
                               &titulo_livro=<%= lista.get(num).getTitulo()%>">Inserir</a>
                        </td>
                        <td>
                            <a class="btn btn-info btn-sm" href="../exemplar/codeListarExemplarDoLivro.jsp?id_livro=<%= lista.get(num).getId()%>">Listar</a>
                        </td>
                        <td>
                            <a class="btn btn-dark btn-sm" href="formAlterarLivro.jsp?id=<%= lista.get(num).getId()%>
                               &titulo=<%= lista.get(num).getTitulo()%>
                               &autor=<%= lista.get(num).getAutor()%>
                               &editora=<%= lista.get(num).getEditora()%>
                               &ano_publicacao=<%= lista.get(num).getAnoPublicacao()%>
                               &genero=<%= lista.get(num).getGenero()%>
                               &isbn=<%= lista.get(num).getIsbn()%>">Alterar</a>
                        </td>
                        <td>
                            <a class="btn btn-danger btn-sm" href="formExcluirLivro.jsp?id=<%= lista.get(num).getId()%>
                               &titulo=<%= lista.get(num).getTitulo()%>
                               &autor=<%= lista.get(num).getAutor()%>
                               &editora=<%= lista.get(num).getEditora()%>
                               &ano_publicacao=<%= lista.get(num).getAnoPublicacao()%>
                               &genero=<%= lista.get(num).getGenero()%>
                               &isbn=<%= lista.get(num).getIsbn()%>">Excluir</a>
                        </td>

                    </tr>
                </tbody>
                <%
                        }
                    } catch (Exception e) {
                        out.println(e);
                    }
                %>

            </table>

            <div class="button-container">
                <form action="formInserirLivro.jsp">
                    <div class='form-button-container'>
                        <button class="btn btn-secondary" type="button" onclick="location.href = 'codeListarLivro.jsp'">Voltar para lista completa </button>
                        <button class="btn btn-primary" type="submit">Inserir novo livro</button>
                    </div>
            </div>
        </form>

    </div>
</body>
</html>
