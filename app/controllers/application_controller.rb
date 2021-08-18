require 'sinatra/base'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }

    get '/' do
        erb :super_hero
    end

    post '/teams' do 
        @team = Team.new(params[:team])
        @hero_1 = Member.new(params[:team][:members][0])
        @hero_2 = Member.new(params[:team][:members][1])
        @hero_3 = Member.new(params[:team][:members][2])

        erb :team
    end

    # The code below does the same thing but without needing a database (i.e. Team and Member classes)
    # post '/teams' do
    #     @team_name = params[:team][:name]
    #     @team_motto = params[:team][:motto]
    #     @hero_name = []
    #     @hero_power = []
    #     @hero_bio = []
    #     @team_members = params[:team][:members]
    #     @team_members.each do |hero|
    #       @hero_name << hero[:name]
    #       @hero_power << hero[:power]
    #       @hero_bio << hero[:bio]
    #     end
    # end
end
