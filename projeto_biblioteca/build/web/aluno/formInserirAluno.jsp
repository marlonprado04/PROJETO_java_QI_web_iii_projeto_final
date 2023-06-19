<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="../estilos/style.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

        <title>Cadastro de aluno</title>
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

        <h1 class="form-title">Cadastrar aluno</h1>

        <form action="codeInserirAluno.jsp" method="POST">

            <div class="form-container">
                <div class="form-group">
                    <label for="nome">Nome:</label>
                    <input class="form-control" type="text" id="nome" name="nome" placeholder="Ex: Joaquim" required>
                </div>

                <div class="form-group">
                    <label for="sobrenome">Sobrenome:</label>
                    <input  class="form-control"type="text" id="sobrenome" name="sobrenome" placeholder="Ex: da Silva" required>
                </div>

                <div class="form-group">
                    <label for="cpf">CPF:</label>
                    <input  class="form-control" type="text" id="cpf" name="cpf" placeholder="Ex: 123.456.789-01" required>
                </div>

                <div class="form-group">
                    <label for="email">Email:</label>
                    <input  class="form-control" type="text" id="email" name="email" placeholder="Ex: joaquimdasilva@gmail.com" required>
                </div>

                <div class="form-group">
                    <label for="telefone">Telefone:</label>
                    <input  class="form-control" type="text" id="telefone" name="telefone" placeholder="Ex: (51)12345-6789" required>
                </div>

                <div class="form-group">
                    <label for="curso">Curso:</label>
                    <input  class="form-control" type="text" id="curso" name="curso" placeholder="Ex: Ciência da computação" required>
                </div>

                <div class="form-button-container">
                    <button class="btn btn-secondary" type="button" onclick="location.href = 'codeListarAluno.jsp'">Listar alunos</button>
                    <button class="btn btn-primary" type="submit">Cadastrar</button>
                </div>

            </div>

        </form>

    </body>
</html>
