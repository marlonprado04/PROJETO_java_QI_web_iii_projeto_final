<%@page import="modeloDAO.ExemplarDAO"%>
<%@page import="modeloDTO.ExemplarDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="../estilos/style.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

        <title>Alteração de exemplar</title>
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
        <%
            try {
                // Criando objeto da classe ExemplarDTO para fazer a transferência de informações
                // do formulário para a classe ExemplarDTO
                ExemplarDTO objExemplarDTO = new ExemplarDTO();

                // Passando todas as informações do formulário através do comando request.getParameter
                // para alterar todos os campos apenas do exemplar com o ID informado
                objExemplarDTO.setId(Integer.parseInt(request.getParameter("id").trim()));
                objExemplarDTO.setObsDoExemplar(request.getParameter("obs_do_exemplar"));
                objExemplarDTO.setStatus(request.getParameter("status"));

                // Criando objeto da classe ExemplarDAO para fazer a operação de ALTERAÇÃO
                // no banco de dados a partir da classe ExemplarDTO
                ExemplarDAO objExemplarDAO = new ExemplarDAO();

                // Alterando o exemplar através da função alterarExemplar dentro da classe ExemplarDAO
                // utilizando os parâmetros da classe ExemplarDTO
                objExemplarDAO.AlterarExemplar(objExemplarDTO);

                // Exibindo na tela a mensagem de que o exemplar foi alterado com sucesso
                out.println("<div class='message-container'>");

                out.println("<h2 class='form-title'>Exemplar alterado com sucesso!</h2>");

                out.println("<div class='form-button-container'>");
                out.println("<a class='btn btn-secondary' href='../livro/codeListarLivro.jsp'>Listar livros</a>");
                out.println("<a class='btn btn-primary' href='codeListarExemplar.jsp'>Listar exemplares</a>");

                out.println("</div>");

                out.println("</div>");
            } catch (Exception e) {
                // Exibindo na tela a mensagem de que o exemplar não foi alterado devido a algum erro
                out.println("<div class='message-container'>");

                out.println("<h2 class='form-title'>Exemplar não alterado devido algum erro!</h2>");

                out.println("<div class='form-button-container'>");
                out.println("<a class='btn btn-secondary' href='../livro/codeListarLivro.jsp'>Listar livros</a>");
                out.println("<a class='btn btn-primary' href='codeListarExemplar.jsp'>Listar exemplares</a>");
                out.println("</div>");

                out.println("</div>");
            }
        %>
    </body>
</html>
