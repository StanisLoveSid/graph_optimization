include Math

def down_s
  graph = { 1 => [], 2 => [1], 3 => [1], 4 => [2,3], 5 => [3,6], 6 => [] }
  history = []
  show = []
  i = 0
  until graph.empty?
    i += 1
    break puts "Цикличность недоступна" if i > graph.length
    keys = []
    graph.each do |key, value|
      if value.empty?
        history << key
        keys << key
        graph.delete key
      end
    end
    show << keys
    graph.each do |key, value|
      unless (value & history).empty?
        value.zip(value & history).map! {|x, y| value.delete(x) if x == y}
      end
    end

  end
end

def up_s
  graph = { 1 => [], 2 => [1], 3 => [1], 4 => [2,3], 5 => [3,6], 6 => [] }
  history = []
  show = []
  i = 0
  until graph.empty?
    i += 1
    break puts "Цикличность недоступна" if i > graph.length
    keys = []
    graph.each do |key, value|
      unless graph.values.flatten.include? key
        history << key
        keys << key
        graph.delete key
      end
    end
    show << keys
  end
end