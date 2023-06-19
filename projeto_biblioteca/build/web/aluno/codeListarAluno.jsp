<%@page import="modeloDTO.AlunoDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modeloDAO.AlunoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="../estilos/style.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="header">
            <h1>Biblioteca</h1>
            <div>
                <ul class="nav nav-pills nav-fill">
                    <li class="nav-item">
                        <a class="nav-link active" href="../aluno/codeListarAluno.jsp">Alunos</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="../livro/codeListarLivro.jsp">Livros</a>
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

            <h1 class='form-title'>Lista de Alunos</h1>

            <div class="container ">

                <nav class="navbar navbar-light bg-light float-right">
                    <form class="form-inline" action='codeConsultarAlunoPorNome.jsp' method="POST">
                        <input class="form-control mr-sm-2" type="search" placeholder="Digite o nome..." aria-label="Search" name='nome'>
                        <button class="btn btn-outline-primary my-2 my-sm-0" type="submit" onclick="location.href = 'codeConsultarAlunoPorNome.jsp'">Pesquisar por nome</button>
                    </form>
                </nav>

                <nav class="navbar navbar-light float-right">
                    <form class="form-inline" action='codeConsultarAlunoPorCpf.jsp' method="POST">
                        <input class="form-control mr-sm-2" type="search" placeholder="Digite o CPF..." aria-label="Search" name='cpf'>
                        <button class="btn btn-outline-primary my-2 my-sm-0" type="submit" onclick="location.href = 'codeConsultarAlunoPorCpf.jsp'">Pesquisar por CPF</button>
                    </form>
                </nav>
            </div>


            <table class="table table-bordered table-striped">
                <thead class="thead-dark">
                    <tr>
                        <th scope="col">Código</th>
                        <th scope="col">Nome</th>
                        <th scope="col">Sobrenome</th>
                        <th scope="col">CPF</th>
                        <th scope="col">Telefone</th>
                        <th scope="col">Email</th>
                        <th scope="col">Curso</th>
                        <th colspan="2">Empréstimo</th>
                        <th colspan="2">Cadastro do Aluno</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        try {
                            AlunoDAO objAlunoDAO = new AlunoDAO();
                            ArrayList<AlunoDTO> lista = objAlunoDAO.ListarAluno();
                            for (int num = 0; num < lista.size(); num++) {
                    %>
                    <tr>      

                        <td><%= lista.get(num).getId()%></td>
                        <td><%= lista.get(num).getNome()%></td>
                        <td><%= lista.get(num).getSobrenome()%></td>
                        <td><%= lista.get(num).getCpf()%></td>
                        <td><%= lista.get(num).getTelefone()%></td>
                        <td><%= lista.get(num).getEmail()%></td>
                        <td><%= lista.get(num).getCurso()%></td>

                        <td><a class="btn btn-info btn-sm" href="../emprestimo/formSelecionarLivroParaEmprestimo.jsp?id_aluno=<%= lista.get(num).getId()%>
                               &nome=<%= lista.get(num).getNome()%>
                               &sobrenome=<%= lista.get(num).getSobrenome()%>">Inserir</a></td>

                        <td><a  class="btn btn-info btn-sm disabled" href="../emprestimo/codeListarEmprestimoDoAluno.jsp?id_aluno=<%= lista.get(num).getId()%>">Listar</a></td>

                        <!-- No código abaixo estou passando as informações da lista 
                        para a outra página a partir do clique do usuário no link--> 
                        <td><a class="btn btn-dark btn-sm" href="formAlterarAluno.jsp?id=<%= lista.get(num).getId()%>
                               &nome=<%= lista.get(num).getNome()%>
                               &sobrenome=<%= lista.get(num).getSobrenome()%>
                               &cpf=<%=lista.get(num).getCpf()%>
                               &telefone=<%= lista.get(num).getTelefone()%>
                               &email=<%= lista.get(num).getEmail()%>
                               &curso=<%= lista.get(num).getCurso()%>">Alterar</a></td>

                        <!-- No código abaixo estou passando as informações da lista 
                        para a outra página a partir do clique do usuário no link--> 
                        <td><a class="btn btn-danger btn-sm" href="formExcluirAluno.jsp?id=<%= lista.get(num).getId()%>
                               &nome=<%= lista.get(num).getNome()%>
                               &sobrenome=<%= lista.get(num).getSobrenome()%>
                               &cpf=<%=lista.get(num).getCpf()%>
                               &telefone=<%= lista.get(num).getTelefone()%>
                               &email=<%= lista.get(num).getEmail()%>
                               &curso=<%= lista.get(num).getCurso()%>">Excluir</a></td>

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
                <form action="formInserirAluno.jsp">
                    <button class="btn btn-primary " type="submit">Inserir novo aluno</button>
                </form>
            </div>
        </div>
    </body>
</html>