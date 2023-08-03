defmodule TradeWeb.StockController do
  use TradeWeb, :controller

  alias Trade.Stocks
  alias Trade.Stocks.Stock
  alias Trade.Receives

  def index(conn, _params) do

    stocks = Receives.list_receives()



    render(conn, "index.html", stocks: stocks)

  end

  def new(conn, _params) do
    changeset = Stocks.change_stock(%Stock{})
    receives = Receives.list_all()
    render(conn, "new.html", changeset: changeset, receives: receives)
  end

  def create(conn, %{"stock" => stock_params}) do
    receive_id = stock_params["receive_id"]
    receive = Receives.get_receive!(receive_id)
    IO.inspect stock_params

    changeset =
      receive
      |> Ecto.build_assoc(:stocks)
      |> Stock.changeset(stock_params)


      case Trade.Repo.insert(changeset) do
        {:ok, _stock} ->
        conn
        |> put_flash(:info, "Stock created successfully.")
        |> redirect(to: Routes.stock_path(conn, :index))

        {:error, changeset} ->
          render(conn, "new.html", changeset: changeset, receives: Trade.Receives.list_all())
      end
  end

  def show(conn, %{"id" => id}) do
    stock = Stocks.get_stock!(id)
    render(conn, "show.html", stock: stock)
  end

  def edit(conn, %{"id" => id}) do
    stock = Stocks.get_stock!(id)
    changeset = Stocks.change_stock(stock)
    receives = Trade.Receives.list_all()
    render(conn, "edit.html", stock: stock, changeset: changeset, receives: receives)
  end

  def update(conn, %{"id" => id, "stock" => stock_params}) do
    stock = Stocks.get_stock!(id)

    case Stocks.update_stock(stock, stock_params) do
      {:ok, stock} ->
        conn
        |> put_flash(:info, "Stock updated successfully.")
        |> redirect(to: Routes.stock_path(conn, :show, stock))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", stock: stock, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    stock = Stocks.get_stock!(id)
    {:ok, _stock} = Stocks.delete_stock(stock)

    conn
    |> put_flash(:info, "Stock deleted successfully.")
    |> redirect(to: Routes.stock_path(conn, :index))
  end


end
