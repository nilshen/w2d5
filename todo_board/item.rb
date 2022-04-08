
class Item

attr_reader :title, :deadline, :description
attr_writer :title, :description

    def self.valid_date?(date_string)
    arr = date_string.split("-")
        if arr[1].to_i < 1 || arr[1].to_i  > 12
            return false
        elsif arr[2].to_i  < 1 || arr[2].to_i  > 31
            return false
        end
    true
    end

    def initialize(title, deadline, description)
        @title = title
        @deadline = deadline
        @description = description
        if Item.valid_date?(@deadline) == false
            raise "Error due to invalid date!"
        end
    end

    def deadline=(new_deadline) 
        if Item.valid_date?(new_deadline) == true
        @deadline = new_deadline
        else 
            raise "Dealine is not valid!"
        end
    end

end


# p Item.valid_date?('2019-10-25') # true
# p Item.valid_date?('1912-06-23') # true
# p Item.valid_date?('2018-13-20') # false
# p Item.valid_date?('2018-12-32') # false
# p Item.valid_date?('10-25-2019') # false

# p Item.new('Fix login page', '2019-10-25', 'The page loads too slow.')
# p Item.new(
#     'Buy Cheese',
#     '2019-10-21',
#     'We require American, Swiss, Feta, and Mozzarella cheese for the Happy hour!'
# # )
# p Item.new(
#     'Fix checkout page',
#     '10-25-2019',
#     'The font is too small.'
# ) 