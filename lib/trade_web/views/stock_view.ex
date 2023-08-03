defmodule TradeWeb.StockView do
  use TradeWeb, :view




  # def render("stock_quantities.json", %{stock_quantities: stock_quantities}) do
  #   json_response = %{
  #     data: Enum.map(stock_quantities, &format_stock_quantity/1)
  #   }

  #   # Encode the response as JSON
  #   response_json = Poison.encode!(json_response)

  #   # Set the appropriate content type in the response
  #   conn = put_resp_content_type(conn, "trade/json")

  #   # Send the JSON response back
  #   send_resp(conn, 200, response_json)
  # end

  # defp format_stock_quantity(stock) do
  #   %{
  #     stock_id: stock.stock_id,
  #     total_received: stock.total_received,
  #     total_dispatched: stock.total_dispatched,
  #     total_returned: stock.total_returned,
  #     available_stock: stock.available_stock
  #   }
  # end
end
