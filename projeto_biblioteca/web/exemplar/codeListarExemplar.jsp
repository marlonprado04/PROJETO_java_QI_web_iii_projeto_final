<%@page import="modeloDTO.ExemplarDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modeloDAO.ExemplarDAO"%>
<%@page import="modeloDAO.LivroDAO" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="../estilos/style.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <title>Lista de Exemplares</title>
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


        <div class="container">


            <h1 class="form-title">Lista de Exemplares</h1>

            <div class="container">

                <nav class="navbar navbar-light bg-light float-right">
                    <form class="form-inline" action='codeConsultarExemplarPorStatus.jsp' method="POST">
                        <input class="form-control mr-sm-2" type="search" placeholder="Digite o status..." aria-label="Search" name='status'>
                        <button class="btn btn-outline-primary my-2 my-sm-0" type="submit" onclick="location.href = 'codeConsultarExemplarPorStatus.jsp'">Pesquisar por status</button>
                    </form>
                </nav>

                <nav class="navbar navbar-light bg-light float-right">
                    <form class="form-inline" action='codeConsultarExemplarPorObservacao.jsp' method="POST">
                        <input class="form-control mr-sm-2" type="search" placeholder="Digite a observação..." aria-label="Search" name='observacao'>
                        <button class="btn btn-outline-primary my-2 my-sm-0" type="submit" onclick="location.href = 'codeConsultarExemplarPorObservacao.jsp'">Pesquisar por observação</button>
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

                        <th colspan='2'>Cadastro exemplar</th>
                    </tr>
                </thead>
                
                <%
                    try {
                        ExemplarDAO objExemplarDAO = new ExemplarDAO();
                        LivroDAO objLivroDAO = new LivroDAO();
                        ArrayList<ExemplarDTO> lista = objExemplarDAO.ListarExemplar();
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
                            <a class="btn btn-dark btn-sm" href="formAlterarExemplar.jsp?id=<%= lista.get(num).getId()%>
                               &id_livro=<%= lista.get(num).getIdLivro()%>
                               &titulo_livro=<%= objLivroDAO.ObterTituloLivro(lista.get(num).getIdLivro())%>
                               &obs_do_exemplar=<%= lista.get(num).getObsDoExemplar()%>
                               &status=<%= lista.get(num).getStatus()%>">Editar</a>
                        </td>
                        <td>
                            <a class="btn btn-danger btn-sm" href="formExcluirExemplar.jsp?id=<%= lista.get(num).getId()%>
                               &id_livro=<%= lista.get(num).getIdLivro()%>
                               &titulo_livro=<%= objLivroDAO.ObterTituloLivro(lista.get(num).getIdLivro())%>
                               &obs_do_exemplar=<%= lista.get(num).getObsDoExemplar()%>
                               &status=<%= lista.get(num).getStatus()%>">Excluir</a>
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

            <div class="button-container float-right">
                <form action="../livro/codeListarLivro.jsp">
                    <button class="btn btn-primary" type="submit">Ir para lista de livros</button>
                </form>
            </div>
        </div>
    </body>
</html>
