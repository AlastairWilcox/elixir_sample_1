defmodule TimeTest do
    use ExUnit.Case
    
    doctest  SampleCodeElixir.Utils.Time 
    
    alias SampleCodeElixir.Utils.Time  
   
    test "test_get_hour_minute_second" do
      assert Time.get_hour_minute_second(1649939223) == "12:27:03"
    end

    test "test_get_hour_minute" do
      assert Time.get_hour_minute(1649939223) == "12:27"
    end    

    test "test_get_hour" do
      assert Time.get_hour(1649939223) == "12"
    end

    test "test_get_ymd_forward_slash" do
      assert Time.get_ymd_forward_slash(1649939223) == "2022/4/14"
    end

    test "test_get_ymd" do
      assert Time.get_ymd(1649939223) == "2022-4-14"
    end

    test "test_determine_label_by_type_hour" do
      time_render_func = Time.determine_label_by_type("hour")     
      func_info = :erlang.fun_info(time_render_func)
      
      assert func_info[:name] == :"-fun.get_hour/1-"
    end

    test "test_determine_label_by_type_hour_minute" do
      time_render_func = Time.determine_label_by_type("hour_minute")     
      func_info = :erlang.fun_info(time_render_func)
      
      assert func_info[:name] == :"-fun.get_hour_minute/1-"
    end

    test "test_determine_label_by_type_hour_minute_second" do
      time_render_func = Time.determine_label_by_type("hour_minute_second")     
      func_info = :erlang.fun_info(time_render_func)
      
      assert func_info[:name] == :"-fun.get_hour_minute_second/1-"
    end

    test "test_determine_label_by_type_ymd" do
      time_render_func = Time.determine_label_by_type("ymd")     
      func_info = :erlang.fun_info(time_render_func)
      
      assert func_info[:name] == :"-fun.get_ymd/1-"
    end

    test "test_determine_label_by_type_slash" do
      time_render_func = Time.determine_label_by_type("ymd_forward_slash")     
      func_info = :erlang.fun_info(time_render_func)
      
      assert func_info[:name] == :"-fun.get_ymd_forward_slash/1-"
    end

   
  end
