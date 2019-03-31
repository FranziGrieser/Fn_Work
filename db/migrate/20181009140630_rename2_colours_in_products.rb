# frozen_string_literal: true

class Rename2ColoursInProducts < ActiveRecord::Migration[5.2]
  def change
    rename_column :products, :colour, :color
  end
end
