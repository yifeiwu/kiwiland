class Graph
  def initialize(file)
    @adj = mda(5,5)
    File.open(file).read.split(", ").each do |entry|
      src = a_to_d(entry[0]).to_i
      dest = a_to_d(entry[1]).to_i
      dist = entry[2].to_i
      #return entry
      #return src,dest,dist
      #return @adj.inspect
      #return src
      #return dest
      @adj[src][dest] = dist
    end
  end

  def routeABCdist
    find_route_dist(["A","B","C"])
  end

  def routeADdist
    find_route_dist(["A","D"])
  end

  def routeADCdist
    find_route_dist(["A","D","C"])
  end

  def routeAEBCDdist
    find_route_dist(["A","E","B","C","D"])
  end
  def routeAEDdist
    find_route_dist(["A","E","D"])
  end
  def routeCC
    results = find_children([2],3,[])
    paths = []
    results.each do |result|
      subarray = result.each_index.select{|i| (result[i] == 2 && i>0) }
      subarray.each do |substr|
        paths = paths.push(result[0,substr.to_i+1]) #get the end station
      end
    end
    paths = paths.uniq.reject { |c| c.empty? }
    return paths.length
  end


  def routeAC4
    results = find_children([0],4,[])
    paths = []
    results.each do |result|
      subarray = result.each_index.select{|i| (result[i] == 2 && i==4) }
      paths = paths.push(result[0,subarray.last.to_i])
    end
    paths = paths.uniq.reject { |c| c.empty? }
    return paths.length
  end


  def routeACshort
    dists, paths = find_path(0,2,5) #try 5 stops,otherwise give up
    return dists.sort[0]
  end



  def routeBBshort
    dists, paths = find_path(1,1,5) #try 5 stops,otherwise give up
    return dists.sort[0]
  end

  def routeCC30
    dists, paths = find_path(2,2,10) #try 10 stops
    return dists.select {|item| item < 30 }.count
  end

  private

  def find_route_dist(route)
    #supply alpha route
    begin
      total = 0
      for i in 0..route.length-2
        src = a_to_d(route[i]).to_i
        dest = a_to_d(route[i+1]).to_i
        total = total + @adj[src][dest]
      end
      return total
    rescue
      return "NO SUCH ROUTE"
    end
  end



  def find_route_dist2(route)
    #route is already converted to digits
    begin
      total = 0
      for i in 0..route.length-2
        src = route[i].to_i
        dest = route[i+1].to_i
        total = total + @adj[src][dest]
      end
      return total
    rescue
      return "NO SUCH ROUTE"
    end
  end


  def find_children(path, counter, answers)
    if counter == 0
      answers.push(path)
      return answers
    end
    counter = counter - 1
    curr_node = path.last
    children = @adj[curr_node].each_index.select{|i| @adj[curr_node][i] !=nil }
    children.each do |child|
      curr_path = path + [child]
      find_children(curr_path,counter,answers)
    end
    answers
  end

  def find_path(start_node, end_node, stops)
    results = find_children([start_node],stops,[])
    paths = []
    results.each do |result|
      subarray = result.each_index.select{|i| (result[i] == end_node && i>0) }
      subarray.each do |substr| #for each substring
        paths = paths.push(result[0,substr.to_i+1]) #get the end station
      end
    end
    paths = paths.uniq.reject { |c| c.empty? }
    dists = []
    paths.each do |path|
      dist = find_route_dist2(path)
      dists.push(dist)
    end
    return dists, paths

  end


  def a_to_d(a)
    table = ("A".."Z").to_a
    return table.index(a)
  end

  def mda(width,height)
    a = Array.new(width)
    a.map! { Array.new(height) }
    return a
  end
end
