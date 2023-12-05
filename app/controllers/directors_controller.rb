class DirectorsController < ApplicationController

  def index
    render({ :template => "directors_templates/list"})
  end

  def show
    the_id = params.fetch("the_id")

    matching_records = Director.where({ :id => the_id})

    @the_director = matching_records.at(0)

    render({ :template => "directors_templates/details"})

  end

  def junior
    non_nulls = Director.where.not({ :dob => nil})
    organized_records = non_nulls.order({ :dob => :desc})
    @junior_director = organized_records.at(0)

    render({ :template => "directors_templates/junior"})
  end

  def senior
    non_nulls = Director.all.where.not({ :dob => nil})
    organized_records = non_nulls.order({ :dob => :asc})
    @senior_director = organized_records.at(0)

    render({ :template => "directors_templates/senior"})
  end


end
