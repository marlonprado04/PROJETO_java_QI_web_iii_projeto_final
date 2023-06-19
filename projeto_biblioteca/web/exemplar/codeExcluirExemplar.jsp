<%-- 
    Document   : codeExcluirExemplar
    Created on : 20 de mai. de 2023, 21:41:33
    Author     : marlo
--%>

<%@page import="modeloDAO.ExemplarDAO"%>
<%@page import="modeloDTO.ExemplarDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="../estilos/style.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

        <title>Exclusão de exemplar</title>
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
        <%-- Bloco try-catch para tratar possíveis exceções --%>
        <% try {
                // Criação do objeto ExemplarDTO para transferência de informações do formulário para a classe ExemplarDTO
                ExemplarDTO objExemplarDTO = new ExemplarDTO();

                // Preenchimento do ID do exemplar a ser excluído através do parâmetro recebido do formulário
                objExemplarDTO.setId(Integer.parseInt(request.getParameter("id").trim()));

                // Criação do objeto ExemplarDAO para realizar a exclusão do exemplar no banco de dados
                ExemplarDAO objExemplarDAO = new ExemplarDAO();

                // Exclusão do exemplar utilizando a função excluirExemplar do objeto ExemplarDAO
                objExemplarDAO.ExcluirExemplar(objExemplarDTO);

                // Exibição da mensagem de sucesso após a exclusão do exemplar
                out.println("<div class='message-container'>");

                out.println("<h2 class='form-title'>Exemplar excluído com sucesso!</h2>");

                out.println("<div class='form-button-container'>");
                out.println("<a class='btn btn-secondary' href='../livro/codeListarLivro.jsp'>Listar livros</a>");
                out.println("<a class='btn btn-primary' href='codeListarExemplar.jsp'>Listar exemplares</a>");

                out.println("</div>");

                out.println("</div>");

            } catch (Exception e) {
                // Em caso de exceção, exibição da mensagem de erro
                out.println("<div class='message-container'>");

                out.println("<h2 class='form-title'>Exemplar não excluído devido algum erro!</h2>");

                out.println("<div class='form-button-container'>");
                out.println("<a class='btn btn-secondary' href='../livro/codeListarLivro.jsp'>Listar livros</a>");
                out.println("<a class='btn btn-primary' href='codeListarExemplar.jsp'>Listar exemplares</a>");

                out.println("</div>");

                out.println("</div>");
            }
        %>
    </body>
</html>
