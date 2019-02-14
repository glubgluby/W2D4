def max_windowed_array(arr, windowsize) #O(n)
    mmqs = StackQueue.new
    range = nil
    arr.each do |el|
        if mmqs.size < windowsize
            mmqs.enqueue(el)
        end
        if mmqs.size == windowsize
            rx = mmqs.dequeue
            if range.nil? || rx > range
                range = rx
            end
        end
    end
    range

end

# class MyQueue
    
#     def initialize
#         @queue = []
#     end
    
#     def peek
#         queue[0]
#     end
    
#     def dequeue
#         queue.shift
#     end
    
#     def enqueue(el)
#         queue << el
#     end
    
#     def empty?
#         queue.empty?
#     end

#     protected
#     attr_accessor :queue
# end

class MyStack
    def initialize
        @store = []
    end

     def peek
        store[-1]
    end
    
    def pop
        store.pop
    end
    
    def push(el)
        store << el
    end
    
    def empty?
        store.empty?
    end

    protected
    attr_accessor :store
    
end

class StackQueue
    attr_reader :stack1, :stack2
    
    def initialize
        @stack1 = []
        @stack2 = []
    end

    def size
        stack1.size
    end

    def empty?
        stack1.empty?
    end

    def enqueue(el)
        @stack1 << el
    end 
    def dequeue
        max = nil
        min = nil
        until @stack1.empty?
            x = @stack1.pop
            if max.nil? || max < x
                max = x
            end
            if min.nil? || min > x
                min = x
            end
            @stack2 << (x)
        end
        @stack2.pop
        until @stack2.empty?
            @stack1 << @stack2.pop
        end
        max - min
    end


end


