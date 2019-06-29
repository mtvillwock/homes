defmodule HomeApiWeb.DefaultController do
  use HomeApiWeb, :controller

  def index(conn, _params) do
    text conn, "HomeApi!"
  end
end
