require 'benchmark'
require Rails.root.join('lib/hypercat/list_builder/graph_adjacency')

namespace :benchmarks do

  namespace :adjacency_list do 
    task prepare: :environment do
      ::Mongoid::Clients.default.database.drop
      p 'Preparing....'
      hypernet = Hypernet.create
      ::GraphGenerator.new(hypernet, 'complete', n: 10).generate '10'
      ::GraphGenerator.new(hypernet, 'complete', n: 50).generate '50'
      ::GraphGenerator.new(hypernet, 'complete', n: 100).generate '100'
      ::GraphGenerator.new(hypernet, 'complete', n: 250).generate '250'
      ::GraphGenerator.new(hypernet, 'grid', n: 10, m: 10).generate '100'
      ::GraphGenerator.new(hypernet, 'grid', n: 100, m: 10).generate '1000'
      ::GraphGenerator.new(hypernet, 'grid', n: 100, m: 100).generate '10000'
      ::GraphGenerator.new(hypernet, 'grid', n: 1000, m: 100).generate '100000'
    end

    task testing: :environment do
      complite_graph_10     = Graph.find_by name: '10'
      complite_graph_50     = Graph.find_by name: '50'
      complite_graph_100    = Graph.find_by name: '100'
      complite_graph_250    = Graph.find_by name: '250'
      gird_graph_100        = Graph.find_by name: '100'
      gird_graph_1000       = Graph.find_by name: '1000'
      gird_graph_10000      = Graph.find_by name: '10000'
      grid_graph_100000     = Graph.find_by name: '10000'
      
      p 'Testing....'

      Mongo::Logger.logger.level = ::Logger::FATAL

      Benchmark.bm(7) do |x|
        x.report('complete 10 nodes') { ::Hypercat::ListBuilder::GraphAdjacency.new(complite_graph_10).result.to_a }
        x.report('complete 50 nodes') { ::Hypercat::ListBuilder::GraphAdjacency.new(complite_graph_50).result.to_a }
        x.report('complete 100 nodes') { ::Hypercat::ListBuilder::GraphAdjacency.new(complite_graph_100).result.to_a }
        x.report('complete 250 nodes') { ::Hypercat::ListBuilder::GraphAdjacency.new(complite_graph_250).result.to_a }
        x.report('grid 100 nodes') { ::Hypercat::ListBuilder::GraphAdjacency.new(gird_graph_100).result.to_a }
        x.report('grid 1000 nodes') { ::Hypercat::ListBuilder::GraphAdjacency.new(gird_graph_1000).result.to_a }
        x.report('grid 10 000 nodes') { ::Hypercat::ListBuilder::GraphAdjacency.new(gird_graph_10000).result.to_a }
        x.report('grid 100 000 nodes') { ::Hypercat::ListBuilder::GraphAdjacency.new(grid_graph_100000).result.to_a }
      end
    end

    task cleanup: :environment do 
      ::Mongoid::Clients.default.database.drop
    end

  end
end