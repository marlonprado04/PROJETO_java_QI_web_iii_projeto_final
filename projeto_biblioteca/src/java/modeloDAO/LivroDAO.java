/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modeloDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import modeloDTO.LivroDTO;
import java.sql.ResultSet;

public class LivroDAO {

    // Criando a variável do tipo connection para poder conectar com o banco de dados
    // Criada globalmente para não precisar criar em cada uma das funções
    Connection con;

    // Criando variável que prepara o código sql para acessar o banco de dados
    // Criada globalmente para não precisar criar em cada uma das funções abaixo
    PreparedStatement pstm;

    // Criando variável necessária para pegar e trabalhar 
    // com os dados do banco de dados 
    ResultSet rs;

    //Criando variável do tipo arraylist para colocar a lista de LIVROS
    // extraída do banco de dados a partir do resultset
    ArrayList<LivroDTO> lista = new ArrayList<>();

    // Criando método do tipo VOID (não retorna nada quando chamado)
    // para cadastrar livro novo. Coloquei como parâmetro padrão do método um objeto
    // do tipo LivroDTO que será a classe de onde as informações do livro
    // serão puxadas.
    public void CadastrarLivro(LivroDTO objLivroDTO) throws ClassNotFoundException {

        // Criando variável com comando SQL necessário para
        // incluir um novo livro na tabela
        // ATENÇÃO: necessário colocar todos os campos que
        // não possuem auto_increment, para pegar do input do usuário através da página JSP
        // e passar para as variáveis ainda não declaradas.
        String sql = "INSERT INTO livro (titulo, autor, editora,  ano_publicacao, genero, isbn) VALUES (?, ?, ?, ?, ?, ?)";

        // Passando a função de conexão com o banco de dados criada na classe ConexaoDAO para
        // a variável con criada acima, para que a função CadastrarLivro funcione direito
        con = new ConexaoDAO().conexaoBD();

        try {

            // Atribuindo à variável pstm a conexão com sql (a partir da variável con)
            // e passando em seguida o comando sql criado acima
            pstm = con.prepareStatement(sql);

            // Passando os campos que serão inseridos no banco de dados, de acordo com o tipo
            // e sequência informada acima    
            pstm.setString(1, objLivroDTO.getTitulo());
            pstm.setString(2, objLivroDTO.getAutor());
            pstm.setString(3, objLivroDTO.getEditora());
            pstm.setString(4, objLivroDTO.getAnoPublicacao());
            pstm.setString(5, objLivroDTO.getGenero());
            pstm.setString(6, objLivroDTO.getIsbn());

            // Executando o código preparado acima
            pstm.execute();

            // Fechando a conexão e codificação
            pstm.close();

        } catch (SQLException e) {

            System.err.println(e);

        }

    }

    // Criando método do tipo arraylist que retorna um array quando chamado
    // para listar todos os livros 
    public ArrayList<LivroDTO> ListarLivro() throws ClassNotFoundException {

        // Criando variável com comando SQL necessário para
        // listar um novo livro na tabela        
        String sql = "SELECT * FROM livro;";

        // Passando a função de conexão com o banco de dados criada na classe ConexaoDAO para
        // a variável con criada acima, para que a função funcione direito
        con = new ConexaoDAO().conexaoBD();

        try {

            // Atribuindo à variável pstm a conexão com sql (a partir da variável con)
            // e passando em seguida o comando sql criado acima
            pstm = con.prepareStatement(sql);

            // Como o comando em sql acima retorna uma seleção, é necessário
            // trabalhar com a variável do tipo ResultSet, que vai armazenar
            // os dados da seleção.
            // Abaixo estou passando o resultado do pstm para essa 
            // variável do tipo ResultSet
            rs = pstm.executeQuery(sql);

            // Criando laço de repetição para varrer o resultado
            // do select do banco de dados até pegar o último elemento            
            while (rs.next()) {

                // Criando objeto para acessar as informações do livro
                LivroDTO objLivroDTO = new LivroDTO();

                // Passando as informações do livro extraídas do banco de dados
                // para a classe LivroDTO 
                objLivroDTO.setId(rs.getInt("id"));
                objLivroDTO.setTitulo(rs.getString("titulo"));
                objLivroDTO.setAutor(rs.getString("autor"));
                objLivroDTO.setEditora(rs.getString("editora"));
                objLivroDTO.setAnoPublicacao(rs.getString("ano_publicacao"));
                objLivroDTO.setGenero(rs.getString("genero"));
                objLivroDTO.setIsbn(rs.getString("isbn"));

                // Adicionando as informações do livro para a variável
                // lista criada acima
                lista.add(objLivroDTO);

            }

            // Executando o código preparado acima
            pstm.execute();

            // Fechando a conexão e codificação
            pstm.close();

        } catch (SQLException e) {
            System.out.println(e);

        }

        return lista;

    }

