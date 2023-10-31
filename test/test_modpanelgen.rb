# frozen_string_literal: true

require 'test_helper'

describe Modpanelgen do
  it 'must have a version number' do
    value(::Modpanelgen::VERSION).wont_be_nil
  end

  # it 'must do something useful' do
  #   assert false
  # end
end
