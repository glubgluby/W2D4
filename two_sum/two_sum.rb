require 'byebug'
def brute_two_sum?(arr, target_sum) #O(n^2)
    i = 0

    while i < arr.length
        j = i + 1

        while j < arr.length
            return true if arr[i] + arr[j] == target_sum

            j += 1
        end

        i += 1
    end

    return false
end

def okay_two_sum?(arr, target_sum) #O(nlogn)
    
    arr_sorted = arr.sort 
    arr_sorted.each.with_index do |el, idx|
        # debugger
        bsearch_idx = bsearch(arr_sorted, target_sum - el)
        return true unless bsearch_idx.nil? || bsearch_idx == idx
    end
    false
end


def bsearch(nums, target)
  return nil if nums.empty?

  probe_index = nums.length / 2
  case target <=> nums[probe_index]
  when -1

    bsearch(nums.take(probe_index), target)
  when 0
    probe_index
  when 1
    sub_answer = bsearch(nums.drop(probe_index + 1), target)
    sub_answer.nil? ? nil : (probe_index + 1) + sub_answer
  end
end

def hash_two_sum?(arr, target_sum) #O(n)
    x = Hash.new
    arr.each do |el|
        return true if x[el]
        x[target_sum-el] = el
    end
    false
end

arr = [0, 1, 5, 7]

