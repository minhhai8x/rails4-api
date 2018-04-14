class User < ActiveRecord::Base

  has_attached_file :avatar, styles: {
                               mobile_v: '600x148#',
                               mobile_h: '600x148'
                             }
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
end
