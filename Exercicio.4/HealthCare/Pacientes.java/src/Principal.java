public class Principal {
    public static void main(String[] args) {
        // Criar instâncias de Paciente
        Paciente paciente1 = new Paciente(60.0, 1.70);
        Paciente paciente2 = new Paciente(80.0, 1.75);
        Paciente paciente3 = new Paciente(120.0, 1.60);

        // Imprimir resultados
        imprimirResultados(paciente1);
        imprimirResultados(paciente2);
        imprimirResultados(paciente3);
    }

    private static void imprimirResultados(Paciente paciente) {
        System.out.printf("Paciente com peso: %.2f kg e altura: %.2f m%n", paciente.getPeso(), paciente.getAltura());
        System.out.printf("IMC: %.2f%n", paciente.calcularIMC());
        System.out.println("Diagnóstico: " + paciente.diagnostico());
        System.out.println();
    }
}
