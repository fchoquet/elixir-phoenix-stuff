defmodule HelloPhoenix.Router do
  use HelloPhoenix.Web, :router

  pipeline :browser do
    plug :accepts, ["html", "text"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", HelloPhoenix do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/test", PageController, :test
    get "/hello", HelloController, :index
    get "/hello/:messenger", HelloController, :show
    get "/hello/:format/:messenger", HelloController, :show
  end

  scope "/admin", HelloPhoenix.Admin, as: :admin do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  scope "/api", HelloPhoenix do
    pipe_through :api

    get "/healthcheck", HealthCheckController, :index
  end
end