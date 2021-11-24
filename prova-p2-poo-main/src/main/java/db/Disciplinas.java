
package db;

import java.sql.*;
import java.util.ArrayList;
import web.DbListener;


public class Disciplinas {
    private String name;
    private String diasemana;
    private String horario;
    private String qtdaulas;
    private String p1;
    private String p2;
    
    public static String getCreateStatement(){
        return "CREATE TABLE IF NOT EXISTS disciplinas("
                + "name VARCHAR(50) PRIMARY KEY,"
                + "diasemana VARCHAR(10), "
                +  "horario VARCHAR(10), "
                +  "qtdaulas VARCHAR(4), "
                +  "p1 VARCHAR(4), "
                +  "p2 VARCHAR(4) "
                + ")";
    }
    
    public static ArrayList<Disciplinas> getList() throws Exception{
        ArrayList<Disciplinas> list = new ArrayList<>();
        Connection con = DbListener.getConnection();
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT * from disciplinas ORDER BY name");
        while(rs.next()){
            String name = rs.getString("name");
            String diasemana = rs.getString("diasemana");
            String horario = rs.getString("horario");
            String qtdaulas = rs.getString("qtdaulas");
            String p1 = rs.getString("p1");
            String p2 = rs.getString("p2");
            
            list.add(new Disciplinas(name, diasemana, horario, qtdaulas, p1, p2));
        }
        rs.close();
        stmt.close();
        con.close();
        return list;
    }
    
    public static void insert(String name, String diasemana, String horario, String qtdaulas) throws Exception{
        Connection con = DbListener.getConnection();
        String sql = "INSERT INTO disciplinas(name, diasemana, horario, qtdaulas) VALUES(?, ?, ?, ?)";
        PreparedStatement stmt = con.prepareStatement(sql);
        stmt.setString(1, name);
        stmt.setString(2, diasemana);
        stmt.setString(3, horario);
        stmt.setString(4, qtdaulas);
        stmt.execute();
        stmt.close();
        con.close();
    }
    
    
    public static void update(String p1, String p2, String name) throws Exception{
        Connection con = DbListener.getConnection();
        String sql = "UPDATE disciplinas "
                + "SET p1=?, "
                + "p2=? " 
                + "WHERE name=?";
        PreparedStatement stmt = con.prepareStatement(sql);
        stmt.setString(1, p1);
        stmt.setString(2, p2);
        stmt.setString(3, name);
        stmt.execute();
        stmt.close();
        con.close();
    }
    
    
    
    public static void delete(String name) throws Exception{
        Connection con = DbListener.getConnection();
        String sql = "DELETE FROM disciplinas WHERE name = ?";
        PreparedStatement stmt = con.prepareStatement(sql);
        stmt.setString(1, name);
        stmt.execute();
        stmt.close();
        con.close();
    }

    public Disciplinas(String name, String diasemana, String horario, String qtdaulas, String p1, String p2) {
        this.name = name;
        this.diasemana = diasemana;
        this.horario = horario;
        this.qtdaulas = qtdaulas;
        this.p1 = p1;
        this.p2 = p2;
    }

    public String getName() {
        return name;
    }

    public String getDiaSemana() {
        return diasemana;
    }
    public String getHorario() {
        return horario;
    }
    public String getAulas() {
        return qtdaulas;
        }
        
        public String getP1() {
            return p1;      
    }
        
        public String getP2() {
            return p2;      
    }
    public void setDiasemana(String diasemana) {
        this.diasemana = diasemana;
    }

public void setHorario(String horario) {
    this.horario = horario;
}
public void setQtdAulas(String qtdaulas) {
    this.qtdaulas = qtdaulas;
}
    public void setName(String name) {
        this.name = name;
    }
    
    public void setP1(String p1) {
        this.p1 = p1;
    }
    public void setP2(String p2) {
        this.p2 = p2;
    }
    
    
    
    
}