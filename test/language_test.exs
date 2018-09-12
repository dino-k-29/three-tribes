defmodule ItemsTest do
  use ExUnit.Case
  doctest Language

  describe "from_rocks/2 translates rocks into words" do
    test "1 rock in banana people language" do
      assert "na" == Language.from_rocks(Language.BananaPeople, [%Rock{}])
    end

    test "4 rocks in banana people language" do
      assert "ba" ==
               Language.from_rocks(Language.BananaPeople, [%Rock{}, %Rock{}, %Rock{}, %Rock{}])
    end

    test "16 rocks in banana people language" do
      assert "la" ==
               Language.from_rocks(Language.BananaPeople, Enum.map(1..16, fn _ -> %Rock{} end))
    end

    test "21 rocks in banana people language" do
      assert "la-ba-na" ==
               Language.from_rocks(Language.BananaPeople, Enum.map(1..21, fn _ -> %Rock{} end))
    end

    test "1 rock in hand people language" do
      assert "clap" == Language.from_rocks(Language.HandPeople, [%Rock{}])
    end

    test "4 rocks in hand people language" do
      assert "thump" ==
               Language.from_rocks(Language.HandPeople, [%Rock{}, %Rock{}, %Rock{}, %Rock{}])
    end

    test "5 rocks in hand people language" do
      assert "thump-clap" ==
               Language.from_rocks(Language.HandPeople, Enum.map(1..5, fn _ -> %Rock{} end))
    end

    test "1 rock in tree people language" do
      assert "scratch" == Language.from_rocks(Language.TreePeople, [%Rock{}])
    end

    test "7 rocks in tree people language" do
      assert "tree" ==
               Language.from_rocks(Language.TreePeople, Enum.map(1..7, fn _ -> %Rock{} end))
    end

    test "8 rocks in tree people language" do
      assert "tree-scratch" ==
               Language.from_rocks(Language.TreePeople, Enum.map(1..8, fn _ -> %Rock{} end))
    end
  end

  describe "to_rocks/2 translates words into rocks" do
    test "na in banana people language" do
      count = Language.to_rocks(Language.BananaPeople, "na")
      assert Enum.count(count) == 1
      assert_list_of_rocks(count)
    end

    test "ba in banana people language" do
      count = Language.to_rocks(Language.BananaPeople, "ba")
      assert Enum.count(count) == 4
      assert_list_of_rocks(count)
    end

    test "la in banana people language" do
      count = Language.to_rocks(Language.BananaPeople, "la")
      assert Enum.count(count) == 16
      assert_list_of_rocks(count)
    end

    test "combining in banana people language" do
      count = Language.to_rocks(Language.BananaPeople, "la-ba-na")
      assert Enum.count(count) == 21
      assert_list_of_rocks(count)
    end

    test "clap in hand people language" do
      count = Language.to_rocks(Language.HandPeople, "clap")
      assert Enum.count(count) == 1
      assert_list_of_rocks(count)
    end

    test "thump in hand people language" do
      count = Language.to_rocks(Language.HandPeople, "thump")
      assert Enum.count(count) == 4
      assert_list_of_rocks(count)
    end

    test "combining in hand people language" do
      count = Language.to_rocks(Language.HandPeople, "thump-clap")
      assert Enum.count(count) == 5
      assert_list_of_rocks(count)
    end

    test "scratch in tree people language" do
      count = Language.to_rocks(Language.TreePeople, "scratch")
      assert Enum.count(count) == 1
      assert_list_of_rocks(count)
    end

    test "tree in tree people language" do
      count = Language.to_rocks(Language.TreePeople, "tree")
      assert Enum.count(count) == 7
      assert_list_of_rocks(count)
    end

    test "combining in tree people language" do
      count = Language.to_rocks(Language.TreePeople, "tree-scratch")
      assert Enum.count(count) == 8
      assert_list_of_rocks(count)
    end
  end

  defp assert_list_of_rocks(count) do
    assert Enum.all?(count, &match?(%Rock{}, &1))
  end
end
