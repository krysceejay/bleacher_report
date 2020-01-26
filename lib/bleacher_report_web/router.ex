defmodule BleacherReportWeb.Router do
  use BleacherReportWeb, :router

  pipeline :browser do
    plug :accepts, ["html json"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  # scope "/", BleacherReportWeb do
  #   pipe_through :browser
  #
  #   get "/", PageController, :index
  # end

  # Other scopes may use custom stacks.
  scope "/api", BleacherReportWeb do
    pipe_through :api

    get "/users", UserController, :index
    get "/user/:id", UserController, :show
    post "/createuser", UserController, :create_user

    get "/contents", ContentController, :index
    get "/content/:id", ContentController, :show
    post "/createcontent", ContentController, :create_content

    get "/reactions", ReactionController, :reactions
    post "/reaction", ReactionController, :reaction
    get "/reaction_counts/:content_id", ReactionController, :reactioncounts
  end
end
