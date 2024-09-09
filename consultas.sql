
-- Este arquivo possui todas as consultas feitas por mim nesse projeto. 
-- Essas consultas foram executadas dentro do pgAdmin4. 
---------------------------------------------------------------------------------------------------------

-- 1. Liste os e-mails dos clientes da tabela sales.customers
select email
from sales.customers

-- 2. Liste os emails e nomes dos clientes da tabela sales.customers
select email, first_name, last_name
from sales.customers

-- 3. Liste todos as informações dos clientes da tabela sales.customers
select *
from sales.customers


-- 4. Liste as marcas de carro que constam na tabela products
select brand
from sales.products

-- 5. Liste as marcas de carro distintas que constam na tabela products
select distinct brand
from sales.products

-- 6. Liste as marcas e anos de modelo distintos que constam na tabela products
select distinct brand, model_year
from sales.products


-- 7. Liste os emails dos clientes da nossa base que moram no estado de Santa Catarina
select email, state
from sales.customers
where state= 'SC'


-- 8. Liste os emails dos clientes da nossa base que moram no estado de Santa Catarina
-- ou Mato Grosso do Sul
select email, state
from sales.customers
where state='SC' or state='MS'


-- 9. Liste os emails dos clientes da nossa base que moram no estado de Santa Catarina 
-- ou Mato Grosso do Sul e que tem mais de 30 anos

select email, state, birth_date
from sales.customers
where (state='SC' or state='MS') and birth_date < '19911228'


-- 10. Liste produtos da tabela products na ordem crescente com base no preço

select *
from sales.products
order by price desc 

-- 11. Liste os estados distintos da tabela customers na ordem crescente
select distinct state
from sales.customers
order by state

-- 12. Liste as 10 primeiras linhas da tabela funnel
select *
from sales.funnel
limit 10


-- 13. Liste os 10 produtos mais caros da tabela products
select *
from sales.products
order by price desc
limit 10

-- 14. Selecione os nomes de cidade distintas que existem no estado de
-- Minas Gerais em ordem alfabética 

select distinct city, state 
from sales.customers
where state = 'MG'
order by city 

-- 15. Selecione o visit_id das 10 compras mais recentes efetuadas

select distinct  visit_id, paid_date
from sales.funnel 
where paid_date IS NOT NULL 
order by paid_date DESC
limit 10


-- 16. Selecione todos os dados dos 10 clientes com maior score nascidos
-- após 01/01/2000 

select *
from sales.customers
where birth_date > '01/01/2000'
order by score DESC
limit 10 

-- 17. Crie uma coluna contendo a idade do cliente da tabela sales.customers

select
	email,
	birth_date,
	(current_date - birth_date) / 365 as "idade do cliente"
from sales.customers


-- 18. Liste os 10 clientes mais novos da tabela customers

select
	email,
	birth_date,
	(current_date - birth_date) / 365 as "idade do cliente"
from sales.customers
order by "idade do cliente"


-- 19. Crie a coluna "nome_completo" contendo o nome completo do cliente
select
	first_name || ' ' || last_name as nome_completo
from sales.customers


-- 20. Crie uma coluna que retorne TRUE sempre que um cliente for um profissional clt 
select
    customer_id,
	first_name,
    professional_status,
	(professional_status = 'clt') as cliente_clt
from sales.customers

-- 21. Selecione veículos que custam entre 100k e 200k na tabela products
select *
from sales.products
where price between 100000 and 200000


-- 22. Selecione veículos que custam abaixo de 100k ou acima 200k 
select *
from sales.products
where price not between 100000 and 200000


-- 23. Selecionar produtos que sejam da marca HONDA, TOYOTA ou RENAULT
select *
from sales.products
where brand NOT in ('HONDA', 'TOYOTA', 'RENAULT')


-- 24. Selecione os primeiros nomes distintos da tabela customers que começam
-- com as iniciais ANA
select distinct first_name
from sales.customers
where first_name like 'ANA%'


-- 25. Selecione os primeiros nomes distintos com iniciais 'ana'
select distinct first_name
from sales.customers
where first_name ilike 'ana%'


-- 26. Selecionar apenas as linhas que contém nulo no campo "population" na tabela
-- temp_tables.regions
select *
from temp_tables.regions
where population is null


-- 27. Calcule quantos salários mínimos ganha cada cliente da tabela 
-- sales.customers. Selecione as colunas de: email, income e a coluna calculada "salários mínimos"
-- Considere o salário mínimo igual à R$1200

select
	email,
	income,
	(income) / 1200 as "salários mínimos"
from sales.customers



-- 28. Na query anterior acrescente uma coluna informando TRUE se o cliente
-- ganha acima de 5 salários mínimos e FALSE se ganha 4 salários ou menos.
-- Chame a nova coluna de "acima de 4 salários"

