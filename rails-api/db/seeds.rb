# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

listing = Listing.create([
	{
		context: 'lyh1很聪明',
		title: '这是真的'
	},{
		context: 'lyh2我很聪明',
		title: '这是真的'
	}
	])

user = User.create([
	{
		name: 'lyh2我很聪明',
		password: '123456',
		email: '123@qq.com',
		mobile: '18811439847',
		}])

category = Category.create([
	{
		name: 'lyh2我很聪明',
		logo: 'http://ons52g6mv.bkt.clouddn.com/category_chenshan.png',
		is_del: '0',
	},{
		name: 'lyh2我很聪明',
		logo: 'http://ons52g6mv.bkt.clouddn.com/category_chuanglian.png',
		is_del: '0',
	},{
		name: 'lyh2我很聪明',
		logo: 'http://ons52g6mv.bkt.clouddn.com/category_jiafang.png',
		is_del: '0',
	},])

product = Product.create([
	{
		name: 'product 1',
		logo: 'http://ons52g6mv.bkt.clouddn.com/product.png',
		is_del: '0',
		categories_id: 1,
	},{
		name: 'product 2',
		logo: 'http://ons52g6mv.bkt.clouddn.com/product.png',
		is_del: '0',
		categories_id: 1,
	},{
		name: 'product 3',
		logo: 'http://ons52g6mv.bkt.clouddn.com/product.png',
		is_del: '0',
		categories_id: 1,
	},])