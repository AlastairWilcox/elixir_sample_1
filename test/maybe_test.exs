defmodule MaybeTest do
    use ExUnit.Case
    
    doctest SampleCodeElixir.Utils.Maybe
    
    alias SampleCodeElixir.Utils.Maybe
  
    test "round_nil" do
      assert Maybe.round(nil, 2) == 0
    end

    test "round_int" do
      assert Maybe.round(2, 2) == 2
    end

    test "round_float" do
      assert Maybe.round(3.14159265359, 2) == 3.14
    end

    test "subtract_nil_nil" do
      assert Maybe.subtract(nil, nil) == 0
    end

    test "subtract_x_nil" do
      assert Maybe.subtract(10, nil) == 0
    end

    test "subtract_nil_x" do
      assert Maybe.subtract(nil, 5) == 0
    end

    test "list_nil" do
      assert Maybe.list(nil) == []
    end

    test "list" do
      assert Maybe.list(1) == [1]
    end

    test "list_list" do
      assert Maybe.list([1,2,3]) == [1,2,3]
    end
    
    test "list_nil_nil" do
      assert Maybe.list(nil, nil) == []
    end
   
    test "list_nil_x" do
      assert Maybe.list(nil, [1,2,3]) == [1,2,3]
    end

    test "list_x_nil" do
      assert Maybe.list(1, nil) == [1]
    end

    test "list_x_y" do
      assert Maybe.list(1, [2,3,4]) == [1,2,3,4]
    end

    test "list_x_y_int" do
      assert Maybe.list(1, 2) == [1,2]
    end
  end
