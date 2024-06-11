unsorted_numbers = [4,3,78,2,0,2]
p unsorted_numbers

def bubble_sort list
  n = list.length-2
  # We subtract 1 because i starts at 0, and another 1 becasue we don't want to iterate the last entry as that will throw an error.
  if list.length <= 1
    return
    # Prevents trying to sort a nil or one entry list.
  end
  for j in 0..n do
    for i in 0..n do
        if list[i] > list[i+1]
          list[i], list[i+1] = list[i+1], list[i]
        end
      # This loop run through the array once, which is not enough to sort.
    end
    # This loop runs us through the maxium possible number of loops required for sorting.
  end
  list
end

p bubble_sort unsorted_numbers

# However, we can do better.

def optimised_bubble_sort list
  n = list.length-1
  m = n - 2
  if n <= 1
    return
  end
  n.times do
    i = 0
    while i < m
      if list[i] > list[i+1]
        list[i], list[i+1] = list[i+1], list[i]
      end
      i += 1
    end
    m -= 1
    # The list sorts from the back. After x runs, we no longer need to look at the last x elements - they are guarenteed to be sorted. We can therefore reduce the scope of the sorting after each loop.
  end
  list
end

p optimised_bubble_sort unsorted_numbers

# Learning points:
#  You cannot use #each_with_index because it will throw an error when it tries to compare the last element with a non-existant next element.
#  A Ruby for do loop does not require you to define or increment i.
#  I tried repeatedly to create a 'flag' that could be checked to end the loop early, but I was not able to modify a variable in the IF statement, despite looking at similar statements in other people's work. I don't know what I did wrong, syntactically, but I'm going to leave it here for now.