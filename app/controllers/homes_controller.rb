class HomesController < ApplicationController
	before_filter :authenticate_user!

  include CategoriesHelper
  include CostsHelper
  include IncomesHelper
  include TimerHelper

  def index
    current_month = Time.now.month
    this_year_months = months_until_now

    @chart = LazyHighCharts::HighChart.new('graph') do |f|
      f.title(text: "Your Finance This Year")
      f.xAxis(categories: this_year_months,
        labels: {
            rotation: -45,
            style: {
                fontSize: '13px',
                fontFamily: 'Verdana, sans-serif'
            }
        })
      
      f.series(name: "Incomes", data: months_incomes((1..current_month).to_a))
      f.series(name: "Costs", data: months_costs((1..current_month).to_a))

      f.yAxis [                  
                  min: 0,
                  title: 
                  {
                    text: 'Amount in USD',
                    margin: 30
                  }
              ]

      f.legend(align: 'right', verticalAlign: 'top', y: 75, x: -50, layout: 'vertical')
      f.chart({type: "spline"})
    end
  end
end