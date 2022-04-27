defmodule ApiSensorsTest do
    use ExUnit.Case

    doctest  SampleCodeElixir.Api.ApiSensors
      
    alias SampleCodeElixir.Api.ApiSensors

    require Logger

    setup_all do
      {:ok, 
        data: [
          %{
            :unix_timestamp => 1650272331,
            :val => 1.3456
          },
          %{
            :unix_timestamp => 1650272271,
            :val => 2
          },
          %{
            :unix_timestamp => 1650272211,
            :val => 3.34567890
          },
          %{
            :unix_timestamp => 1650250611,
            :val => 4
          }
         ]          
      }
    end
  
    test "test_data", state do
      res = ApiSensors.process(state[:data], "val", "hour")
      assert length(res[:time]) == 4
      assert length(res[:val]) == 4      
    end   
  end
  