    // Criando método do tipo VOID (não retorna nada quando chamado)
// para excluir um livro. Coloquei como parâmetro padrão do método um objeto
// do tipo LivroDTO que será a classe de onde as informações do livro
// serão puxadas.
    public void ExcluirLivro(LivroDTO objLivroDTO) throws ClassNotFoundException {

        // Criando variável com comando SQL necessário para
        // excluir um livro na tabela
        String sql = "DELETE FROM livro WHERE id = ?";

        // Passando a função de conexão com o banco de dados criada na classe ConexaoDAO para
        // a variável con criada acima, para que a função funcione corretamente
        con = new ConexaoDAO().conexaoBD();

        try {

            // Atribuindo à variável pstm a conexão com sql (a partir da variável con)
            // e passando em seguida o comando sql criado acima
            pstm = con.prepareStatement(sql);

            // Passando o campo de id para o banco de dados filtrar
            // apenas o livro selecionado
            pstm.setInt(1, objLivroDTO.getId());

            // Executando o código preparado acima
            pstm.execute();

            // Fechando a conexão e codificação
            pstm.close();

        } catch (SQLException e) {

            System.err.println(e);

        }

    }

// Criando método do tipo VOID (não retorna nada quando chamado)
// para ALTERAR um LIVRO. Coloquei como parâmetro padrão do método um objeto
// do tipo LivroDTO que será a classe de onde as informações do livro
// serão puxadas.
    public void AlterarLivro(LivroDTO objLivroDTO) throws ClassNotFoundException {

        // Criando variável com comando SQL necessário para
        // ALTERAR um LIVRO na tabela
        String sql = "UPDATE livro SET titulo = ?, autor = ?, editora = ?, ano_publicacao = ?, genero = ?, isbn = ? WHERE id = ?";

        // Passando a função de conexão com o banco de dados criada na classe ConexaoDAO para
        // a variável con criada acima, para que a função funcione corretamente
        con = new ConexaoDAO().conexaoBD();

        try {

            // Atribuindo à variável pstm a conexão com sql (a partir da variável con)
            // e passando em seguida o comando sql criado acima
            pstm = con.prepareStatement(sql);

            // Passando os campos ATUALIZADOS do LIVRO pegos a partir da classe
            // LivroDTO que possuem os dados a serem transferidos
            pstm.setString(1, objLivroDTO.getTitulo());
            pstm.setString(2, objLivroDTO.getAutor());
            pstm.setString(3, objLivroDTO.getEditora());
            pstm.setString(4, objLivroDTO.getAnoPublicacao());
            pstm.setString(5, objLivroDTO.getGenero());
            pstm.setString(6, objLivroDTO.getIsbn());

            // Passando o id para o banco de dados filtrar
            // apenas o LIVRO selecionado
            pstm.setInt(7, objLivroDTO.getId());

            // Executando o código preparado acima
            pstm.execute();

            // Fechando a conexão e codificação
            pstm.close();

        } catch (SQLException e) {

            System.err.println(e);

        }

    }

// Criando método para retornar o título do livro a partir do ID informado
    public String ObterTituloLivro(int idLivro) throws ClassNotFoundException {
        // Criando variável para armazenar o título do livro
        String tituloLivro = "";

        // Criando comando SQL para extrair o título do livro a partir do ID informado
        String sql = "SELECT titulo FROM livro WHERE id = ?";

        // Obtendo a conexão com o banco de dados
        con = new ConexaoDAO().conexaoBD();

        try {
            // Preparando o  comando SQL
            pstm = con.prepareStatement(sql);

            // Definindo o valor do parâmetro ID
            pstm.setInt(1, idLivro);

            // Atribuindo o resultado da query à variável de ResultSet
            rs = pstm.executeQuery();

            while (rs.next()) {
                tituloLivro = rs.getString("titulo");
            }

        } catch (SQLException e) {
            System.err.println(e);
        }

        return tituloLivro;
    }

// Criando método para consultar livro pelo titulo
    public ArrayList<LivroDTO> ConsultarLivroPorTitulo(String titulo) throws ClassNotFoundException {

        String sql = "SELECT * FROM livro WHERE titulo LIKE ?";

        con = new ConexaoDAO().conexaoBD();

        try {
            pstm = con.prepareStatement(sql);
            pstm.setString(1, "%" + titulo + "%");
            rs = pstm.executeQuery();

            while (rs.next()) {
                LivroDTO objLivroDTO = new LivroDTO();
                objLivroDTO.setId(rs.getInt("id"));
                objLivroDTO.setTitulo(rs.getString("titulo"));
                objLivroDTO.setAutor(rs.getString("autor"));
                objLivroDTO.setEditora(rs.getString("editora"));
                objLivroDTO.setAnoPublicacao(rs.getString("ano_publicacao"));
                objLivroDTO.setGenero(rs.getString("genero"));
                objLivroDTO.setIsbn(rs.getString("isbn"));
                lista.add(objLivroDTO);
            }

            pstm.close();
        } catch (SQLException e) {
            System.out.println(e);
        }

        return lista;
    }

