package modeloDTO;

public class ExemplarDTO {

    private int id;
    private int idLivro;
    private String obsDoExemplar;
    private String status;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdLivro() {
        return idLivro;
    }

    public void setIdLivro(int idLivro) {
        this.idLivro = idLivro;
    }

    public String getObsDoExemplar() {
        return obsDoExemplar;
    }

    public void setObsDoExemplar(String obsDoExemplar) {
        this.obsDoExemplar = obsDoExemplar;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
