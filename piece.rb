class Piece
  TEAMS = [:white, :black]

  def initialize(team)
    unless TEAMS.include?(team)
      raise "Invalid team (#{team})"
    end

    @team = team
  end

  def kind
    self.class.name.downcase.split('::').last.to_sym
  end

  def team
    @team
  end
end

