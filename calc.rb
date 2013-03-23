# encoding: UTF-8

puts "for how many days you want to calculate?"
days = gets.strip.to_i
days = 1 if days < 1
puts "how many one-way trips (in average, per day) do you want to make?"
trips = gets.strip.to_i
trips = 1 if trips < 1

prices = {
  single_ticket: 2.4,
  four_tickets: 8.4,
  day_ticket: 6.5,
  weekly_ticket: 28.0,
  monthly_ticket: 77.0
}

calculations = [
  {
    name: 'Single Ticket',
    explanation: "#{prices[:single_ticket]} € * #{trips} trips * #{days} days",
    total: prices[:single_ticket] * trips * days
  },
  {
    name: 'Four Tickets',
    explanation: "#{prices[:four_tickets]} € * #{((trips * days) / 4.0).ceil} groups of 4 tickets",
    total: prices[:four_tickets] * ((trips * days) / 4.0).ceil
  },
  {
    name: 'Day Ticket',
    explanation: "#{prices[:day_ticket]} € * #{days} days",
    total: prices[:day_ticket] * days
  },
  {
    name: 'Weekly Ticket',
    explanation: "#{prices[:weekly_ticket]} € * #{(days / 7.0).ceil} weeks",
    total: prices[:weekly_ticket] * (days / 7.0).ceil
  },
  {
    name: 'Monthly Ticket',
    explanation: "#{prices[:monthly_ticket]} € * #{(days / 30.0).ceil} month(s)",
    total: prices[:monthly_ticket] * (days / 30.0).ceil
  }
]

puts "Calculating costs for #{trips} trips each day during #{days} days (#{days*trips} trips in total)"
calculations.sort{ |a,b| a[:total] <=> b[:total] }.each do |calculation|
  puts calculation[:name]
  puts "#{calculation[:explanation]} = #{calculation[:total]} €"
end