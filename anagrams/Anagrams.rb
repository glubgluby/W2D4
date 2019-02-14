def first_anagram?(str1, str2)
    return false if str2.size != str1.size
    res = str1.chars.permutation(str1.size).to_a
    res.map!{|charr| charr.join("")}
    res.include?(str2)
end

def second_anagram?(str1, str2)
    return false if str2.size != str1.size
    res = str2.chars
    
    str1.chars.each do |ch|
        i = res.find_index(ch)
        i.nil? ? (return false) : res[i]= nil
    end

    return true
end

def third_anagram?(str1, str2)
    str1.chars.sort == str2.chars.sort
end

def fourth_anagram?(str1, str2)
    return false if str2.size != str1.size
    counter1 = Hash.new(0)
    str1.chars.each{|ch| counter1[ch] += 1}
    str2.chars.each{|ch| counter1[ch] -= 1}
    counter1.values.all?{|el| 0}
end