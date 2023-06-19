package modeloDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import modeloDTO.ExemplarDTO;

public class ExemplarDAO {

    Connection con; // Variável de conexão com o banco de dados
    PreparedStatement pstm; // Variável para preparar o código SQL
    ResultSet rs; // Variável para armazenar os resultados do banco de dados
    ArrayList<ExemplarDTO> lista = new ArrayList<>(); // Lista de objetos ExemplarDTO

    // Método para cadastrar um novo exemplar
    public void CadastrarExemplar(ExemplarDTO objExemplarDTO) throws ClassNotFoundException {

        String sql = "INSERT INTO exemplar (id_livro, obs_do_exemplar, status) VALUES (?, ?, ?)";

        con = new ConexaoDAO().conexaoBD();

        try {
            pstm = con.prepareStatement(sql);
            pstm.setInt(1, objExemplarDTO.getIdLivro());
            pstm.setString(2, objExemplarDTO.getObsDoExemplar());
            pstm.setString(3, objExemplarDTO.getStatus());
            pstm.execute();
            pstm.close();
        } catch (SQLException e) {
            System.err.println(e);
        }

    }

    // Método para listar os exemplares
    public ArrayList<ExemplarDTO> ListarExemplar() throws ClassNotFoundException {

        String sql = "SELECT * FROM exemplar";

        con = new ConexaoDAO().conexaoBD();

        try {
            pstm = con.prepareStatement(sql);
            rs = pstm.executeQuery();

            while (rs.next()) {
                ExemplarDTO objExemplarDTO = new ExemplarDTO();
                objExemplarDTO.setId(rs.getInt("id"));
                objExemplarDTO.setIdLivro(rs.getInt("id_livro"));
                objExemplarDTO.setObsDoExemplar(rs.getString("obs_do_exemplar"));
                objExemplarDTO.setStatus(rs.getString("status"));
                lista.add(objExemplarDTO);
            }

            pstm.close();
        } catch (SQLException e) {
            System.out.println(e);
        }

        return lista;
    }

    // Método para excluir um exemplar
    public void ExcluirExemplar(ExemplarDTO objExemplarDTO) throws ClassNotFoundException {

        String sql = "DELETE FROM exemplar WHERE id = ?";

        con = new ConexaoDAO().conexaoBD();

        try {
            pstm = con.prepareStatement(sql);
            pstm.setInt(1, objExemplarDTO.getId());
            pstm.execute();
            pstm.close();
        } catch (SQLException e) {
            System.err.println(e);
        }

    }

    // Método para alterar as informações de um exemplar
    public void AlterarExemplar(ExemplarDTO objExemplarDTO) throws ClassNotFoundException {

        String sql = "UPDATE exemplar SET obs_do_exemplar = ?, status = ? WHERE id = ?";

        con = new ConexaoDAO().conexaoBD();

        try {
            pstm = con.prepareStatement(sql);
            pstm.setString(1, objExemplarDTO.getObsDoExemplar());
            pstm.setString(2, objExemplarDTO.getStatus());
            pstm.setInt(3, objExemplarDTO.getId());
            pstm.execute();
            pstm.close();
        } catch (SQLException e) {
            System.err.println(e);
        }

    }

    // Método para listar os exemplares de um livro específico
    public ArrayList<ExemplarDTO> ListarExemplarDoLivro(int idLivro) throws ClassNotFoundException {

        String sql = "SELECT * FROM exemplar WHERE id_livro= ?";

        con = new ConexaoDAO().conexaoBD();

        try {
            pstm = con.prepareStatement(sql);
            pstm.setInt(1, idLivro);
            rs = pstm.executeQuery();

            while (rs.next()) {
                ExemplarDTO objExemplarDTO = new ExemplarDTO();
                objExemplarDTO.setId(rs.getInt("id"));
                objExemplarDTO.setIdLivro(rs.getInt("id_livro"));
                objExemplarDTO.setObsDoExemplar(rs.getString("obs_do_exemplar"));
                objExemplarDTO.setStatus(rs.getString("status"));
                lista.add(objExemplarDTO);
            }

            pstm.close();
        } catch (SQLException e) {
            System.out.println(e);
        }

        return lista;
    }

