# ELIXIR_VERY_SIMPLE_API
simple elixir api using phoenix for college studies purpose

to start download docker desktop https://www.docker.com/products/docker-desktop/
download the postgress image run the command
docker pull postgres

then set up the container configuration
docker run --name bs_db -p 5432:5432 -e POSTGRES_USER=seu_user -e POSTGRES_PASSWORD=sua_senha -d postgres

update or download hex
mix local.hex

install phoenix server for the project
mix archive.install hex phx_new

on the project directory with the terminal run the following commands
mix deps.get
mix ecto.create

mix phx.gen.json Clients Client clients name:string document:integer address:string phone:integer
mix ecto.migrate

mix phx.server
testar usando o iex
iex -S mix
cria o json
ApiTest.Clients.create_client(%{name: "TESTE", document:202521425})

to run the api use the localhost on port 4000
the endpoints for the client are
POST http://localhost:4000/api/clients/create

with the following json
{
  "client": {
		"name": "joao",
  	"address": "rua alameda 8",
  	"document": 225489797,
  	"phone": 9854745
	}
}

and for recovering a client using the document data
GET http://localhost:4000/api/clients/225489797
