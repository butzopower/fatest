require './selector'
describe 'Selector' do
  describe 'select_best_indices' do
    it 'should select min and max in an ordered set' do
      Selector.new([1,2,3,4,5]).select_best.should == [0,4]
    end

    it 'should select min and best max when max isnt in range' do
      Selector.new([5,1,2,3,4]).select_best.should == [1,4]
    end

    it 'should select best min and max when min isnt in range' do
      Selector.new([2,3,4,5,1]).select_best.should == [0,3]
    end

    it 'shouldnt freak out on duplicates' do
      Selector.new([1,1,2,3,4,6,5,4,4]).select_best.should == [0,5]
    end

    it 'should work for really obvious cases' do
      Selector.new([1,6,2,3,4]).select_best.should == [0,1]
      Selector.new([2,3,4,1,6]).select_best.should == [3,4]
    end

    it 'should pick the middle when the largest range is in the middle' do
      Selector.new([4,6,2,5,1]).select_best.should == [2,3]
    end
  end
end
