require('pg')
require_relative('../db/sql_runner')

class TeamMatch

  def initialize(options,runner)
    @id = options['id'].to_i
    @team_id = options ['team_id'].to_i
    @match_id = options['match_id'].to_i
    @runner = runner 
  end

  def save()
    sql = "INSERT INTO teams_matches (team_id, match_id) VALUES (#{@team_id},#{@match_id});"
    return TeamMatch.map_item(sql,@runner)
  end  

  def self.all(runner)
    sql = "SELECT * FROM teams_matches;"
    return TeamMatch.map_items(sql,runner)
  end

  def self.delete_all(runner)
    sql = "DELETE FROM teams_matches;"
    runner.run( sql )
  end

  def self.map_items(sql,runner)
    team_matches  =  runner.run( sql )
    result = team_matches.map {|team_matche| TeamMatch.new(team_matche,runner)}
    return result
  end

  def self.map_item(sql,runner)
    result=TeamMatch.map_items(sql,runner)
    return result.first
  end
end