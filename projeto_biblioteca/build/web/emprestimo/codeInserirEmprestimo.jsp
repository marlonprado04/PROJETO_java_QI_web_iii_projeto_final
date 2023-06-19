<%@page import="modeloDAO.ExemplarDAO"%>
<%@page import="modeloDTO.ExemplarDTO"%>
<%@page import="modeloDAO.EmprestimoDAO"%>
<%@page import="modeloDTO.EmprestimoDTO"%>
<%@page import="java.time.LocalDateTime"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="../estilos/style.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Retorno do cadastro de empréstimo</title>

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

                // --------------------------------------------------------
                // EMPRÉSTIMO
                // Criando objeto da classe EMPRESTIMODTO para fazer a transferência de informações
                // do formulário para a classe EMPRESTIMO
                EmprestimoDTO objEmprestimoDTO = new EmprestimoDTO();

                // Passando as informações do formulário através do comando request.getparameter
                objEmprestimoDTO.setIdAluno(Integer.parseInt(request.getParameter("id_aluno").trim()));
                objEmprestimoDTO.setIdExemplar(Integer.parseInt(request.getParameter("id_exemplar").trim()));
                objEmprestimoDTO.setDataEmprestimo(request.getParameter("data_emprestimo"));
                objEmprestimoDTO.setDataDevolucao(request.getParameter("data_devolucao"));
                objEmprestimoDTO.setStatus(request.getParameter("status_emprestimo"));

                // Criando objeto da classe EMPRESTIMODAO para fazer a operação de cadastro
                // no banco de dados a partir da classe EMPRESTIMODTO
                EmprestimoDAO objEmprestimoDAO = new EmprestimoDAO();

                // Cadastrando aluno a partir da função CADASTRARALUNO dentro classe ALINODAO
                // isso tudo pegando os parâmetros da classe ALUNODTO
                objEmprestimoDAO.CadastrarEmprestimo(objEmprestimoDTO);

                //----------------------------------------------------------
                // EXEMPLAR
                // Criando objeto da classe ExemplarDTO para fazer a transferência de informações
                // do formulário para a classe ExemplarDTO
                ExemplarDTO objExemplarDTO = new ExemplarDTO();

                // Passando todas as informações do formulário através do comando request.getParameter
                // para alterar todos os campos apenas do exemplar com o ID informado
                objExemplarDTO.setId(Integer.parseInt(request.getParameter("id_exemplar").trim()));
                objExemplarDTO.setObsDoExemplar(request.getParameter("obs_exemplar"));
                objExemplarDTO.setStatus(request.getParameter("status_exemplar"));

                // Criando objeto da classe ExemplarDAO para fazer a operação de ALTERAÇÃO
                // no banco de dados a partir da classe ExemplarDTO
                ExemplarDAO objExemplarDAO = new ExemplarDAO();

                // Alterando o exemplar através da função alterarExemplar dentro da classe ExemplarDAO
                // utilizando os parâmetros da classe ExemplarDTO
                objExemplarDAO.AlterarExemplar(objExemplarDTO);

                // Exibindo mensagem de sucesso
                out.println("<div class='message-container'>");

                out.println("<h2 class='form-title'>Empréstimo cadastrado com sucesso!</h2>");

                out.println("<div class='form-button-container'>");
                out.println("<a class='btn btn-secondary' href='../aluno/codeListarAluno.jsp'>Listar alunos</a>");
                out.println("<a class='btn btn-primary' href='codeListarEmprestimo.jsp'>Listar empréstimos</a>");
                out.println("</div>");

                out.println("</div>");
            } catch (Exception e) {
                // Exibindo mensagem de erro
                out.println("<div class='message-container'>");

                out.println("<h2 class='form-title'>Empréstimo não cadastrado devido algum erro!</h2>");

                out.println("<div class='form-button-container'>");
                out.println("<a class='btn btn-secondary' href='../aluno/codeListarAluno.jsp'>Listar alunos</a>");
                out.println("<a class='btn btn-primary' href='codeListarEmprestimo.jsp'>Listar empréstimos</a>");
                out.println("</div>");

                out.println("</div>");
            }
        %>
    </body>
</html>
