class ResumeGenre < ActiveRecord::Base
  belongs_to :genre
  belongs_to :resume
end