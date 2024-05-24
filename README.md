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

![Screenshot from 2024-05-23 22-37-06](https://github.com/Rogue-Telvanni/ELIXIR_VERY_SIMPLE_API/assets/110510237/1a9fcc59-c11e-4e22-a343-004fafe16c87)

and for recovering a client using the document data
GET http://localhost:4000/api/clients/225489797

![Screenshot from 2024-05-23 22-49-58](https://github.com/Rogue-Telvanni/ELIXIR_VERY_SIMPLE_API/assets/110510237/b0f21fd2-7ae0-4814-84d0-4d8381484fab)

for recovering all clients simple use 
GET http://localhost:4000/api/clients/

![Screenshot from 2024-05-23 23-19-22](https://github.com/Rogue-Telvanni/ELIXIR_VERY_SIMPLE_API/assets/110510237/b7a9eef8-0650-490c-a43c-2daa45ad3e58)
