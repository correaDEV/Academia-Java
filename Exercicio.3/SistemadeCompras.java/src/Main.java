public class Main {
    public static void main(String[] args) {
        // Criar produtos
        Produto produto1 = new Produto("Mouse Gamer", 60.00, 2);
        Produto produto2 = new Produto("Teclado Mecânico", 150.00, 1);
        Produto produto3 = new Produto("Monitor 24\"", 700.00, 1);

        // Criar carrinho de compras
        CarrinhoDeCompras carrinho = new CarrinhoDeCompras();

        // Adicionar produtos ao carrinho
        carrinho.adicionarProduto(produto1);
        carrinho.adicionarProduto(produto2);
        carrinho.adicionarProduto(produto3);

        // Listar produtos no carrinho e exibir o total
        System.out.println(carrinho);
    }
}
