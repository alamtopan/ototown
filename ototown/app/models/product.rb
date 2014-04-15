class Product < ActiveRecord::Base
  attr_accessible :name, :description, :category_id, :condition, :type_product, :brand, :model, :year, :color,
                  :color, :plate_number, :exp_date, :kilometer, :door, :seat, :transmission, :engine,:price,
                  :cyclinders, :fuel, :location, :city, :province, :images_attributes, :user_id,:status,:negotiable,
                  :advertise_attributes


  is_impressionable
  extend FriendlyId
  friendly_id :slug_candidates, use: [:slugged, :finders]

  belongs_to :category
  belongs_to :user
  has_many :images, class_name: 'ImageProduct', dependent: :destroy

  accepts_nested_attributes_for :images, reject_if: :all_blank, allow_destroy: true

  validates :name, :category_id, :condition, :user_id, presence: true
  validates_length_of :price, maximum: 12

  scope :published, -> {where(status: true)}
  scope :filter_by_name, ->(name) do
            return if name.blank?
            where('name LIKE ?', "%#{name}%")
          end
  scope :filter_by_category_id, ->(category_id) do
            return if category_id.blank?
            where(category_id: category_id)
          end
  scope :filter_by_condition, ->(condition) do
            return if condition.blank?
            where(condition: condition) unless condition == 'All'
          end
  scope :filter_by_brand, ->(brand) do
            return if brand.blank?
            where(brand: brand)
          end
  scope :filter_by_model, ->(model) do
            return if model.blank?
            where(model: model)
          end
  scope :filter_by_transmission, ->(transmission) do
            return if transmission.blank?
            where(transmission: transmission)
          end
  scope :filter_by_year, ->(year) do
            return if year.blank?
            where(year: year)
          end
  scope :filter_by_type_product, ->(type_product) do
            return if type_product.blank?
            where(type_product: type_product)
          end
  scope :filter_by_province, ->(province) do
            return if province.blank?
            where(province: province)
          end
  scope :filter_by_city, ->(city) do
            return if city.blank?
            where(city: city)
          end
  scope :filter_by_price, ->(price1,price2) do
            return if price1.blank? && price2.blank?
            return where('price <= ? OR price >= ?', price2,price1) if price1.blank? || price2.blank?
            where('price <= ? AND price >= ?', price2,price1) if price1.present? && price2.present?
          end

  scope :filter_search, ->(params)  do
      return scoped if params.blank?

      filter_by_category_id(params[:category_id])
        .filter_by_name(params[:name])
        .filter_by_condition(params[:condition])
        .filter_by_brand(params[:brand])
        .filter_by_model(params[:model])
        .filter_by_transmission(params[:transmission])
        .filter_by_year(params[:year])
        .filter_by_type_product(params[:type_product])
        .filter_by_province(params[:province])
        .filter_by_city(params[:city])
        .filter_by_price(params[:price_from], params[:price_to])
  end

  def slug_candidates
    "#{id}-#{name}"
  end
end
