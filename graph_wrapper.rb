require './graph'
require 'pp'

my_text_file = ARGV[0]
@graph = Graph.new(my_text_file)

pp @graph.routeABCdist
pp @graph.routeADdist
pp @graph.routeADCdist
pp @graph.routeAEBCDdist
pp @graph.routeAEDdist
pp @graph.routeCC
pp @graph.routeAC4
pp @graph.routeACshort
pp @graph.routeBBshort
pp @graph.routeCC30
