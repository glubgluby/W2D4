def slow_min(arr)
    arr.each do |el|
        counter = 0

        arr.each do |el2|
            counter += 1 if el2 > el 
        end

        return el if counter == arr.size
    end
end

def good_min(arr)
    min = arr.first
    arr.each do |el|
        min = el if el < min 
    end
    min
end

def slow_subsum(arr)
    res_arr = []
    i = 0

    while i < arr.length
        check = [arr[i]]
        res_arr << check
        j = i + 1

        while j < arr.length
            check += [arr[j]]
            res_arr << check
            j += 1
        end

        i += 1
    end

    res_arr.map{|sub_arr| sub_arr.sum}.max
end


def contig_sum(array)
    sum = nil
    max = nil
    array.each do |el|
        if sum.nil?
            sum = el
            max = el
        else
            sum += el
        
        end

        max = sum if sum > max

        if sum <= 0
            sum = 0
        end

    end

    max

end