select
	email,
	income,
	(income) / 1200 as "salários mínimos",
	((income) / 1200) > 4 as "acima de 4 salários"
from sales.customers



-- 29. Na query anterior filtre apenas os clientes que ganham entre
-- 4 e 5 salários mínimos. Utilize o comando BETWEEN

select
	email,
	income,
	(income) / 1200 as "salários mínimos",
	((income) / 1200) > 4 as "acima de 4 salários"
from sales.customers
where ((income) / 1200) between 4 and 5



-- 30. Selecine o email, cidade e estado dos clientes que moram no estado de 
-- Minas Gerais e Mato Grosso. 

select email, city, state
from sales.customers
where state in ('MT', 'MG')



-- 31. Selecine o email, cidade e estado dos clientes que não 
-- moram no estado de São Paulo.

select email, city, state
from sales.customers
where state not in ('SP')



-- 32. Selecine os nomes das cidade que começam com a letra Z.

select city
from temp_tables.regions
where city ilike 'z%'

-- 33. Contagem de todas as linhas de uma tabela
-- Conte todas as visitas realizadas ao site da empresa fictícia
select count(*)
from sales.funnel



-- 34. Conte todos os pagamentos registrados na tabela sales.funnel 
select count(paid_date)
from sales.funnel


-- 35. Conte todos os produtos distintos visitados em jan/21
select count(distinct product_id)
from sales.funnel
where visit_page_date between '2021-01-01' and '2021-01-31'

-- 36. Calcule o preço mínimo, máximo e médio dos productos da tabela products
select min(price), max(price), avg(price)
from sales.products


-- 37. Informe qual é o veículo mais caro da tabela products
select max(price) from sales.products

select *
from sales.products
where price = (select max(price) from sales.products)


-- 38. Calcule o nº de clientes da tabela customers por estado
select state, count(*) as contagem
from sales.customers
group by state
order by contagem desc


-- 39. Calcule o nº de clientes por estado e status profissional 
select state, professional_status, count(*) as contagem
from sales.customers
group by 1, 2
order by state, contagem desc


-- 40. Selecione os estados distintos na tabela customers utilizando o group by

select distinct state
from sales.customers

-- 41. Calcule o nº de clientes por estado filtrando apenas estados acima de 100 clientes
select 
    state, 
    count(*)
from sales.customers
group by state
having count(*) > 100


-- 42. Conte quantos clientes da tabela sales.customers tem menos de 30 anos

select count(*)
from sales.customers
where ((current_date - birth_date) / 365 ) < 30



-- 43. Informe a idade do cliente mais velho e mais novo da tabela sales.customers

select 
	max((current_date - birth_date) / 365 ),
	min((current_date - birth_date) / 365 )
from sales.customers

-- 44.  Selecione todas as informações do cliente mais rico da tabela sales.customers
-- (possívelmente a resposta contém mais de um cliente)

select *
from sales.customers
where income = (select max(income) from sales.customers)

-- 45. Conte quantos veículos de cada marca tem registrado na tabela sales.products
-- Ordene o resultado pelo nome da marca

select brand, count(*)
from sales.products
group by brand
order by brand 



-- 46. Conte quantos veículos existem registrados na tabela sales.products
-- por marca e ano do modelo. Ordene pela nome da marca e pelo ano do veículo

select brand, model_year, count(*)
from sales.products
group by brand, model_year
order by brand , model_year



-- 47. Conte quantos veículos de cada marca tem registrado na tabela sales.products
-- e mostre apenas as marcas que contém mais de 10 veículos registrados

select brand, count(*)
from sales.products
group by brand
having count(*) > 10 


-- 48. Utilize o LEFT JOIN para fazer join entre as tabelas
-- temp_tables.tabela_1 e temp_tables.tabela_2

select * from temp_tables.tabela_1
select * from temp_tables.tabela_2

select t1.cpf, t1.name, t2.state
from temp_tables.tabela_1 as t1 
left join temp_tables.tabela_2 as t2
	on t1.cpf = t2.cpf


-- 49. Utilize o INNER JOIN para fazer join entre as tabelas
-- temp_tables.tabela_1 e temp_tables.tabela_2
select t1.cpf, t1.name, t2.state
from temp_tables.tabela_1 as t1 
inner join temp_tables.tabela_2 as t2
	on t1.cpf = t2.cpf


-- 50. Utilize o RIGHT JOIN para fazer join entre as tabelas
-- temp_tables.tabela_1 e temp_tables.tabela_2
select t2.cpf, t1.name, t2.state
from temp_tables.tabela_1 as t1 
right join temp_tables.tabela_2 as t2
	on t1.cpf = t2.cpf


