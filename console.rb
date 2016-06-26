require_relative( 'models/match' )
require_relative( 'models/team' )
require_relative( 'models/team_match' )
require_relative( 'db/sql_runner' )
require( 'pry-byebug' )

runner = SqlRunner.new({dbname: 'dodgeball_league', host: 'localhost'})


TeamMatch.delete_all(runner)
Team.delete_all(runner)
Match.delete_all(runner)

team1=Team.new({'name' => 'Clown Punchers'}, runner)

t1=team1.save()

team2=Team.new({'name' => 'Kamikazes'}, runner)
t2=team2.save()

match1=Match.new({'home_team_id' => t1.id, 'home_team_score' => '0', 'away_team_id' => t2.id, 'away_team_score' => '0'}, runner )
m1=match1.save()

match2=Match.new({'home_team_id' => t2.id, 'home_team_score' => '2', 'away_team_id' => t1.id, 'away_team_score' => '0'}, runner )
m2=match2.save()


team_match1=TeamMatch.new({'team_id' => t1.id, 'match_id' => m1.id}, runner)
tm1=team_match1.save()

team_match2=TeamMatch.new({'team_id' => t2.id, 'match_id' => m1.id}, runner)
tm2=team_match2.save()

team_match3=TeamMatch.new({'team_id' => t1.id, 'match_id' => m2.id}, runner)
tm3=team_match3.save()

team_match4=TeamMatch.new({'team_id' => t2.id, 'match_id' => m2.id}, runner)
tm4=team_match4.save()

binding.pry
nil







