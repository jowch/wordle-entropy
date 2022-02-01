### A Pluto.jl notebook ###
# v0.17.7

using Markdown
using InteractiveUtils

# ╔═╡ 4df3170c-83a7-11ec-0eb7-9fe0a20bfc16
md"""
# Introduction to Wordle

[Wordle](https://www.powerlanguage.co.uk/wordle/) is a daily word guessing game where the objective is to guess the daily, five-letter "wordle" within six guesses. Each time you make a guess, you are given the following feedback:
- Letters that are in the correct position will be highlighted in green;
- Letters that are in the wordle but not in the correct position are highlighted in yellow;
- And, the rest are highlighted in gray.

Here are the instructions from the [game](https://www.powerlanguage.co.uk/wordle/):
![instructions-screenshot](https://images.squarespace-cdn.com/content/v1/50eca855e4b0939ae8bb12d9/80a523b2-edff-41ac-8a9e-d515285a0b74/How+to+play+original+Wordle.png?format=1000w)

The game went viral as friends would compete with each other to see who could guess the wordle with the fewest number of guesses. [Try it out for yourself!](https://www.powerlanguage.co.uk/wordle/).
"""

# ╔═╡ a97ec29b-bdc6-4015-940e-a84fe8001e01
md"""
## Guessing Strategy

When starting, one might expect that any given word is as good as any other as a first guess. However, this is not the case as certain letters are more frequent in English than others. For example, most words have at least one vowel and consonants like `s` and `r` are more common than others (see [this Wikipedia page](https://www.wikiwand.com/en/Letter_frequency) for more information about this).

Believe it or not, there is a significant amount of nerdiness 🤓 and snobbery 😎 surrounding which words are the best ones to guess first. For example, many have suggested that you should prioritize words that have the most frequent letters, including the author of [this Medium article](https://towardsdatascience.com/a-frequency-analysis-on-wordle-9c5778283363) and many others on Twitter. But is this really the best strategy? Let's find out.
"""

# ╔═╡ 9b5ff53f-0d0f-4aa8-8484-25b5d4ecdc3f
md"""
## Fetching the Word Lists

Before we begin to try different guessing strategies, we need to first find some words to try. It turns out that the full lists of valid words and wordles can be found in the game source code. Once extracted, we will be able to use these lists of words to validate strategies.

However, we should take care in the way we do this extraction to avoid spoilers. Ideally, the code we write to do this extraction requires no explicit knowledge of past or future wordles. In this way, no wordles are specifically "hard-coded" into the extraction routines. Today's wordle (whenever you are reading this) is also not considered to be "known". Additionally, in this spirit, we should only use historical wordles to do our validation.

I won't include this fetching code in this notebook as it is not super interesting. If you are interested, you can find it in the `src/wordle.jl` file or [on GitHub](https://github.com/jowch/wordle-entropy/blob/main/src/wordle.jl).

With these caveats, let's get started! 🚀
"""

# ╔═╡ Cell order:
# ╟─4df3170c-83a7-11ec-0eb7-9fe0a20bfc16
# ╟─a97ec29b-bdc6-4015-940e-a84fe8001e01
# ╟─9b5ff53f-0d0f-4aa8-8484-25b5d4ecdc3f
