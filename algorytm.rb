include Math
require 'colorize'

class AssocativeScores
  def down_s(graph)
    history = []
    show = []
    i = 0
    until graph.empty?
      i += 1
      break puts "Транзитивность недоступна".red if i > (graph.length*100)
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
    puts "S с чертой внизу: ".green + "#{show}" 
  end

  def up_s
    graph = {}
    sent_graph = {}
    puts "Введите количество вершин"
    amount_of_keys = gets.chomp.to_i
    total_amount = (1..amount_of_keys).to_a
    total_amount.each do |element|
      graph[element] = []
      sent_graph[element] = []
    end
    graph.each do |key, value|
      puts "Введите вершины, которые водят в вершину #{key}"
      graph[key] = gets.chomp.split(',').map(&:to_i)
      sent_graph[key] = graph[key]
    end
    #graph = { 1 => [], 2 => [1], 3 => [1], 4 => [2,3], 5 => [3,6], 6 => [] }
    show = []
    i = 0
    until graph.empty?
      i += 1
      break puts "Транзитивность недоступна".red if i > (graph.length * 100)
      keys = []
      iteration_keys = []
      graph.each do |key, value|
        unless graph.values.flatten.include? key
          keys << key
          iteration_keys << key
        end
      end
      graph.each do |key, value|
        iteration_keys.each do |element|
          graph.delete(key) if key == element
        end
      end
      show << keys
    end
    puts "S с чертой верху: ".green + "#{show}"
    down_s(sent_graph)
  end

end

AssocativeScores.new.up_s
