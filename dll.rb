require 'benchmark'
Node = Struct.new(:value, :left_node, :right_node)

class List
  attr_accessor :head, :tail

  def initialize
    @head = nil
    @tail = nil
  end

  def add(node)
    if @head.nil?
      @head, @tail = node, node
    else
      @tail.right_node = node
      node.left_node = @tail
      @tail = node
    end
  end

  def remove(node)
    if node == @head
      @head = @head.right_node
      @head.left_node = nil
      node = nil
    elsif node == @tail
      @tail = @tail.left_node
      @tail.right_node = nil
      node = nil
    else
      node.right_node.left_node = node.left_node
      node.left_node.right_node = node.right_node
      node = nil
    end
  end

  def traverse
    node = @head
    while node != nil do
      yield node
      node = node.right_node
    end
  end

  def deduplicate!
    values = []
    traverse do |node|
      (values.include? node.value) ? remove(node) : (values << node.value)
    end
  end

  def print_values
    traverse { |n| puts n.value }
  end

  def count_nodes
    count = []
    traverse { |node| count << node }
    count.count
  end

  def dedup
    traverse do |node|
      check = node.right_node
      while check != nil do
        if node.value == check.value
          new_check = check.right_node
          remove(check)
          check = new_check
        else
          check = check.right_node
        end
      end
    end
  end

  def make_list(nodes)
    nodes.times do
      add Node.new rand(nodes/2)
    end
  end
end

iterations = 100

[200, 400, 600, 1200].each do |n|
  Benchmark.bm do |bm|
    bm.report("deduplicate array #{n} nodes  ") do
      iterations.times do
        list = List.new
        list.make_list(n)
        list.deduplicate!
      end
    end

    bm.report("deduplicate pointer #{n} nodes") do
      iterations.times do
        list = List.new
        list.make_list(n)
        list.dedup
      end
    end
  end
end
