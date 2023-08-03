defmodule TradeWeb.ReceiveController do
  use TradeWeb, :controller

  alias Trade.Receives
  alias Trade.Receives.Receive

  def index(conn, _params) do
    receives = Receives.list_receives()
    render(conn, "index.html", receives: receives)
  end

  def new(conn, _params) do
    changeset = Receives.change_receive(%Receive{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"receive" => receive_params}) do

    case Receives.create_receive(receive_params) do
      {:ok, receive} ->
        conn
        |> put_flash(:info, "Receive created successfully.")
        |> redirect(to: Routes.receive_path(conn, :show, receive))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    receive = Receives.get_receive!(id)
    render(conn, "show.html", receive: receive)
  end

  def edit(conn, %{"id" => id}) do
    receive = Receives.get_receive!(id)
    changeset = Receives.change_receive(receive)
    render(conn, "edit.html", receive: receive, changeset: changeset)
  end

  def update(conn, %{"id" => id, "receive" => receive_params}) do
    receive = Receives.get_receive!(id)

    case Receives.update_receive(receive, receive_params) do
      {:ok, receive} ->
        conn
        |> put_flash(:info, "Receive updated successfully.")
        |> redirect(to: Routes.receive_path(conn, :show, receive))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", receive: receive, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    receive = Receives.get_receive!(id)
    {:ok, _receive} = Receives.delete_receive(receive)

    conn
    |> put_flash(:info, "Receive deleted successfully.")
    |> redirect(to: Routes.receive_path(conn, :index))
  end
end
