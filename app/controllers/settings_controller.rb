class SettingsController < ApplicationController

  def new
  end

  def create
    config = sanitised_params.slice(:fixtures, :races).to_hash
    symbolise config
    save_config config
    # set the CONFIG constant
    Object.const_set(:CONFIG, config)
    redirect_to root_path
  end

  private

  # overrides application controller before_action otherwise would cause endless loop
  def check_config
    true
  end

  def save_config(config)
    file = Rails.root + 'config/config.yml'
    File.open(file, 'w') do |f|
      f.write config.to_yaml
    end
  end

  def sanitised_params
    params[:fixtures] = params[:fixtures].to_i
    params[:races].each do |r|
      r[:score_by_division]= !r[:score_by_division].blank?
      r[:score_by_category]= !r[:score_by_category].blank?
      r[:scorers]= r[:scorers].to_i
    end
    params
  end

  def symbolise(config)
    # converts hash keys
    config.symbolize_keys!
    config[:races].each { |r| r.symbolize_keys! }
  end
end