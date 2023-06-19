<%-- 
    Document   : codeExcluirLivro
    Created on : 20 de mai. de 2023, 21:41:33
    Author     : marlo
--%>

<%@page import="modeloDAO.LivroDAO"%>
<%@page import="modeloDTO.LivroDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="../estilos/style.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <title>Exclusão de livro</title>
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

        <%-- Bloco try-catch para tratar possíveis exceções --%>
        <% try {
                // Criação do objeto LivroDTO para transferência de informações do formulário para a classe Livro
                LivroDTO objLivroDTO = new LivroDTO();

                // Preenchimento do ID do livro a ser excluído através do parâmetro recebido do formulário
                objLivroDTO.setId(Integer.parseInt(request.getParameter("id").trim()));

                // Criação do objeto LivroDAO para realizar a exclusão do livro no banco de dados
                LivroDAO objLivroDAO = new LivroDAO();

                // Exclusão do livro utilizando a função ExcluirLivro do objeto LivroDAO
                objLivroDAO.ExcluirLivro(objLivroDTO);

                // Exibição da mensagem de sucesso após a exclusão do livro
                out.println("<div class='message-container'>");

                out.println("<h2 class='form-title'>Livro excluído com sucesso!</h2>");

                out.println("<div class='form-button-container'>");
                out.println("<a class='btn btn-primary' href='formInserirLivro.jsp'>Cadastrar novo livro</a>");
                out.println("<a class='btn btn-secondary' href='codeListarLivro.jsp'>Listar livros</a>");
                out.println("</div>");

                out.println("</div>");

            } catch (Exception e) {

                out.println("<div class='message-container'>");

                out.println("<h2 class='form-title'>Livro não excluído devido algum erro!</h2>");

                out.println("<div class='form-button-container'>");
                out.println("<a class='btn btn-primary' href='formInserirLivro.jsp'>Cadastrar novo livro</a>");
                out.println("<a class='btn btn-secondary' href='codeListarLivro.jsp'>Listar livros</a>");
                out.println("</div>");

                out.println("</div>");

                out.println(e);

            }
        %>
    </body>
</html>
