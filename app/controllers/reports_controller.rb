class ReportsController < ApplicationController
  def index
  	@reports = Dir['public/report*.html']
  	puts @reports 
    @reports.map! {|report|  report.gsub(/public\//,"") }
  end
end
