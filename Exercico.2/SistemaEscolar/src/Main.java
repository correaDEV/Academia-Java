import java.util.ArrayList;
import java.util.List;

public class Main {
    private List<Aluno> alunos;
    private List<Turma> turmas;

    public Main() {
        alunos = new ArrayList<>();
        turmas = new ArrayList<>();
    }

    public void criarAlunos() {
        alunos.add(new Aluno("Lucas", 22, 1234));
        alunos.add(new Aluno("Maria", 21, 5678));
        alunos.add(new Aluno("João", 23, 9101));
        alunos.add(new Aluno("Ana", 20, 1121));
        alunos.add(new Aluno("Pedro", 22, 3141));
    }

    public void criarTurmas() {
        Turma turmaA = new Turma("Turma A", "1A");
        Turma turmaB = new Turma("Turma B", "1B");

        for (Aluno aluno : alunos) {
            turmaA.adicionarAluno(aluno);
            turmaB.adicionarAluno(aluno);
        }

        turmas.add(turmaA);
        turmas.add(turmaB);
    }

    public void listarTurmas() {
        for (Turma turma : turmas) {
            System.out.println("\n" + turma.getNome() + " (" + turma.getCodigo() + ")");
            for (Aluno aluno : turma.listarAlunos()) {
                System.out.println("  - " + aluno.getNome() + ", Idade: " + aluno.getIdade() + ", Matrícula: " + aluno.getMatricula());
            }
        }
    }

    public static void main(String[] args) {
        Main main = new Main();
        main.criarAlunos();
        main.criarTurmas();
        main.listarTurmas();
    }
}
