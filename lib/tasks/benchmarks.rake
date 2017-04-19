require 'benchmark'
require Rails.root.join('lib/hypercat/list_builder/graph_adjacency')

namespace :benchmarks do

  desc 'testing adjacency list building'
  task adjacency_list: :environment do
    ::Mongoid::Clients.default.database.drop
    Mongo::Logger.logger.level = ::Logger::FATAL
    p 'Preparing....'
    hypernet = Hypernet.create
    complite_graph_10     = ::GraphGenerator.new(hypernet, 'complete', n: 10).generate '10'
    complite_graph_50     = ::GraphGenerator.new(hypernet, 'complete', n: 50).generate '50'
    complite_graph_100    = ::GraphGenerator.new(hypernet, 'complete', n: 100).generate '100'
    complite_graph_250    = ::GraphGenerator.new(hypernet, 'complete', n: 250).generate '250'
    gird_graph_1000       = ::GraphGenerator.new(hypernet, 'grid', n: 100, m: 10).generate '1000'
    gird_graph_10000      = ::GraphGenerator.new(hypernet, 'grid', n: 100, m: 100).generate '10000'
    grid_graph_100000     = ::GraphGenerator.new(hypernet, 'grid', n: 1000, m: 100).generate '10000'
    p 'Testing....'
    Benchmark.bm(7) do |x|
      x.report('10 nodes') { ::Hypercat::ListBuilder::GraphAdjacency.new(complite_graph_10).result.to_a }
      x.report('50 nodes') { ::Hypercat::ListBuilder::GraphAdjacency.new(complite_graph_50).result.to_a }
      x.report('100 nodes') { ::Hypercat::ListBuilder::GraphAdjacency.new(complite_graph_100).result.to_a }
      x.report('250 nodes') { ::Hypercat::ListBuilder::GraphAdjacency.new(complite_graph_250).result.to_a }
      x.report('1000 nodes') { ::Hypercat::ListBuilder::GraphAdjacency.new(gird_graph_1000).result.to_a }
      x.report('10 000 nodes') { ::Hypercat::ListBuilder::GraphAdjacency.new(gird_graph_10000).result.to_a }
      x.report('100 000 nodes') { ::Hypercat::ListBuilder::GraphAdjacency.new(grid_graph_100000).result.to_a }
    end
    p 'Cleaning up....'
    ::Mongoid::Clients.default.database.drop
  end

end