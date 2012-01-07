class Comprobante < ActiveRecord::Base
    #attr_accessible :archivo
    belongs_to :customer
    
    mount_uploader :archivo, ComprobanteUploader
end
