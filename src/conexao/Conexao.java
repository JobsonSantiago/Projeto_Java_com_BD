/*
    * Esta classe será responsável pela conexão com MySql 
    * terá 3 métodos:
    * abertura da conexão
    * fechamento da conexão
    * e execução de comandos SQL
 */

package conexao;

import javax.swing.JOptionPane;
import java.sql.*; // para execução de comandos SQL no ambiente java

public class Conexao {

    final private String driver = "com.mysql.jdbc.Driver";// definição do driver MySql para acesso aos dados
    final private String url = "jdbc:mysql://localhost/funcionario"; //acesso ao bd clientes no servidor
    final private String usuario = "root"; //usuário do MySql - usbwebserver 
    final private String senha = ""; //senha do MySql - usbwebserver
    private Connection conexao; //variavel que armazenará a conexão aberta
    public Statement statement; //variavel para execução dos comandos SQL dentro do ambiente Java
    public ResultSet resultset; //variável que armazenará o resultado da execução de um comando SQL

    public boolean conecta() {
        boolean result = true;
        try {
            Class.forName(driver);
            conexao = DriverManager.getConnection(url, usuario, senha);
            JOptionPane.showMessageDialog(null, "Conexão estabelecida", "Mensagem do Programa", JOptionPane.INFORMATION_MESSAGE);
        } catch (ClassNotFoundException Driver) {
            JOptionPane.showMessageDialog(null, "Driver não localizado" + Driver, "Mensagem do Programa", JOptionPane.INFORMATION_MESSAGE);
            result = false;
        } catch (SQLException Fonte) {
            JOptionPane.showMessageDialog(null, "Fonte de dados não localizada" + Fonte, "Mensagem do Programa", JOptionPane.INFORMATION_MESSAGE);
            result = false;
        }
        return result;
    }

    public void desconecta() {
        try {
            conexao.close();
            JOptionPane.showMessageDialog(null, "Conexão com o banco fechada", "Mensagem do Programa", JOptionPane.INFORMATION_MESSAGE);
        } catch (SQLException fecha) {

        }
    }
    
    public void executaSQL (String sql){
        try {
            statement = conexao.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            resultset = statement.executeQuery(sql);
        }catch (SQLException excecao){
            JOptionPane.showMessageDialog(null, "Erro no comando SQL! \n Erro: "+excecao, "Mensagem do Programa", JOptionPane.INFORMATION_MESSAGE);
        }
    }
}
