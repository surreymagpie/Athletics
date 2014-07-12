module RacesHelper
  def table_race_scores(race)
    @team_tables, table_titles = [], []

    if race.score_by_division?
      divs = Race.get_divisions(race)
      divs.each do |div|
        @team_tables << RaceScore.joins(:club).where('race_id = ? AND clubs.division = ?', race.id, div).order('total ASC').to_a
        table_titles << content_tag(:caption, "Division #{div}")
      end      
    elsif race.score_by_category?
      cats = Race.get_categories(race)
      cats.each do |cat|
        @team_tables << RaceScore.where('race_id = ? AND team_name ILIKE ?', race.id, "%#{cat}%").order('total ASC').to_a
        table_titles << content_tag(:caption, "#{cat} Category")
      end
      # render partial: 'team_table', collection: @team_tables, locals: { table_title: table_titles}
    else
      @team_tables << RaceScore.where(race_id: race.id).order('total ASC').to_a
      table_titles << content_tag(:caption, "All results")
      # render partial: 'team_table', collection: @team_tables, locals: { team_table: @team_table, table_title: Array(content_tag(:caption, "All results"))}
    end
      render partial: 'team_table', collection: @team_tables, locals: { table_titles: table_titles}
  end
end
