defmodule ItemsTest do
  use ExUnit.Case
  doctest Language

  describe "translate/2 turns words into rocks" do
    test "la in banana people language" do
      count = Language.translate(Language.BananaPeople, "na")
      assert Enum.count(count) == 1
      assert_list_of_rocks(count)
    end

    test "ba in banana people language" do
      count = Language.translate(Language.BananaPeople, "ba")
      assert Enum.count(count) == 4
      assert_list_of_rocks(count)
    end

    test "na in banana people language" do
      count = Language.translate(Language.BananaPeople, "la")
      assert Enum.count(count) == 16
      assert_list_of_rocks(count)
    end

    test "combining in banana people language" do
      count = Language.translate(Language.BananaPeople, "na-ba-la")
      assert Enum.count(count) == 21
      assert_list_of_rocks(count)
    end

    test "clap in hand people language" do
      count = Language.translate(Language.HandPeople, "clap")
      assert Enum.count(count) == 1
      assert_list_of_rocks(count)
    end

    test "thump in hand people language" do
      count = Language.translate(Language.HandPeople, "thump")
      assert Enum.count(count) == 4
      assert_list_of_rocks(count)
    end

    test "combining in hand people language" do
      count = Language.translate(Language.HandPeople, "clap-thump")
      assert Enum.count(count) == 5
      assert_list_of_rocks(count)
    end

    test "scratch in tree people language" do
      count = Language.translate(Language.TreePeople, "scratch")
      assert Enum.count(count) == 1
      assert_list_of_rocks(count)
    end

    test "tree in tree people language" do
      count = Language.translate(Language.TreePeople, "tree")
      assert Enum.count(count) == 7
      assert_list_of_rocks(count)
    end

    test "combining in tree people language" do
      count = Language.translate(Language.TreePeople, "tree-scratch")
      assert Enum.count(count) == 8
      assert_list_of_rocks(count)
    end
  end

  defp assert_list_of_rocks(count) do
    assert Enum.all?(count, &match?(%Rock{}, &1))
  end
end
