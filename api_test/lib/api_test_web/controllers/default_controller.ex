defmodule ApiTestWeb.DefaultController do
  use ApiTestWeb, :controller


  def index(conn, _params) do
    text conn, "TEST API OK - #{Mix.env()}"
  end

end