    // Método para consultar exemplar por observação
    public ArrayList<ExemplarDTO> ConsultarExemplarPorObservacao(String obs) throws ClassNotFoundException {

        String sql = "SELECT * FROM exemplar WHERE obs_do_exemplar LIKE ?";

        con = new ConexaoDAO().conexaoBD();

        try {
            pstm = con.prepareStatement(sql);
            pstm.setString(1, "%" + obs + "%");
            rs = pstm.executeQuery();

            while (rs.next()) {
                ExemplarDTO objExemplarDTO = new ExemplarDTO();
                objExemplarDTO.setId(rs.getInt("id"));
                objExemplarDTO.setIdLivro(rs.getInt("id_livro"));
                objExemplarDTO.setObsDoExemplar(rs.getString("obs_do_exemplar"));
                objExemplarDTO.setStatus(rs.getString("status"));

                lista.add(objExemplarDTO);
            }

            pstm.close();
        } catch (SQLException e) {
            System.out.println(e);
        }

        return lista;
    }

    // Método para consultar exemplar por status
    public ArrayList<ExemplarDTO> ConsultarExemplarPorStatus(String status) throws ClassNotFoundException {

        String sql = "SELECT * FROM exemplar WHERE status LIKE ?";

        con = new ConexaoDAO().conexaoBD();

        try {
            pstm = con.prepareStatement(sql);
            pstm.setString(1, "%" + status + "%");
            rs = pstm.executeQuery();

            while (rs.next()) {
                ExemplarDTO objExemplarDTO = new ExemplarDTO();
                objExemplarDTO.setId(rs.getInt("id"));
                objExemplarDTO.setIdLivro(rs.getInt("id_livro"));
                objExemplarDTO.setObsDoExemplar(rs.getString("obs_do_exemplar"));
                objExemplarDTO.setStatus(rs.getString("status"));

                lista.add(objExemplarDTO);
            }

            pstm.close();
        } catch (SQLException e) {
            System.out.println(e);
        }

        return lista;
    }

    // Método para listar os exemplares de um livro específico
    public ArrayList<ExemplarDTO> ListarExemplarDoLivroComStatus(int idLivro, String status) throws ClassNotFoundException {

        String sql = "SELECT * FROM exemplar WHERE id_livro= ? AND status LIKE ?";

        con = new ConexaoDAO().conexaoBD();

        try {
            pstm = con.prepareStatement(sql);
            pstm.setInt(1, idLivro);
            pstm.setString(2, "%" + status + "%");
            rs = pstm.executeQuery();

            while (rs.next()) {
                ExemplarDTO objExemplarDTO = new ExemplarDTO();
                objExemplarDTO.setId(rs.getInt("id"));
                objExemplarDTO.setIdLivro(rs.getInt("id_livro"));
                objExemplarDTO.setObsDoExemplar(rs.getString("obs_do_exemplar"));
                objExemplarDTO.setStatus(rs.getString("status"));
                lista.add(objExemplarDTO);
            }

            pstm.close();
        } catch (SQLException e) {
            System.out.println(e);
        }

        return lista;
    }

    // Criando método para retornar a observação do exemplar a partir do ID informado
    public String ObterObservacaoDoExemplar(int idExemplar) throws ClassNotFoundException {
        // Criando variável para armazenar a observação do exemplar
        String obs = "";

        // Criando comando SQL para extrair a observação do exemplar a partir do ID informado
        String sql = "SELECT obs_do_exemplar FROM exemplar WHERE id = ?";

        // Obtendo a conexão com o banco de dados
        con = new ConexaoDAO().conexaoBD();

        try {
            // Preparando o  comando SQL
            pstm = con.prepareStatement(sql);

            // Definindo o valor do parâmetro ID
            pstm.setInt(1, idExemplar);

            // Atribuindo o resultado da query à variável de ResultSet
            rs = pstm.executeQuery();

            while (rs.next()) {
                obs = rs.getString("obs_do_exemplar");
            }

        } catch (SQLException e) {
            System.err.println(e);
        }

        return obs;
    }
}
