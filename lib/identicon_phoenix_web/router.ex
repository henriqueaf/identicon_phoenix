defmodule IdenticonPhoenixWeb.Router do
  use IdenticonPhoenixWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", IdenticonPhoenixWeb do
    pipe_through :browser # Use the default browser stack

    get "/", MainController, :index
    get "/identicon/:name_string", MainController, :identicon
  end

  # Other scopes may use custom stacks.
  # scope "/api", IdenticonPhoenixWeb do
  #   pipe_through :api
  # end
end