    // Criando método para consultar livro pelo autor
    public ArrayList<LivroDTO> ConsultarLivroPorAutor(String autor) throws ClassNotFoundException {

        String sql = "SELECT * FROM livro WHERE autor LIKE ?";

        con = new ConexaoDAO().conexaoBD();

        try {
            pstm = con.prepareStatement(sql);
            pstm.setString(1, "%" + autor + "%");
            rs = pstm.executeQuery();

            while (rs.next()) {
                LivroDTO objLivroDTO = new LivroDTO();
                objLivroDTO.setId(rs.getInt("id"));
                objLivroDTO.setTitulo(rs.getString("titulo"));
                objLivroDTO.setAutor(rs.getString("autor"));
                objLivroDTO.setEditora(rs.getString("editora"));
                objLivroDTO.setAnoPublicacao(rs.getString("ano_publicacao"));
                objLivroDTO.setGenero(rs.getString("genero"));
                objLivroDTO.setIsbn(rs.getString("isbn"));
                lista.add(objLivroDTO);
            }

            pstm.close();
        } catch (SQLException e) {
            System.out.println(e);
        }

        return lista;
    }

    public String ObterTituloLivroAtravesDoIdExemplar(int idExemplar) throws ClassNotFoundException, SQLException {
        int idLivro = 0;
        String titulo = "";

        String sqlId = "SELECT id_livro FROM exemplar WHERE id = ?";
        String sqlTitulo = "SELECT titulo FROM livro WHERE id = ?";

        con = new ConexaoDAO().conexaoBD();

        try {
            pstm = con.prepareStatement(sqlId);
            pstm.setInt(1, idExemplar);
            rs = pstm.executeQuery();

            if (rs.next()) {
                idLivro = rs.getInt("id_livro");

                try {
                    pstm = con.prepareStatement(sqlTitulo);
                    pstm.setInt(1, idLivro);
                    rs = pstm.executeQuery();

                    if (rs.next()) {
                        titulo = rs.getString("titulo");
                    }
                } catch (SQLException e) {
                    System.err.println(e);
                }
            }
        } catch (SQLException e) {
            System.err.println(e);
        } finally {
            // Fechando recursos corretamente
            if (rs != null) {
                rs.close();
            }
            if (pstm != null) {
                pstm.close();
            }
            if (con != null) {
                con.close();
            }
        }

        return titulo;
    }

}
