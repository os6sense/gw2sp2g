
class HighestReturn
    def initialize
        @top5 = []
    end

    def add recipe
        @top5 << recipe if @top5.size == 0

        (0..(@top5.size >= 5?4:@top5.size - 1)).each do | i |
            if recipe.profit["per_sp_value"] > (@top5[i]).profit["per_sp_value"]
                @top5.sort! { |x, y| x.profit["per_sp_value"] <=> y.profit["per_sp_value"] }
                @top5.delete_at(0) if @top5.size == 5
                @top5 << recipe
                break
            end
        end
    end

    def get i
        @top5[i]
    end

    def each &block
        @top5.sort! { |x, y| y.profit["per_sp_value"] <=> x.profit["per_sp_value"] }
        @top5.each &block
    end
end
