<%-- 
    Document   : codeExcluirAluno
    Created on : 20 de mai. de 2023, 21:41:33
    Author     : marlo
--%>

<%@page import="modeloDAO.AlunoDAO"%>
<%@page import="modeloDTO.AlunoDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="../estilos/style.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <title>Exclusão de aluno</title>
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
            </div>
        </div>
        <% try {
                // Criando objeto da classe ALUNODTO para fazer a transferência de informações
                // do formulário para a classe ALUNO
                AlunoDTO objAlunoDTO = new AlunoDTO();

                // Passando o id do formulário através do comando request.getparameter
                // para EXCLUIR apenas o ALUNO com o id informado
                objAlunoDTO.setId(Integer.parseInt(request.getParameter("id").trim()));

                // Criando objeto da classe ALUNODAO para fazer a operação de EXCLUSÃO
                // no banco de dados a partir da classe ALUNODTO
                AlunoDAO objAlunoDAO = new AlunoDAO();

                // EXCLUINDO ALUNO a partir da função EXCLUIRALUNO dentro classe ALINODAO
                // isso tudo pegando os parâmetros da classe ALUNODTO
                objAlunoDAO.ExcluirAluno(objAlunoDTO);

                //Printando na tela a informação de que o aluno foi excluído com sucesso
                out.println("<div class='message-container'>");

                out.println("<h2 class='form-title'>Aluno excluído com sucesso!</h2>");

                out.println("<div class='form-button-container'>");
                out.println("<a class='btn btn-primary' href='formInserirAluno.jsp'>Cadastrar novo aluno</a>");
                out.println("<a class='btn btn-secondary' href='codeListarAluno.jsp'>Listar alunos</a>");
                out.println("</div>");

                out.println("</div>");

            } catch (Exception e) {

                //Printando na tela a informação de que o aluno foi não foi excluído 
                out.println("<div class='message-container'>");

                out.println("<h2 class='form-title'>Aluno não excluído devido algum erro!</h2>");

                out.println("<div class='form-button-container'>");
                out.println("<a class='btn btn-primary' href='formInserirAluno.jsp'>Cadastrar novo aluno</a>");
                out.println("<a class='btn btn-secondary' href='codeListarAluno.jsp'>Listar alunos</a>");
                out.println("</div>");

                out.println("</div>");

                out.println(e);

            }
        %>
    </body>
</html>
