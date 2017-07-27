class CreateItemsBookingsAndReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :name
      t.string :description

      t.timestamps
    end

    create_table :bookings do |t|
      t.date :start_date
      t.date :end_date

      t.timestamps
    end

    create_table :reviews do |t|
      t.text    :content
      t.integer :rating

      t.timestamps
    end

    create_table :field_types do |t|
      t.string :name
    end

    create_table :custom_fields do |t|
      t.string :content
    end

    add_reference :reviews, :user, index: true
    add_reference :reviews, :item, index: true
    add_reference :bookings, :user, index: true
    add_reference :bookings, :item, index: true
    add_reference :custom_fields, :field_type, index: true
    add_reference :custom_fields, :item, index: true
    add_reference :items, :user, index: true
  end
end
