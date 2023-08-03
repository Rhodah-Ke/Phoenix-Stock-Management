defmodule Trade.ReturnsTest do
  use Trade.DataCase

  alias Trade.Returns

  describe "returns" do
    alias Trade.Returns.Return

    import Trade.ReturnsFixtures

    @invalid_attrs %{quantity: nil, return_date: nil, returning_reason: nil}

    test "list_returns/0 returns all returns" do
      return = return_fixture()
      assert Returns.list_returns() == [return]
    end

    test "get_return!/1 returns the return with given id" do
      return = return_fixture()
      assert Returns.get_return!(return.id) == return
    end

    test "create_return/1 with valid data creates a return" do
      valid_attrs = %{quantity: 42, return_date: ~D[2023-07-13], returning_reason: "some returning_reason"}

      assert {:ok, %Return{} = return} = Returns.create_return(valid_attrs)
      assert return.quantity == 42
      assert return.return_date == ~D[2023-07-13]
      assert return.returning_reason == "some returning_reason"
    end

    test "create_return/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Returns.create_return(@invalid_attrs)
    end

    test "update_return/2 with valid data updates the return" do
      return = return_fixture()
      update_attrs = %{quantity: 43, return_date: ~D[2023-07-14], returning_reason: "some updated returning_reason"}

      assert {:ok, %Return{} = return} = Returns.update_return(return, update_attrs)
      assert return.quantity == 43
      assert return.return_date == ~D[2023-07-14]
      assert return.returning_reason == "some updated returning_reason"
    end

    test "update_return/2 with invalid data returns error changeset" do
      return = return_fixture()
      assert {:error, %Ecto.Changeset{}} = Returns.update_return(return, @invalid_attrs)
      assert return == Returns.get_return!(return.id)
    end

    test "delete_return/1 deletes the return" do
      return = return_fixture()
      assert {:ok, %Return{}} = Returns.delete_return(return)
      assert_raise Ecto.NoResultsError, fn -> Returns.get_return!(return.id) end
    end

    test "change_return/1 returns a return changeset" do
      return = return_fixture()
      assert %Ecto.Changeset{} = Returns.change_return(return)
    end
  end

  describe "returns" do
    alias Trade.Returns.Return

    import Trade.ReturnsFixtures

    @invalid_attrs %{quantity: nil, return_date: nil, returning_reason: nil}

    test "list_returns/0 returns all returns" do
      return = return_fixture()
      assert Returns.list_returns() == [return]
    end

    test "get_return!/1 returns the return with given id" do
      return = return_fixture()
      assert Returns.get_return!(return.id) == return
    end

    test "create_return/1 with valid data creates a return" do
      valid_attrs = %{quantity: 42, return_date: ~D[2023-07-26], returning_reason: "some returning_reason"}

      assert {:ok, %Return{} = return} = Returns.create_return(valid_attrs)
      assert return.quantity == 42
      assert return.return_date == ~D[2023-07-26]
      assert return.returning_reason == "some returning_reason"
    end

    test "create_return/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Returns.create_return(@invalid_attrs)
    end

    test "update_return/2 with valid data updates the return" do
      return = return_fixture()
      update_attrs = %{quantity: 43, return_date: ~D[2023-07-27], returning_reason: "some updated returning_reason"}

      assert {:ok, %Return{} = return} = Returns.update_return(return, update_attrs)
      assert return.quantity == 43
      assert return.return_date == ~D[2023-07-27]
      assert return.returning_reason == "some updated returning_reason"
    end

    test "update_return/2 with invalid data returns error changeset" do
      return = return_fixture()
      assert {:error, %Ecto.Changeset{}} = Returns.update_return(return, @invalid_attrs)
      assert return == Returns.get_return!(return.id)
    end

    test "delete_return/1 deletes the return" do
      return = return_fixture()
      assert {:ok, %Return{}} = Returns.delete_return(return)
      assert_raise Ecto.NoResultsError, fn -> Returns.get_return!(return.id) end
    end

    test "change_return/1 returns a return changeset" do
      return = return_fixture()
      assert %Ecto.Changeset{} = Returns.change_return(return)
    end
  end
end
