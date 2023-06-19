<%@page import="modeloDAO.LivroDAO"%>
<%@page import="modeloDTO.LivroDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="../estilos/style.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

        <title>Alteração de livro</title>
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
            </div>


        </div>
        <%
            try {
                // Criando objeto da classe LIVRODTO para fazer a transferência de informações
                // do formulário para a classe LIVRO
                LivroDTO objLivroDTO = new LivroDTO();

                // Passando TODAS informações do formulário através do comando request.getParameter
                // para ALTERAR TODOS OS CAMPOS apenas do LIVRO com o ID informado
                objLivroDTO.setId(Integer.parseInt(request.getParameter("id").trim()));
                objLivroDTO.setTitulo(request.getParameter("titulo"));
                objLivroDTO.setAutor(request.getParameter("autor"));
                objLivroDTO.setEditora(request.getParameter("editora"));
                objLivroDTO.setAnoPublicacao(request.getParameter("ano_publicacao"));
                objLivroDTO.setGenero(request.getParameter("genero"));
                objLivroDTO.setIsbn(request.getParameter("isbn"));

                // Criando objeto da classe LIVRODAO para fazer a operação de ALTERAÇÃO
                // no banco de dados a partir da classe LIVRODTO
                LivroDAO objLivroDAO = new LivroDAO();

                // ALTERANDO LIVRO a partir da função ALTERAR dentro da classe LIVRODAO
                // isso tudo pegando os parâmetros da classe LIVRODTO
                objLivroDAO.AlterarLivro(objLivroDTO);

                // Printando na tela a informação de que o livro foi alterado com sucesso
                out.println("<div class='message-container'>");

                out.println("<h2 class='form-title'>Livro alterado com sucesso!</h2>");

                out.println("<div class='form-button-container'>");
                out.println("<a class='btn btn-primary' href='formInserirLivro.jsp'>Cadastrar novo livro</a>");
                out.println("<a class='btn btn-secondary' href='codeListarLivro.jsp'>Listar livros</a>");
                out.println("</div>");

                out.println("</div>");
            } catch (Exception e) {
                // Printando na tela a informação de que o livro não foi alterado devido a algum erro
                out.println("<div class='message-container'>");

                out.println("<h2 class='form-title'>Livro não alterado devido algum erro!</h2>");

                out.println("<div class='form-button-container'>");
                out.println("<a class='btn btn-primary' href='formInserirLivro.jsp'>Cadastrar novo livro</a>");
                out.println("<a class='btn btn-secondary' href='codeListarLivro.jsp'>Listar livros</a>");
                out.println("</div>");

                out.println(e);

            }
        %>
    </body>
</html>
