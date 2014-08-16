module RacesHelper
  def table_race_scores(race)
    return unless race.race_scores.any?
    @team_tables, table_titles = [], []
    if race.score_by_division?
      divs = race.get_divisions
      divs.each do |div|
        @team_tables << RaceScore.joins(:results).where(race_id: race.id).merge(Result.in_division(div)).distinct.order('total ASC').to_a
        table_titles << content_tag(:caption, "Division #{div}")
      end
    elsif race.score_by_category?
      cats = race.get_categories
      cats.each do |cat|
        @team_tables << RaceScore.joins(:results).where(race_id: race.id).merge(Result.categorised(cat)).distinct.order('total ASC').to_a
        table_titles << content_tag(:caption, "#{cat} Category")
      end
    else
      @team_tables << RaceScore.where(race_id: race.id).order('total ASC').to_a
      table_titles << content_tag(:caption, "All results")
    end
    render partial: 'team_table', collection: @team_tables, locals: { table_titles: table_titles}
  end
end
