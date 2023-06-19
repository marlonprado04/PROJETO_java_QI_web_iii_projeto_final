<%@page import="modeloDTO.ExemplarDTO"%>
<%@page import="modeloDAO.ExemplarDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modeloDTO.LivroDTO"%>
<%@page import="modeloDAO.LivroDAO"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="../estilos/style.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
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
                <h3>Informações do aluno: </h3>

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

        <!-- SESSÃO COM INFORMAÇÕES DO LIVRO -->


        <form method="POST">

            <div class="form-container">
                <h3>Informações do livro: </h3>
                <div class="form-group">
                    <label for="id_livro">ID</label>
                    <input class="form-control" type="text" id="id_livro" name="id_livro" placeholder="ID do livro" required value="<%= request.getParameter("id_livro")%>" readonly>
                </div>
                <div class="form-group">
                    <label for="titulo">Titulo</label>
                    <input class="form-control" type="text" id="titulo" name="titulo" placeholder="Titulo do livro" required value="<%=request.getParameter("titulo")%>" readonly>
                </div>
            </div>
        </form>

        <!-- SESSÃO COM INFORMAÇÕES DO EXEMPLAR -->
        <div class="container">

            <h1 class="form-title">Lista de Exemplares</h1>

            <div class="container">

                <nav class="navbar navbar-light bg-light float-right">
                    <form class="form-inline" action='formSelecionarExemplarParaEmprestimo.jsp' method="POST">
                        <input class="form-control mr-sm-2" type="search" placeholder="Digite o status..." aria-label="Search" name='status'>

                        <input type="hidden" name="id_aluno" value="<%= request.getParameter("id_aluno") != null ? request.getParameter("id_aluno").trim() : ""%>">
                        <input type="hidden" name="nome" value="<%= request.getParameter("nome")%>">
                        <input type="hidden" name="sobrenome" value="<%= request.getParameter("sobrenome")%>">

                        <input type="hidden" name="id_livro" value="<%= request.getParameter("id_livro") != null ? request.getParameter("id_livro").trim() : ""%>">
                        <input type="hidden" name="titulo" value="<%= request.getParameter("titulo")%>">

                        <button class="btn btn-outline-primary my-2 my-sm-0" type="submit" onclick="location.href = 'formSelecionarExemplarParaEmprestimo.jsp'">Pesquisar por status</button>
                    </form>
                </nav>
            </div>

            <table class="table table-bordered table-striped">
                <thead class="thead-dark">

                    <tr>
                        <th scope='col'>Código do Livro</th>
                        <th scope='col'>Nome do Livro</th>

                        <th scope='col'>ID do exemplar</th>
                        <th scope='col'>Status</th>
                        <th scope='col'>Observação</th>

                        <th scope="col">Empréstimo</th>
                    </tr>
                </thead>

                <%
                    try {
                        ExemplarDAO objExemplarDAO = new ExemplarDAO();
                        LivroDAO objLivroDAO = new LivroDAO();

                        int idLivro = Integer.parseInt(request.getParameter("id_livro").trim());
                        String status = request.getParameter("status") != null ? request.getParameter("status").trim() : "";

                        ArrayList<ExemplarDTO> lista = objExemplarDAO.ListarExemplarDoLivroComStatus(idLivro, status);

                        for (int num = 0; num < lista.size(); num++) {
                %>
                <tbody>
                    <tr>
                        <td><%= lista.get(num).getIdLivro()%></td>
                        <td><%= objLivroDAO.ObterTituloLivro(lista.get(num).getIdLivro())%></td>

                        <td><%= lista.get(num).getId()%></td>
                        <td><%= lista.get(num).getStatus()%></td>
                        <td><%= lista.get(num).getObsDoExemplar()%></td>

                        <td>
                            <a class="btn btn-info btn-sm" href="formInserirEmprestimo.jsp?id_aluno=<%= request.getParameter("id_aluno") != null ? request.getParameter("id_aluno").trim() : ""%>
                               &nome=<%= request.getParameter("nome")%>
                               &sobrenome=<%= request.getParameter("sobrenome")%>
                               &id_livro=<%= request.getParameter("id_livro")%>
                               &titulo=<%=request.getParameter("titulo")%>
                               &id_exemplar=<%= lista.get(num).getId()%>
                               &obs_exemplar=<%= lista.get(num).getObsDoExemplar()%>">Adicionar</a>
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


    </body>
</html>
