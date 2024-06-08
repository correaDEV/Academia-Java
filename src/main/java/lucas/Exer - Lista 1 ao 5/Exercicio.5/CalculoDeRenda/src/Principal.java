import java.util.Locale;
import java.util.Scanner;

public class Principal {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        scanner.useLocale(Locale.US);

        System.out.print("Digite o nome: ");
        String nome = scanner.nextLine();

        System.out.print("Digite o salário: ");
        double salario = scanner.nextDouble();

        scanner.close();

        Pessoa pessoa = new Pessoa(nome, salario);
        ImpostoDeRenda impostoDeRenda = new ImpostoDeRenda(pessoa);
        impostoDeRenda.imprimir();
    }
}
