<%@page import="modeloDAO.EmprestimoDAO"%>
<%@page import="modeloDTO.EmprestimoDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

        <link rel="stylesheet" type="text/css" href="../estilos/style.css">
        <title>Alteração de empréstimo</title>
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


        <%

            try {
                // Criando objeto da classe EMPRESTIMODTO para fazer a transferência de informações
                // do formulário para a classe EMPRESTIMODTO
                EmprestimoDTO objEmprestimoDTO = new EmprestimoDTO();

                // Passando todas as informações do formulário através do comando request.getParameter
                // para alterar todos os campos apenas do EMPRESTIMO com o ID informado
                objEmprestimoDTO.setId(Integer.parseInt(request.getParameter("id").trim()));
                objEmprestimoDTO.setIdAluno(Integer.parseInt(request.getParameter("id_aluno").trim()));
                objEmprestimoDTO.setIdExemplar(Integer.parseInt(request.getParameter("id_exemplar").trim()));
                objEmprestimoDTO.setDataDevolucao(request.getParameter("data_devolucao"));
                objEmprestimoDTO.setDataEmprestimo(request.getParameter("data_emprestimo"));
                objEmprestimoDTO.setStatus(request.getParameter("status_emprestimo"));

                // Criando objeto da classe EMPRESTIMODAO para fazer a operação de ALTERAÇÃO
                // no banco de dados a partir da classe EMPRESTIMODAO
                EmprestimoDAO objEmprestimoDAO = new EmprestimoDAO();

                // Alterando o exemplar através da função ALTERAREMPRESTIMO dentro da classe EMPRESTIMODAO
                // utilizando os parâmetros da classe EMPRESTIMODAO
                objEmprestimoDAO.AlterarEmprestimo(objEmprestimoDTO);

                // Exibindo na tela a mensagem de que o EMPRÉSTIMO foi alterado com sucesso
                out.println("<div class='message-container'>");

                out.println("<h2 class='form-title'>Empréstimo alterado com sucesso!</h2>");

                out.println("<div class='form-button-container'>");
                out.println("<a class='btn btn-secondary' href='../aluno/codeListarAluno.jsp'>Listar alunos</a>");
                out.println("<a class='btn btn-primary' href='codeListarEmprestimo.jsp'>Listar empréstimos</a>");
                out.println("</div>");
            } catch (Exception e) {
                // Exibindo na tela a mensagem de que o EMPRÉSTIMO não foi alterado devido a algum erro
                out.println("<div class='message-container'>");

                out.println("<h2 class='form-title'>Empréstimo não excluído devido algum erro!</h2>");

                out.println("<div class='form-button-container'>");
                out.println("<a class='btn btn-secondary' href='../aluno/codeListarAluno.jsp'>Listar alunos</a>");
                out.println("<a class='btn btn-primary' href='codeListarEmprestimo.jsp'>Listar empréstimos</a>");
                out.println("</div>");
            }
        %>
    </body>
</html>
