require "minitest/autorun"
require "./lib/tuning_tools"

class TuningTest; include TuningTools; end

describe "TuningTools", "blah" do

  before do
    @tuning_test = TuningTest.new
  end

  it "returns correct frequency for pitch" do
    @tuning_test.midi_to_et_frequency(70).must_equal 466.1637615180899
    @tuning_test.midi_to_et_frequency(69).must_equal 440
  end

  it "returns correct offset given pitch and ratio" do
    @tuning_test.ratio_to_cents_offset(60, [1,1]).round(4).must_equal 0.0
    @tuning_test.ratio_to_cents_offset(67, [3,2]).round(4).must_equal 1.9526
    @tuning_test.ratio_to_cents_offset(64, [5,4]).round(4).must_equal -13.6876
    @tuning_test.ratio_to_cents_offset(67, [5,4], 3).round(4).must_equal -13.6876
    @tuning_test.ratio_to_cents_offset(60, [3,2], 5).round(4).must_equal 1.9526
  end
end
