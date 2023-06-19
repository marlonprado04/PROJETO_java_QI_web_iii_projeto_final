
package modeloDAO;

// Importando biblioteca da conexão, para poder realizar a conexão com o banco de dados
import java.sql.Connection; 
// Importando biblioteca que serve de driver para direcionar a conexão para o banco de dados
import java.sql.DriverManager; 
import java.sql.SQLException;


public class ConexaoDAO {
    
    // Criando a função necessária para conetar ao banco de dados
    
    public Connection conexaoBD() throws ClassNotFoundException{
        
        // Declarando variável necessária para criar conexão com o banco
        
        Connection con = null;

        try {
            
            
            //Carregando o Driver correto do MYSQL para a memória do sistema
            // para que o ele consiga acessar corretamente
            // na hora que executar o DriverManeger.
            
            // Sem essa linha, o sistema pode falhar ao tentar se comunicar com o banco de dados
            // por falta de informação de driver (depende da versão do JDBC).
            
            Class.forName("com.mysql.jdbc.Driver");
            
            // Criando variável com caminho para o driver de conexão com o banco de dados
            // Se atentar que a porta informada é a 3307, pois na minha máquina foi esta que
            // configurei
            
            String url = "jdbc:mysql://localhost:3307/biblioteca?user=root&password=";
            
            // Passando URL criada para a variável "con", que servirá de emcapsulamento para
            // a conexão com o banco de dados, pois dentro dela está o DriverManager já
            // com a URL, pronto para conectar com o banco

            con = DriverManager.getConnection(url);
            
            
        } catch (SQLException e) {
            
            System.err.println(e);
        }
        
        // Fazendo classe retornar a variável com a conexão completa estabelecida
        // para permitir conexão em outras classes java.
      
        return con;
       

    }
    
    
    
}
