require_relative "item"

class List
attr_reader :label
attr_writer :label

    def initialize(label)
        @label = label 
        @items = []
    end

    def add_item(title, deadline,description = "") #!!!!!      cannot just put in "", should be description = "" 
        if Item.valid_date?(deadline)
        @items << Item.new(title, deadline, description) #!!!!! just put description here, NO description = ""
        return true
        end
        false
    end

    def size
        @items.length
    end

    def valid_index?(index)
     0 <= index && index < self.size 
    end

    def swap (index_1, index_2)
        if valid_index?(index_1) && valid_index?(index_2)
            @items[index_1],@items[index_2] = @items[index_2],@items[index_1]
            return true
        end
        false
    end

    def [](index)
        if valid_index?(index)
        @items[index]
        end 
        nil
    end

    def priority
        @items[0]
    end

end