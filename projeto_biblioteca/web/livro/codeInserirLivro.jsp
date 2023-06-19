<%@page import="modeloDAO.LivroDAO"%>
<%@page import="modeloDTO.LivroDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="../estilos/style.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Retorno da inserção do livro</title>

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

        <% try {
                // Criando objeto da classe LivroDTO para fazer a transferência de informações
                // do formulário para a classe livro
                LivroDTO objLivroDTO = new LivroDTO();

                // Passando as informações do formulário através do comando request.getParameter
                objLivroDTO.setTitulo(request.getParameter("titulo"));
                objLivroDTO.setAutor(request.getParameter("autor"));
                objLivroDTO.setEditora(request.getParameter("editora"));
                objLivroDTO.setAnoPublicacao(request.getParameter("ano_publicacao"));
                objLivroDTO.setGenero(request.getParameter("genero"));
                objLivroDTO.setIsbn(request.getParameter("isbn"));

                // Criando objeto da classe LivroDAO para fazer a operação de cadastro
                // no banco de dados a partir da classe LivroDTO
                LivroDAO objLivroDAO = new LivroDAO();

                // Cadastrando livro a partir da função CadastrarLivro dentro da classe LivroDAO
                // usando os parâmetros da classe LivroDTO
                objLivroDAO.CadastrarLivro(objLivroDTO);

                // Imprimindo na tela a informação de que o livro foi cadastrado com sucesso
                //Printando na tela a informação de que o aluno foi cadastrado com sucesso
                out.println("<div class='message-container'>");

                out.println("<h2 class='form-title'>Livro cadastrado com sucesso!</h2>");

                out.println("<div class='form-button-container'>");
                out.println("<a class='btn btn-primary' href='formInserirLivro.jsp'>Cadastrar novo livro</a>");
                out.println("<a class='btn btn-secondary' href='codeListarLivro.jsp'>Listar livros</a>");
                out.println("</div>");

                out.println("</div>");

            } catch (Exception e) {
                out.println("<div class='message-container'>");

                out.println("<h2 class='form-title'>Livro não cadastrado devido algum erro!</h2>");

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
