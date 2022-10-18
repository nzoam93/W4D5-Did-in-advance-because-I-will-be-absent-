#stacks are FILO (first in , LAST OUT). Like MTG
class MyStack(store = [])
    def initialize
        @store = store
    end

    def peek
        @store[-1]
    end

    def size
        @store.length
    end

    def empty?
        @store.empty?
    end

    def pop
        @store.pop
    end

    def push(n)
        @store.push(n)
    end
end
