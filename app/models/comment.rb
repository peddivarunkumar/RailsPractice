class Comment < ApplicationRecord
  belongs_to :article

  after_create_commit {broadcast_prepend_to "comments"}
  after_destroy_commit {broadcast_remove_to "comments"}
end
