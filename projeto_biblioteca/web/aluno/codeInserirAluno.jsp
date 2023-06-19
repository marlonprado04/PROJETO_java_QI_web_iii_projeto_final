
<%@page import="modeloDAO.AlunoDAO"%>
<%@page import="modeloDTO.AlunoDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="../estilos/style.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Retorno da inserção do aluno</title>

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
        <% try {
                // Criando objeto da classe ALUNODTO para fazer a transferência de informações
                // do formulário para a classe aluno
                AlunoDTO objAlunoDTO = new AlunoDTO();

                // Passando as informações do formulário através do comando request.getparameter
                objAlunoDTO.setNome(request.getParameter("nome"));
                objAlunoDTO.setSobrenome(request.getParameter("sobrenome"));
                objAlunoDTO.setCpf(request.getParameter("cpf"));
                objAlunoDTO.setEmail(request.getParameter("email"));
                objAlunoDTO.setCurso(request.getParameter("curso"));
                objAlunoDTO.setTelefone(request.getParameter("telefone"));

                // Criando objeto da classe ALUNODAO para fazer a operação de cadastro
                // no banco de dados a partir da classe ALUNODTO
                AlunoDAO objAlunoDAO = new AlunoDAO();

                // Cadastrando aluno a partir da função CADASTRARALUNO dentro classe ALINODAO
                // isso tudo pegando os parâmetros da classe ALUNODTO
                objAlunoDAO.CadastrarAluno(objAlunoDTO);

                //Printando na tela a informação de que o aluno foi cadastrado com sucesso
                out.println("<div class='message-container'>");

                out.println("<h2 class='form-title'>Aluno cadastrado com sucesso!</h2>");

                out.println("<div class='form-button-container'>");
                out.println("<a class='btn btn-primary' href='formInserirAluno.jsp'>Cadastrar novo aluno</a>");
                out.println("<a class='btn btn-secondary' href='codeListarAluno.jsp'>Listar alunos</a>");
                out.println("</div>");

                out.println("</div>");

            } catch (Exception e) {
                //Printando na tela a informação de que o aluno não foi cadastrado devido algum erro
                out.println("<div class='message-container'>");

                out.println("<h2 class='form-title'>Aluno não cadastrado devido algum erro!</h2>");

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
