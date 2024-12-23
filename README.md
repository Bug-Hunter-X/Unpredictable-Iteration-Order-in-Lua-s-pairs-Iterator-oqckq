# Lua Pairs Iterator Issue

This repository demonstrates a potential issue with Lua's `pairs` iterator when dealing with nested tables that are modified during iteration.  The problem arises from the fact that `pairs` doesn't guarantee a specific iteration order, and modifying a table while iterating over it with `pairs` can lead to unpredictable results.  In some cases, it may cause an infinite loop or skip elements.

## The Problem

The `bug.lua` file contains a function `foo` that recursively iterates over a nested table.  Under certain circumstances (the exact circumstances are not easily predictable!), the iteration will not visit all elements.  This happens because modifications to the table while `pairs` is iterating over it might disrupt the order, causing elements to be missed.

## The Solution

The `bugSolution.lua` file provides a safer approach. This solution emphasizes using a copy of the table to ensure that modifications to the original table during iteration doesn't change the iteration sequence.

## How to Reproduce

1. Clone this repository.
2. Run `bug.lua` using a Lua interpreter. Observe that the output isn't always the same and might not process every element.
3. Run `bugSolution.lua`.  The output is consistent and processes all elements.

This example highlights the importance of defensive programming practices when working with iterators and mutable data structures in Lua.