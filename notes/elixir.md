## Ecto

### Partial updates

`validate_required` checks if a field is populated on _either_ the attributes map _or_ the changeset itself.  This means it can be used for partial updates, as the changeset should contain all of the original fields, and `validate_required` should pass even if the update `attrs` only contains a single field.

### IEx

To access a configured environment in IEx run `iex -S mix`.
Use the repo with `Unrulr.Repo.[get/insert/etc]`.


## ElixirLS

When references/find-source breaks, delete `.elixir_ls/` and restart vscode


## Elixir Lang

### With

Two things I didn't notice during several pass-throughs of the language introduction:

1.  With has an else option.
2.  You can use guards in the clauses.

In the case where I have several operations which might fail, and I don't want to nest case/if statements, we can use `with` to turn it into something like this:

```
with {:ok, packet} <-
     get_packet_for_editing(
       packet_id,
       user_id,
       repo: repo
     ),
     objective when objective != nil <-
       Enum.find(
         packet.objectives,
         fn obj -> obj.id == objective_id end
       ),
     {:ok, updated} <-
       Portfolios.update_objective(
         objective,
         objective_params,
         repo: repo
       ) do
  render(conn, "objective.json", %{objective: updated})
else
  {:error, error} ->
    Logger.error(error)
    send_resp(conn, 500, "Internal Error")

  nil ->
    send_resp(
      conn,
      400,
      "referenced objective #{objective_id} is not connected to packet #{packet_id}"
    )
end
```

### Keyword lists as params

When a function call contains an un-enclosed keyword pair, that's shorthand for a keyword list.  I _think_ that any unenclosed pairs need to be the final arguments to a function.

```
do_something(first_arg, second_arg, option_1: val_1, option_2: val_2)
```

is syntactic sugar for:

```
do_something(first_arg, second_arg, [option_1: val_1, option_2: val_2])
```


 

## Testing

### Controllers

To determine how to access the correct route in a controller (via Routes, which is a convenience name for UnrulrWeb.Router.Helpers), run `mix phx.routes` which will describe the route names inferred from the structure in `router.ex`
