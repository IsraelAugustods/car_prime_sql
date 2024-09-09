
-- Este arquivo possui todas as consultas feitas por mim nesse projeto. 
-- Essas consultas foram executadas dentro do pgAdmin4. 
-- O intuito desse projeto é responder perguntas de negócio utilizando SQL (Linguagem de Consulta Estruturada)
---------------------------------------------------------------------------------------------------------

-- Liste os e-mails dos clientes da tabela sales.customers
select email
from sales.customers

-- Liste os emails e nomes dos clientes da tabela sales.customers
select email, first_name, last_name
from sales.customers

-- Liste todos as informações dos clientes da tabela sales.customers
select *
from sales.customers







