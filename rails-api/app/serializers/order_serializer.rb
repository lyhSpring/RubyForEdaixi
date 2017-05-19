class OrderSerializer < ActiveModel::Serializer
  attributes :id, :courier_id, :washing_status, :factory_id, :waybill_id, 
  		:voucher_status, :categories_id, :status, :address_id, :totalprice, 
  		:user_id, :waybills, :items, :act_pay
  def waybills
  	# Waybill.where('order_id=?',object.id)
  	object.waybills
  end

  def items
  	# Item.where('order_id=?',object.id)
  	object.items
  end
end
