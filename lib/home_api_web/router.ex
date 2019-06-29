defmodule HomeApiWeb.Router do
  use HomeApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", HomeApiWeb do
    pipe_through :api
    resources "/homes", HomeController, except: [:new, :edit]
  end

  pipeline :browser do
    plug(:accepts, ["html"])
  end

  scope "/", HomeApiWeb do
    pipe_through :browser
    get "/", DefaultController, :index
  end
end
