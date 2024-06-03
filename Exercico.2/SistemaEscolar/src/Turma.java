import java.util.ArrayList;
import java.util.List;

public class Turma {
    private String nome;
    private String codigo;
    private List<Aluno> alunos;

    public Turma(String nome, String codigo) {
        this.nome = nome;
        this.codigo = codigo;
        this.alunos = new ArrayList<>();
    }

    public void adicionarAluno(Aluno aluno) {
        alunos.add(aluno);
    }

    public List<Aluno> listarAlunos() {
        return alunos;
    }

    public String getNome() {
        return nome;
    }

    public String getCodigo() {
        return codigo;
    }

    @Override
    public String toString() {
        return "Turma(nome='" + nome + "', codigo='" + codigo + "', alunos=" + alunos + ")";
    }
}
