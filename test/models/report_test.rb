# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  test '#editable?' do
    user1 = users(:alice)
    report = user1.reports.create(content: 'test')
    assert report.editable?(user1)
  end

  test '#created_on' do
    report = reports(:one)
    assert_equal Date.new(2021, 6, 13), report.created_on
  end
end
