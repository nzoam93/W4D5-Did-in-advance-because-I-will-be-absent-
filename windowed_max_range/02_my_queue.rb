#queues are FIFI (first in FIRST OUT)

class MyQueue
    def initialize(store = [])
        @store = store
    end

    def peek
        @store[-1] #why is it last ele and not the first ele?
    end

    def size
        @store.length
    end

    def empty?
        @store.empty?
    end

    def enqueue(n) #our object is an array so we can push in and shift
        @store.push(n)
    end

    def dequeue
        @store.shift()
    end
end
