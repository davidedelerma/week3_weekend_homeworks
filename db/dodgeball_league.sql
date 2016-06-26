DROP TABLE teams_matches;
DROP TABLE teams;
DROP TABLE matches;

CREATE TABLE teams (
  id serial4 primary key,
  name varchar(255)
);

CREATE TABLE matches (
  id serial4 primary key,
  home_team_id INT4,
  away_team_id INT4,
  home_team_score INT4,
  away_team_score INT4
);

CREATE TABLE teams_matches (
  id serial4 primary key,
  team_id INT4 references teams(id),
  match_id INT4 references matches(id)
);

