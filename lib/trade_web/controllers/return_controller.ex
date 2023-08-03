defmodule TradeWeb.ReturnController do
  use TradeWeb, :controller

  alias Trade.Returns
  alias Trade.Returns.Return
  alias Trade.Receives
  


  def index(conn, _params) do
    returns = Returns.list_returns()
    render(conn, "index.html", returns: returns)
  end

  def new(conn, _params) do
    changeset = Returns.change_return(%Return{})
    receives = Receives.list_all()
    render(conn, "new.html", changeset: changeset, receives: receives)
  end

  def create(conn, %{"return" => return_params}) do
    receive_id = return_params["receive_id"]
    receive = Receives.get_receive!(receive_id)
    IO.inspect return_params


    changeset =
      receive
      |> Ecto.build_assoc(:returns)
      |> Return.changeset(return_params)

      case Trade.Repo.insert(changeset) do
        {:ok, _return} ->
          conn
          |> put_flash(:info, "Return created successfully.")
          |> redirect(to: Routes.return_path(conn, :index))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset, receives: Trade.Receives.list_all())
    end
  end

  def show(conn, %{"id" => id}) do
    return = Returns.get_return!(id)
    render(conn, "show.html", return: return)
  end

  def edit(conn, %{"id" => id}) do
    return = Returns.get_return!(id)
    changeset = Returns.change_return(return)
    receives = Trade.Receives.list_all()
    render(conn, "edit.html", return: return, changeset: changeset, receives: receives)
  end

  def update(conn, %{"id" => id, "return" => return_params}) do
    return = Returns.get_return!(id)

    case Returns.update_return(return, return_params) do
      {:ok, return} ->
        conn
        |> put_flash(:info, "Return updated successfully.")
        |> redirect(to: Routes.return_path(conn, :show, return))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", return: return, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    return = Returns.get_return!(id)
    {:ok, _return} = Returns.delete_return(return)

    conn
    |> put_flash(:info, "Return deleted successfully.")
    |> redirect(to: Routes.return_path(conn, :index))
  end
end
