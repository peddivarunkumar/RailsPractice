class Comment < ApplicationRecord
  belongs_to :article
  belongs_to :user

  after_create_commit {broadcast_append_to "comments"}
  after_destroy_commit {broadcast_remove_to "comments"}
end
