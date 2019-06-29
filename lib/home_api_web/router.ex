defmodule HomeApiWeb.Router do
  use HomeApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", HomeApiWeb do
    pipe_through :api
  end
end
