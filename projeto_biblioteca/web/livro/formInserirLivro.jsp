<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="../estilos/style.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro de livro</title>
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

        <h1 class="form-title">Cadastrar novo livro</h1>

        <form action="codeInserirLivro.jsp" method="POST">

            <div class="form-container">
                <div class="form-group">
                    <label for="titulo">Título:</label>
                    <input class="form-control" type="text" id="titulo" name="titulo" placeholder="Ex: Dom Quixote" required>
                </div>

                <div class="form-group">
                    <label for="autor">Autores: </label>
                    <input class="form-control" type="text" id="autor" name="autor" placeholder="Ex: Machado de Assis" required>
                </div>

                <div class="form-group">
                    <label for="editora">Editora:</label>
                    <input class="form-control" type="text" id="editora" name="editora" placeholder="Ex: Companhia das Letras" required>
                </div>

                <div class="form-group">
                    <label for="ano_publicacao">Ano de Publicação (4 digitos):</label>
                    <input class="form-control" type="text" id="ano_publicacao" name="ano_publicacao" placeholder="Ex: 1605" required>
                </div>

                <div class="form-group">
                    <label for="genero">Gênero:</label>
                    <input class="form-control" type="text" id="genero" name="genero" placeholder="Ex: Romance" required>
                </div>

                <div class="form-group">
                    <label for="isbn">ISBN:</label>
                    <input class="form-control" type="text" id="isbn" name="isbn" placeholder="Ex: 978-85-359-0277-9" required>
                </div>

                <div class="form-button-container">
                    <button class="btn btn-secondary" type="button" onclick="location.href = 'codeListarLivro.jsp'">Listar Livros</button>
                    <button class="btn btn-primary" type="submit">Cadastrar</button>
                </div>
            </div>

        </form>

    </body>
</html>
