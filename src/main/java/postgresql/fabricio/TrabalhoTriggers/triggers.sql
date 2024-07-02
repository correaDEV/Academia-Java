create table produtos 
(
    id integer not null primary key,
    nome varchar(50) not null,
    estoque integer
)

create sequence seq_produtos
increment by 1 no maxvalue no minvalue
cache 1

alter sequence seq_produtos owned by produtos.id

alter table produtos 
alter column id set default nextval('seq_produtos':: regclass)

insert into produtos(nome, estoque) 
values ('teclado dell 10PH', 23), 
('monitor dell P22H27', 7), 
('monitor dell 77F24', 10), 
('mouse dell MS22', 18)

create table vendas (
    id integer not null unique,
    fk_produto integer,
    quantidade integer not null,
    constraint fk_produto_id 
	foreign key (fk_produto) references produtos(id)
)

create sequence seq_vendas increment by 1 no maxvalue no minvalue cache 1

alter sequence seq_vendas owned by vendas.id

alter table vendas 
alter column id set default nextval('seq_vendas'::regclass)

select * from produtos
select * from vendas

--EVENTO -> CONDIÇÃO  -> AÇÃO = ECA

CREATE OR REPLACE FUNCTION verificaestoque() 
RETURNS TRIGGER AS $BODY$
DECLARE 
	estoqueatual integer := 0;
BEGIN
	estoqueatual := (select produtos.estoque 
					 from produtos 
					 where produtos.id = NEW.fk_produto );
	IF(estoqueatual >= NEW.quantidade)
	THEN
		update produtos set estoque = (estoqueatual - NEW.quantidade)
		where produtos.id = new.fk_produto;
		raise notice 'Tudo certo!';
		return new;
	ELSE
		RAISE EXCEPTION 'Inserção cancelada!';
		return null;
	END IF;
END
$BODY$
language plpgsql volatile; -- informar a sintaxe da trigger

create trigger trigger_estoque after insert
on vendas
for each row execute procedure verificaestoque();

11 - 2

insert into vendas(fk_produto,quantidade) values (1,3)

select * from produtos
select * from vendas



-- RESOLUÇÃO DO EXERCÍCIO DE TRIGGER

-- 5. Faça uma trigger que valide os anos iniciais e finais da existência do dinossauro inserido ou atualizado. Caso os anos não estejam corretos, cancele a operação e mostre uma mensagem ao usuário.:
CREATE OR REPLACE FUNCTION validar_anos()
RETURNS TRIGGER AS $BODY$
BEGIN
    IF NEW.inicio > NEW.fim THEN
        RAISE EXCEPTION 'O ano de início deve ser menor ou igual ao ano de fim.';
        RETURN NULL;
    END IF;
    RETURN NEW;
END
$BODY$
LANGUAGE plpgsql VOLATILE;

CREATE TRIGGER trig_validar_anos
BEFORE INSERT OR UPDATE ON dinossauros
FOR EACH ROW
EXECUTE FUNCTION validar_anos();

-- 6. Atualize a trigger anterior, para validar a inserção e alteração do dinossauro, conforme as eras (verificar se os anos de existência do dinossauro condizem com a era informada), informando que os valores de anos estão errados ou não condizem com a era informada:
CREATE OR REPLACE FUNCTION validar_anos_era()
RETURNS TRIGGER AS $BODY$
DECLARE
    era_inicio INTEGER;
    era_fim INTEGER;
BEGIN
    SELECT ano_inicio, ano_fim INTO era_inicio, era_fim
    FROM eras
    WHERE id = NEW.fk_era;

    IF NEW.inicio > NEW.fim THEN
        RAISE EXCEPTION 'O ano de início deve ser menor ou igual ao ano de fim.';
        RETURN NULL;
    END IF;

    IF NEW.inicio < era_inicio OR NEW.fim > era_fim THEN
        RAISE EXCEPTION 'Os anos de existência do dinossauro não condizem com a era informada.';
        RETURN NULL;
    END IF;

    RETURN NEW;
END
$BODY$
LANGUAGE plpgsql VOLATILE;

CREATE TRIGGER trig_validar_anos_era
BEFORE INSERT OR UPDATE ON dinossauros
FOR EACH ROW
EXECUTE FUNCTION validar_anos_era();

-- DINOSSAUROS que NÃO correspondem as ERAS:
Nome: Pinacossauro
Era: Triássico (251-200)
Anos: (85-75)

Nome: Anquilossauro
Era: Triássico (251-200)
Anos: (66-63)