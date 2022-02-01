using Dates
using HTTP


WORDLE_URL = "https://www.powerlanguage.co.uk/wordle/"
WORDLE_START_DATE = Date(2021, 6, 19)
LATEST_KNOWN_WORDLE_NUMBER = Dates.value(today() - WORDLE_START_DATE) - 1


function fetch_known_words()
    js_url = let
        html = HTTP.request(:GET, WORDLE_URL).body |> String

        filename = match(r"src=\"(main.\w+.js)\"", html) |> only
        joinpath(WORDLE_URL, filename)
    end

    js = replace(HTTP.request(:GET, js_url).body |> String, "\n" => "")

    # find array of words
    matches = eachmatch(r"\[([\"\w,]+)\]", js) |> collect .|> only .|> String
    matches = replace.(matches, "\"" => "")
    matches = split.(matches, ',')

    # There are several arrays in the game source, but there are two criteria we
    # can use to identify the list answers. First, the number of words in the
    # list must be longer than the number of wordles we've had. Second, the list
    # of words is not in alphabetical order. I happen to know that the first
    # five words are enough to tell if the word list is in alphabetical order.
    target_list = filter(matches) do candidate_list
        if length(candidate_list) > LATEST_KNOWN_WORDLE_NUMBER 
            first_five = candidate_list[1:5]
            sorted = all(sort(first_five) .== first_five)

            return !sorted
        else
            return false
        end
    end |> only

    target_list[1:LATEST_KNOWN_WORDLE_NUMBER]
end
