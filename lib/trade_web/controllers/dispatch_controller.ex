defmodule TradeWeb.DispatchController do
  use TradeWeb, :controller

  alias Trade.Dispatches
  alias Trade.Dispatches.Dispatch
  alias Trade.Receives

  def index(conn, _params) do
    dispatches = Dispatches.list_dispatches()
    render(conn, "index.html", dispatches: dispatches)
  end

  def new(conn, _params) do
    changeset = Dispatches.change_dispatch(%Dispatch{})
    receives = Receives.list_all()
    render(conn, "new.html", changeset: changeset, receives: receives)
  end

  def create(conn, %{"dispatch" => dispatch_params}) do
    receive_id = dispatch_params["receive_id"]
    receive = Receives.get_receive!(receive_id)
    IO.inspect dispatch_params

    changeset =
      receive
      |> Ecto.build_assoc(:dispatches)
      |> Dispatch.changeset(dispatch_params)

    case Trade.Repo.insert(changeset) do
      {:ok, _dispatch} ->
        conn
        |> put_flash(:info, "Dispatch created successfully.")
        |> redirect(to: Routes.dispatch_path(conn, :index))

      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset, receives: Trade.Receives.list_all())
    end
  end

  def edit(conn, %{"id" => id}) do
    dispatch = Dispatches.get_dispatch!(id)
    changeset = Dispatches.change_dispatch(dispatch)
    receives = Trade.Receives.list_all()
    render(conn, "edit.html", dispatch: dispatch, changeset: changeset, receives: receives)
  end

  def show(conn, %{"id" => id}) do
    dispatch = Dispatches.get_dispatch!(id)
    render(conn, "show.html", dispatch: dispatch)
  end

  def update(conn, %{"id" => id, "dispatch" => dispatch_params}) do
    dispatch = Dispatches.get_dispatch!(id)

    case Dispatches.update_dispatch(dispatch, dispatch_params) do
      {:ok, dispatch} ->
        conn
        |> put_flash(:info, "Dispatch updated successfully.")
        |> redirect(to: Routes.dispatch_path(conn, :show, dispatch))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", dispatch: dispatch, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    dispatch = Dispatches.get_dispatch!(id)
    {:ok, _dispatch} = Dispatches.delete_dispatch(dispatch)

    conn
    |> put_flash(:info, "Dispatch deleted successfully.")
    |> redirect(to: Routes.dispatch_path(conn, :index))
  end
end