-- 51. Utilize o FULL JOIN para fazer join entre as tabelas
-- temp_tables.tabela_1 e temp_tables.tabela_2
select t2.cpf, t1.name, t2.state
from temp_tables.tabela_1 as t1 
full join temp_tables.tabela_2 as t2
	on t1.cpf = t2.cpf

-- 52. Identifique qual é o status profissional mais frequente nos clientes 
-- que compraram automóveis no site

select 
	cus.professional_status,
	count(fun.paid_date) as pagamentos

from sales.funnel as fun
left join sales.customers as cus
	on fun.customer_id = cus.customer_id
group by cus.professional_status
order by pagamentos desc


-- 53. Identifique qual é o gênero mais frequente nos clientes que compraram
-- automóveis no site. Obs: Utilizar a tabela temp_tables.ibge_genders
select * from temp_tables.ibge_genders limit 10

select 
	ibge.gender,
	count(fun.paid_date)
from sales.funnel as fun
left join sales.customers as cus
	on fun.customer_id = cus.customer_id
left join temp_tables.ibge_genders as ibge
	on lower(cus.first_name) = ibge.first_name
group by ibge.gender


-- 54. Identifique de quais regiões são os clientes que mais visitam o site
select * from sales.customers limit 10
select * from temp_tables.regions limit 10

select
	reg.region,
	count(fun.visit_page_date) as visitas
from sales.funnel as fun
left join sales.customers as cus
	on fun.customer_id = cus.customer_id
left join temp_tables.regions as reg
	on lower(cus.city) = lower(reg.city)
	and lower(cus.state) = lower(reg.state)
group by reg.region
order by visitas desc


-- 55. Identifique quais as marcas de veículo mais visitada na tabela sales.funnel

select 
	pro.brand,
	count(*) as visitas

from sales.funnel as fun
left join sales.products as pro
	on fun.product_id = pro.product_id
group by pro.brand
order by visitas desc


-- 56. Identifique quais as lojas de veículo mais visitadas na tabela sales.funnel

select 
	sto.store_name,
	count(*) as visitas

from sales.funnel as fun
left join sales.stores as sto
	on fun.store_id = sto.store_id
group by sto.store_name
order by visitas desc



-- 57. Identifique quantos clientes moram em cada tamanho de cidade
select
	reg.size,
	count(*) as contagem
from sales.customers as cus
left join temp_tables.regions as reg
	on lower(cus.city) = lower(reg.city)
	and lower(cus.state) = lower(reg.state)
group by reg.size
order by contagem

-- 58. Una a tabela sales.products com a tabela temp_tables.products_2

select * from sales.products
union all
select * from temp_tables.products_2

-- 59. Crie uma coluna calculada com o número de visitas realizadas por cada
-- cliente da tabela sales.customers

with numero_de_visitas as (

	select customer_id, count(*) as n_visitas
	from sales.funnel
	group by customer_id

)

select
	cus.*,
	n_visitas

from sales.customers as cus
left join numero_de_visitas as ndv
	on cus.customer_id = ndv.customer_id

-- 60. Conversão de texto em data
-- Corrija a query abaixo utilizando o operador ::
select '2021-10-01'::date - '2021-02-01'::date

select nome_coluna::date
from nome_tabela


-- 61. Conversão de texto em número
-- Corrija a query abaixo utilizando o operador ::
select '100'::numeric - '10'::numeric


-- 62. Conversão de número em texto
-- Corrija a query abaixo utilizando o operador ::
select replace(112122::text,'1','A')


-- 63. Conversão de texto em data
-- Corrija a query abaixo utilizando a função CAST
select cast('2021-10-01' as date) - cast('2021-02-01' as date)

-- 64. Agrupamento de dados com CASE WHEN
-- Calcule o nº de clientes que ganham abaixo de 5k, entre 5k e 10k, entre 10k e 
-- 15k e acima de 15k

with faixa_de_renda as (
	select
		income,
		case
			when income < 5000 then '0-5000'
			when income >= 5000 and income < 10000 then '5000-10000'
			when income >= 10000 and income < 15000 then '10000-15000'
			else '15000+'
			end as faixa_renda
	from sales.customers
)

select faixa_renda, count(*)
from faixa_de_renda
group by faixa_renda


-- 65. Tratamento de dados nulos com COALESCE
-- Crie uma coluna chamada populacao_ajustada na tabela temp_tables.regions e
-- preencha com os dados da coluna population, mas caso esse campo estiver nulo, 
-- preencha com a população média (geral) das cidades do Brasil
select * from temp_tables.regions limit 10

select
	*,
	case
		when population is not null then population
		else (select avg(population) from temp_tables.regions)
		end as populacao_ajustada

from temp_tables.regions





