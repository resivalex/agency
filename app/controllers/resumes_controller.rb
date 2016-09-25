class ResumesController < ApplicationController
  def index
    @resumes = Resume.all
  end
end
