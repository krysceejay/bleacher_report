# BleacherReport

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  A Phoenix base microservice using ETS(Erlang Term Storage) as an in-memory cache.

  To create a user
  POST to http://localhost:4000/createuser
  Parameters: name (string)

  View all users
  GET to http://localhost:4000/users

  Create content
  POST to http://localhost:4000/createcontent
  Parameters: user_id (string), title (string), body (string)

  View all contents
  GET to http://localhost:4000/contents

  Create reactions
  POST to http://localhost:4000/reaction
  Parameters: action (string), content_id (string), reaction_type (string), type (string), user_id (string)

  View add fire reaction counts
  GET to http://localhost:4000/reaction_counts/:content_id
