class WelcomeController < ApplicationController

 def index


  response = HTTParty.get("https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20yahoo.finance.xchange%20where%20pair%20in%20(%22USDILS%22)&format=json&diagnostics=true&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys&callback=")
  @usdils = response["query"]["results"]["rate"]["Rate"].to_f

  response = HTTParty.get("https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20yahoo.finance.xchange%20where%20pair%20in%20(%22EURILS%22)&format=json&diagnostics=true&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys&callback=")
  @eurils = response["query"]["results"]["rate"]["Rate"].to_f

  l = Position.all

  @dic = {}

  l.each do |p|

    response = HTTParty.get("https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20yahoo.finance.quotes%20where%20symbol%3D%22#{p.symbol}%22&format=json&diagnostics=true&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys&callback=")
    currentPrice = response["query"]["results"]["quote"]["LastTradePriceOnly"].to_f
    @dic[p] = currentPrice

  end

 end

end
