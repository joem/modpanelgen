# frozen_string_literal: true

require 'test_helper'

describe ModularPanelGen do
  it 'must have a version number' do
    value(::ModularPanelGen::VERSION).wont_be_nil
  end

  # it 'must do something useful' do
  #   assert false
  # end
end
