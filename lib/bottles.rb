require "pry"
class Bottles

  def song
    verses(99, 0)
  end

  def verses(starting, ending)
    starting.downto(ending).map do |number|
      verse(number)
    end.join("\n")
  end

  def verse(number)
    return empty_verse if number == 0
    return single_bottle_verse if number == 1
    build_phrase(get_next_phrases(number))
  end

  def build_phrase(phrase_hash)
    return single_bottle_verse if phrase_hash[:next_num] == 1

    "#{phrase_hash[:number]} bottles of beer on the wall, #{phrase_hash[:number]} bottles of beer.\nTake one down and pass it around, #{phrase_hash[:next_number]} #{phrase_hash[:phrase]} of beer on the wall.\n"
  end

  def single_bottle_verse
    "1 bottle of beer on the wall, 1 bottle of beer.\nTake it down and pass it around, no more bottles of beer on the wall.\n"
  end

  def empty_verse
    "No more bottles of beer on the wall, no more bottles of beer.\nGo to the store and buy some more, 99 bottles of beer on the wall.\n"
  end

  def get_next_phrases(number)
    next_num = number - 1

    result =
      if number == 2
        { phrase: "bottle", next_number: "1" }
      else
        { phrase: "bottles", next_number: (next_num).to_s }
      end

    result[:number] = number

    result
  end
end


